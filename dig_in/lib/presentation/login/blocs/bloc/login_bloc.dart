import 'package:dig_in/base/base_result_use_case.dart';
import 'package:dig_in/data/api/sharedpreferences/app_preferences.dart';
import 'package:dig_in/domain/login/get_user_use_case.dart';
import 'package:dig_in/domain/login/login_by_email_password_user_case.dart';
import 'package:dig_in/domain/login/register_info_user_use_case.dart';
import 'package:dig_in/domain/login/register_user_by_email_and_password_use_case.dart';
import 'package:dig_in/domain/login/register_user_local_use_case.dart';
import 'package:dig_in/domain/models/user_model.dart';
import 'package:dig_in/log.dart';
import 'package:dig_in/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginByEmailAndPasswordUseCase _loginByEmailAndPasswordUseCase;
  final RegisterUserByEmailAndPasswordUseCase _registerUserByEmailAndPasswordUseCase;
  final RegisterInfoUserUseCase _registerInfoUserUseCase;
  final RegisterUserLocalUseCase _registerUserLocalUseCase;
  final GetUserUseCase _getUserUseCase;
  final BuildContext _context;
  final _tag = "LoginBloc";
  LoginBloc(
    this._context,
    this._loginByEmailAndPasswordUseCase,
    this._registerUserByEmailAndPasswordUseCase,
    this._registerInfoUserUseCase,
    this._registerUserLocalUseCase,
    this._getUserUseCase,
    AppPreferences _preferences
  ) : super(LoginState.initial()) {
    on<LoginByEmailAndPasswordEvent>((event, emit) async{
      emit(LoginState.loading());//show progrees
      if(event.email.isEmpty || event.password.isEmpty){//check that all fields are not empty
        Log.i(_tag,"La informacion es vacia");
        emit(LoginState.error());
        return;
      }
      //login in firebase 
      final response = await _loginByEmailAndPasswordUseCase.loginByEmailAndPassword(event.email, event.password);
      Log.i(_tag,"loginByEmailAndPassword => ${response.runtimeType}");

      switch (response.runtimeType) {
        case SuccessResponse:
            Log.i(_tag,"loginByEmailAndPassword => ${(response as SuccessResponse).data}");
            //get user data from firestore
            final responseUser = await _getUserUseCase.getUser(response.data);
            Log.i(_tag,"getUser => ${responseUser.runtimeType}");
            switch (responseUser.runtimeType) {
              case SuccessResponse:
                Log.i(_tag,"getUser => ${(responseUser as SuccessResponse).data}");
                //register data in local database
                await _registerUserLocalUseCase.registerUserLocal(responseUser.data);
                //save already logged in 
                _preferences.isLogin = true;
                //go to home screen
                Screens.navigationTo(context: _context, page: Screens.home,onBack: false);
                break;
              case NullOrEmptyData:
                Log.i(_tag,"getUser => NullOrEmptyData");
                break;
              case NoConnectionInternet:
                Log.i(_tag,"getUser => NoConnectionInternet");
                emit(LoginState.noConnectionInternet());
                break;
              case ErrorResponseApi:
                Log.i(_tag,"getUser => ErrorResponseApi ${(responseUser as ErrorResponseApi).error}");
                break;
            }

            emit(LoginState.loaded());
          break;
        case ErrorResponseApi:
            Log.i(_tag,"loginByEmailAndPassword => ErrorResponseApi ${(response as ErrorResponseApi).error}");
            emit(LoginState.errorApi());
          break;
        case NoConnectionInternet:
            Log.i(_tag,"loginByEmailAndPassword => NoConnectionInternet");
            emit(LoginState.noConnectionInternet());
          break;
        case NullOrEmptyData:
        default:
          Log.i(_tag,"loginByEmailAndPassword => NullOrEmptyData");
          emit(LoginState.errorApi());
          break;
      }
    });
    
    on<RegisterUserEvent>((event, emit) async {
      emit(LoginState.loading());//show progrees
      //check that all fields are not empty
      if(event.email.isEmpty || event.password.isEmpty ||event.name.isEmpty ||event.lastname.isEmpty){
        Log.i(_tag,"La informacion es vacia");
        emit(LoginState.error());
        return;
      }
      //register in autentification by email and password
      final response = await _registerUserByEmailAndPasswordUseCase.registerUserByEmailAndPassword(event.email, event.password);
      switch (response.runtimeType) {
        case SuccessResponse:
            Log.i(_tag,"${(response as SuccessResponse).data}");
            //register user in firestore
            final responseUser = await _registerInfoUserUseCase.registerInfoUser(UserModel(
              event.email, 
              event.password, 
              event.name, 
              event.lastname, 
              response.data,
              ""
            ));
            Log.i(_tag,"responseUser => ${responseUser.runtimeType}");
            switch (responseUser.runtimeType) {
              case SuccessResponse:
                _context.read<LoginBloc>().add(LoginByEmailAndPasswordEvent(event.email, event.password));
                emit(LoginState.loaded());
                break;
              case ErrorResponseApi:
                  Log.i(_tag,"responseUser => ${(response as ErrorResponseApi).error}");
                  emit(LoginState.errorApi());
                break;
              case NoConnectionInternet:
                  emit(LoginState.noConnectionInternet());
                break;
              case NullOrEmptyData:
              default:
                  emit(LoginState.error());
              break;
            }
          break;
        case ErrorResponseApi:
            Log.i(_tag, "${(response as ErrorResponseApi).error}");
            if(response.error.toString().contains("email-already-in-use")){
              _context.read<LoginBloc>().add(LoginByEmailAndPasswordEvent(event.email, event.password));
            }else {
              emit(LoginState.errorApi());
            }
          break;
        case NoConnectionInternet:
            emit(LoginState.noConnectionInternet());
          break;
        case NullOrEmptyData:
        default:
            emit(LoginState.error());
        break;
      }
    });
  }
}

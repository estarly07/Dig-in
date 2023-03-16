import 'package:bloc/bloc.dart';
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
  ) : super(LoginInitial()) {
    on<LoginByEmailAndPasswordEvent>((event, emit) async{
      emit(LoadingState());
      if(event.email.isEmpty || event.password.isEmpty){
        Log.i(_tag,"La informacion es vacia");
        emit(ErrorState());
        return;
      }

      final response = await _loginByEmailAndPasswordUseCase.loginByEmailAndPassword(event.email, event.password);
      Log.i(_tag,"loginByEmailAndPassword => ${response.runtimeType}");
      switch (response.runtimeType) {
        case SuccessResponse:
            Log.i(_tag,"loginByEmailAndPassword => ${(response as SuccessResponse).data}");
            final responseUser = await _getUserUseCase.getUser(response.data);
            Log.i(_tag,"getUser => ${responseUser.runtimeType}");
            switch (responseUser.runtimeType) {
              case SuccessResponse:
                Log.i(_tag,"getUser => ${(responseUser as SuccessResponse).data}");
                await _registerUserLocalUseCase.registerUserLocal(responseUser.data);
                _preferences.isLogin = true;
                Screens.navigationTo(
                  context: _context, 
                  page: Screens.home,
                  onBack: false
                );
                break;
              case NullOrEmptyData:
                Log.i(_tag,"getUser => NullOrEmptyData");
                break;
              case NoConnectionInternet:
                Log.i(_tag,"getUser => NoConnectionInternet");
                break;
              case ErrorResponseApi:
                Log.i(_tag,"getUser => ErrorResponseApi ${(responseUser as ErrorResponseApi).error}");
                break;
            }

            emit(LoadedState());
          break;
        case ErrorResponseApi:
            print((response as ErrorResponseApi).error);
            Log.i(_tag,"loginByEmailAndPassword => ErrorResponseApi ${(response).error}");
            emit(ErrorApiState());
          break;
        case NullOrEmptyData:
        default:
          Log.i(_tag,"loginByEmailAndPassword => NullOrEmptyData");
          emit(ErrorApiState());
          break;
      }
    });
    
    on<RegisterUserEvent>((event, emit) async {
      emit(LoadingState());
      if(
        event.email.isEmpty || 
        event.password.isEmpty ||
        event.name.isEmpty ||
        event.lastname.isEmpty 
      ){
        Log.i("LOGIN BLOC","La informacion es vacia");
        emit(ErrorState());
        return;
      }
      final response = await _registerUserByEmailAndPasswordUseCase.registerUserByEmailAndPassword(
        event.email, event.password
      );
      switch (response.runtimeType) {
        case SuccessResponse:
            Log.i("LOGIN BLOC","${(response as SuccessResponse).data}");
            final responseUser = await registerUser(UserModel(
              event.email, 
              event.password, 
              event.name, 
              event.lastname, 
              response.data,
              ""
            ));
            Log.i("LOGIN BLOC","responseUser => ${responseUser.runtimeType}");
            switch (responseUser.runtimeType) {
              case SuccessResponse:
                Screens.navigationTo(
                  context: _context, 
                  page: Screens.home,
                  onBack: false
                );
                emit(LoadedState());
                break;
              case ErrorResponseApi:
                  print((response as ErrorResponseApi).error);
                  emit(ErrorApiState());
                break;
              case NullOrEmptyData:
                  emit(ErrorApiState());
                  print("null");
              break;
              default:
            }
          break;
        case ErrorResponseApi:
            print((response as ErrorResponseApi).error);

            if(response.error.toString().contains("email-already-in-use")){
              final responseLogin = await _loginByEmailAndPasswordUseCase.loginByEmailAndPassword(event.email, event.password);
              switch (responseLogin.runtimeType) {
                case SuccessResponse:
                    print((responseLogin as SuccessResponse).data);
                    final user = UserModel(
                      event.email, 
                      event.password, 
                      event.name, 
                      event.lastname, 
                      responseLogin.data,
                      ""
                    );
                    final responseUser = await registerUser(user);
                    switch (responseUser.runtimeType) {
                      case SuccessResponse:
                        if(await registerUserLocal(user)){
                          Screens.navigationTo(
                            context: _context, 
                            page: Screens.home,
                            onBack: false
                          );
                          emit(LoadedState());
                        }
                        
                        break;
                      case ErrorResponseApi:
                          print((response).error);
                          emit(ErrorApiState());
                        break;
                      case NullOrEmptyData:
                          emit(ErrorApiState());
                          print("null");
                      break;
                      default:
                    }
                    emit(LoadedState());
                  break;
                case ErrorResponseApi:
                    print((response).error);
                    emit(ErrorApiState());
                  break;
                case NullOrEmptyData:
                    emit(ErrorApiState());
                    print("null");
                break;
                default:
              }
             
            }else {
              emit(ErrorApiState());
            }
          break;
        case NullOrEmptyData:
            emit(ErrorApiState());
            print("null");
        break;
        default:
      }
    });
  }
  Future<BaseResultUseCase> registerUser(UserModel userModel) async {
    final responseUser = await _registerInfoUserUseCase.registerIngoUser(UserModel(
      userModel.email, 
      userModel.password, 
      userModel.name, 
      userModel.lastname, 
      userModel.uid,
      userModel.image
    ));
    switch (responseUser.runtimeType) {
      case SuccessResponse:
        return SuccessResponse((responseUser as SuccessResponse).data);
      case ErrorResponseApi:
        print((responseUser as ErrorResponseApi).error);
        return ErrorResponseApi(responseUser.error);
      case NullOrEmptyData:
      default:
        print("null");
        return NullOrEmptyData();
    }
  }
  
  Future<bool> registerUserLocal(UserModel user)  async {
    final response = await _registerUserLocalUseCase.registerUserLocal(user);
    switch (response.runtimeType) {
      case SuccessResponse:
        return (response as SuccessResponse).data;
      default:
        return false;
    }
  }
}

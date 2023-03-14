import 'package:bloc/bloc.dart';
import 'package:dig_in/base/base_result_use_case.dart';
import 'package:dig_in/domain/login/login_by_email_password_user_case.dart';
import 'package:dig_in/domain/login/register_info_user_use_case.dart';
import 'package:dig_in/domain/login/register_user_by_email_and_password_use_case.dart';
import 'package:dig_in/domain/models/user_model.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginByEmailAndPasswordUseCase _loginByEmailAndPasswordUseCase;
  final RegisterUserByEmailAndPasswordUseCase _registerUserByEmailAndPasswordUseCase;
  final RegisterInfoUserUseCase _registerInfoUserUseCase;
  final BuildContext _context;
  LoginBloc(
    this._context,
    this._loginByEmailAndPasswordUseCase,
    this._registerUserByEmailAndPasswordUseCase,
    this._registerInfoUserUseCase
  ) : super(LoginInitial()) {
    on<LoginByEmailAndPasswordEvent>((event, emit) async{
      emit(LoadingState());
      if(event.email.isEmpty || event.password.isEmpty){
        emit(ErrorState());
        return;
      }

      final response = await _loginByEmailAndPasswordUseCase.loginByEmailAndPassword(event.email, event.password);

      switch (response.runtimeType) {
        case SuccessResponse:
            print((response as SuccessResponse).data);
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
    });
    
    on<RegisterUserEvent>((event, emit) async {
      emit(LoadingState());
      if(
        event.email.isEmpty || 
        event.password.isEmpty ||
        event.name.isEmpty ||
        event.lastname.isEmpty 
      ){
        emit(ErrorState());
        return;
      }
      final response = await _registerUserByEmailAndPasswordUseCase.registerUserByEmailAndPassword(
        event.email, event.password
      );
      switch (response.runtimeType) {
        case SuccessResponse:
            print((response as SuccessResponse).data);
            final responseUser = await registerUser(UserModel(
              event.email, 
              event.password, 
              event.name, 
              event.lastname, 
              response.data,
              ""
            ));
            switch (responseUser.runtimeType) {
              case SuccessResponse:
                /* Screens.navigationTo(
                  context: _context, 
                  page: Screens.home,
                  onBack: false
                ); */
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
                     final responseUser = await registerUser(UserModel(
                      event.email, 
                      event.password, 
                      event.name, 
                      event.lastname, 
                       responseLogin.data,
                      ""
                    ));
                    switch (responseUser.runtimeType) {
                      case SuccessResponse:
                        /* Screens.navigationTo(
                          context: _context, 
                          page: Screens.home,
                          onBack: false
                        ); */
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
}

import 'package:bloc/bloc.dart';
import 'package:dig_in/base/base_result_use_case.dart';
import 'package:dig_in/domain/login/login_by_email_password_user_case.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginByEmailAndPasswordUseCase _loginByEmailAndPasswordUseCase;
  LoginBloc(
    this._loginByEmailAndPasswordUseCase
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
      if(event.email.isEmpty || event.password.isEmpty){
        emit(ErrorState());
        return;
      }
    });
  }
}

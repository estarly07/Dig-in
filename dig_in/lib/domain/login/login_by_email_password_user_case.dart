import 'package:dig_in/base/base_result_repository.dart' as repository;
import 'package:dig_in/base/base_result_use_case.dart';
import 'package:dig_in/domain/login/login_repository.dart';

class LoginByEmailAndPasswordUseCase {
  final LoginRepository _loginRepository;

  LoginByEmailAndPasswordUseCase(this._loginRepository);

  Future<BaseResultUseCase> loginByEmailAndPassword(String email,String password) async {
    try {
      final response = await _loginRepository.loginByEmailAndPassword(email, password);
      switch (response.runtimeType) {
        case repository.SuccessResponse:
          return BaseResultUseCase.success((response as repository.SuccessResponse).data);
        case repository.ErrorResponseApi:
          return BaseResultUseCase.errorApi((response as repository.ErrorResponseApi).exception);
        case repository.NullOrEmptyData:
        default:
          return BaseResultUseCase.nullOrEmptyData();
      }
    } on Exception catch (e) {
      return BaseResultUseCase.errorApi(e);
    }
  }
  
}
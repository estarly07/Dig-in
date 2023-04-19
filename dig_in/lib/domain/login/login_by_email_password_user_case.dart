import 'package:dig_in/base/base_result_repository.dart' as repository;
import 'package:dig_in/base/base_result_use_case.dart';
import 'package:dig_in/domain/login/user_repository.dart';
import 'package:dig_in/domain/utils.dart';

class LoginByEmailAndPasswordUseCase {
  final UserRepository _userRepository;

  LoginByEmailAndPasswordUseCase(this._userRepository);

  Future<BaseResultUseCase> loginByEmailAndPassword(String email,String password) async {
    try {
      //validate internet connection
      if(!await isConnected()){return NoConnectionInternet();}
      //login in firebase by email and password
      final response = await _userRepository.loginByEmailAndPassword(email, password);
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
import 'package:dig_in/domain/login/user_repository.dart';

import '../../base/base_result_repository.dart' as repository;
import '../../base/base_result_use_case.dart';
import '../utils.dart';

class LoginByGoogleUseCase {
  final UserRepository _userRepository;
  LoginByGoogleUseCase(this._userRepository);
  
  Future<BaseResultUseCase> loginByGoogle() async {
    try {
      if(!await isConnected()){return BaseResultUseCase.noConnectionInternet();}
      final response = await _userRepository.loginByGoogle();
      switch (response.runtimeType) {
        case repository.SuccessResponse:
          return BaseResultUseCase.success((response as repository.SuccessResponse).data);
        case repository.ErrorResponseApi:
          return BaseResultUseCase.errorApi((response as repository.ErrorResponseApi).exception);
        case repository.NullOrEmptyData:
        default:
          return BaseResultUseCase.nullOrEmptyData();
      }
    } on Exception catch(e) {
      return BaseResultUseCase.errorApi(e);
    }
  }
}
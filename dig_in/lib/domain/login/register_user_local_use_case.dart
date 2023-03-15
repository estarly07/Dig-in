import 'package:dig_in/base/base_result_use_case.dart';
import 'package:dig_in/domain/login/user_repository.dart';
import 'package:dig_in/domain/models/user_model.dart';

class RegisterUserLocalUseCase {
  final UserRepository _userRepository;
  RegisterUserLocalUseCase(this._userRepository);

  Future<BaseResultUseCase> registerUserLocal(UserModel userModel) async {
    try {
      final response = await _userRepository.registerUserLocal(userModel);    
      return BaseResultUseCase.success(response);
    } on Exception catch (e) {
      return BaseResultUseCase.errorApi(e);
    }
  }
}
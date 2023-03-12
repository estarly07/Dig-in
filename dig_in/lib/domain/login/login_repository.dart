import 'package:dig_in/base/base_result_repository.dart';

abstract class LoginRepository {
  Future<BaseResultRepository> loginByEmailAndPassword(String email,String password);
}
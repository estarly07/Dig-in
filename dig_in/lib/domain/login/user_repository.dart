import 'package:dig_in/base/base_result_repository.dart';

abstract class UserRepository {
  Future<BaseResultRepository> loginByEmailAndPassword(String email,String password);
  Future<BaseResultRepository> registerUserByEmailAndPassword(String email,String password);
}
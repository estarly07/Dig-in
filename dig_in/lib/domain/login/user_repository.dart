import 'package:dig_in/base/base_result_repository.dart';
import 'package:dig_in/domain/models/user_model.dart';

abstract class UserRepository {
  Future<BaseResultRepository> loginByEmailAndPassword(String email,String password);
  Future<BaseResultRepository> registerUserByEmailAndPassword(String email,String password);
  Future<BaseResultRepository> registerUser(UserModel userModel);
  Future<BaseResultRepository> registerUserLocal(UserModel userModel);
  Future<BaseResultRepository> getUserRemote(String uid);
}
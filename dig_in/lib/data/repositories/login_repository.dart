import 'package:dig_in/base/base_result_repository.dart';
import 'package:dig_in/data/api/firebase/login_service_firebase.dart';
import 'package:dig_in/domain/login/user_repository.dart';
import 'package:dig_in/domain/models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final LoginServiceFirebase _loginServiceFirebase;

  UserRepositoryImpl(this._loginServiceFirebase);

  @override
  Future<BaseResultRepository> loginByEmailAndPassword(String email,String password) async{
    try {
      final response = await _loginServiceFirebase.loginByEmailAndPassword(email, password);
      if(response == null ){
        return BaseResultRepository.nullOrEmptyData();
      }else{
        return BaseResultRepository.success(response);
      }
    } on Exception catch (e) {
      print("ERROR $e");
      return BaseResultRepository.errorApi(e);
    }
  }

  @override
  Future<BaseResultRepository> registerUserByEmailAndPassword(String email,String password) async {
    try {
      final response = await _loginServiceFirebase.registerUserByEmailAndPassword(email, password);
      if(response == null ){
        return BaseResultRepository.nullOrEmptyData();
      }else{
        return BaseResultRepository.success(response);
      }
    } on Exception catch (e) {
      print("ERROR $e");
      return BaseResultRepository.errorApi(e);
    }
  }

  @override
  registerUser(UserModel userModel) {
    throw UnimplementedError();
  }
  
}
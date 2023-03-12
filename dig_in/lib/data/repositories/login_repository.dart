import 'package:dig_in/base/base_result_repository.dart';
import 'package:dig_in/data/api/firebase/login_service_firebase.dart';
import 'package:dig_in/domain/login/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginServiceFirebase _loginServiceFirebase;

  LoginRepositoryImpl(this._loginServiceFirebase);

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
  
}
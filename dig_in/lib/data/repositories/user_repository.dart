import 'package:dig_in/base/base_result_repository.dart';
import 'package:dig_in/data/api/database/database_service.dart';
import 'package:dig_in/data/api/firebase/login_service_firebase.dart';
import 'package:dig_in/data/api/response/user_response.dart';
import 'package:dig_in/domain/login/user_repository.dart';
import 'package:dig_in/domain/models/user_model.dart';
import 'package:dig_in/log.dart';

class UserRepositoryImpl implements UserRepository {
  final LoginServiceFirebase _loginServiceFirebase;
  final DatabaseService _databaseService;
  final _tag = "UserRepository";
  UserRepositoryImpl(this._loginServiceFirebase, this._databaseService);

  @override
  Future<BaseResultRepository> loginByEmailAndPassword(String email,String password) async{
    try {
      final response = await _loginServiceFirebase.loginByEmailAndPassword(email, password);
      Log.i(_tag,"$response");
      if(response == null ){
        return BaseResultRepository.nullOrEmptyData();
      }else{
        return BaseResultRepository.success(response);
      }
    } on Exception catch (e) {
      Log.e(_tag,"$e");
      return BaseResultRepository.errorApi(e);
    }
  }

  @override
  Future<BaseResultRepository> registerUserByEmailAndPassword(String email,String password) async {
    try {
      final response = await _loginServiceFirebase.registerUserByEmailAndPassword(email, password);
      Log.i(_tag,"$response");
      if(response == null ){
        return BaseResultRepository.nullOrEmptyData();
      }else{
        return BaseResultRepository.success(response);
      }
    } on Exception catch (e) {
      Log.e(_tag,"$e");
      return BaseResultRepository.errorApi(e);
    }
  }
  
  @override
  Future<BaseResultRepository> registerUser(UserModel userModel)async {
     try {
      final response = await _loginServiceFirebase.registerUser(
        userModel.parse().toJson(),userModel.uid
      );
      Log.i(_tag,"$response");
      if(response){
        return BaseResultRepository.nullOrEmptyData();
      }else{
        return BaseResultRepository.success(response);
      }
    } on Exception catch (e) {
      Log.e(_tag,"$e");
      return BaseResultRepository.errorApi(e);
    }
  }
  
  @override
  Future<BaseResultRepository> registerUserLocal(UserModel userModel) async {
     try {
      final response = await _databaseService.createUser(
        userModel.parse().toJson()
      );
      Log.i(_tag,"$response");
      return BaseResultRepository.success(response != 1);
    } on Exception catch (e) {
      Log.e(_tag,"$e");
      return BaseResultRepository.errorApi(e);
    }
  }
  
  @override
  Future<BaseResultRepository> getUserRemote(String uid) async {
    try {
      final response = await _loginServiceFirebase.getUser(uid);
      Log.i(_tag,"$response");
      if(response ==null){
        return BaseResultRepository.nullOrEmptyData();
      }else{
        return BaseResultRepository.success(UserResponse.fromJson(response).parse());
      }
    } on Exception catch (e) {
      Log.e(_tag,"$e");
      return BaseResultRepository.errorApi(e);
    }
  }
}
extension User  on UserModel{
  UserResponse parse(){
    return UserResponse(email, password, name, lastname, uid, image);
  }
}
extension UserM  on UserResponse{
  UserModel parse(){
    return UserModel(email, password, name, lastname, uid, image);
  }
}
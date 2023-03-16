
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  AppPreferences._();
  static final get  = AppPreferences._();
  final listKeys =["isLogin"];
  late final SharedPreferences _preferences;
  initPreferences() async{
    _preferences = await SharedPreferences.getInstance();
  }

  set isLogin(bool isLogin)=> _preferences.setBool(listKeys[0], isLogin);
  bool get isLogin => _preferences.getBool(listKeys[0]) ?? false;
  
}
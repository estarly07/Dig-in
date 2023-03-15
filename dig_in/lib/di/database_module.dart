import 'package:dig_in/data/api/database/database.dart';
import 'package:get_it/get_it.dart';

void init(GetIt getIt){
    getIt.registerFactory(() => Database());
}
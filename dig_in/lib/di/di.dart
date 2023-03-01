import 'package:dig_in/di/blocs_moduler.dart'       as diBlocs;
import 'package:dig_in/di/repositories_module.dart' as diRepositories;
import 'package:dig_in/di/services_module.dart'     as diServices;
import 'package:dig_in/di/use_case_module.dart'     as diUseCases;
import 'package:get_it/get_it.dart';
final  getIt = GetIt.instance;

void init(){
  diServices    .init(getIt);
  diRepositories.init(getIt);
  diUseCases    .init(getIt);
  diBlocs       .init(getIt);

}
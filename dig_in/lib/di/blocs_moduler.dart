
import 'package:dig_in/presentation/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

void init(GetIt getIt){
  getIt.registerFactory(() => HomeBloc(getIt(),getIt(),getIt()));
}
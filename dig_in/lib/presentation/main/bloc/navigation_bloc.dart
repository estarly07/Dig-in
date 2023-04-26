import 'package:bloc/bloc.dart';
import 'package:dig_in/presentation/routes.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial(Screens.home)) {
    on<ChangeScreenEvent>((event, emit) {
      if (state.currentScreen.last == event.screen) return;
      state.currentScreen.add(event.screen);
      emit(ChangeScreenState(state.currentScreen));
    });
    on<BackScreenEvent>((event, emit) {
      state.currentScreen..removeLast();
      emit(ChangeScreenState(state.currentScreen));
    });
  }
}

part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState {
  final List<String> currentScreen;

  NavigationState(this.currentScreen);
}

class NavigationInitial extends NavigationState {
  NavigationInitial(String currentScreen) : super([currentScreen]);
}

class ChangeScreenState extends NavigationState {
  ChangeScreenState(List<String> currentScreen) : super(currentScreen);
}

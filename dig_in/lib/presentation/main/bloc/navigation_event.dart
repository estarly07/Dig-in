part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

class ChangeScreenEvent extends NavigationEvent {
  final String screen;
  ChangeScreenEvent(this.screen);
}

class BackScreenEvent extends NavigationEvent {}

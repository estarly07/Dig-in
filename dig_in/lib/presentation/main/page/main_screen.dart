import 'package:dig_in/presentation/main/provider/main_provider.dart';
import 'package:dig_in/presentation/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../routes.dart';
import '../bloc/navigation_bloc.dart';
import '../widgets/navigation_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async {
              if (state.currentScreen != Screens.home) {
                context.read<NavigationBloc>().add(BackScreenEvent());
                return false;
              }
              return true;
            },
            child: Stack(
              children: [
                _getScreen(state.currentScreen.last),
                MainProvider(
                    currentPage: state.currentScreen.last,
                    onClickNavigation: (screen) {
                      context
                          .read<NavigationBloc>()
                          .add(ChangeScreenEvent(screen));
                    },
                    child: CustomNavigationBar()),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget _getScreen(String screen) {
  switch (screen) {
    case Screens.home:
      return const HomeScreen();
    default:
      return Container();
  }
}

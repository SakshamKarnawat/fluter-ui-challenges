import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morse_code_learning/providers/bloc/landing_pageview_bloc.dart';
import 'package:morse_code_learning/providers/bloc/navbar_bloc.dart';
import 'package:morse_code_learning/screens/home_screen.dart';
import 'package:morse_code_learning/screens/landing_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // * Wrapping the whole app with MultiBlocProvider to provide blocs to all the screens:
    return MultiBlocProvider(
      providers: [
        BlocProvider<LandingPageViewBloc>(
          // * Creating LandingPageViewBloc and updating its state to 0
          create: (_) => LandingPageViewBloc()..add(UpdatePageViewIndex(0)),
        ),
        BlocProvider<NavbarBloc>(
          // * Creating NavbarBloc and updating its state to 0
          create: (_) => NavbarBloc()..add(UpdatePage(0)),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData.light().copyWith(
        // ),
        // * Setting routes for the app:
        initialRoute: LandingScreen.route,
        routes: {
          LandingScreen.route: (context) => const LandingScreen(),
          HomeScreen.route: (context) => const HomeScreen(),
        },
      ),
    );
  }
}

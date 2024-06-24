import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/Screens/Login-Signup/login.dart';
import 'package:medical/Screens/Views/Dashboard_screen.dart';
import 'package:medical/Screens/Views/Screen1.dart';
import 'package:medical/bloc/login/login_cubit.dart';
import 'package:medical/bloc/register/register_cubit.dart';
import 'package:medical/firebase_options.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Medics());
}

class Medics extends StatelessWidget {
  const Medics({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit())
      ],
      child: ResponsiveSizer(builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Screen1(),
          initialRoute: '/login',
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            // When navigating to the "/second" route, build the SecondScreen widget.
            '/login': (context) => login(),
            '/mainmenu': (context) => Dashboard(),
          },
        );
      }),
    );
  }
}

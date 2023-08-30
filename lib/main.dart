
import 'package:chatapp/pages/chat.dart';
import 'package:chatapp/pages/cubits/chat_cubit/chat_cubit_cubit.dart';
import 'package:chatapp/pages/cubits/login_cubit/login_cubit.dart';
import 'package:chatapp/pages/cubits/register_cubit/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/login.dart';
import 'pages/register.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
       BlocProvider(create: (context)=> LoginCubit()),
       BlocProvider(create: (context)=> RegisterCubit()),
       BlocProvider(create: (context)=> ChatCubitCubit()),
     ],
      child: MaterialApp(
        initialRoute: 'LoginScreen',
        routes: {
          'LoginScreen': (context) => LoginPage(),
          'RegisterScreen': (context) => RegisterScreen(),
          'ChatScreen': (context) => ChatScreenS(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

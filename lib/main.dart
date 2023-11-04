import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UI/dashboard.dart';
import 'UI/homeui.dart';
import 'UI/signin/signin.dart';
import 'blocs/userslist/user_list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>UserListBloc()),
      ],
      child: MaterialApp(
        title: 'Cars',debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
       home: SignInScreen(),
       // home: HomeUiPage(),
      ),
    );
  }
}


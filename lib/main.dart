import 'package:a2_final2/cep/home_cep.dart';
import 'package:a2_final2/provider/users.dart';
import 'package:a2_final2/routes/app_routes.dart';
import 'package:a2_final2/views/user_form.dart';
import 'package:a2_final2/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() {
  runApp(const MyApp(),);
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Projeto A2',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {

          AppRoutes.home: (_) => const HomePage(),
          AppRoutes.userForm: (_) => const UserForm(),
          AppRoutes.userList: (_) => const UserList(),
          AppRoutes.homeCep: (_) => const HomeCep(),
        },
      ),
    );
  }
}
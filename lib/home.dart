import 'package:a2_final2/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Aplicação',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }

  
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {

                  Navigator.of(context).pushNamed(
                  AppRoutes.userList,
                );
                // Lógica para o botão "Usuário"
                print('Botão Usuário pressionado!');
              },
              child: Text('Lista de Usuário'),
            ),
            SizedBox(height: 16), // Espaçamento entre os botões
            ElevatedButton(
              onPressed: () {

                Navigator.of(context).pushNamed(
                  AppRoutes.homeCep,
                );
                // Lógica para o botão "Consultar CEP"
                print('Botão Consultar CEP pressionado!');
              },
              child: Text('Consultar CEP'),
            ),
          ],
        ),
      ),
    );
  }
}
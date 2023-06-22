import 'package:a2_final2/provider/users.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../components/user_tile.dart';
import '../models/user.dart';
import '../routes/app_routes.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.userForm,
                arguments: const User(
                  id: '',
                  name: '',
                  email: '',
                  avatarUrl: '',
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}

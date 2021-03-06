import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // para nao notificar a mudança de interface
    // final Users users = Provider.of(context, listen: false);
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuários'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // adicionar usuário
              // users.put(
              //     User(name: 'Teste', email: 'teste@teste.com', avatarUrl: ''));

              // remover usuario
              // users.remove(users.byIndex(0));

              //edição
              // users.put(User(id: '2',
              // name: 'Rafael',
              // email: 'rafael@teste.com',
              // avatarUrl: ''));

              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM
              );
            },
          )
        ],
      ),
      body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (ctx, i) => UserTile(users.byIndex(i))),
    );
  }
}

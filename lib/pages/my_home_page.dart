import 'package:bloc_network_demo/bloc/user_bloc.dart';
import 'package:bloc_network_demo/bloc/user_event.dart';
import 'package:bloc_network_demo/services/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/action_button.dart';
import '../widgets/users_list.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: BlocProvider(
        create: (context) =>
            UserBloc(userRepository: context.read<UserRepository>())
              ..add(UserLoadEvent()),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Users List'),
            backgroundColor: Colors.indigo[300],
            centerTitle: true,
          ),
          body: Column(
            children: [
              ActionButton(),
              Expanded(
                child: UsersList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

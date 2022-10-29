import 'dart:developer';

import 'package:bloc_network_demo/bloc/user_bloc.dart';
import 'package:bloc_network_demo/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: ((context, state) {
        log(state.toString());
        if (state is UserLoadedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Users is loaded'),
            ),
          );
        }
      }),
      builder: (context, state) {
        if (state is UserEmptyState) {
          return Center(
            child: Text(
              'No data received. Please button "Load"',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        if (state is UserLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.white70 : Colors.blue[50],
              child: ListTile(
                leading: Text(
                  'ID: ${state.loadedUser[index].id}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                title: Column(
                  children: [
                    Text(
                      state.loadedUser[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        Text(
                          'email: ${state.loadedUser[index].email}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'phone: ${state.loadedUser[index].phone}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is UserErrorState) {
          return Center(
            child: Text('Error fetching users'),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

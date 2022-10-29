import 'package:bloc_network_demo/bloc/user_bloc.dart';
import 'package:bloc_network_demo/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = context.read<UserBloc>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () => userBloc.add(UserLoadEvent()),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: Text('load'),
        ),
        SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () => userBloc.add(UserClearEvent()),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: Text('clear'),
        ),
      ],
    );
  }
}

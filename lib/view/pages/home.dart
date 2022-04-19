import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_grading_app/core/model/registrar.dart';

import '../../core/bloc/auth/auth_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (_, current) => current is Authenticated,
        builder: (_, state) {
          return Scaffold(
            body: _contents(context, state),
          );
        });
  }

  Widget _contents(BuildContext context, AuthState state) {
    if (state is Authenticated) {
      switch (state.currentUser.runtimeType) {
        case RegistrarModel:
          return Container();
        default:
          return Container(color: Colors.red);
      }
    } else {
      // Invalid AuthState
      return Container();
    }
  }
}
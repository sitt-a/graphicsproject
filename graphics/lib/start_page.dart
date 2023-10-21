
import 'package:students_voice/presentation/common/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'application/Auth/Bloc/Auth_bloc.dart';
import 'application/manager/bloc/manager_bloc.dart';
import 'application/user/bloc/userbloc_bloc.dart';

class startpage extends StatelessWidget {
  startpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
        ),
        BlocProvider<ManagerblocBloc>(
          create: (BuildContext context) => ManagerblocBloc(),
        ),
        BlocProvider<UserblocBloc>(
          create: (BuildContext context) => UserblocBloc(),
        ),
      ],
      child: RouteGenerator(),
      
    );
  }
}

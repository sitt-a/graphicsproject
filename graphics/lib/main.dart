import 'package:students_voice/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'Start_page.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(MyApp()),
      blocObserver: StudentsVoiceBlocObserver());
}

// RouteGenerator routeGenerator = RouteGenerator();
// final _router = routeGenerator.routes;

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return startpage();
    
    // MultiBlocProvider(
    //   providers: [
    //     BlocProvider<AuthBloc>(
    //       create: (BuildContext context) => AuthBloc(),
    //     ),
    //     BlocProvider<ManagerblocBloc>(
    //       create: (BuildContext context) => ManagerblocBloc(),
    //     ),
    //     BlocProvider<UserblocBloc>(
    //       create: (BuildContext context) => UserblocBloc(),
    //     ),
    //   ],
    //   child: MaterialApp.router(
    //       debugShowCheckedModeBanner: false,
    //       routeInformationParser: _router.routeInformationParser,
    //       routerDelegate: _router.routerDelegate),
    // );
  
  }
}

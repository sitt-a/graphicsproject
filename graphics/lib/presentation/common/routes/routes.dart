

import 'package:students_voice/presentation/manager/managerScreen.dart';
import 'package:students_voice/presentation/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteGenerator extends StatelessWidget{
  // dynamic routes;
  RouteGenerator({super.key});
  final gorouter = 
    GoRouter(initialLocation: '/',
    debugLogDiagnostics: true,
     routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => ComplaintPage(),
      ),
      
      GoRoute(
          path: '/userScreen',
          builder: (context, state) => userScreen()),
      
      GoRoute(
          path: '/loginScreen',
          builder: (context,state) =>
              const loginScreen()),
      
      GoRoute(
          path: '/managerScreen', 
          builder: (context, state) => ManagerScreen()),
      
      GoRoute(
          path: '/signupScreen',
          builder: (context, state) => const signupScreen()),

      GoRoute(
        path: '/adminScreen',
        builder: (context, state) => adminScreen(),
      ),

      GoRoute(path: '/MyProfile',
      builder: (context, state) =>  MyProfile()),

      // GoRoute(path: '/myreports',
      //         builder: (context, state) =>  MyReports()),

      // GoRoute(path: '/myprofile',
      //         builder: (context, state) => Profilepage(user: state.extra!),),

      // GoRoute(path: '/editprofile',
      //        builder: (context, state) => EditProfile(user: state.extra!),),

      // GoRoute(path: '/userviewdetail',
      //        builder: (context, state) => UserViewDetail(detail: state.extra!),),

      // GoRoute(path: '/policeviewdetail',
      //        builder: (context, state) => PoliceViewDetail(detail: state.extra!),),

      // GoRoute(path: '/about',
      //        builder: (context, state) => const About()),

    ]);
     @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: gorouter.routerDelegate,
      routeInformationParser: gorouter.routeInformationParser,
      routeInformationProvider: gorouter.routeInformationProvider,
    );
  }
  }

//   dynamic getRoutes() {
//      return routes;
//   }
// }

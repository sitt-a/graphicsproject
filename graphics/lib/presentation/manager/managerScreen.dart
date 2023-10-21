import 'package:flutter/material.dart';
import 'package:students_voice/presentation/manager/ongoingComplaintScreen.dart';
import 'package:students_voice/presentation/manager/solvedComplaintScreen.dart';
import 'package:students_voice/presentation/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:convert';
import '../../application/Auth/Bloc/Auth_state.dart';
import '../../application/Auth/auth.dart';
import 'package:students_voice/application/Auth/Bloc/Auth_bloc.dart';
import '../../application/manager/bloc/manager_bloc.dart';
import '../components/bottumNavBar.dart';
import '../components/reportedCard.dart';
import '../../domain/Complaint_model/report.dart';

class ManagerScreen extends StatefulWidget {
  ManagerScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<ManagerScreen> createState() => _ReportComplaintState();
}

class _ReportComplaintState extends State<ManagerScreen> {
  late IO.Socket socket;
  List<Report> reported = [];
  dynamic message;
  dynamic user;

  @override
  void initState() {
    super.initState();
    connect();
  }

  dynamic connect() async {
    try {
      socket = IO.io('http://localhost:3000', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });
      socket.connect();
      socket.emit("login", user.userId);
      socket.onConnect((data) {
        socket.on("report", (msg) async {
          message = msg;
          final managerBloc = BlocProvider.of<ManagerblocBloc>(context);
          managerBloc.add(
            GetReported(msg),
          );
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
          children: [
            SafeArea(
              child: Container(
                child: Stack(clipBehavior: Clip.none, children: [
                  const Card(
                    child: ListTile(
                      leading: Image(
                          width: 120,
                          image: AssetImage('assets/images/logo.jpg')),
                      title: Text(
                        'Reported',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 5,
                      right: 15,
                      child: Container(
                          color: Colors.white,
                          width: 60,
                          height: 60,
                          child: const Image(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/speaker.jpg'))))
                ]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Reported Complaints',
              style: TextStyle(
                  fontFamily: 'times',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<ManagerblocBloc, ManagerblocState>(
                builder: (_, ManagerblocState managerState) {
              bool selected1 = true;
              bool selected2 = false;
              bool selected3 = false;
              if (managerState is GetSolvedSucessful) {
                selected1 = false;
                selected2 = false;
                selected3 = true;
              }
              if (managerState is GetOngoingSucessful) {
                selected1 = false;
                selected2 = true;
                selected3 = false;
              }
              if (managerState is GetReportedSucessful) {
                selected1 = true;
                selected2 = false;
                selected3 = false;
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 4.0,
                              color: selected1 ? Colors.orange : Colors.black),
                        ),
                      ),
                      width: 100,
                      height: 40,
                      child: const Text(
                        'Reported',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      alignment: Alignment.center,
                    ),
                    onTap: () {
                      final managerBloc =
                          BlocProvider.of<ManagerblocBloc>(context);
                      managerBloc.add(
                        GetReported(message),
                      );
                    },
                  ),
                  InkWell(
                    hoverColor: Colors.orange,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 4.0,
                              color: selected2 ? Colors.orange : Colors.black),
                        ),
                      ),
                      width: 100,
                      height: 40,
                      child: const Text(
                        'OnGoing',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      alignment: Alignment.center,
                    ),
                    onTap: () async {
                      final managerBloc =
                          BlocProvider.of<ManagerblocBloc>(context);
                      managerBloc.add(
                        GetOngoing(user.name, ongoing: null),
                      );
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 4.0,
                              color: selected3 ? Colors.orange : Colors.black),
                        ),
                      ),
                      width: 100,
                      height: 40,
                      child: const Text(
                        'Solved',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      alignment: Alignment.center,
                    ),
                    onTap: () async {
                      final managerBloc =
                          BlocProvider.of<ManagerblocBloc>(context);
                      managerBloc.add(
                        GetSolved(user.name),
                      );
                    },
                  ),
                ],
              );
            }),
            BlocBuilder<ManagerblocBloc, ManagerblocState>(
                builder: (_, ManagerblocState managerState) {
              if (managerState is ManagerblocInitial) {
                return BlocBuilder<AuthBloc, AuthState>(
                    builder: (_, AuthState state) {
                  if (state is LoginSuccessful) {
                    user = state.response;
                    return Container(
                        padding: const EdgeInsets.all(70),
                        child: Column(children: const [
                          Text(
                            'no new reported data ',
                            style: TextStyle(
                                fontFamily: "italic",
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          Text('tap ongoing for previously recived',
                              style: TextStyle(
                                  fontFamily: "italic",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17))
                        ]));
                  }
                  return const Text('');
                });
              } else if (managerState is GetReportedSucessful) {
                reported.insert(0, managerState.complaintList);
                return Expanded(
                  child: ListView.builder(
                      itemCount: (reported).length,
                      itemBuilder: (BuildContext context, int index) {
                        return ReportedCard(
                          title: (reported)[index].title,
                          description: reported[index].description,
                          university: reported[index].university,
                        );
                      }),
                );
              } else if (managerState is GetOngoingSucessful) {
                return OngoingComplaint(
                    ongoing: json.decode(managerState.complaintList.body));
              } else if (managerState is GetSolvedSucessful) {
                return SolvedComplaint(
                    solved: json.decode(managerState.complaintList.body));
              } else {
                return const Text('');
              }
            })
          ],
        )),
        bottomNavigationBar:
            BlocBuilder<AuthBloc, AuthState>(builder: (_, AuthState state) {
          if (state is LoginSuccessful) {
            user = state.response;
            return BottomNavBar(image: user.imgUrl, user: user);
          }
          return const Text('');
        }));
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:students_voice/application/Auth/Bloc/Auth_bloc.dart';
// import 'package:students_voice/application/Auth/Bloc/Auth_state.dart';
// import 'package:students_voice/application/manager/bloc/manager_bloc.dart';
// import 'package:students_voice/presentation/manager/ongoingComplaintScreen.dart';
// import 'package:students_voice/presentation/manager/solvedComplaintScreen.dart';
// import 'package:students_voice/presentation/screens.dart';
// import 'package:students_voice/domain/Complaint_model/report.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'dart:convert';

// import '../components/bottumNavBar.dart';
// import '../components/reportedCard.dart';

// class ManagerScreen extends StatefulWidget {
//   ManagerScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<ManagerScreen> createState() => _ManagerScreenState();
// }

// class _ManagerScreenState extends State<ManagerScreen> {
//   late IO.Socket socket;
//   List<Report> reported = [];
//   dynamic message;
//   dynamic user;
//   bool _reportedComplaintState = true;
//   bool _announcementState = false;

//   @override
//   void initState() {
//     super.initState();
//     connect();
//   }

//   dynamic connect() async {
//     try {
//       socket = IO.io('http://localhost:3000', <String, dynamic>{
//         'transports': ['websocket'],
//         'autoConnect': false,
//       });
//       socket.connect();
//       socket.emit("login", user.userId);
//       socket.onConnect((data) {
//         socket.on("report", (msg) async {
//           message = msg;
//           final managerBloc = BlocProvider.of<ManagerblocBloc>(context);
//           managerBloc.add(
//             GetReported(msg),
//           );
//         });
//       });
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   void _toggleReportedComplaintState() {
//     setState(() {
//       _reportedComplaintState = true;
//       _announcementState = false;
//     });
//   }

//   void _toggleAnnouncementState() {
//     setState(() {
//       _reportedComplaintState = false;
//       _announcementState = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             SafeArea(
//               child: Container(
//                 child: Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     const Card(
//                       child: ListTile(
//                         leading: Image(
//                           width: 120,
//                           image: AssetImage('assets/images/logo.jpg'),
//                         ),
//                         title: Text(
//                           'Reported',
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.green,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 5,
//                       right: 15,
//                       child: Container(
//                         color: Colors.white,
//                         width: 60,
//                         height: 60,
//                         child: const Image(
//                           fit: BoxFit.cover,
//                           image: AssetImage('assets/images/speaker.jpg'),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Text(
//               'Reported Complaints',
//               style: TextStyle(
//                 fontFamily: 'times',
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 InkWell(
//                   onTap: _toggleReportedComplaintState,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border(
//                         bottom: BorderSide(
//                           width: 4.0,
//                           color: _reportedComplaintState
//                               ? Colors.orange
//                               : Colors.black,
//                         ),
//                       ),
//                     ),
//                     width: 100,
//                     height: 40,
//                     child: const Text(
//                       'Reported',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     alignment: Alignment.center,
//                   ),
//                 ),
//                 InkWell(
//                   onTap: _toggleAnnouncementState,
//                   hoverColor: Colors.orange,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border(
//                         bottom: BorderSide(
//                           width: 4.0,
//                           color:
//                               _announcementState ? Colors.orange : Colors.black,
//                         ),
//                       ),
//                     ),
//                     width: 100,
//                     height: 40,
//                     child: const Text(
//                       'Announcement',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     alignment: Alignment.center,
//                   ),
//                 ),
//               ],
//             ),
//             if (_reportedComplaintState)
//               BlocBuilder<ManagerblocBloc, ManagerblocState>(
//                 builder: (_, ManagerblocState managerState) {
//                   bool selected1 = true;
//                   bool selected2 = false;
//                   bool selected3 = false;
//                   if (managerState is GetSolvedSucessful) {
//                     selected1 = false;
//                     selected2 = false;
//                     selected3 = true;
//                   }
//                   if (managerState is GetOngoingSucessful) {
//                     selected1 = false;
//                     selected2 = true;
//                     selected3 = false;
//                   }
//                   if (managerState is GetReportedSucessful) {
//                     selected1 = true;
//                     selected2 = false;
//                     selected3 = false;
//                   }

//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       const SizedBox(
//                         height: 50,
//                       ),
//                       InkWell(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                 width: 4.0,
//                                 color: selected1
//                                     ? Colors.orange
//                                     : Colors.black,
//                               ),
//                             ),
//                           ),
//                           width: 100,
//                           height: 40,
//                           child: const Text(
//                             'Reported',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           alignment: Alignment.center,
//                         ),
//                         onTap: () {
//                           final managerBloc =
//                               BlocProvider.of<ManagerblocBloc>(context);
//                           managerBloc.add(
//                             GetReported(message),
//                           );
//                         },
//                       ),
//                       InkWell(
//                         hoverColor: Colors.orange,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                 width: 4.0,
//                                 color: selected2
//                                     ? Colors.orange
//                                     : Colors.black,
//                               ),
//                             ),
//                           ),
//                           width: 100,
//                           height: 40,
//                           child: const Text(
//                             'OnGoing',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           alignment: Alignment.center,
//                         ),
//                         onTap: () async {
//                           final managerBloc =
//                               BlocProvider.of<ManagerblocBloc>(context);
//                           managerBloc.add(
//                             GetOngoing(user.name, ongoing: null),
//                           );
//                         },
//                       ),
//                       InkWell(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                 width: 4.0,
//                                 color: selected3
//                                     ? Colors.orange
//                                     : Colors.black,
//                               ),
//                             ),
//                           ),
//                           width: 100,
//                           height: 40,
//                           child: const Text(
//                             'Solved',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           alignment: Alignment.center,
//                         ),
//                         onTap: () async {
//                           final managerBloc =
//                               BlocProvider.of<ManagerblocBloc>(context);
//                           managerBloc.add(
//                             GetSolved(user.name),
//                           );
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             if (_reportedComplaintState)
//               BlocBuilder<ManagerblocBloc, ManagerblocState>(
//                 builder: (_, ManagerblocState managerState) {
//                   if (managerState is ManagerblocInitial) {
//                     return BlocBuilder<AuthBloc, AuthState>(
//                       builder: (_, AuthState state) {
//                         if (state is LoginSuccessful) {
//                           user = state.response;
//                           return Container(
//                             padding: const EdgeInsets.all(70),
//                             child: Column(
//                               children: const [
//                                 Text(
//                                   'no new reported data ',
//                                   style: TextStyle(
//                                     fontFamily: "italic",
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 17,
//                                   ),
//                                 ),
//                                 Text(
//                                   'tap ongoing for previously received',
//                                   style: TextStyle(
//                                     fontFamily: "italic",
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 17,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }
//                         return const Text('');
//                       },
//                     );
//                   } else if (managerState is GetReportedSucessful) {
//                     reported.insert(0, managerState.complaintList);
//                     return Expanded(
//                       child: ListView.builder(
//                         itemCount: reported.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return ReportedCard(
//                             title: reported[index].title,
//                             description: reported[index].description,
//                             university: reported[index].university,
//                           );
//                         },
//                       ),
//                     );
//                   } else if (managerState is GetOngoingSucessful) {
//                     return OngoingComplaint(
//                       ongoing: json.decode(managerState.complaintList.body),
//                     );
//                   } else if (managerState is GetSolvedSucessful) {
//                     return SolvedComplaint(
//                       solved: json.decode(managerState.complaintList.body),
//                     );
//                   } else {
//                     return const Text('');
//                   }
//                 },
//               ),
//             if (_announcementState)
//               // Replace with your announcement screen
//               Container(
//                 child: Text('Announcement Screen'),
//               ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BlocBuilder<AuthBloc, AuthState>(
//         builder: (_, AuthState state) {
//           if (state is LoginSuccessful) {
//             user = state.response;
//             return BottomNavBar(image: user.imgUrl, user: user);
//           }
//           return const Text('');
//         },
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:students_voice/application/Auth/Bloc/Auth_bloc.dart';
// import 'package:students_voice/application/Auth/Bloc/Auth_state.dart';
// import 'package:students_voice/application/manager/bloc/manager_bloc.dart';
// import 'package:students_voice/presentation/manager/ongoingComplaintScreen.dart';
// import 'package:students_voice/presentation/manager/solvedComplaintScreen.dart';
// import 'package:students_voice/presentation/screens.dart';
// import 'package:students_voice/domain/Complaint_model/report.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'dart:convert';

// import '../components/bottumNavBar.dart';
// import '../components/reportedCard.dart';

// class managerScreen extends StatefulWidget {
//   managerScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<managerScreen> createState() => _managerScreenState();
// }

// class _managerScreenState extends State<managerScreen> {
//   late IO.Socket socket;
//   List<Report> reported = [];
//   dynamic message;
//   dynamic user;
//   bool _reportedComplaintState = true;
//   bool _announcementState = false;

//   @override
//   void initState() {
//     super.initState();
//     connect();
//   }

//   dynamic connect() async {
//     try {
//       socket = IO.io('http://localhost:3000', <String, dynamic>{
//         'transports': ['websocket'],
//         'autoConnect': false,
//       });
//       socket.connect();
//       socket.emit("login", user.userId);
//       socket.onConnect((data) {
//         socket.on("report", (msg) async {
//           message = msg;
//           final managerBloc = BlocProvider.of<ManagerblocBloc>(context);
//           managerBloc.add(
//             GetReported(msg),
//           );
//         });
//       });
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   void _toggleReportedComplaintState() {
//     setState(() {
//       _reportedComplaintState = true;
//       _announcementState = false;
//     });
//   }

//   void _toggleAnnouncementState() {
//     setState(() {
//       _reportedComplaintState = false;
//       _announcementState = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             SafeArea(
//               child: Container(
//                 child: Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     const Card(
//                       child: ListTile(
//                         leading: Image(
//                           width: 120,
//                           image: AssetImage('assets/images/logo.jpg'),
//                         ),
//                         title: Text(
//                           'Reported',
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.green,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 5,
//                       right: 15,
//                       child: Container(
//                         color: Colors.white,
//                         width: 60,
//                         height: 60,
//                         child: const Image(
//                           fit: BoxFit.cover,
//                           image: AssetImage('assets/images/speaker.jpg'),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Text(
//               'Reported Complaints',
//               style: TextStyle(
//                 fontFamily: 'times',
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 InkWell(
//                   onTap: _toggleReportedComplaintState,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border(
//                         bottom: BorderSide(
//                           width: 4.0,
//                           color: _reportedComplaintState
//                               ? Colors.orange
//                               : Colors.black,
//                         ),
//                       ),
//                     ),
//                     width: 100,
//                     height: 40,
//                     child: const Text(
//                       'Reported',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     alignment: Alignment.center,
//                   ),
//                 ),
//                 InkWell(
//                   onTap: _toggleAnnouncementState,
//                   hoverColor: Colors.orange,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border(
//                         bottom: BorderSide(
//                           width: 4.0,
//                           color:
//                               _announcementState ? Colors.orange : Colors.black,
//                         ),
//                       ),
//                     ),
//                     width: 100,
//                     height: 40,
//                     child: const Text(
//                       'Announcement',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     alignment: Alignment.center,
//                   ),
//                 ),
//               ],
//             ),
//             if (_reportedComplaintState)
//               BlocBuilder<ManagerblocBloc, ManagerblocState>(
//                 builder: (_, ManagerblocState managerState) {
//                   bool selected1 = true;
//                   bool selected2 = false;
//                   bool selected3 = false;
//                   if (managerState is GetSolvedSucessful) {
//                     selected1 = false;
//                     selected2 = false;
//                     selected3 = true;
//                   }
//                   if (managerState is GetOngoingSucessful) {
//                     selected1 = false;
//                     selected2 = true;
//                     selected3 = false;
//                   }
//                   if (managerState is GetReportedSucessful) {
//                     selected1 = true;
//                     selected2 = false;
//                     selected3 = false;
//                   }

//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       const SizedBox(
//                         height: 50,
//                       ),
//                       InkWell(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                 width: 4.0,
//                                 color: selected1
//                                     ? Colors.orange
//                                     : Colors.black,
//                               ),
//                             ),
//                           ),
//                           width: 100,
//                           height: 40,
//                           child: const Text(
//                             'Reported',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           alignment: Alignment.center,
//                         ),
//                         onTap: () {
//                           final managerBloc =
//                               BlocProvider.of<ManagerblocBloc>(context);
//                           managerBloc.add(
//                             GetReported(message),
//                           );
//                         },
//                       ),
//                       InkWell(
//                         hoverColor: Colors.orange,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                 width: 4.0,
//                                 color: selected2
//                                     ? Colors.orange
//                                     : Colors.black,
//                               ),
//                             ),
//                           ),
//                           width: 100,
//                           height: 40,
//                           child: const Text(
//                             'OnGoing',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           alignment: Alignment.center,
//                         ),
//                         onTap: () async {
//                           final managerBloc =
//                               BlocProvider.of<ManagerblocBloc>(context);
//                           managerBloc.add(
//                             GetOngoing(user.name, ongoing: null),
//                           );
//                         },
//                       ),
//                       InkWell(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                 width: 4.0,
//                                 color: selected3
//                                     ? Colors.orange
//                                     : Colors.black,
//                               ),
//                             ),
//                           ),
//                           width: 100,
//                           height: 40,
//                           child: const Text(
//                             'Solved',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           alignment: Alignment.center,
//                         ),
//                         onTap: () async {
//                           final managerBloc =
//                               BlocProvider.of<ManagerblocBloc>(context);
//                           managerBloc.add(
//                             GetSolved(user.name),
//                           );
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             if (_reportedComplaintState)
//               BlocBuilder<ManagerblocBloc, ManagerblocState>(
//                 builder: (_, ManagerblocState managerState) {
//                   if (managerState is ManagerblocInitial) {
//                     return BlocBuilder<AuthBloc, AuthState>(
//                       builder: (_, AuthState state) {
//                         if (state is LoginSuccessful) {
//                           user = state.response;
//                           return Container(
//                             padding: const EdgeInsets.all(70),
//                             child: Column(
//                               children: const [
//                                 Text(
//                                   'no new reported data ',
//                                   style: TextStyle(
//                                     fontFamily: "italic",
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 17,
//                                   ),
//                                 ),
//                                 Text(
//                                   'tap ongoing for previously received',
//                                   style: TextStyle(
//                                     fontFamily: "italic",
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 17,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }
//                         return const Text('');
//                       },
//                     );
//                   } else if (managerState is GetReportedSucessful) {
//                     reported.insert(0, managerState.complaintList);
//                     return Expanded(
//                       child: ListView.builder(
//                         itemCount: reported.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return ReportedCard(
//                             title: reported[index].title,
//                             description: reported[index].description,
//                             university: reported[index].university,
//                           );
//                         },
//                       ),
//                     );
//                   } else if (managerState is GetOngoingSucessful) {
//                     return OngoingComplaint(
//                       ongoing: json.decode(managerState.complaintList.body),
//                     );
//                   } else if (managerState is GetSolvedSucessful) {
//                     return SolvedComplaint(
//                       solved: json.decode(managerState.complaintList.body),
//                     );
//                   } else {
//                     return const Text('');
//                   }
//                 },
//               ),
//             if (_announcementState)
//               // Replace with your announcement screen
//               Container(
//                 child: Text('Announcement Screen'),
//               ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BlocBuilder<AuthBloc, AuthState>(
//         builder: (_, AuthState state) {
//           if (state is LoginSuccessful) {
//             user = state.response;
//             return BottomNavBar(image: user.imgUrl, user: user);
//           }
//           return const Text('');
//         },
//       ),
//     );
//   }
// }

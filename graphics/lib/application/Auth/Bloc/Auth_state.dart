import 'package:equatable/equatable.dart';

import '../../../domain/Announcement_model/announcement.dart';
abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}
class LogingIn extends AuthState {}
// class LoginSuccessful extends AuthState {
//   final String username;

//   LoginSuccessful(this.username);

//   @override
//   List<Object> get props => [username];
// }
class LoginSuccessful extends AuthState {
  final response;   final Announcement;
  LoginSuccessful(this.response,this.Announcement,);
}

// class LoginSuccessful extends AuthState {
//   final dynamic response;
//   final dynamic Announcement;

//   LoginSuccessful(this.response, this.Announcement);

//   @override
//   List<Object> get props => [response, Announcement];
// }

class LoginFailed extends AuthState {
  // final Object error;

  // LoginFailed(this.error);

  // @override
  // List<Object> get props => [error];
}
class SignUpInitial extends AuthState {}
class SigningIn extends AuthState {}
class SignUpSuccessful extends AuthState {}
class SignUpFailed extends AuthState {}
class LoggingOut extends AuthState {}
class LogedOut extends AuthState {}


///itemine
///
///
// ////// its mine start
// class Response {
//   final String role;

//   Response(this.role);
// }
// class LoginSuccessful extends AuthState {
//   final Response response;
//   final Announcement announcement;

//   LoginSuccessful(this.response, this.announcement);

//   @override
//   List<Object> get props => [response, announcement];
// }
///its mine end

// Usage example:
// class Announcement {
//   final String announcementId;
//   final String title;
//   final String author;
//   final String body;

//   Announcement({
//     required this.announcementId,
//     required this.title,
//     required this.author,
//     required this.body,
//   });
// // }
// final response = Response('manager');
// final announcement = Announcement(
//   announcementId: 'announcement1',
//   title: 'Example Announcement',
//   author: 'John Doe',
//   body: 'Lorem ipsum dolor sit amet.',
// );
// final loginSuccessfulState = LoginSuccessful(response, announcement);
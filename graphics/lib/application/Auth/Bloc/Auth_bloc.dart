import 'package:bloc/bloc.dart';
// import 'package:students_voice/domain/model.dart';
import 'Auth_event.dart';
import 'Auth_state.dart';
import '../../../infrastructure/repository/manager_repository.dart';
import '../../../infrastructure/repository/user_repository.dart';
class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final userRepository = UserRepository();
  final managerRepository = ManagerRepository();

  AuthBloc() : super(AuthInitial()) {
    on<Login>(_onLogin);
    on<SignUp>(_onSignUp);
    on<LogOut>(_onLogOut);
  }

 void _onLogin(Login event, Emitter emit) async {
    emit(LogingIn());
    final response =
        await userRepository.getUser(event.username, event.password);
    final Announcement = await userRepository.getAnnouncement();
    if (response == 401) {
      emit(LoginFailed());
    } else {
      emit(LoginSuccessful(response, Announcement));
    }
  }



  void _onSignUp(SignUp event, Emitter emit) async {
    emit(SigningIn());
    final response =
        await userRepository.getUser(event.username, event.password);
    if (response == 400 || response == 401) {
      await userRepository.signUpUser(event.body);
      emit(SignUpSuccessful());
    } else {
      emit(SignUpFailed());
    }
  }

  void _onLogOut(LogOut event, Emitter emit) async {
    emit(LoggingOut());
    await userRepository.deleteToken();
    emit(LogedOut());
  }
}

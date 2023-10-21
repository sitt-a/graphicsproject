import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import '../../../infrastructure/repository/user_repository.dart';
part 'userbloc_event.dart';
part 'userbloc_state.dart';

class UserblocBloc extends Bloc<UserblocEvent, UserblocState> {
  final userRepository = UserRepository();

  UserblocBloc() : super(UserblocInitial()) {
    on<GetMyReport>(_onGetMyReport);
    on<DeleteReported>(_onDeleteReported);
    on<GetAnnouncement>(_onGetAnnouncement);
    on<UpdateProfile>(_onUpdateProfile);
    on<ReportNows>(_onReport);
  }

  void _onGetAnnouncement(GetAnnouncement event, Emitter emit) async {
    emit(SampleFound());
  }

  void _onGetMyReport(GetMyReport event, Emitter emit) async {
    dynamic myreport = await userRepository.getMyReport(event.id);
    if (myreport == null) {
      emit(ReportFoundFailed);
    } else {
      emit(ReportFound(myreports: myreport));
    }
  }

  void _onUpdateProfile(UpdateProfile event, Emitter emit) async {
    emit(UserblocInitial());
    final response = await userRepository.updateProfile(
        event.email, event.password, event.name);
    if (response == null) {
      emit(EditProfileFailed());
    } else {
      final response2 =
          await userRepository.getUser(event.email, event.password);
      emit(EditProfileSucessfull(response: response2));
    }
  }

  void _onUpdateComplaint(UpdateComplaint event, Emitter emit) async {
    emit(UserblocInitial());
    final response =
        await userRepository.updateComplaint(event.id, event.updatedData);
    if (response == null) {
      emit(EditComplaintFailed());
    } else {
      final response2 = await userRepository.getMyReport(event.id);
      emit(EditComplaintSucessfull(response: response2));
    }
  }

  void _onReport(ReportNows event, Emitter emit) async {
    emit(SucessfullyReported());
  }

  void _onDeleteReported(DeleteReported event, Emitter emit) async {
    emit(UserblocInitial());
    final response = await userRepository.deleteReported(event.id);
    if (response.statusCode == 200) {
      emit(DeleteSucessfull());
    } else {
      emit(DeleteFailed());
    }
  }
}

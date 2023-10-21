import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:students_voice/infrastructure/repository/manager_repository.dart';
import 'package:students_voice/domain/Announcement_model/announcement.dart';
import 'package:equatable/equatable.dart';

part 'manager_event.dart';
part 'manager_state.dart';

class ManagerblocBloc extends Bloc<ManagerblocEvent, ManagerblocState> {
  final managerRepository = ManagerRepository();

  ManagerblocBloc() : super(ManagerblocInitial()) {
    on<GetOngoing>(_onOngoing);
    on<GetSolved>(_onSolved);
    on<GetReported>(_onReported);
    // on<DeleteComplaint>(_onDeleteComplaint);
    on<MoveToOngoing>(_onMoveToOngoing);
    on<MoveToSolved>(_onMoveToSolved);
    on<AnnouncementLoad>((AnnouncementLoad event, emit) async {
      emit(AnnouncementLoading());
      ////
      try {
        final announcements = await managerRepository.getAnnouncement();
        emit(AnnouncementOperationSuccess(announcements));
      } catch (error) {
        emit(AnnouncementOperationFailure(error));
      }
    });
    on<AnnouncementCreate>((event, emit) async {
      try {
        await managerRepository.createAnnouncement(event.announcement);
        final announcements = await managerRepository.createAnnouncement(event.announcement);
        emit(AnnouncementOperationSuccess(announcements));
      } catch (error) {
        emit(AnnouncementOperationFailure(error));
      }
    });
    on<AnnouncementUpdate>((event, emit) async {
      try {
        await managerRepository.updateAnnouncement(event.announcement);
        final announcements = await managerRepository.updateAnnouncement(event.announcement);
        emit(AnnouncementOperationSuccess(announcements));
      } catch (error) {
        emit(AnnouncementOperationFailure(error));
      }
    });
    on<AnnouncementDelete>((event, emit) async {
      try {
        await managerRepository.deleteAnnouncement(event.id);
        final announcements = await managerRepository.deleteAnnouncement(event.id);
        emit(AnnouncementOperationSuccess(announcements));
      } catch (error) {
        emit(AnnouncementOperationFailure(error));
      }
    });
  }

  void _onOngoing(GetOngoing event, Emitter emit) async {
    emit(ManagerblocInitial());
    final ongoingComplaints =
        await managerRepository.getOngoingComplaints(event.user);
    try {
      emit(GetOngoingSucessful(complaintList: ongoingComplaints));
    } catch (e) {}
  }

  void _onSolved(GetSolved event, Emitter emit) async {
    emit(ManagerblocInitial());
    final solvedComplaints =
        await managerRepository.getSolvedComplaints(event.user);
    try {
      emit(GetSolvedSucessful(complaintList: solvedComplaints));
    } catch (e) {}
  }

  void _onReported(GetReported event, Emitter emit) async {
    emit(ManagerblocInitial());
    final reportedComplaints =
        await managerRepository.getReportedComplaints(event.msg);
    try {
      emit(GetReportedSucessful(complaintList: reportedComplaints));
    } catch (e) {}
  }

  // void _onDeleteComplaint(DeleteComplaint event, Emitter emit) async {
  //   emit(ManagerblocInitial());
  //   final response = await managerRepository.deleteComplaint(event.id);
  //   if (response.statusCode == 200) {
  //     emit(DeleteSucessfull());
  //   } else {
  //     emit(DeleteFailed());
  //   }
  // }

  void _onMoveToOngoing(MoveToOngoing event, Emitter emit) async {
    emit(ManagerblocInitial());
    final response = await managerRepository.moveToOngoing(event.id);
    if (response.statusCode == 200) {
      emit(MoveSuccessfull());
    } else {
      emit(MoveFailed());
    }
  }

  void _onMoveToSolved(MoveToSolved event, Emitter emit) async {
    emit(ManagerblocInitial());
    final response = await managerRepository.moveToSolved(event.id);
    if (response.statusCode == 200) {
      emit(MoveSuccessfull());
    } else {
      emit(MoveFailed());
    }
  }
}

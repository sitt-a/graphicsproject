part of 'manager_bloc.dart';

abstract class ManagerblocEvent extends Equatable {
  const ManagerblocEvent();

  @override
  List<Object> get props => [];
}

class GetReported extends ManagerblocEvent {
  dynamic msg;
  GetReported(this.msg);
}

class GetOngoing extends ManagerblocEvent {
  dynamic user;
  GetOngoing(this.user, {required ongoing});
}

class GetSolved extends ManagerblocEvent {
  dynamic user;
  GetSolved(this.user);
}

class DeleteComplaint extends ManagerblocEvent {
  dynamic id;
  DeleteComplaint(this.id);
}

class MoveToOngoing extends ManagerblocEvent {
  dynamic id;
  MoveToOngoing(this.id);
}

class MoveToSolved extends ManagerblocEvent {
  dynamic id;
  MoveToSolved(this.id);
}

//Announcement
class AnnouncementCreate extends ManagerblocEvent {
  final Announcement announcement;
  const AnnouncementCreate(this.announcement);

  @override
  List<Object> get props => [announcement];
  @override
  String toString() => 'Announcement Created {announcement:${announcement.announcementId}}';
}

class AnnouncementLoad extends ManagerblocEvent {
  const AnnouncementLoad();
  @override
  List<Object> get props => [];
}

class AnnouncementUpdate extends ManagerblocEvent {
  final Announcement announcement;
  const AnnouncementUpdate(this.announcement);
  @override
  List<Object> get props => [announcement];
  @override
  String toString() => 'Announcement Updated {announcement:${announcement.announcementId}}';
}

class AnnouncementDelete extends ManagerblocEvent {
  final int id;
  const AnnouncementDelete(this.id);
  @override
    String toString() => 'Announcement Deleted {announcement id:$id}';

}

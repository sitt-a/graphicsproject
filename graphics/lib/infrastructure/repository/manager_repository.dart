import 'package:students_voice/infrastructure/data_provider/manager_data_provider.dart';

class ManagerRepository {
  final ManagerDataProvider dataProvider = ManagerDataProvider();

  Future<dynamic> getReportedComplaints(user) async {
    return dataProvider.getReportedComplaint(user);
  }

  Future<dynamic> getOngoingComplaints(user) async {
    return dataProvider.getOngoingComplaints(user);
  }

  Future<dynamic> getSolvedComplaints(user) async {
    return dataProvider.getSolvedComplaints(user);
  }

  Future<dynamic> deleteComplaint(id) async {
    return dataProvider.deleteComplaint(id);
  }

  Future<dynamic> moveToOngoing(id) async {
    return dataProvider.moveToOngoing(id);
  }

  Future<dynamic> moveToSolved(id) async {
    return dataProvider.moveToSolved(id);
  }

  // Announcement
  Future<dynamic> createAnnouncement(announcement) async {
    return dataProvider.createAnnouncement(announcement);
  }

  Future<dynamic> getAnnouncement() async {
    return dataProvider.getAnnouncement();
  }

  Future<dynamic> updateAnnouncement(announcement) async {
    return dataProvider.updateAnnouncement(announcement);
  }

  Future<dynamic> deleteAnnouncement(id) async {
    return dataProvider.deleteAnnouncement(id);
  }
}

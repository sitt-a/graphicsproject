import 'package:students_voice/infrastructure/data_provider/user_data_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {
  final UserDataProvider dataProvider = UserDataProvider();
  static const storage = FlutterSecureStorage();

  Future<void> deleteToken() async {
    return await storage.deleteAll();
  }

  Future<bool> hasToken() async {
    String? token = await storage.read(key: "token");
    return token != null;
  }

  Future<dynamic>? getUser(dynamic password, dynamic username) async {
    return dataProvider.getUser(password, username);
  }

  Future<dynamic> getAnnouncement() async {
    return dataProvider.getAnnouncement();
  }

  Future<dynamic> reportComplaint(Map<String, dynamic> body) async {
    return dataProvider.reportComplaint(body);
  }

  Future<dynamic> getMyReport(String id) async {
    return dataProvider.getMyReport(id);
  }

  Future<dynamic> signUpUser(Map<String, dynamic> body) async {
    return dataProvider.signUpUser(body);
  }

  Future<dynamic> updateProfile(
      dynamic email, dynamic password, dynamic fullname) async {
    return dataProvider.updateProfile(email, password, fullname);
  }

  Future<dynamic> updateComplaint(
      String id, Map<String, dynamic> updatedData) async {
    return dataProvider.updateComplaint(id, updatedData);
  }

  Future<dynamic> deleteReported(id) async {
    return dataProvider.deleteReported(id);
  }
}

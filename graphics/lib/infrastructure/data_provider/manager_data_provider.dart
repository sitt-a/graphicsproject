import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:students_voice/domain/model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ManagerDataProvider {
  String baseUrl = 'http://localhost:3000';
  final storage = FlutterSecureStorage();

  Future<dynamic> getOngoingComplaints(user) async {
    var response = await http.get(
      Uri.parse(baseUrl + '/manager/reportedComplaints/$user/ongoing'),
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to get complaints");
    }
  }

  Future<dynamic> getSolvedComplaints(user) async {
    var response = await http.get(
      Uri.parse(baseUrl + '/manager/reportedComplaints/$user/solved'),
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to get complaints");
    }
  }

  dynamic getReportedComplaint(String json) {
    dynamic decodedJson = jsonDecode(json);
    dynamic reportedComplaint = Report.fromJson(decodedJson);
    return reportedComplaint;
  }

  Future<dynamic> deleteComplaint(id) async {
    var response = await http.get(
      Uri.parse(baseUrl + '/manager/complaint/delete/$id'),
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to delete complaint");
    }
  }

  Future<dynamic> moveToOngoing(id) async {
    var response = await http.patch(
      Uri.parse(baseUrl + '/manager/ongoing/$id'),
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to move complaint to ongoing");
    }
  }

  Future<dynamic> moveToSolved(id) async {
    var response = await http.patch(
      Uri.parse(baseUrl + '/manager/solved/$id'),
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to move complaint to solved");
    }
  }

  Future<List<Announcement>> getAnnouncement() async {
    var response = await http.get(Uri.parse(baseUrl + '/announcements'));
    if (response.statusCode == 200) {
      List<dynamic> decodedJson = jsonDecode(response.body);
      List<Announcement> announcementList =
          decodedJson.map((json) => Announcement.fromJson(json)).toList();
      return announcementList;
    } else {
      throw Exception("Failed to get announcements");
    }
  }

  Future<dynamic> createAnnouncement(Map<String, dynamic> body) async {
    String? token = await storage.read(key: "token");
    var response = await http.post(
      Uri.parse(baseUrl + '/manager/post-announcement'),
      headers: {"Content-Type": "application/json", "token": "$token"},
      body: jsonEncode(body),
    );
    return response;
  }

  Future<void> updateAnnouncement(Map<String, dynamic> body) async {
    var response = await http.patch(
      Uri.parse(baseUrl + '/announcement/update/'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update announcement');
    }
  }

  Future<dynamic> deleteAnnouncement(id) async {
    var response = await http.get(
      Uri.parse(baseUrl + '/manager/announcement/delete/$id'),
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to delete announcement");
    }
  }
}

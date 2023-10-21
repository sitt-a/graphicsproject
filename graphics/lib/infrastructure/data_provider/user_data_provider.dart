import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:students_voice/domain/model.dart';

class UserDataProvider {
  String baseUrl = 'http://localhost:3000';
  final storage = const FlutterSecureStorage();

  Future<dynamic> getUser(dynamic username, dynamic password) async {
    var response = await http.post(
      Uri.parse(baseUrl + '/api/login'),
      headers: {"Content-type": "application/json"},
      body: jsonEncode({'username': username, 'password': password}),
    );
    if (response.statusCode == 200) {
      await storage.write(
          key: "token", value: "${jsonDecode(response.body)["user"]['token']}");
      dynamic json = jsonDecode(response.body);
      dynamic user = User.fromJson(json['user']);
      return user;
    } else {
      return response.statusCode;
    }
  }

  Future<dynamic> signUpUser(Map<String, dynamic> body) async {
    var response = await http.post(
      Uri.parse(baseUrl + '/api/signup'),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(body),
    );
    return response;
  }

  Future<List<Announcement>> getAnnouncement() async {
    try {
      var response = await http.get(Uri.parse(baseUrl + '/announcements'));
      if (response.statusCode == 200) {
        List<dynamic> djson = jsonDecode(response.body);
        List<Announcement> announcements = djson
            .map((json) => Announcement.fromJson(json))
            .toList()
            .cast<Announcement>();
        return announcements;
      } else {
        throw Exception("Failed to get announcements");
      }
    } catch (e) {
      throw Exception("Failed to get announcements: $e");
    }
  }

  Future<dynamic> reportComplaint(Map<String, dynamic> body) async {
    String? token = await storage.read(key: "token");
    var response = await http.post(
      Uri.parse(baseUrl + '/create-complaint'),
      headers: {"Content-type": "application/json", "token": "$token"},
      body: jsonEncode(body),
    );
    return response;
  }

  Future<dynamic> getMyReport(String user) async {
    var response = await http.get(
      Uri.parse(baseUrl + '/mycomplaints/$user'),
      headers: {"Content-type": "application/json"},
    );
    return response;
  }

  Future<dynamic> updateProfile(
      dynamic email, dynamic password, dynamic name) async {
    var response = await http.patch(Uri.parse(baseUrl + '/profile/update/profile'),
        headers: {"Content-type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
          "name": name,
        }));

    return response;
  }

  Future<dynamic> deleteReported(id) async {
    var response = await http.get(
      Uri.parse(baseUrl + '/delete-complaint/$id'),
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to delete complaint");
    }
  }

  Future<dynamic> updateComplaint(
      String id, Map<String, dynamic> updatedData) async {
    final response = await http.patch(
      Uri.parse(baseUrl + '/update-complaint/$id'),
      body: jsonEncode(updatedData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update complaint: ${response.statusCode}');
    }
  }
}

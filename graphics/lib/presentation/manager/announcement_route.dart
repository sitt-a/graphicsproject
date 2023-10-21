import 'package:flutter/material.dart';
import 'package:students_voice/presentation/announcement.dart';
import 'package:students_voice/presentation/manager/announcement_list.dart';
import '../../domain/Announcement_model/announcement.dart';


class AnnouncementAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => AnnouncementsList());
    }

    if (settings.name == AddUpdateAnnouncement.routeName) {
      AnnouncementArgument args = settings.arguments as AnnouncementArgument;
      return MaterialPageRoute(
          builder: (context) => AddUpdateAnnouncement(
                args: args,
              ));
    }

    if (settings.name == AnnouncementDetail.routeName) {
      Announcement announcement = settings.arguments as  Announcement ;
      return MaterialPageRoute(
          builder: (context) => AnnouncementDetail(
                announcement: announcement,
              ));
    }

    return MaterialPageRoute(builder: (context) => AnnouncementsList());
  }
}

class AnnouncementArgument {
  final Announcement announcement;
  final bool edit;
  AnnouncementArgument({required this.announcement, required this.edit});
}
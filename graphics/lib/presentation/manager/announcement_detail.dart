import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_voice/application/manager/manager.dart';
import 'package:students_voice/presentation/announcement.dart';
import 'package:students_voice/domain/Announcement_model/announcement.dart';


class AnnouncementDetail extends StatelessWidget {
  static const routeName = 'announcementDetail';
  final Announcement announcement;

  AnnouncementDetail({required this.announcement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.announcement.announcementId}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              AddUpdateAnnouncement.routeName,
              arguments: AnnouncementArgument(
                  announcement: this.announcement, edit: true),
            ),
          ),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context
                    .read<ManagerblocBloc>()
                    .add(AnnouncementDelete(announcement as int));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AnnouncementsList.routeName, (route) => false);
              }),
        ],
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Title: ${this.announcement.title}'),
              subtitle: Text(': ${this.announcement.author}'),
            ),
            Text(
              ' body',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(this.announcement.body),
          ],
        ),
      ),
    );
  }
}

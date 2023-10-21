
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_voice/application/manager/manager.dart';
import 'package:students_voice/presentation/announcement.dart';


class AnnouncementsList extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Announcements'),
      ),
      body: BlocBuilder<ManagerblocBloc, ManagerblocState>(
        builder: (_, state) {
          if (state is AnnouncementOperationFailure) {
            return Text('Could not do announcement operation');
          }

          if (state is AnnouncementsLoadSuccess) {
            final announcements = state.announcements;

            return ListView.builder(
              itemCount: announcements.length,
              itemBuilder: (_, idx) => ListTile(
                title: Text('${announcements[idx].title}'),
                subtitle: Text('${announcements[idx].announcementId}'),
                onTap: () => Navigator.of(context)
                    .pushNamed(AnnouncementDetail.routeName, arguments: announcements[idx]),
              ),
            );
          }

          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
         AddUpdateAnnouncement.routeName,
          arguments: AnnouncementArgument(edit: false, announcement: null!),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
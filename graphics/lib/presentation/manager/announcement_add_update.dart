import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:students_voice/domain/Annoucement_model/announcement.dart';
import 'package:students_voice/domain/Announcement_model/announcement.dart';
import 'package:students_voice/application/manager/bloc/manager_bloc.dart';
import 'package:students_voice/presentation/announcement.dart';


// import 'package:student_voice/course/course.dart';

class AddUpdateAnnouncement extends StatefulWidget {
  static const routeName = 'announcementAddUpdate';
  final AnnouncementArgument args;

  AddUpdateAnnouncement({required this.args});
  @override
  _AddUpdateAnnouncementState createState() => _AddUpdateAnnouncementState();
}

class _AddUpdateAnnouncementState extends State<AddUpdateAnnouncement> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _announcement= {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args.edit ? "Edit Announcement" : "Add New Announcement"}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.announcement.announcementId : '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter  AnnouncementId';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'AnnouncementId'),
                  onSaved: (value) {
                    setState(() {
                      this._announcement["AnnouncementId"] = value;
                    });
                  }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.announcement.title : '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter announcement title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Announcement Title'),
                  onSaved: (value) {
                    this._announcement["title"] = value;
                  }),
              TextFormField(
                  initialValue: widget.args.edit
                      ? widget.args.announcement.body.toString()
                      : '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Announcement author';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Announcement author'),
                  onSaved: (value) {
                    setState(() {
                      this._announcement["author"] = int.parse(value!);
                    });
                  }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.announcement.body : '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter announcement body';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Announcement body '),
                  onSaved: (value) {
                    setState(() {
                      this._announcement["body"] = value;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form!.validate()) {
                      form.save();
                      final ManagerblocEvent  event = widget.args.edit
                          ? AnnouncementUpdate(
                              Announcement (
                                announcementId: widget.args.announcement.announcementId,
                                title: this._announcement["title"],
                                author: this._announcement["author"],
                                body: this._announcement["body"],
                              ),
                            )
                          : AnnouncementCreate(
                              Announcement(
                                title: this._announcement["title"],
                                author: this._announcement["author"],
                                body: this._announcement["body"], announcementId: '',
                              ),
                            );
                      BlocProvider.of<ManagerblocBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AnnouncementsList.routeName, (route) => false);
                    }
                  },
                  label: Text('SAVE'),
                  icon: Icon(Icons.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
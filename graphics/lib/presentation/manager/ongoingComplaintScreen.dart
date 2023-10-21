import 'package:flutter/material.dart';

import '../components/reportedCard.dart';

class OngoingComplaint extends StatefulWidget {
  OngoingComplaint({Key? key, this.ongoing}) : super(key: key);
  dynamic ongoing;
  @override
  State<OngoingComplaint> createState() =>   _OngoingComplaintState();
}

class _OngoingComplaintState extends State<OngoingComplaint> {
  @override
  Widget build(BuildContext context) {
    return widget.ongoing.length == 0
        ? Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              "no ongoing complaints ",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ))
        : Expanded(
            flex: 4,
            child: ListView.builder(
                itemCount: (widget.ongoing).length,
                itemBuilder: (BuildContext context, int index) {
                  return ReportedCard(
                    id: widget.ongoing[index]['_id'],
                    title: widget.ongoing[index]['status'],
                    description: widget.ongoing[index]["description"],
                    university: widget.ongoing[index]["university"],
                    complain_to: widget.ongoing[index]['complain_to'],
                  );
                }),
          );
  }
}

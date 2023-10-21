import 'package:flutter/material.dart';
import '../components/reportedCard.dart';

class SolvedComplaint extends StatefulWidget {
  SolvedComplaint({Key? key, this.solved}) : super(key: key);
  dynamic solved;
  @override
  State<SolvedComplaint> createState() => _SolvedComplaintState();
}

class _SolvedComplaintState extends State<SolvedComplaint> {
  @override
  Widget build(BuildContext context) {
    return widget.solved.length == 0
        ? Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              "no solved complaints list",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ))
        : Expanded(
            flex: 4,
            child: ListView.builder(
                itemCount: (widget.solved).length,
                itemBuilder: (BuildContext context, int index) {
                  return ReportedCard(
                    id: widget.solved[index]['_id'],
                    title: widget.solved[index]['status'],
                    description: widget.solved[index]["description"],
                    university: widget.solved[index]["university"],
                    complain_to: widget.solved[index]['complain_to'],
                  );
                }),
          );
  }
}

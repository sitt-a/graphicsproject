import 'package:flutter/material.dart';

class ComplaintPage extends StatefulWidget {
  @override
  _ComplaintPageState createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  late TextEditingController _descriptionController;
  String _selectedTitle = '';

  final List<String> _titleOptions = const [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController();
  }

  void _submitComplaint() {
    String description = _descriptionController.text;

    // Perform the necessary actions with the complaint data
    // such as sending it to a server or processing it locally

    // Clear the text field after submission
    _descriptionController.clear();

    // Show a dialog or display a success message
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Complaint Submitted'),
          content: const Text('Thank you for submitting your complaint.'),
          actions: const [
            // TextButton(
            //   onPressed: () {},
            //     // Navigator.of(context).pop();
            
            //   child: const Text('OK'),
            // ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaint Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/images/logo.png', // Replace with your own image asset path
                width: 50,
                height: 50,
              ),
            ),
            const Text(
              'Title:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedTitle,
              items: _titleOptions.map((String title) {
                return DropdownMenuItem<String>(
                  value: title,
                  child: Text(title),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _selectedTitle = value!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: TextFormField(
                controller: _descriptionController,
                maxLines: null, // Allow for multiline input
                decoration: InputDecoration(
                  hintText: 'Enter your complaint description',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitComplaint,
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
//admi page
import 'package:flutter/material.dart';
import 'new_manager.dart';

// void main() {
//   runApp(MaterialApp(
//     home:adminScreen(),
//   ));
// }

class adminScreen extends StatelessWidget {
  final List<String> managers = [
    'Yabsira Yetwale',
    'John Doe',
    'Jane Smith'
  ]; // Example list of managers

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Manage Managers'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.grey,
                    ),
                    onPressed: () {},
                    child: Text('Managers'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.grey,
                    ),
                    onPressed: () {},
                    child: Text('Users'),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      color: Colors.grey[300],
                      width: 10.0,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        'Full Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          SizedBox(width: 5.0),
                          Text(
                            'Update',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Delete',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: managers.length,
                  itemBuilder: (context, index) {
                    final managerName = managers[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          Text(
                            '${index + 1}.',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            managerName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 30.0),
                            child: IconButton(
                              icon: Icon(
                                Icons.update,
                                color: Colors.yellow,
                              ),
                              onPressed: () {
                                // Add your logic here for onPressed (Update)
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                // Add your logic here for onPressed (Delete)
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewManagerPage()),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Add New Manager',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

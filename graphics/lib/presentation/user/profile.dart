import 'package:flutter/material.dart';

//// profile
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyProfile(),
//     );
//   }
// }
class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My profile'),
        backgroundColor: Colors.red,
      ),
      body:SingleChildScrollView(
        
        child:Center(child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: EdgeInsets.only(top: 5.0,right: 45),
                child:Center(child:IconButton(
                  icon: Icon(
                    Icons.account_circle_rounded,
                    color: Color.fromARGB(255, 143, 83, 240),
                    size: 80.0,
                  ),
                  onPressed: () {
                    // Add your logic here for onPressed (Add New Manager)
                  },
                ),
              
            ),
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter manager name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Phone Number',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'e.g., 251-978-7874',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Email Address',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'manager@gmail.com',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Center(child: ElevatedButton(
  onPressed: () {
    // Add your logic here for the Add button
  },
  style: ElevatedButton.styleFrom(
    primary: Colors.red,
    onPrimary: Colors.white,
    padding: EdgeInsets.only(top:16.0,left: 30,right: 30,bottom: 16.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
  child:Text(
    'Add',
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
  
)
            ),
          ],
        ),
      ),
    ),
      ),
    );
  }
}
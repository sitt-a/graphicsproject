import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'student voice',
      debugShowCheckedModeBanner: false,
      // home: MyHomePage(),
      home:MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color.fromRGBO(54, 59, 89, 1), 
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.white), 
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),

        drawer: Drawer(
          child: Container(
            color: Color.fromRGBO(218, 0, 0, 0.88),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Row(children: [
                      Image.asset(
                        'assets/images/splash.png',
                        width: 80,
                        height: 80,
                      ),
                      Text(
                        'Student Voice',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.69),
                          fontSize: 18,
                        ),
                      ),
                    ])),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  iconColor: Color.fromARGB(255, 255, 255, 255),
                  onTap: () {
                    // Handle profile link press
                  },
                ),
                ListTile(
                  leading: Icon(Icons.announcement),
                  title: Text('Announcement'),
                  iconColor: Color.fromARGB(255, 255, 255, 255),
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  onTap: () {
                    // Handle announcement link press
                  },
                ),
                ListTile(
                  leading: Icon(Icons.warning),
                  title: Text('Complaint'),
                  iconColor: Color.fromARGB(255, 255, 255, 255),
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  onTap: () {
                    // Handle complaint link press
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  iconColor: Color.fromARGB(255, 255, 255, 255),
                  onTap: () {
                    // Handle logout link press
                  },
                ),
              ],
            ),
          ),
        ),

     body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            color: Color.fromRGBO(54, 59, 89, 1),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: constraints.maxWidth < 600 ? 300 : 400,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/mega.png',
                                width: constraints.maxWidth < 600 ? 150 : 200,
                                height: constraints.maxWidth < 600 ? 150 : 200,
                                fit: BoxFit.contain,
                              ),
                              Text(
                                'Empowering Voices. Resolving Complaints',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: constraints.maxWidth < 600 ? 15 : 20,
                                ),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle main container button pressed
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(237, 94, 104, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 16,
                                  ),
                                  textStyle: TextStyle(
                                    fontSize: constraints.maxWidth < 600 ? 12 : 15,
                                  ),
                                ),
                                child: Text('Complaints'),
                              ),
                            ],
                          ),
                        ),
                        


                        Container(
                          padding: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [

                                // Container(
                                //   child: Text(
                                //           'Left Text',
                                //           style: TextStyle(
                                //             color: Colors.white,
                                //             fontSize: 16,
                                //             fontWeight: FontWeight.bold,
                                //           ),
                                //         ),

                                // ),

                                Container(
                                  margin: EdgeInsets.only(right: constraints.maxWidth < 600 ? 10 : 20),
                                  width: constraints.maxWidth < 600 ? 200 : 250,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/ring.png',
                                            width: constraints.maxWidth < 600 ? 100 : 120,
                                            height: constraints.maxWidth < 600 ? 100 : 120,
                                            fit: BoxFit.contain,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Sample Text 1',
                                            style: TextStyle(
                                              fontSize: constraints.maxWidth < 600 ? 16 : 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Lorem ipsum dolor .',
                                            style: TextStyle(
                                              fontSize: constraints.maxWidth < 600 ? 14 : 16,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          ElevatedButton(
                                            onPressed: () {
                                              // Handle button pressed
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                vertical: 8,
                                                horizontal: 16,
                                              ),
                                              textStyle: TextStyle(
                                                fontSize: constraints.maxWidth < 600 ? 13 : 15,
                                              ),
                                            ),
                                            child: Text('Button 1'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth < 600 ? 10 : 20,
                                ), // Adjust the spacing between sliding containers
                                Container(
                                  width: constraints.maxWidth < 600 ? 200 : 250,
                                  // Adjust the width of the sliding containers as needed
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/ring.png', // Replace with your image path
                                            width: constraints.maxWidth < 600 ? 100 : 120,
                                            height: constraints.maxWidth < 600 ? 100 : 120,
                                            fit: BoxFit.contain,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Sample Text 1',
                                            style: TextStyle(
                                              fontSize: constraints.maxWidth < 600 ? 16 : 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Lorem ipsum dolor .',
                                            style: TextStyle(
                                              fontSize: constraints.maxWidth < 600 ? 14 : 16,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          ElevatedButton(
                                            onPressed: () {
                                              // Handle button pressed
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                vertical: 8,
                                                horizontal: 16,
                                              ),
                                              textStyle: TextStyle(
                                                fontSize: constraints.maxWidth < 600 ? 13 : 15,
                                              ),
                                            ),
                                            child: Text('Button 1'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth < 600 ? 10 : 20,
                                ), // Adjust the spacing between sliding containers
                                Container(
                                  width: constraints.maxWidth < 600 ? 200 : 250,
                                  // Adjust the width of the sliding containers as needed
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/ring.png', // Replace with your image path
                                            width: constraints.maxWidth < 600 ? 100 : 120,
                                            height: constraints.maxWidth < 600 ? 100 : 120,
                                            fit: BoxFit.contain,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Sample Text 1',
                                            style: TextStyle(
                                              fontSize: constraints.maxWidth < 600 ? 16 : 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Lorem ipsum dolor .',
                                            style: TextStyle(
                                              fontSize: constraints.maxWidth < 600 ? 14 : 16,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          ElevatedButton(
                                            onPressed: () {
                                              // Handle button pressed
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                vertical: 8,
                                                horizontal: 16,
                                              ),
                                              textStyle: TextStyle(
                                                fontSize: constraints.maxWidth < 600 ? 13 : 15,
                                              ),
                                            ),
                                            child: Text('Button 1'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),

     );
  }
}


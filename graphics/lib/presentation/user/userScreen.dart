import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class userScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Color.fromRGBO(54, 59, 89, 1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'mega.png', 
                            width: 150,
                            height: 150,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            'Empowering Voices. Resolving Complaints',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              context.go('/MyProfile');
                              // Handle main container button pressed
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(237, 94, 104, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              textStyle: TextStyle(fontSize: 12),
                            ),
                            child: Text('Complaints'),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            Container(
                              width:
                                  200, // Adjust the width of the sliding containers as needed
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
                                        'ring.png', 
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Sample Text 1',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Lorem ipsum dolor .',
                                        style: TextStyle(
                                          fontSize: 14,
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
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 16),
                                          textStyle: TextStyle(fontSize: 13),
                                        ),
                                        child: Text('ReadMore'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                                width:10), // Adjust the spacing between sliding containers
                            Container(
                              width:200, // Adjust the width of the sliding containers as needed
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
                                        'ring.png', // Replace with your image path
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Sample Text 1',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Lorem ipsum dolor .',
                                        style: TextStyle(
                                          fontSize: 14,
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
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 16),
                                          textStyle: TextStyle(fontSize: 13),
                                        ),
                                        child: Text('ReadMore'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    10), // Adjust the spacing between sliding containers
                            Container(
                              width: 200,
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
                                        'ring.png', // Replace with your image path
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Sample Text 1',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Lorem ipsum dolor .',
                                        style: TextStyle(
                                          fontSize: 14,
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
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 16),
                                          textStyle: TextStyle(fontSize: 13),
                                        ),
                                        child: Text('ReadMore'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
), ],),),) ],), ),],),),),);
  }
}

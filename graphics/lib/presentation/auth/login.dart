import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../application/Auth/Bloc/Auth_state.dart';
import '../../application/Auth/Bloc/Auth_event.dart';
import '../../application/Auth/Bloc/Auth_bloc.dart';
import '../../application/Auth/auth.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loginPage();
  }
}
class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      backgroundColor:  Colors.white, 
      body: SingleChildScrollView( 
        child: Container( 
          padding: EdgeInsets.all(20.0), 
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [ 
              Image.asset('splash.png'), 
              SizedBox(height: 20), 
              Text( 
                'Student Voice', 
                style: TextStyle( 
                  fontSize: 20, 
                   
                ), 
              ), 
              SizedBox(height: 20), 
              Form( 
                key: _formKey, 
                child: Column( 
                  children: 
                  [  
                    TextFormField( 
                      decoration: InputDecoration( 
                        border: OutlineInputBorder( 
                    borderRadius: BorderRadius.circular(10.0), 
                  ), 
                        hintText: 'Enter Email', 
                      ), 
                      validator: (value) { 
                        if (value!.isEmpty) { 
                          return 'Please enter your email'; 
                        } 
                        return null; 
                      }, 
                    ), 
                    SizedBox(height: 20), 
                    TextFormField( 
                      obscureText: true, 
                      decoration: InputDecoration( 
                        border: OutlineInputBorder( 
                    borderRadius: BorderRadius.circular(10.0), 
                  ), 
                        hintText: 'Enter Password', 
                      ), 
                      validator: (value) { 
                        if (value!.isEmpty) { 
                          return 'Please enter your password'; 
                        } 
                        return null; 
                      }, 
                    ), 
                  ], 
                ), 
              ), 
               
               
              SizedBox(height: 10), 
              Align( 
                alignment: Alignment.centerRight, 
                child: TextButton( 
                  onPressed: () { 
                    // Forgot password functionality 
                  }, 
                  child: Text( 
                    'Forgot Password', 
                    style: TextStyle( 
                      color: Colors.red, 
                    ), 
                  ), 
                ), 
              ),


              SizedBox(height: 10), 

              BlocConsumer<AuthBloc, AuthState>(
                listener: (_, AuthState state) {
                  if (state is LoginSuccessful) {
                    if (state.response.role == "manager") {
                      context.go('/managerScreen',);}
               else if (state.response.role == "user") {
                              context.go(
                                '/userScreen',
                              );
                            }
                         else if (state.response.role == "Admin") {
                              context.go(
                                '/adminScreen',
                              );
                            }   
                            
                            }},
              
              builder: (_, AuthState state) {
                          Widget buttonChild = const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          );
                   if (state is LogingIn) {
                            buttonChild = const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(),
                            );
                          }

                          
                          if (state is LoginSuccessful) {
                            buttonChild = const Text("Login Successful");
                          }

                          if (state is LoginFailed) {
                            buttonChild = const Text("Login failed");
                          }
                    return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 100, 5),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 238, 59, 39),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: const Size(280, 50),
                              ),
                              onPressed: state is LogingIn
                                  ? null
                                  : () {
                                      if (!_formKey.currentState!.validate()) {
                                        return;
                                      }
                                      final authBloc =
                                          BlocProvider.of<AuthBloc>(context);
                                      authBloc.add(
                                        Login(
                                            username: emailcontroler.text,
                                            password: passwordcontroler.text),
                                      );
                                    },
                              child: buttonChild,
                            ),
                          );
                        }),
        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 120, vertical: 10),
                          child: Row(
                            children: [
                              const Text(' Not registerd yet ? '),
                              InkWell(
                                onTap: () => context.go('/signupScreen'),
                                child: const Text(
                                  'Create Account ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 114, 245, 14),
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        )
                      ])
              
        //       ElevatedButton( 
        //         onPressed: () { 
        //           if (_formKey.currentState!.validate()) { 
        //             // Form validation successful, perform login functionality 
        //           } 
        //         }, 
        //         style: ElevatedButton.styleFrom( 
        //           primary: Colors.red, // Set button color to red 
        //           onPrimary: Colors.white, // Set text color to white 
        //         ), 
        //         child: Text('Login'), 
        //       ), 
        //       SizedBox(height: 10), 
        //       Center( 
        //         child: TextButton( 
        //           onPressed: () { 
        //             // Create account functionality 
        //           }, 
        //           child: Text( 
        //             'Not registered yet? create account', 
        //             style: TextStyle( 
        //               color: Colors.black, 
        //             ), 
        //           ), 
        //         ), 
        //       ), 
        //     ], 
        //   ), 
        // ), 
      ), ),
    ); 
  } 
}

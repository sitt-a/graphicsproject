
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../application/manager/bloc/manager_bloc.dart';

class ReportedCard extends StatelessWidget {
 ReportedCard({ Key? key,this.title,this.description ,this.university,
 this.complaint_reporter ,this.path, this.complain_to,this.id}) : super(key: key);
  
  dynamic title;  dynamic description ;
  dynamic university;dynamic complaint_reporter; 
  dynamic complain_to; 
  dynamic path; dynamic id;


  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 8,
            shadowColor: Colors.green,
            margin: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              
              Container(
                height: 170,width: 190,
                child: Expanded(
                flex: 1,
                child: Image(
                  image: NetworkImage('http://10.0.2.2:3000/uploads/$path'),
                  fit: BoxFit.cover,),
                                ),
              ),
            
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Text(title,style:const  TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text(description),
                    const  SizedBox(height: 10,),
                    Text('university : $university',textAlign: TextAlign.start,),
                    const SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       
                    BlocConsumer<ManagerblocBloc, ManagerblocState>(
                      listener: (context, state) {
                        if (state is DeleteSucessfull){
                          
                      showDialog(
                           context: context,
                            builder: (context) {
                         Future.delayed(const Duration(seconds: 8), () {
                              context.go('/managerScreen',);
                               });
                           return const AlertDialog(
                            title: Text('sucessfully Deleted'),
                         );
                       });
                          
                          }},
                      builder:(_, ManagerblocState state){
                            return ElevatedButton(
                           style: ElevatedButton.styleFrom(
                                primary: Colors.yellow[800],
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: const Size(60, 30),),
  
                        onPressed: (){
                          final managerBloc =BlocProvider.of<ManagerblocBloc>(context);
                           managerBloc.add(DeleteComplaint(id),); 
                        }, 
                        child: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.black),
                          ));

                          },
                          ),

                       ElevatedButton(
                        style: ElevatedButton.styleFrom(
                                primary: Colors.yellow[800],
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: const Size(60, 30),),
                        
                        onPressed: (){
                           Map<String, dynamic> detail = 
                           {'name': title, 'status': title,
                           'complain_to':complain_to,'description' :description,'id':id};
                             context.go('/managerviewdetail',extra:detail);
                             }, 
                          child: const Text(
                            'See More',
                            style: TextStyle(color: Colors.black),)),

                    ],),

                    
                        
                        const SizedBox(width: 1,),

                           
                    ],),
                ),
              
            ]),
          
        );

        
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}
class _ProfileViewState extends State<ProfileView> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child:StreamBuilder(
                 stream: FirebaseFirestore.instance
                .collection('Users').doc(FirebaseAuth.instance.currentUser.uid).collection('Profile')
                .snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
                  if(!snapshot.hasData){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                        children: snapshot.data.docs.map((document){
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 80.0,),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                  Text('${document.data()['Email']}',style: TextStyle(
                                      fontSize: 15.0
                                  ),
                                  ),
                              SizedBox(height: MediaQuery.of(context).size.height /25),
                              Text('${document.data()['Name']}',style: TextStyle(
                                  fontSize: 15.0
                              ),),
                            ],
                          ),
                        );

                      }).toList(),
                      );
                }
            ),
          ),
         );



        }
      


}

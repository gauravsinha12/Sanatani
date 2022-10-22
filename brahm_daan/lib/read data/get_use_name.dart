import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documetID;

  GetUserName({required this.documetID});
  @override
  Widget build(BuildContext context) {

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documetID).get(),
      builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Text('Full Name: ' + data['fullName']);
      }
      return Text('Loading...');
    }));
  }
}

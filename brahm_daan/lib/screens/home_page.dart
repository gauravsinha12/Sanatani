import 'package:brahm_daan/read%20data/get_use_name.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  //document IDs
  List<String> docIDs = [];

  Future getDocIDs() async {
    //get all documents from the collection
    await FirebaseFirestore.instance
        .collection('users').orderBy('fullName', descending: false)
        .get()
        .then((snapshot) => snapshot.docs.forEach((doc) {
              //add the document ID to the list
              
              docIDs.add(doc.reference.id);
            })); //add all the document IDs to the list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(user!.email!)),
        actions: [
          GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: Icon(Icons.logout))
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getDocIDs(),
                  builder: ((context, snapshot) {
                    return ListView.builder(
                      itemCount: docIDs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(

                            title: GetUserName(documetID: docIDs[index]),
                            tileColor: Colors.grey[200],
                          ),
                        );
                      },
                    );
                  })))
        ],
      )),
    );
  }
}

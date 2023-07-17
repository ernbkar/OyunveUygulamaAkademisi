import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Getuserdata extends StatelessWidget {
  //DocID is required in order to recievet data
  final String docID;
  final String selecteddata;
  const Getuserdata({
    required this.selecteddata,
    required this.docID,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CollectionReference users = FirebaseFirestore.instance.collection("users");
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(docID).get(),
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          //Switch case for recieving selected data
          switch(selecteddata){
            case 'firstname':
              return Text('${data['first name']}');
            case 'lastname':
              return Text('${data['last name']}');
            case 'username':
              return Text('${data['username']}');
            case 'biography':
              return Text('${data['biography']}');
            case 'imageurl':
              return Text('${data['image']}');
            case 'city':
              return Text('${data['city']}');
            case 'memory':
              return Text('${data['memory']}');
            default:
              return const Text("Conflicting type");
          }
        }
        return const Text("yükleniyor...");
      }
    );
  }
}

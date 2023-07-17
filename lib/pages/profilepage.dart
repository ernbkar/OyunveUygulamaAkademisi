
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memapp/pages/settingspages/settingspage.dart';
import 'package:memapp/read_data/getuserdata.dart';
import 'package:memapp/widgets/favorites.dart';
import 'package:memapp/pages/drawer.dart';
import 'package:memapp/widgets/bottomnavigationbar.dart';
class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String imageID ="";
  String docID = "";
  var city;
  var URL;
  late DocumentSnapshot docsnapshot;

  Future getDocID() async{
    await FirebaseFirestore.instance.collection("users").get().then((snapshot) =>(snapshot.docs.forEach((element) {
      docID = element.reference.id;
    })));
  }

  late DocumentSnapshot snapshot;

  Future getImageId()async{
    await FirebaseFirestore.instance.collection("Imagedata").get().then((snapshot) => (snapshot.docs.forEach((element) {
      imageID = element.reference.id;
    })));
  }

  Future getImagedata()async{
    await getImageId();
    await FirebaseFirestore.instance.collection("Imagedata").doc(imageID).get().then((value){
      snapshot = value;
    });

    city = snapshot['city'];
    URL = snapshot['image'];
  }



  @override
  Widget build(BuildContext context) {
    //Getting the width and height of context
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.indigo,
      extendBodyBehindAppBar: true,
      //Profile page appbar
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          //Zero elevated transparent appbar color
          backgroundColor: Colors.transparent,
          elevation: 0,
          //Profile page appbar title
          title: const Text("PROFİL", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
          actions: [
            //Settingspage navigator button
            IconButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
              icon: const Icon(Icons.settings),
            )
          ]
      ),
      drawer: FutureBuilder(
        future: getImagedata(),
        builder: (context, snapshot){
          return CustomDrawer(city: city,URL: URL,docID: docID,);
        },
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: FutureBuilder(
          future: getDocID(),
          builder: (context,snapshot){
            return CustomBody(width: width, height: height, userid: docID);
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(profilepressed: true,searchpressed: false,uploadpressed: false,),
    );
  }
}


class CustomBody extends StatelessWidget {
  final String userid;
  final double width;
  final double height;
  String imageID = "";
  var city;
  var URL;
  late DocumentSnapshot snapshot;

  Future getImageId()async{
    await FirebaseFirestore.instance.collection("Imagedata").get().then((snapshot) => (snapshot.docs.forEach((element) {
      imageID = element.reference.id;
    })));
  }

  Future getImagedata()async{
    await getImageId();
    await FirebaseFirestore.instance.collection("Imagedata").doc(imageID).get().then((value){
      snapshot = value;
    });

    city = snapshot['city'];
    URL = snapshot['image'];
  }
  CustomBody({
    required this.userid,
    required this.width,
    required this.height,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
      ),
      width: width,
      height: height*2/3,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 70,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage('https://www.woolha.com/media/2020/03/eevee.png'),
                ),
                PersonalInformationLine(userid: userid,)
              ],
            ),
          ),
          const SizedBox(height: 30),
          Positioned(
              top: height/2,
              left: width/10,
              child:  InformationLine(docID: userid,)),
          const SizedBox(height: 10,),
          CustomDivider(width: width,height: height),
          const SizedBox(height: 10,),
          const Text("Paylaşımlar",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          const SizedBox(height: 10,),
          FutureBuilder(
              future: getImagedata(),
              builder: (context,snapshot){
                if(URL != null)
                  {
                    return RouteCard(city: city,URL: URL,height: 60,width:width/1.2,);
                  }
                else
                  {
                    return SizedBox();
                  }
          })
        ],
      ),
    );
  }
}

class PersonalInformationLine extends StatelessWidget {
  final String userid;
  final currentuser = FirebaseAuth.instance.currentUser;

  //Document ID list

  //Getting userdata document ID from firestore


  PersonalInformationLine({
    required this.userid,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/2.5,
     child: Column(
       children: [
         SizedBox(
           child: Row(
             children: [
               Getuserdata(selecteddata: 'firstname', docID: userid),
               const SizedBox(width: 5,),
               Getuserdata(selecteddata: 'lastname', docID: userid)
             ],
           ),
         ),
         SizedBox(
           child: Row(
             children: [
               Getuserdata(selecteddata: 'username', docID: userid)
             ],
           ),
         )
       ],
     ),
    );
  }
}

class InformationLine extends StatelessWidget {
  final _informationcontroller = TextEditingController();
  final String docID;
  bool displaybio = false;
  Future updatebiograph()async{
    _informationcontroller.text.trim().length < 10 || _informationcontroller.text.trim().length > 300 || _informationcontroller.text.isEmpty ? displaybio = false : displaybio = true;
    if(displaybio){
      await FirebaseFirestore.instance.collection("users").doc(docID).update({"biography":_informationcontroller.text.trim()});
    }
  }

  InformationLine({
    required this.docID,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          SizedBox(
            child: Row(
              children: <Widget>[
                const Text("Hakkında", style: TextStyle(fontWeight: FontWeight.bold),),
                IconButton(onPressed: (){
                  showDialog(context: context, builder: (context) => AlertDialog(
                    content: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const Text("Hakkında", style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(
                            child: TextFormField(
                            controller: _informationcontroller,
                            cursorColor: Colors.indigo,
                            style: const TextStyle(color: Colors.indigo),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 16,
                                ),
                          ))),
                          ElevatedButton(onPressed: (){
                            updatebiograph();
                          }, child: Text("Update"))
                        ],
                      )
                    ),
                  ));
                }, icon: const Icon(Icons.edit))
              ],
            ),
          ),Getuserdata(selecteddata: 'biography', docID: docID)
        ],
      )
    );
  }
}

class CustomDivider extends StatelessWidget {
  final double width;
  final double height;
  const CustomDivider({
    required this.width,
    required this.height,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: width/1.2,
      height: 2,
    );
  }
}



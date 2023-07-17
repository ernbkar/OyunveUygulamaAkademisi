import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class CustomDrawer extends StatelessWidget {
  final String docID;
  final String city;
  final String URL;
  const CustomDrawer({
    required this.docID,
    required this.URL,
    required this.city,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: RichText(
            text: TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                    text: city ,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  const WidgetSpan(
                      child: SizedBox(
                        height: 10,
                      )
                  ),
                ]
            ),
          )
      ),
      extendBodyBehindAppBar: true,
      body: DrawerBody(width: width,height: height, URL: URL,docID: docID));


  }
}

class DrawerBody extends StatelessWidget {
  final String docID;
  final String URL;
  final double width;
  final double height;
  const DrawerBody({
    required this.docID,
    required this.URL,
    required this.height,
    required this.width,
    Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopImage(height: height, URL: URL,),
        Expanded(child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Information(width: width, docID: docID,),
            const SizedBox(height: 40,),
          ],
        ))
      ],
    );
  }
}

class TopImage extends StatelessWidget {
  final String URL;
  final double height;
  const TopImage({
  required this.URL,
  required this.height,
  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          height: MediaQuery.of(context).size.height/3,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(URL),
                fit: BoxFit.fill
            ),
          )
    );
  }
}



class Information extends StatelessWidget {
  final _memorycontroller = TextEditingController();
  final double width;
  final String docID;
  var memory;
  late DocumentSnapshot docsnapshot;
  bool displaymemory = false;

  Future getmemorydata()async{
    await FirebaseFirestore.instance.collection("users").doc(docID).get().then((value){
      docsnapshot = value;
    });

    memory = docsnapshot['memory'];
  }

  Future updatememory(controller)async{
    controller.text.trim().length < 10 || controller.text.trim().length > 300 || controller.text.isEmpty ? displaymemory = false : displaymemory = true;
    await FirebaseFirestore.instance.collection("users").doc(docID).update({"memory":controller.text.trim()});
  }
  Information({
    required this.docID,
    required this.width,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            )
          ]
      ),
      child: Column(
        children:  <Widget>[
          Center(
            child: SizedBox(
              child: Row(
                children: [const Text("ANILAR",style: TextStyle(fontWeight: FontWeight.bold),),IconButton(onPressed: (){
                  showDialog(context: context, builder: (context) => AlertDialog(
                    content: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white
                            ),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _memorycontroller,
                                ),
                                ElevatedButton(onPressed: (){
                                  updatememory(_memorycontroller);
                                }, child: Text("Gönder"))
                              ],
                            ))
                  ),
                  );
                }, icon: Icon(Icons.edit))],
              ),
            ),
          ),
          FutureBuilder(
              future: getmemorydata(),
              builder: (context,snapshot){
            return SizedBox(
              child: memory != null ? Text(memory) : Text("Lüften anı ekleyiniz"),
            );
          })
        ],
      )
    );
  }
}

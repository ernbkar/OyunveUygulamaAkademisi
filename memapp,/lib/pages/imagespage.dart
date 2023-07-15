import 'package:flutter/material.dart';


class ImagesPage extends StatelessWidget {
  final int itemcount;
  const ImagesPage({
    required this.itemcount,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("IMAGES",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
      ),
      body: Column(
         children: [
           Expanded(child: ImagesBody(itemcount: itemcount))
         ]
      ),
    );
  }
}

class ImagesBody extends StatelessWidget {
  final int itemcount;
  const ImagesBody({
    required this.itemcount,
    Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return ListView.separated(itemBuilder: (BuildContext context,int index){
      return SizedBox(
          width: width,
          height: height/3,
          child: Image.network("https://img.freepik.com/free-photo/panoramic-istanbul-city-twilight-turkey_335224-1278.jpg?w=826&t=st=1687290970~exp=1687291570~hmac=c5438b96180740c659ed60ad1adf7bda9a7228e92975282afebbf96331cd6bed")
      );
    }, separatorBuilder: (BuildContext context,int index) => const Divider(), itemCount: itemcount);
  }
}


import 'package:flutter/material.dart';
import 'package:memapp/pages/imagespage.dart';
class CustomDrawer extends StatelessWidget {
  final String city;
  final String country;
  const CustomDrawer({
    required this.country,
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
                    text: city + "\n",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  const WidgetSpan(
                      child: SizedBox(
                        height: 10,
                      )
                  ),
                  TextSpan(
                    text: country,style: const TextStyle(color: Colors.white),
                  )
                ]
            ),
          )
      ),
      extendBodyBehindAppBar: true,
      body: DrawerBody(width: width,height: height));


  }
}

class DrawerBody extends StatelessWidget {
  final double width;
  final double height;
  const DrawerBody({
    required this.height,
    required this.width,
    Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopImage(height: height),
        Expanded(child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Information(width: width),
            const SizedBox(height: 40,),
            Padding(padding: const EdgeInsets.only(left: 20,right: 20),child: Images(width: width/10,height: height/4,),)
          ],
        ))
      ],
    );
  }
}


class Images extends StatelessWidget {
  final double height;
  final double width;
  const Images({
    required this.width,
    required this.height,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ImagesPage(itemcount: 20),
            ),
          );
        },
        child: Container(
        height: height,
        width: width,
        decoration:  BoxDecoration(
          image: const DecorationImage(image: NetworkImage("https://img.freepik.com/free-photo/panoramic-istanbul-city-twilight-turkey_335224-1278.jpg?w=826&t=st=1687290970~exp=1687291570~hmac=c5438b96180740c659ed60ad1adf7bda9a7228e92975282afebbf96331cd6bed"),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(10),
        )));
  }
}

class TopImage extends StatelessWidget {
  final double height;
  const TopImage({
  required this.height,
  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          height: MediaQuery.of(context).size.height/3,
          decoration: const BoxDecoration(
            image: DecorationImage(image: NetworkImage("https://img.freepik.com/free-photo/panoramic-istanbul-city-twilight-turkey_335224-1278.jpg?w=826&t=st=1687290970~exp=1687291570~hmac=c5438b96180740c659ed60ad1adf7bda9a7228e92975282afebbf96331cd6bed"),
                fit: BoxFit.fill
            ),
          )
    );
  }
}



class Information extends StatelessWidget {
  final double width;
  const Information({
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
        children: const <Widget>[
          Center(
            child: Text("ANILAR",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
           Text("ANILAR FALAN FİNAL ANILAR FALAN FİNAL ANILAR FALAN FİNAL ANILAR FALAN FİNAL ANILAR FALAN FİNAL ANILAR FALAN FİNAL ANILAR FALAN FİNAL ANILAR FALAN FİNAL ANILAR FALAN FİNAL ANILAR FALAN FİNAL ANILAR FALAN FİNAL ANILAR FALAN FİNAL ANILAR FALAN FİNAL ANILAR FALAN FİNAL ANILAR FALAN FİNAL ANILAR FALAN FİNALANILAR FALAN FİNAL ANILAR FALAN FİNAL ANILAR FALAN FİNAL ANILAR FALAN FİNAL")
        ],
      )
    );
  }
}

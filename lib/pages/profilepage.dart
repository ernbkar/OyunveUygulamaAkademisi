import 'package:flutter/material.dart';
import 'package:memapp/widgets/favorites.dart';
import 'package:memapp/pages/drawer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const CustomDrawer(city: "Istanbul",country: "Turkey"),
      body: SizedBox(
        width: width,
        height: height,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: TopImage(width: width,height: height,)
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomBody(width: width,height: height,)
              ),
              Positioned(
                  top: height/3.5,
                  left: width/10,
                  child:
                  const CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage('https://www.woolha.com/media/2020/03/eevee.png'),
                  )),
            ],
          ),
        ));
  }
}

class TopImage extends StatelessWidget {
  final double width;
  final double height;
  const TopImage({
    required this.width,
    required this.height,
    Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height/2.5,
      decoration: const BoxDecoration(
          image: DecorationImage(image: NetworkImage("https://picsum.photos/id/237/200/300"),
              fit: BoxFit.cover)
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  final double width;
  final double height;
  const CustomBody({
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
          Positioned(
              top: height/3,
              left: width/10,
              child: const PersonalInformationLine()),
          const SizedBox(height: 30),
          Positioned(
              top: height/2,
              left: width/10,
              child: InformationLine()),
          const SizedBox(height: 10,),
          CustomDivider(width: width,height: height),
          const SizedBox(height: 10,),
          const Text("Favoriler",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          const SizedBox(height: 10,),
          RouteCard(width: width/1.1, height: 80,city: "Istanbul",country: "Turkey",),
        ],
      ),
    );
  }
}

class PersonalInformationLine extends StatelessWidget {
  const PersonalInformationLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(text: const TextSpan(
      children: <InlineSpan>[
        TextSpan(text:"Ad Soyad\n",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20)),
        WidgetSpan(child: SizedBox(height: 30,)),
        TextSpan(text:"Meslek", style: TextStyle(color: Colors.black)),
      ],
    ));
  }
}

class InformationLine extends StatelessWidget {
  const InformationLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(text: const TextSpan(
        children: <InlineSpan>[
          TextSpan(text: "Hakkında\n",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
          WidgetSpan(child: SizedBox(height: 20)),
          TextSpan(text: "In up so discovery my middleton eagerness dejection explained. Estimating excellence ye contrasted insensible as. Oh up unsatiable advantages decisively as at interested. Present suppose in esteems in demesne colonel it to. End horrible she landlord screened stanhill. Repeated offended you opinions off dissuade ask packages screened. She alteration everything sympathize impossible his get compliment. Collected few extremity suffering met had sportsman. ",style: TextStyle(color: Colors.black)),
        ]
    ));
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



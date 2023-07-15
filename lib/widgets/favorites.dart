import 'package:flutter/material.dart';
import 'package:memapp/pages/popuppage.dart';

class RouteCard extends StatefulWidget {
  final double width;
  final double height;
  final String city;
  final String country;
  const RouteCard({
    required this.width,
    required this.height,
    required this.city,
    required this.country,
    Key? key}) : super(key: key);

  @override
  State<RouteCard> createState() => _RouteCardState();
}

class _RouteCardState extends State<RouteCard> {
  @override

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Scaffold.of(context).openDrawer();
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )],
        ),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
              child: Image.network("https://img.freepik.com/free-photo/panoramic-istanbul-city-twilight-turkey_335224-1278.jpg?w=826&t=st=1687290970~exp=1687291570~hmac=c5438b96180740c659ed60ad1adf7bda9a7228e92975282afebbf96331cd6bed",width: widget.width/2.3,fit: BoxFit.cover,),
            ),
            SizedBox(
              width: widget.width - widget.width/2.3,
              height: widget.height,
              child: Center(
                child: Column(
                  children: <Widget>[
                    const SizedBox(width: 10),
                    Text(widget.city, style: const TextStyle(fontWeight: FontWeight.bold),),
                    Text(widget.country),
                    SizedBox(
                      width: widget.width - widget.width/2.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(onPressed: (){}, icon: const Icon(Icons.share, color: Colors.blue)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.comment, color: Colors.blue)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.pin_drop, color: Colors.blue)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}

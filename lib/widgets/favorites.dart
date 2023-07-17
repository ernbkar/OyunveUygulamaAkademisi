import 'package:flutter/material.dart';

class RouteCard extends StatefulWidget {
  final double width;
  final double height;
  final String city;
  final String URL;
  const RouteCard({
    required this.URL,
    required this.width,
    required this.height,
    required this.city,
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
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius:  BorderRadius.circular(15),
              child: Image.network(widget.URL,width: widget.width,fit: BoxFit.cover,),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(widget.city, style: const TextStyle(fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),

    );
  }
}

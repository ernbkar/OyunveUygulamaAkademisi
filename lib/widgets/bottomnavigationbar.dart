import 'package:flutter/material.dart';
import 'package:memapp/pages/discoverpage.dart';
import 'package:memapp/pages/profilepage.dart';
import 'package:memapp/pages/sharepage.dart';

class CustomBottomNavigationBar extends StatefulWidget {
   bool profilepressed;
   bool searchpressed;
   bool uploadpressed;
  CustomBottomNavigationBar({
    required this.profilepressed,
    required this.searchpressed,
    required this.uploadpressed,
    Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 15,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
            IconButton(onPressed: (widget.searchpressed == true) ? null : (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DiscoverPage()),
              );
                setState((){
                  widget.searchpressed = !widget.searchpressed;
                  if(widget.uploadpressed == true || widget.profilepressed == true){
                    if(widget.uploadpressed == true)
                      widget.uploadpressed = !widget.uploadpressed;
                    else if(widget.profilepressed == true)
                      widget.profilepressed = !widget.profilepressed;
                  }
                });
            }, icon: Icon((widget.searchpressed == true) ? Icons.explore : Icons.explore_outlined, color: Colors.black,)),
          IconButton(onPressed: (widget.uploadpressed == true) ? null : (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SharePage()),
            );
            setState(() {
              widget.uploadpressed = !widget.uploadpressed;
              if(widget.searchpressed == true || widget.profilepressed == true){
                if(widget.searchpressed == true)
                  widget.searchpressed = !widget.searchpressed;
                else if(widget.profilepressed == true)
                  widget.profilepressed = !widget.profilepressed;
              }
            });
          }, icon: Icon((widget.uploadpressed == true) ? Icons.add_box : Icons.add_box_outlined, color: Colors.black,)),
          IconButton(onPressed: (widget.profilepressed == true) ? null : (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
            setState((){
              widget.profilepressed = !widget.profilepressed;
              if(widget.searchpressed == true || widget.uploadpressed == true){
                if(widget.searchpressed == true)
                  widget.searchpressed = !widget.searchpressed;
                else if(widget.uploadpressed == true)
                  widget.uploadpressed = !widget.uploadpressed;
              }
            });
          }, icon: Icon((widget.profilepressed == true) ? Icons.account_circle : Icons.account_circle_outlined, color: Colors.black,)),

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';


class PopUpPage extends StatefulWidget {
  const PopUpPage({Key? key}) : super(key: key);

  @override
  State<PopUpPage> createState() => _PopUpPageState();
}

class _PopUpPageState extends State<PopUpPage> {
  @override
  Widget build(BuildContext context) {
    final double height =  MediaQuery.of(context).size.height;
    final double width =  MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ),
      content: SizedBox(
        width: width/1.2,
        height: height/2,
      ),
    );
  }
}

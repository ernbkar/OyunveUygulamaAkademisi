import 'package:flutter/material.dart';


class CustomToggleButton extends StatefulWidget {
  final String textlabel1;
  final String textlabel2;
  final String textlabel3;
  final double width;
  final double height;
  CustomToggleButton({
    required this.textlabel1,
    required this.textlabel2,
    required this.textlabel3,
    required this.width,
    required this.height,
    Key? key}) : super(key: key);

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  bool ispressed1 = false;
  bool ispressed2 = false;
  bool ispressed3 = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CustomButton(text: widget.textlabel1, width: widget.width, ispressed: (ispressed2 == true|| ispressed3 == true) ? ispressed1 : !ispressed1),
          Container(color: Colors.black, height: widget.height/1.2,width: 1,),
          CustomButton(text: widget.textlabel2, width: widget.width, ispressed: (ispressed1 == true|| ispressed3 == true) ? ispressed2 : !ispressed2),
          Container(color: Colors.black, height: widget.height/1.2,width: 1,),
          CustomButton(text: widget.textlabel3, width: widget.width, ispressed: (ispressed1 == true|| ispressed2 == true) ? ispressed3 : !ispressed3),
        ],
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final String text;
  final double width;
  late bool ispressed;
  CustomButton({
    required this.text,
    required this.width,
    required this.ispressed,
    Key? key}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          widget.ispressed = !widget.ispressed;
        });
      },
      child: SizedBox(
        width: widget.width/5,
        child: Text(widget.text, style: TextStyle(fontWeight: (widget.ispressed == true) ? FontWeight.bold : FontWeight.normal),),
      ),
    );
  }
}


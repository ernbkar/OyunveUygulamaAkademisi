import "package:flutter/material.dart";
import 'package:memapp/widgets/searchcart.dart';


class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SearchCart(),
      )
    );
  }
}

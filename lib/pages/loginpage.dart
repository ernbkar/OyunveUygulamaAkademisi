import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width =  MediaQuery.of(context).size.width;
    final double height =  MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SizedBox(
        width: width,
        height: height,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const CircleAvatar(
                          radius: 90,
                          backgroundColor: Colors.blue,
                          backgroundImage: NetworkImage('https://www.woolha.com/media/2020/03/eevee.png'),
                        ),
                        SizedBox(
                          width: width/1.3,
                          child: Column(
                            children: const <Widget>[
                              LoginPageRows(title: "username"),
                              LoginPageRows(title: "password"),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            children: <Widget>[
                              const Text("Do you not have an acocunt?",style: TextStyle(color: Colors.white),),
                              Container(color: Colors.white,width: 10,height: 1,),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 20),
                                ),
                                onPressed: () {},
                                child: const Text('Register',style: TextStyle(color: Colors.white),),
                              ),
                              const Text("OR",style: TextStyle(color: Colors.white),),
                              SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: const <Widget>[
                                    CustomSocielButtons(icon: FontAwesomeIcons.google),
                                    CustomSocielButtons(icon: FontAwesomeIcons.facebook),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
      )
    );
  }
}

class LoginPageRows extends StatelessWidget {
  final String title;
  const LoginPageRows({
    required this.title,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/1.3,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(title,style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  )
                ]
            ),
            child: TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(hintText: title, border: InputBorder.none),
            ),
          ),
        ],
      )
    );
  }
}

class CustomSocielButtons extends StatelessWidget {
  final IconData icon;
  const CustomSocielButtons({
    required this.icon,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: SizedBox(
      child: FaIcon(icon),
    ),
    );
  }
}







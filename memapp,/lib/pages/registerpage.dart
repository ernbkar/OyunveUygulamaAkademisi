import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RegisterPage extends StatelessWidget {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _checkpasswordcontroller = TextEditingController();
  Future signup() async {
    if(passwordconfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailcontroller.text.trim(), password: _passwordcontroller.text.trim());
    }
  }
  bool passwordconfirmed(){
    if(_passwordcontroller.text.trim()==_checkpasswordcontroller.text.trim()){
      print("true");
      return true;
    }
    else
      {
        print("false");
        return false;
      }
  }
  RegisterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width/1.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      )
                    ],
                  ),
                  child: TextFormField(
                    controller: _emailcontroller,
                    decoration: const InputDecoration(
                        label: Text("Email"),
                        prefixIcon: Icon(Icons.email),
                        border: InputBorder.none
                    ),
                  )
              ),
              const SizedBox(height: 5,),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      )
                    ],
                  ),
                  child: TextFormField(
                    controller: _passwordcontroller,
                    decoration: const InputDecoration(
                        label: Text("Şifre"),
                        prefixIcon: Icon(Icons.lock),
                        border: InputBorder.none
                    ),
                  ),
              ),
              const SizedBox(height: 5,),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      )
                    ],
                  ),
                  child: TextFormField(
                    controller: _checkpasswordcontroller,
                    decoration: const InputDecoration(
                        label: Text("Şifreyi kontrol et"),
                        prefixIcon: Icon(Icons.email),
                        border: InputBorder.none
                    ),
                  )
              ),
            const SizedBox(height: 40,),
            registerbutton()],
          ),
        ),
      )
    );
  }
  Widget registerbutton()
  {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white
      ),
      onPressed: () {
        signup();
      },
      child: const Text(
        'Kayıt Ol',
        style: TextStyle(color: Colors.indigo),
      ),
    );
  }
}





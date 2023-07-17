import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memapp/pages/discoverpage.dart';

class RegisterPage extends StatelessWidget {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _checkpasswordcontroller = TextEditingController();
  final _firstnamecontroller = TextEditingController();
  final _lastnamecontroller = TextEditingController();
  final _usernamecontroller = TextEditingController();
  Future signup() async {
    if(passwordconfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailcontroller.text.trim(), password: _passwordcontroller.text.trim());
    }
  }
  bool passwordconfirmed(){
    if(_passwordcontroller.text.trim()==_checkpasswordcontroller.text.trim()){
      //Add user
      adduserdetails(_firstnamecontroller.text.trim(), _lastnamecontroller.text.trim(), _emailcontroller.text.trim(),_usernamecontroller.text.trim());
      return true;
    }
    else
      {
        return false;
      }
  }
  Future adduserdetails(String firstname, String lastname, String email, String username) async{
    await FirebaseFirestore.instance.collection("users").add({
      'first name' : firstname,
      'last name'  : lastname,
      'email'      : email,
      'username'   : username,
      'biography'  : "Hakkınızda bir şeyler ekleyiniz",
      'memory'     : "Lütfen anı ekleyiniz"
    });
  }

  void dispose(){
      _emailcontroller.dispose();
      _passwordcontroller.dispose();
      _checkpasswordcontroller.dispose();
      _firstnamecontroller.dispose();
      _lastnamecontroller.dispose();
      _usernamecontroller.dispose();
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
                    controller: _usernamecontroller,
                    decoration: const InputDecoration(
                        label: Text("Kullanıcı Adı"),
                        prefixIcon: Icon(Icons.email),
                        border: InputBorder.none
                    ),
                  )
              ),
              const SizedBox(height: 10,),
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
                    controller: _firstnamecontroller,
                    decoration: const InputDecoration(
                        label: Text("Ad"),
                        prefixIcon: Icon(Icons.email),
                        border: InputBorder.none
                    ),
                  )
              ),
              const SizedBox(height: 10,),
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
                    controller: _lastnamecontroller,
                    decoration: const InputDecoration(
                        label: Text("Soy Ad"),
                        prefixIcon: Icon(Icons.email),
                        border: InputBorder.none
                    ),
                  )
              ),
                const SizedBox(height: 10,),
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
                        label: Text("email"),
                        prefixIcon: Icon(Icons.lock),
                        border: InputBorder.none
                    ),
                  ),
              ),

              const SizedBox(height: 10,),
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
                        prefixIcon: Icon(Icons.email),
                        border: InputBorder.none
                    ),
                  )
              ),
              const SizedBox(height: 10,),
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
            registerbutton(context)],
          ),
        ),
      )
    );
  }
  Widget registerbutton(context)
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
      onPressed: () async{
        await signup();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const DiscoverPage()));
      },
      child: const Text(
        'Kayıt Ol',
        style: TextStyle(color: Colors.indigo),
      ),
    );
  }
}





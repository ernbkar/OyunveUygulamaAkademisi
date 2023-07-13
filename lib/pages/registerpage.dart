import 'package:flutter/material.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
                    decoration: const InputDecoration(
                        label: Text("Kullanıcı Adı"),
                        prefixIcon: Icon(Icons.account_circle),
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
                    decoration: const InputDecoration(
                        label: Text("Şifre"),
                        prefixIcon: Icon(Icons.lock),
                        border: InputBorder.none
                    ),
                  ),
              ),
            const SizedBox(height: 40,),
            const RegisterButton()],
          ),
        ),
      )
    );
  }
}


class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white
      ),
      onPressed: () {},
      child: const Text(
        'Kayıt Ol',
        style: TextStyle(color: Colors.indigo),
      ),
    );
  }
}




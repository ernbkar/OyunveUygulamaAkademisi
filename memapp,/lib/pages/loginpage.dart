import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memapp/pages/discoverpage.dart';


class LoginPage extends StatelessWidget {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  Future<User?> loginemailandpassword( String email,
       String password, BuildContext context) async{
        FirebaseAuth auth = FirebaseAuth.instance;
        User? user;
        try{
            UserCredential usercredential = await auth.signInWithEmailAndPassword(email: _emailcontroller.text.trim(),password: _passwordcontroller.text.trim());
            user = usercredential.user;
        }on FirebaseAuthException catch(e){
          if(e.code == "user-not-found"){
            print("No user found");
          }
        }

        return user;
  }
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 90,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  'https://www.woolha.com/media/2020/03/eevee.png',
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: width / 1.3,
                child: Column(
                  children: <Widget>[
                    LoginPageRows(title: "Kullanıcı Adı",customtexteditingcontroller: _emailcontroller,),
                    SizedBox(height: 20),
                    LoginPageRows(title: "Şifre", isPassword: true,customtexteditingcontroller: _passwordcontroller,),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: <Widget>[
                  const SizedBox(height: 8),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
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
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () async{
                            User? user = await loginemailandpassword(_emailcontroller.text,_passwordcontroller.text,context);
                            if(user!=null){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const DiscoverPage()));
                            }
                          },
                          child: const Text(
                            'Giriş Yap',
                            style: TextStyle(color: Colors.indigo),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "OR",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const <Widget>[
                        CustomSocialButton(icon: FontAwesomeIcons.google),
                        CustomSocialButton(icon: FontAwesomeIcons.facebook),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPageRows extends StatefulWidget {
  final String title;
  final bool isPassword;
  final TextEditingController customtexteditingcontroller;
  LoginPageRows({
    required this.customtexteditingcontroller,
    this.title = "", this.isPassword = false, Key? key}) : super(key: key);

  @override
  State<LoginPageRows> createState() => _LoginPageRowsState();
}

class _LoginPageRowsState extends State<LoginPageRows> {
  bool _isObscure = true;

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
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
              controller: widget.customtexteditingcontroller,
              cursorColor: Colors.indigo,
              style: const TextStyle(color: Colors.indigo),
              obscureText: widget.isPassword ? _isObscure : false,
              decoration: InputDecoration(
                hintText: widget.title,
                hintStyle: const TextStyle(color: Colors.indigo),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                suffixIcon: widget.isPassword
                    ? IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                    color: Colors.indigo,
                  ),
                  onPressed: _toggleObscure,
                )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSocialButton extends StatelessWidget {
  final IconData icon;
  const CustomSocialButton({required this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: FaIcon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


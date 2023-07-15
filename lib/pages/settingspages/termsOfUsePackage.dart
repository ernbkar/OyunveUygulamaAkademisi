import 'package:flutter/material.dart';
import 'package:memapp/assets/text.dart' as metin;

class TermsOfUsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Kullanım Koşulları',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.policy),
              iconColor: Colors.green, // İlgili ikonu buraya ekleyin
              title: Text('Gizlilik Politikası ve Hizmet Şartları'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
                );
              },
            );
          },
          itemCount: 1,
        ),
      ),
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Gizlilik Politikası ve Hizmet Şartları',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            uzunMetin,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
String uzunMetin = metin.Metin.uzunMetin;
import 'package:flutter/material.dart';

class DeleteAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Çıkış Yap',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Hesaptan Çıkış Yap'),
          onPressed: () {
            _signOut(context);
          },
        ),
      ),
    );
  }

  void _signOut(BuildContext context) {
    // Kullanıcının hesaptan çıkış yapmasını sağlamak için burada gerekli işlemleR yapılabilir
    // Örneğin, yerel oturum durumunu temizleyebilir veya oturumla ilgili bilgileri sıfırlanabilir
    // Ardından kullanıcıyı yönlendirilebilir, örneğin giriş sayfasına geri döndürülebilir
  }
}

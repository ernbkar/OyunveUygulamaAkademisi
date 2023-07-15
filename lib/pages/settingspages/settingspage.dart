import 'package:flutter/material.dart';
import 'package:memapp/assets/text.dart';
import 'AppearanceSettingsPage.dart';
import 'ConnectionSettingsPage.dart';
import 'DataStorageSettingsPage.dart';
import 'DeleteAccount.dart';
import 'DeleteAccountPage.dart';
import 'HelpPage.dart';
import 'PrivacySettingsPage.dart';
import 'termsOfUsePackage.dart';


class SettingsPage extends StatelessWidget {
  final String uzunMetin = Metin.uzunMetin;
  //gizlilik ve kullanım koşulları için yazdığım metin.dartı tanımladım
  //sayfaların adları ikonları ikon renkleri ve konumları var burda
  final List<Map<String, dynamic>> settings = [
    {
      'title': 'Özel Ayarlar',
      'icon': Icons.settings,
      'iconColor': Colors.grey,
      'page': CustomSettingsPage(),
    },
    {
      'title': 'Görünüm ve Düzen',
      'icon': Icons.color_lens,
      'iconColor': Colors.orange,
      'page': AppearanceSettingsPage(),
    },
    {
      'title': 'Gizlilik Ve Güvenlik',
      'icon': Icons.lock,
      'iconColor': Colors.blue,
      'page': PrivacySettingsPage(),
    },
    {
      'title': 'Veri ve Depolama',
      'icon': Icons.storage,
      'iconColor': Colors.yellow,
      'page': DataStorageSettingsPage(),
    },
    {
      'title': 'Kullanım Koşulları',
      'icon': Icons.gavel,
      'iconColor': Colors.green,
      'page': TermsOfUsePage(),
    },
    {
      'title': 'Hakkında',
      'icon': Icons.info,
      'iconColor': Colors.green,
      'page': ConnectionSettingsPage(),
    },
    {
      'title': 'Yardım',
      'icon': Icons.help,
      'iconColor': Colors.blue,
      'page': HelpPage(),
    },
    {
      'title': 'Hesap Silme',
      'icon': Icons.delete,
      'iconColor': Colors.red,
      'page': DeleteAccount(),
    },
    {
      'title': 'Çıkış Yap',
      'icon': Icons.exit_to_app,
      'iconColor': Colors.black,
      'page': DeleteAccountPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    // ayarlar ve gizlilik sayfasının genel özelliklerini tanımladım
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ayarlar Ve Gizlilik',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: settings.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              children: [
                Icon(
                  settings[index]['icon'],
                  color: settings[index]['iconColor'],
                ),
                SizedBox(
                  width: 8,
                ),
                Text(settings[index]['title']),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => settings[index]['page']),
              );
            },
          );
        },
      ),
    );
  }
}

class CustomSettingsPage extends StatelessWidget {
  final List<String> settings = ['Temalar Seçimi', 'Uygulama Sürüm Bilgisi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Özel Ayarlar',
          style: TextStyle(
            color: Colors
                .black, // Özel Ayarlar yazısının rengini siyah olarak ayarla
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: settings.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: index == 0 ? Icon(Icons.palette) : Icon(Icons.info),
            title: Text(settings[index]),
            onTap: () {
              _navigateToSettingsDetail(context, index);
            },
          );
        },
      ),
    );
  }

  void _navigateToSettingsDetail(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ThemeSelectionPage()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AppVersionPage()),
      );
    }
  }
}

class ThemeSelectionPage extends StatefulWidget {
  @override
  _ThemeSelectionPageState createState() => _ThemeSelectionPageState();
}

class _ThemeSelectionPageState extends State<ThemeSelectionPage> {
  String _selectedTheme = 'açık';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Temalar Seçimi',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: <Widget>[
          RadioListTile<String>(
            title: Text('Koyu Tema'),
            value: 'koyu',
            groupValue: _selectedTheme,
            onChanged: (String? value) {
              setState(() {
                _selectedTheme = value!;
              });
            },
          ),
          RadioListTile<String>(
            title: Text('Açık Tema'),
            value: 'açık',
            groupValue: _selectedTheme,
            onChanged: (String? value) {
              setState(() {
                _selectedTheme = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}

class AppVersionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Uygulama Sürüm Bilgisi',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Text('Uygulama Sürüm Bilgisi Sayfası'),
      ),
    );
  }
}

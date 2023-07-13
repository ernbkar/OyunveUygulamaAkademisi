import 'package:flutter/material.dart';


class AppearanceSettingsPage extends StatelessWidget {
  final List<String> options = [
    'Ekran Yoğunluğu',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Görünüm ve Düzen',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: options.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.brightness_medium),
            iconColor: Colors.orange, // İstediğiniz simgeyi buraya ekleyin
            title: Text(options[index]),
            onTap: () {
              _navigateToOptionPage(context, index);
            },
          );
        },
      ),
    );
  }

  void _navigateToOptionPage(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScreenDensityPage()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScreenDensityPage()),
      );
    }
  }
}

class ScreenDensityPage extends StatefulWidget {
  @override
  _ScreenDensityPageState createState() => _ScreenDensityPageState();
}

class _ScreenDensityPageState extends State<ScreenDensityPage> {
  int selectedOption = 1; // Başlangıçta izin ver i seçili  olarak ayarladım

  final List<String> notifications = ['Ekran Bildirimleri'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Ekran Yoğunluğu',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: notifications.length + 2, // iki öge ekledim
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            // İlk öğe, Ekran Bildirimleri metnini içeren ListTile
            return ListTile(
              title: Text(notifications[0]),
            );
          } else if (index == 1) {
            // İkinci öğe, izin ver seçeneğini içeren RadioListTile
            return RadioListTile(
              title: Text('İzin Ver'),
              value: 1,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value as int; // Seçilen seçeneği güncelle
                });
              },
            );
          } else {
            // Diğer öğeler için RadioListTile
            return RadioListTile(
              title: Text('İzin Verme'),
              value: index,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value as int; // Seçilen seçeneği güncelle
                });
              },
            );
          }
        },
      ),
    );
  }
}
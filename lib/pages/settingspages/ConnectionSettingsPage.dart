import 'package:flutter/material.dart';

class ConnectionSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Hakkında',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return ListTile(
                leading: Icon(Icons.info),
                iconColor: Colors.lightGreen,
                title: Text('Uygulama Bilgisi'),
                subtitle: Text(
                    'Uygulama adı, geliştirici bilgisi vb. gibi genel bilgiler'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppInfoPage(
                        appName: 'Uygulama Adı',
                        developerInfo: 'Geliştirici Bilgisi',
                      ),
                    ),
                  );
                },
              );
            } else if (index == 1) {
              return ListTile(
                leading: Icon(Icons.details), // İkonu burada ekliyoruz
                title: Text('Sürüm Detayları'),
                iconColor: Colors.lightGreen,
                subtitle: Text(
                    'Uygulamanın sürüm numarası, tarih vb. gibi ayrıntılar'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VersionDetailsPage(),
                    ),
                  );
                },
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}

class AppInfoPage extends StatelessWidget {
  final String appName;
  final String developerInfo;

  AppInfoPage({required this.appName, required this.developerInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Uygulama Bilgisi',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Uygulama Adı:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              appName,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Geliştirici Bilgisi:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              developerInfo,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VersionDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Sürüm Detayları',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/images/logo.png',
              width: 400,
              height: 400,
            ),
            Text(
              'WanderLens',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Sürüm 1.0.0',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Yayın Tarihi: 07 Temmuz 2023',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
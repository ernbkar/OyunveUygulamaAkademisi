import 'package:flutter/material.dart';
class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Yardım',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.help, size: 30),
                iconColor: Colors.lightBlue, // İlgili ikon
                title: Text(
                  'Genel Sorunlar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelpTopicPage(
                        title: 'Genel Sorunlar',
                        content:
                            'Bu bölümde genel sorunlarla ilgili yardım alabilirsiniz.',
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.settings, size: 30),
                iconColor: Colors.lightBlue, // İlgili ikon
                title: Text(
                  'Teknik Sorunlar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelpTopicPage(
                        title: 'Teknik Sorunlar',
                        content:
                            'Bu bölümde teknik sorunlarla ilgili yardım alabilirsiniz.',
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.mail, size: 30),
                iconColor: Colors.lightBlue, // İlgili ikon
                title: Text(
                  'İletişim',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelpTopicPage(
                        title: 'İletişim',
                        content:
                            'Bize ulaşmak için aşağıdaki iletişim seçeneklerinden birini kullanabilirsiniz.',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HelpTopicPage extends StatelessWidget {
  final String title;
  final String content;

  HelpTopicPage({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(content),
      ),
    );
  }
}

import "package:flutter/material.dart";
import 'package:memapp/pages/settingspage.dart';
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
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../data/pref_manager.dart';

enum Language { english, arabic }

class ChangeLanguagePage extends StatefulWidget {
  @override
  _ChangeLanguagePageState createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  var _language;
  @override
  void initState() {
    super.initState();
    switch (Prefs.getString('language', def: 'en')) {
      case 'en':
        _language = Language.english;
        break;

      case 'ar':
        _language = Language.arabic;
        break;

      default:
        break;
    }
  }

  _changeLanguage(int index) {
    switch (index) {
      case 0:
        _language = Language.english;
        Prefs.setString(Prefs.LANGUAGE, 'en');
        break;

      case 1:
        _language = Language.arabic;
        Prefs.setString(Prefs.LANGUAGE, 'ar');
        break;

        break;
    }
    EasyLocalization.of(context).locale =
        EasyLocalization.of(context).supportedLocales[index];

    print("language" + _language.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'language_settings'.tr(),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RadioListTile(
              value: Language.english,
              onChanged: (value) => _changeLanguage(0),
              groupValue: _language,
              title: Text('english'.tr()),
            ),
            Divider(
              height: 0.5,
              indent: 10,
              endIndent: 10,
            ),
            RadioListTile(
              value: Language.arabic,
              onChanged: (value) => _changeLanguage(1),
              groupValue: _language,
              title: Text('spanish'.tr()),
            ),
          ],
        ),
      ),
    );
  }
}

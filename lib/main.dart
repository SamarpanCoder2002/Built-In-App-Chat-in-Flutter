import 'package:flutter/material.dart';
import 'package:inapp_chat_project/config.dart';
import 'package:zego_zimkit/services/services.dart';

import 'main_screen.dart';

void main() async{
  await DataManagement.loadEnvFile;
  final _appId = await DataManagement.getSecretData(StoredString.appId);
  final _appSignKey = await DataManagement.getSecretData(StoredString.appSignKey);

  await ZIMKit().init(appID: int.parse(_appId), appSign: _appSignKey);

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const EntryRoot());
}

class EntryRoot extends StatelessWidget {
  const EntryRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZegoCloud InApp Chat',
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: child!,
      ),
      home: const MainScreen(),
    );
  }
}




















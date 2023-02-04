import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inapp_chat_project/dashboard_screen.dart';
import 'package:zego_zimkit/services/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  void changeSystemNavigationAndStatusBarColor(
          {Color navigationBarColor = Colors.white,
          Color statusBarColor = Colors.transparent,
          Brightness? statusIconBrightness = Brightness.dark,
          Brightness? navigationIconBrightness = Brightness.dark}) =>
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor, // navigation bar color
        statusBarColor: statusBarColor, // status bar color
        statusBarIconBrightness: statusIconBrightness,
        systemNavigationBarIconBrightness: navigationIconBrightness,
      ));

  @override
  void initState() {
    changeSystemNavigationAndStatusBarColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                controller: _userNameController,
                cursorColor: const Color(0xff424242),
                decoration: InputDecoration(
                  enabledBorder: _commonBorder,
                  focusedBorder: _commonBorder,
                  border: _commonBorder,
                  filled: true,
                  hintText: 'User Name',
                  fillColor: const Color(0xFFF3F2F2),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                )),
            const SizedBox(height: 15),
            TextFormField(
                controller: _userIdController,
                cursorColor: const Color(0xff424242),
                decoration: InputDecoration(
                  enabledBorder: _commonBorder,
                  focusedBorder: _commonBorder,
                  border: _commonBorder,
                  filled: true,
                  hintText: 'User Id',
                  fillColor: const Color(0xFFF3F2F2),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                )),
            const SizedBox(height: 15),
            _commonButton('Log in', () async {
              await ZIMKit().connectUser(
                  id: _userIdController.text, name: _userNameController.text);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          DashBoardScreen(userId: _userIdController.text)));
            }),
          ],
        ),
      ),
    );
  }

  _commonButton(String btnName, VoidCallback onTap) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff0155FE),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
        child: Text(
          btnName,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ));
  }

  get _commonBorder => OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
            color: const Color(0xff424242).withOpacity(0.4), width: 2),
      );
}

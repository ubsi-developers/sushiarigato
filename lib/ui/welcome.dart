import 'package:flutter/material.dart';
import 'package:sushiarigato/ui/public/category/category_list.dart';
import 'package:sushiarigato/ui/login.dart';
import 'package:sushiarigato/helpers/theme_colors.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("images/bg-sushiarigato.jpg"),
            fit: BoxFit.cover,
            colorFilter:
                ColorFilter.mode(ThemeColors.darkOverlay80(), BlendMode.darken),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Text(
                    'Hi, Sahabat',
                    style: TextStyle(
                      color: ThemeColors.white(),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Text(
                      'SushiArigato',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: ThemeColors.primary(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 200),
                    child: Text(
                      'Pilih menu tanpa ribet',
                      style: TextStyle(
                        color: ThemeColors.white(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buttonFind(),
            _buttonLogin(),
          ],
        ),
      ),
    );
  }

  Widget _buttonFind() {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 30, right: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: ThemeColors.primary(),
          fixedSize: const Size(250, 45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CategoryList(),
            ),
          );
        },
        child: Text(
          "Cari Menu",
          style: TextStyle(
            color: ThemeColors.white(),
          ),
        ),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 30, right: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: ThemeColors.secondary(),
          fixedSize: const Size(250, 45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Login(),
            ),
          );
        },
        child: Text(
          "Masuk",
          style: TextStyle(
            color: ThemeColors.primary(),
          ),
        ),
      ),
    );
  }
}

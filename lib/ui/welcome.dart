import 'package:flutter/material.dart';
import 'package:sushiarigato/ui/public/category/category_list.dart';
import 'package:sushiarigato/ui/login.dart';
import 'package:sushiarigato/helpers/theme_colors.dart';
import 'package:sushiarigato/ui/register.dart';

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
            _buttonLihatMenu(),
            Container(
              child: Row(
                children: [
                  _buttonLogin(),
                  _buttonRegister(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buttonLihatMenu() {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: ThemeColors.white(),
          fixedSize: Size(MediaQuery.of(context).size.width - 15, 45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
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
          "Lihat Menu",
          style: TextStyle(
            color: ThemeColors.primary(),
          ),
        ),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 30, right: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: ThemeColors.primary(),
          fixedSize: Size(MediaQuery.of(context).size.width * 0.5 - 45, 45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
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
          "Login",
          style: TextStyle(
            color: ThemeColors.white(),
          ),
        ),
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 15, right: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: ThemeColors.secondary(),
          fixedSize: Size(MediaQuery.of(context).size.width * 0.5 - 45, 45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Register(),
            ),
          );
        },
        child: Text(
          "Register",
          style: TextStyle(
            color: ThemeColors.primary(),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sushiarigato/ui/home.dart';
import 'package:sushiarigato/ui/login.dart';

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
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bg-sushiarigato.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromRGBO(0, 0, 0, 0.6), BlendMode.darken)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 8),
                child: Column(
                  children: [
                    const Text(
                      'Hi, Sahabat',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 15),
                      child: const Text(
                        'SushiArigato',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Color.fromRGBO(255, 166, 116, 1)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 200),
                      child: const Text(
                        'Pilih menu tanpa ribet',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  ],
                )),
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
            primary: const Color(0xFFDA580F),
            fixedSize: const Size(250, 45),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Home()));
        },
        child: const Text(
          "Cari Menu",
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
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
            primary: const Color(0xFFFDDCC4),
            fixedSize: const Size(250, 45),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Login()));
        },
        child: const Text(
          "Masuk",
          style: TextStyle(
            color: Color(0xFFDA580F),
          ),
        ),
      ),
    );
  }
}

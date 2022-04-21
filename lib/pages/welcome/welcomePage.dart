import 'package:amaris_test/pages/login/LoginPage.dart';
import 'package:amaris_test/utils/const.dart';
import 'package:amaris_test/widgets/AmarisButton.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.topLeft)),
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 70),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Welcome!',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: AmarisButton(
                        backgroundColor: amarisYellow,
                        fontColor: amarisBlack,
                        text: 'Sign up',
                        disabled: true,
                        function: () => {print("Hello")}),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: AmarisButton(
                        backgroundColor: amarisWhite,
                        fontColor: amarisBlack,
                        disabled: false,
                        text: 'Log in',
                        function: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()))
                            }),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: amarisWhite),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:amaris_test/utils/const.dart';
import 'package:amaris_test/widgets/AmarisButton.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _nameController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: amarisBlack.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                height: MediaQuery.of(context).size.height * 0.5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                        style: TextStyle(color: amarisWhite),
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(color: amarisWhite),
                          fillColor: Colors.white,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: amarisWhite),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: amarisWhite),
                          ),
                        ),
                      ),
                      TextField(
                        style: TextStyle(color: amarisWhite),
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: amarisWhite),
                          fillColor: Colors.white,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: amarisWhite),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: amarisWhite),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: AmarisButton(
                            backgroundColor: amarisWhite,
                            fontColor: amarisBlack,
                            text: 'Log in',
                            function: () => {},
                            disabled: false),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                right: 0,
                bottom: MediaQuery.of(context).size.height * 0.45,
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      color: amarisWhite,
                    )))
          ],
        ),
      ),
    );
  }
}

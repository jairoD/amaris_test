import 'package:amaris_test/controllers/seriesController.dart';
import 'package:amaris_test/controllers/userController.dart';
import 'package:amaris_test/pages/home/HomePage.dart';
import 'package:amaris_test/services/seriesService.dart';
import 'package:amaris_test/utils/Alerts.dart';
import 'package:amaris_test/utils/const.dart';
import 'package:amaris_test/widgets/AmarisButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _nameController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<UserController>().loadUsers());
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
    var userReader = context.read<UserController>();
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
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
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
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
                              function: () => login(userReader),
                              disabled: false),
                        )
                      ],
                    ),
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

  login(UserController userController) {
    if (_formKey.currentState!.validate()) {
      Alerts.loading(context);
      if (userController.validate(
          name: _nameController.text, passowrd: _passwordController.text)) {
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      } else {
        Navigator.pop(context);
        Alerts.errorFlushbar(context, 'Error', 'Email o contraseña incorrecta');
      }
    }
  }
}

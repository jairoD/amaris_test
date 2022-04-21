import 'dart:convert';

import 'package:amaris_test/models/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class UserController with ChangeNotifier {
  List<Users> localUsers = [];

  Future<void> loadUsers() async {
    final usersJson = await rootBundle.loadString('data/users.json');
    Map<String, dynamic> data = await jsonDecode(usersJson);
    List<dynamic> users = data["users"];
    localUsers = users.map((e) => Users.fromMap(e)).toList();
    notifyListeners();
  }

  bool validate({required String name, required String passowrd}) {
    Users userValidate = Users(name: name, password: passowrd);
    if (localUsers.contains(userValidate)) {
      return true;
    }
    return false;
  }
}

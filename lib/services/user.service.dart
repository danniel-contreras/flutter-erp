import 'dart:developer';

import 'package:erp_test_app/models/auth.model.dart';
import 'package:erp_test_app/utils/constants.dart';
import 'package:erp_test_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserService {
  void loginUser({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    try {
      AuthPayload payload = AuthPayload(userName: username, password: password);

      log(payload.toJson());

      http.Response res = await http.post(
          Uri.parse('${Constants.API_URL}/auth'),
          body: payload.toJson(),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          });

      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBarMessage(context, "Bienvenido");
          });
      log(res.body);
      log(res.statusCode.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}

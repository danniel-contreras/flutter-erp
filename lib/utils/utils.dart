import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void showSnackBarMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

void httpErrorHandler({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 201:
      onSuccess();
      break;
    case 400:
      showSnackBarMessage(context, "Solicitud invalida");
      break;
    case 401:
      showSnackBarMessage(context, "Acceso denegado");
      break;
    case 500:
      showSnackBarMessage(context, "Error interno de el servidor");
      break;
    default:
      showSnackBarMessage(context, "Error no catalogado");
  }
}

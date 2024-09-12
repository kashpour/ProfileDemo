import 'package:flutter/material.dart';

Future<dynamic> customShowDialog(
    BuildContext context, String message, String buttonMessage,
    {TextField? txtPassword}) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          content: txtPassword ?? const Text(''),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(buttonMessage))
          ],
          title: Text(
            textAlign: TextAlign.center,
            message,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        );
      });
}

import 'package:flutter/material.dart';

Future<dynamic> customShowDialog(BuildContext context, String message) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"))
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

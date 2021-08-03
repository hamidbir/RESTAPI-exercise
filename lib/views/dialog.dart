import 'package:flutter/material.dart';

class AlertDelete extends StatelessWidget {
  const AlertDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning!'),
      content: Text('Are delete this note?'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text('Ok')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('Cancel')),
      ],
    );
  }
}

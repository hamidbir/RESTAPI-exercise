import 'package:flutter/material.dart';

class ListModify extends StatelessWidget {
  const ListModify({Key? key, required this.titlePage}) : super(key: key);
  final String titlePage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titlePage),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Title',
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'description',
              ),
            ),
            SizedBox(
              height: 28,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 48),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Submit',
                    //style: TextStyle(fontSize: 28),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

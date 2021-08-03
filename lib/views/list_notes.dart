import 'package:apirest/models/note_for_listing.dart';
import 'package:apirest/views/dialog.dart';
import 'package:apirest/views/list_editing.dart';
import 'package:flutter/material.dart';

class ListNotes extends StatelessWidget {
  final notes = [
    NoteForListing(
        noteID: '1',
        noteTitle: 'Note1',
        createDateTime: DateTime.now(),
        lastEditedDateTime: DateTime.now()),
    NoteForListing(
        noteID: '1',
        noteTitle: 'Note1',
        createDateTime: DateTime.now(),
        lastEditedDateTime: DateTime.now()),
    NoteForListing(
        noteID: '2',
        noteTitle: 'Note2',
        createDateTime: DateTime.now(),
        lastEditedDateTime: DateTime.now()),
    NoteForListing(
        noteID: '3',
        noteTitle: 'Note3',
        createDateTime: DateTime.now(),
        lastEditedDateTime: DateTime.now()),
    NoteForListing(
        noteID: '4',
        noteTitle: 'Note4',
        createDateTime: DateTime.now(),
        lastEditedDateTime: DateTime.now()),
  ];
  String formattDateTime(DateTime dateTime) {
    return '${dateTime.year}/${dateTime.month}/${dateTime.day} - Time${dateTime.hour} : ${dateTime.minute}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App Hamid'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ListModify(titlePage: 'Create Note')));
          },
          child: Icon(Icons.add),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey(notes[index].noteID),
                direction: DismissDirection.startToEnd,
                onDismissed: (dir) {},
                background: Container(
                  color: Colors.red,
                  child: Icon(Icons.delete),
                ),
                confirmDismiss: (dir) async {
                  final result = await showDialog(
                      context: context, builder: (_) => AlertDelete());
                  return result;
                },
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ListModify(titlePage: 'Editing Note')));
                  },
                  child: ListTile(
                    title: Text(notes[index].noteTitle,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent)),
                    subtitle: Text(
                        'Last edited on ${formattDateTime(notes[index].lastEditedDateTime)}',
                        style: TextStyle(color: Colors.grey)),
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Divider(
                    color: Colors.deepOrangeAccent,
                    height: 0.25,
                  ),
                ),
            itemCount: notes.length));
  }
}

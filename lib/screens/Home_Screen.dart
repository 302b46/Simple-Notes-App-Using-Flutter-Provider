// ignore: file_names
// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab8/models/notes.dart';
import 'package:lab8/models/notes_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class Home_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[600],
        appBar: AppBar(
            titleSpacing: 0.0,
            toolbarHeight: 200,
            title: Image.asset(
              "assets/note.jpeg",
              fit: BoxFit.cover,
            )),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<NotesProvider>(
                builder: (context, NotesProvider data, child) {
              return data.getNotes.length != 0
                  ? ListView.builder(
                      itemCount: data.getNotes.length,
                      itemBuilder: (context, index) {
                        return CardList(data.getNotes[index], index);
                      },
                    )
                  : GestureDetector(
                      onTap: () {
                        showAlertDialog(context);
                      },
                      child: Center(
                          child: Text("Add New Note",
                              style: TextStyle(
                                color: Colors.white,
                              ))),
                    );
            })));
    floatingActionButton:
    FloatingActionButton(
      onPressed: () {
        showAlertDialog(context);
      },
      backgroundColor: Colors.white,
      child: Icon(
        Icons.add,
        color: Colors.black,
      ),
    );
  }
}

// ignore: must_be_immutable
class CardList extends StatelessWidget {
  int index;
  final Notes notes;
  CardList(this.notes, this.index);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ListTile(
              leading: Icon(Icons.note),
              title: Text(
                notes.title,
              ),
              subtitle: Text(notes.description),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  print("Note Deleted.");
                  Provider.of<NotesProvider>(context, listen: false)
                      .removeNote(index);
                },
              ),
            )));
  }
}

showAlertDialog(BuildContext context) {
  TextEditingController _Title = TextEditingController();
  TextEditingController _Description = TextEditingController();
  // Create button
  Widget okButton = TextButton(
    child: Text("ADD NOTE"),
    onPressed: () {
      context.read<NotesProvider>().addNote(_Title.text, _Description.text);
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("ADD A NEW NOTE "),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _Title,
          decoration: InputDecoration(hintText: "Enter Title"),
        ),
        TextField(
          controller: _Description,
          decoration: InputDecoration(hintText: "Enter Description"),
        ),
      ],
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

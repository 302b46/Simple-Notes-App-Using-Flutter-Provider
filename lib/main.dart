import 'package:flutter/material.dart';
import 'package:lab8/models/notes_provider.dart';
import '/screens/Home_Screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: MaterialApp(title: 'Provider Demo', home: Home_Screen()),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'notes.dart';

class NotesProvider extends ChangeNotifier {
  List<Notes> _notes = <Notes>[];

  List<Notes> get getNotes {
    return _notes;
  }

  // Add data to list of notes
  void addNote(String title, String description) {
    Notes note = new Notes(title, description);
    _notes.add(note);

    notifyListeners(); //To update UI
  }

// Remove/delete notes by using list index position
  void removeNote(int index) {
    _notes.removeAt(index);
    notifyListeners();
  }
}

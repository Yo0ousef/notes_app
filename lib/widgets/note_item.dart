import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_notes_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return EditNoteView(note: note,);
        }));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                note.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                child: Text(
                  note.content,
                  style: TextStyle(
                    color: Colors.black.withOpacity(.4),
                    fontSize: 18,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: Icon(
                  FontAwesomeIcons.trash,
                  size: 24,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              note.date,
              style: TextStyle(
                color: Colors.black.withOpacity(.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

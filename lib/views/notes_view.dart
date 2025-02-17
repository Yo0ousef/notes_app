import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  static String id = 'notesView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.black,
        shape: CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const AddNoteBottomSheet();
            },
            isScrollControlled: true,
          );
        },
        child: Icon(Icons.add),
      ),
      body: NotesViewBody(),
    );
  }
}

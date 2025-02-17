import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_list_view.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/edit_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title , content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onTap: (){
              Navigator.pop(context);
              widget.note.title = title ??widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();

            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          SizedBox(
            height: 50,
          ),
          CustomTextField(
            onChanged: (value){
              title= value ;
            },
            hintText:widget.note.title,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (value){
              content= value ;
            },
            hintText: widget.note.content,
            maxLines: 5,
          ),
          SizedBox(
            height: 16,
          ),
          EditColorsListView(note:widget.note,),
        ],
      ),
    );
  }
}

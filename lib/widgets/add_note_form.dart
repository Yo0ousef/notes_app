import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_list_view.dart';
import 'package:notes_app/widgets/cusotm_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, content;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hintText: 'Title',
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              content = value;
            },
            hintText: 'Content',
            maxLines: 5,
          ),
          SizedBox(
            height: 40,
          ),
          ColorListView(),
          SizedBox(
            height: 40,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                buttonTitle: 'Add',
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  addNoteFunction(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void addNoteFunction(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      String formattedDate =
          '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
      NoteModel note = NoteModel(
        title: title!,
        content: content!,
        date: formattedDate,
        color: Colors.lightBlueAccent.value,
      );
      BlocProvider.of<AddNoteCubit>(context).addNote(note);
    } else {
      autoValidateMode = AutovalidateMode.always;
    }
    setState(() {});
  }
}

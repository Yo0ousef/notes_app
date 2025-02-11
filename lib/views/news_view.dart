import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_view_body.dart';


class NewsView extends StatelessWidget {
  const NewsView({super.key});
  static String id = 'newsview';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NotesViewBody() ,
    );
  }
}


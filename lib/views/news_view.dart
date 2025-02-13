import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  static String id = 'newsview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
       backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.black,
        shape: CircleBorder(),
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: NotesViewBody(),
    );
  }
}

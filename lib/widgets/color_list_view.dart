import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorCircle extends StatelessWidget {
  const ColorCircle({super.key, required this.isActive, required this.color});

  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
      radius: 29,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 26,
        backgroundColor: color,
      ),
    )
        : CircleAvatar(
      radius: 29,
      backgroundColor: color,
    );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  bool isActive = false;
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: (){
                BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
                currentIndex = index;
                setState(() {
                });
              },
              child: ColorCircle(
                isActive: currentIndex == index,
                color: kColors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

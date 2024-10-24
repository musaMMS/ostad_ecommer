import 'package:flutter/material.dart';

class ColorPiciker extends StatefulWidget {
  const ColorPiciker({super.key, required this.colors, required this.onColorSelected});
  final List<Color>colors;
  final Function (Color)onColorSelected;
  @override
  State<ColorPiciker> createState() => _ColorPicikerState();
}

class _ColorPicikerState extends State<ColorPiciker> {
  late Color _selectedColor = widget.colors.first;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color',style: Theme.of(context).textTheme.titleMedium,),
        SizedBox(height: 8,),
        Wrap(
          spacing: 8,
          children:widget.colors.map((item){
            return GestureDetector(
              onTap: (){
                _selectedColor =item;
                widget.onColorSelected(item);
                setState(() {


                });
              },
              child: CircleAvatar(
                backgroundColor: item,
                radius: 16,
                child: _selectedColor== item ?Icon(Icons.check,
                  color: Colors.white,
                ):null,
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
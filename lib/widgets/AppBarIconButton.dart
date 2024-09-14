import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({super.key,
    required this.onTap,
    required this.iconData

  });
  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 16,
        backgroundColor:Colors.grey[200],
        child: Icon(
          iconData,
          size: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}

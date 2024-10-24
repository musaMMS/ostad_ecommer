import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.onTap, required this.title,
  });
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight:FontWeight.w600) ,
        ),
        TextButton(onPressed: onTap,
            child: Text('See all',)),
      ],
    );
  }
}
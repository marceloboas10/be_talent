import 'package:flutter/material.dart';
import 'package:teste_be_talent/app/ui/styles/text_styles.dart';

class TableRowWidget extends StatelessWidget {
  const TableRowWidget({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
          ),
          child: Text(title, style: TextStyles.instance.healding2),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(value, style: TextStyles.instance.healding3),
        ),
      ],
    );
  }
}

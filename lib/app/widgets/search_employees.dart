import 'package:flutter/material.dart';
import 'package:teste_be_talent/app/ui/styles/colors_app.dart';
import 'package:teste_be_talent/app/ui/styles/text_styles.dart';

class SearchEmployees extends StatelessWidget {
  const SearchEmployees({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
      child: SearchBar(
        backgroundColor: WidgetStatePropertyAll(ColorsApp.instance.gray5),
        constraints: const BoxConstraints(minHeight: 48),
        leading: Icon(
          Icons.search,
          color: ColorsApp.instance.black,
        ),
        hintText: 'Pesquisar',
        hintStyle: WidgetStatePropertyAll(TextStyles.instance.healding3),
      ),
    );
  }
}

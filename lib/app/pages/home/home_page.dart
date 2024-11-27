import 'package:flutter/material.dart';
import 'package:teste_be_talent/app/ui/styles/colors_app.dart';
import 'package:teste_be_talent/app/ui/styles/text_styles.dart';
import 'package:teste_be_talent/app/widgets/table_header.dart';
import 'package:teste_be_talent/app/widgets/table_row_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.instance.white,
      body: SafeArea(
        child: Column(children: [
          TableHeader(),
          Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            height: 570,
            decoration: BoxDecoration(
              border: Border.fromBorderSide(
                  BorderSide(color: ColorsApp.instance.gray10)),
            ),
            child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    backgroundColor: ColorsApp.instance.white,
                    title: Text(
                      'Marcelo Vilas Boas',
                      style: TextStyles.instance.healding3,
                    ),
                    leading: const Icon(Icons.person),
                    children: const [
                      Column(
                        children: [
                          TableRowWidget(title: 'Cargo', value: 'Front-end'),
                          TableRowWidget(
                              title: 'Data de admissão', value: '00/00/0000'),
                          TableRowWidget(
                              title: 'Telefone', value: '+55 (55) 55555-555'),
                        ],
                      )
                    ],
                  );
                }),
          ),
        ]),
      ),
    );
  }
}

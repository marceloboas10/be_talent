import 'package:flutter/material.dart';
import 'package:teste_be_talent/app/ui/styles/colors_app.dart';
import 'package:teste_be_talent/app/ui/styles/text_styles.dart';
import 'package:teste_be_talent/app/widgets/table_row_widget.dart';

class TableEmployees extends StatefulWidget {
  const TableEmployees({super.key});

  @override
  State<TableEmployees> createState() => _TableEmployeesState();
}

class _TableEmployeesState extends State<TableEmployees> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8),
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        border:
            Border.fromBorderSide(BorderSide(color: ColorsApp.instance.gray10)),
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
                ),
              ],
            );
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:teste_be_talent/app/ui/styles/colors_app.dart';
import 'package:teste_be_talent/app/ui/styles/text_styles.dart';

class TableHeader extends StatelessWidget {

  const TableHeader({ super.key });

   @override
   Widget build(BuildContext context) {
       return Container(
            margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
            height: 57,
            decoration: BoxDecoration(
                color: ColorsApp.instance.blue10,
                border: Border.all(color: ColorsApp.instance.gray10),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 40),
                child: Text(
                  'Foto',
                  style: TextStyles.instance.healding2,
                ),
              ),
              Text(
                'Nome',
                style: TextStyles.instance.healding2,
              ),
              const SizedBox(width: 212),
              Icon(
                Icons.circle,
                size: 8,
                color: ColorsApp.instance.black,
              )
            ]),
          );
  }
}
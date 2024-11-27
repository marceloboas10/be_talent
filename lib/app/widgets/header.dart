import 'package:flutter/material.dart';
import 'package:teste_be_talent/app/ui/styles/colors_app.dart';
import 'package:teste_be_talent/app/ui/styles/text_styles.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: ColorsApp.instance.gray5,
                child: Text(
                  'CG',
                  style: TextStyles.instance.healding3,
                ),
              ),
              const Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/bell-notification.png',
                        height: 37,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 26,
                    bottom: 22,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: ColorsApp.instance.bluePrimary,
                      ),
                      constraints:
                          const BoxConstraints(minHeight: 20, minWidth: 20),
                      child: const Text(
                        '02',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 22,
          ),
          Text(
            'Funcionário',
            style: TextStyles.instance.healding1,
          )
        ],
      ),
    );
  }
}

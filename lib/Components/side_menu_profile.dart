
import 'package:financial_literacy/Components/info_card.dart';
import 'package:flutter/material.dart';

class SideMenuProfile extends StatelessWidget {
  const SideMenuProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      height: double.infinity,
      color: Colors.green,
      child: const SafeArea(
        child: Column(
          children: [
            InfoCard(name: "wiwiwi", email: "Info@eee.ru",)
          ],
        ),
      ),
    );
  }
}

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
      child:  SafeArea(
        child: Column(
          children: [
            const InfoCard(name: "wiwiwi", email: "Info@eee.ru",),
            SizedBox(
              height: 600,
              child: ListView.separated(
                itemCount: 15,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context,i)=> ListTile(
                  title: const Text("zzzz"),
                  trailing: const Icon(Icons.arrow_forward_ios,color: Color.fromARGB(255, 255, 255, 255),),
                  onTap: () {
                   
                  },
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
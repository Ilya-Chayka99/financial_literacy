
import 'package:financial_literacy/Components/info_card.dart';
import 'package:financial_literacy/GetX/Controllers/controller.dart';
import 'package:financial_literacy/Screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SideMenuProfile extends StatelessWidget {
  const SideMenuProfile({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff17203a), Color(0xff1e2962)],
          stops: [0.25, 0.75],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      ),
      child:  SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            InfoCard(name: ControllerGet.to.user.value.name, email: ControllerGet.to.user.value.email, img: 'http://89.111.131.40:8080/api/image/image/${ControllerGet.to.user.value.image}',),
            SizedBox(
              height: 200,
              child: ListView.separated(
                itemCount: 1,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context,i)=> ListTile(
                  title: const Text("Выход",style: TextStyle(color: Colors.white),),
                  trailing: const Icon(Icons.arrow_forward_ios,color: Color.fromARGB(255, 255, 255, 255),),
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool("login", false);
                    Get.off(const Onboarding());
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


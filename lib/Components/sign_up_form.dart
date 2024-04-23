
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final passController = TextEditingController();

  bool isShowLoading = false;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller = StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Email",style: GoogleFonts.russoOne(
                textStyle: const TextStyle(color: Colors.black54,)
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  controller: loginController,
                  validator: (value) {
                    {
                      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                      final regex = RegExp(pattern);
                      return value!.isEmpty || !regex.hasMatch(value)
                          ? 'Неправильный адресс электронной почты'
                          : null;
                    }
                  },
                  onSaved: (email) {},
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white, 
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset("lib/Assets/icons/email.svg"),
                    ),
                  ),
                ),
              ),
              Text("Пароль",style: GoogleFonts.russoOne(
                textStyle: const TextStyle(color: Colors.black54,)
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  controller: passController,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Обязательное поле";
                    }
                    return null;
                  },
                  onSaved: (password) {},
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset("lib/Assets/icons/password.svg"),
                    ),
                  ),
                ),
              ),
              Text("Повтор пароля",style: GoogleFonts.russoOne(
                textStyle: const TextStyle(color: Colors.black54,)
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  validator: (value) {
                    if(value!.isEmpty || value != passController.text){
                      return "Пароли должны совпадать";
                    }
                    return null;
                  },
                  onSaved: (password) {},
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset("lib/Assets/icons/password.svg"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 24),
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      isShowLoading = true;
                    });
                    
                    Future.delayed(const Duration(seconds: 1),
                    () {
                       if(_formkey.currentState!.validate()){
                          check.fire();
                        } else {
                          error.fire();
                        }
                        Future.delayed(const Duration(seconds: 2),
                          () {
                            setState(() {
                              isShowLoading = false;
                            });
                          });
                    });
                   
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF77D8E),
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)
                      )
                    )
                  ),
                  icon: const Icon(CupertinoIcons.arrow_right,color: Color.fromARGB(0, 255, 255, 255),), 
                  label: Text("Зарегистрироваться",style: GoogleFonts.russoOne(
                    textStyle: const TextStyle(color: Colors.white,)
                  ),),
                ),
              )
            ],
          )
        ),
        isShowLoading ? Positioned.fill(
          child: Column(
            children: [
              const Spacer(),
              SizedBox(
                height: 100,
                width: 100,
                child: RiveAnimation.asset("lib/Assets/RiveAssets/check.riv",
                onInit: (artboard){
                  StateMachineController controller = getRiveController(artboard);
                  check = controller.findSMI("Check") as SMITrigger;
                  error = controller.findSMI("Error") as SMITrigger;
                  reset = controller.findSMI("Reset") as SMITrigger;
                },),
              ),
              const Spacer(flex: 2,)
            ],
          )
        ) : const SizedBox()
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noize_app/common/styles/colors.dart';
import 'package:noize_app/common/styles/constants.dart';
import 'package:noize_app/common/widgets/back_button.dart';
import 'package:noize_app/common/widgets/custom_textfield1.dart';
import 'package:noize_app/utils/device_utils.dart';
import 'package:noize_app/views/screens/main_screen.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late IconData passwordIcon;
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    passwordIcon = Icons.remove_red_eye_outlined;
    obscureText = false;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = DeviceUtils.getScreenWidth(context);
    final double screenHeight = DeviceUtils.getScreenHeight(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton1(),
              Constants.whiteSpaceVertical(24),
              SizedBox(
                  width: screenWidth * 0.8,
                  child: Text(
                    "Sign in to your account",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: Constants.big,
                        fontWeight: FontWeight.w900),
                  )),
              Constants.whiteSpaceVertical(24),
              CustomTextfield1(
                hint: "Email address",
                hintStyle:
                    TextStyle(color: Theme.of(context).colorScheme.primary),
                width: 90,
                pixelHeight: 54,
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              Constants.whiteSpaceVertical(16),
              //Password textfield
              CustomTextfield1(
                hint: "Password",
                hintStyle:
                    TextStyle(color: Theme.of(context).colorScheme.primary),
                width: 90,
                pixelHeight: 54,
                obscureText: obscureText,
                alwaysShowSuffixIcon: true,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        if (passwordIcon == Icons.remove_red_eye_outlined) {
                          passwordIcon = Icons.lock;
                          obscureText = true;
                        } else if (passwordIcon == Icons.lock) {
                          passwordIcon = Icons.remove_red_eye_outlined;
                          obscureText = false;
                        }
                      });
                    },
                    icon: Icon(
                      passwordIcon,
                      color: Theme.of(context).colorScheme.primary,
                    )),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Constants.whiteSpaceVertical(8),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: Constants.extraSmall),
                    ),
                  )),

              Constants.whiteSpaceVertical(12),

              MaterialButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));}, color: NoizeColors.ultraMarine, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)), minWidth: screenWidth * 0.9, height: 48, child: Text("Sign in", style: TextStyle(color: NoizeColors.white),),),

              Constants.whiteSpaceVertical(24),

              Row(
                children: [
                Expanded(child: Divider(height: 1, color: NoizeColors.gray.withAlpha(150),)),
                Constants.wrapInPadding(Text("OR", style: TextStyle(color: Theme.of(context).colorScheme.primary)), left: 8, right: 8,),
                Expanded(child: Divider(height: 1, color: NoizeColors.gray.withAlpha(150),)),
              ],),

              Constants.whiteSpaceVertical(24),

              MaterialButton(onPressed: (){}, minWidth: screenWidth * 0.9, color: NoizeColors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25), side: BorderSide(color: NoizeColors.ultraMarine, width: 1)), height: 48, child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                SvgPicture.asset("assets/noize/google.svg", width: 24, height: 24,),
                Expanded(child: Center(child: Text("Continue with Google", style: TextStyle(color: NoizeColors.ultraMarine, fontWeight: FontWeight.bold),),))
              ],), ),

              Constants.whiteSpaceVertical(14),

              MaterialButton(onPressed: (){}, minWidth: screenWidth * 0.9, color: NoizeColors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25), side: BorderSide(color: NoizeColors.ultraMarine, width: 1)), height: 48, child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                SvgPicture.asset("assets/noize/facebook.svg", width: 24, height: 24,),
                Expanded(child: Center(child: Text("Continue with Facebook", style: TextStyle(color: NoizeColors.ultraMarine, fontWeight: FontWeight.bold),),))
              ],), ),

              Constants.whiteSpaceVertical(12),
              
              RichText(textAlign: TextAlign.center,
                text: TextSpan(children: [
                const TextSpan(text: "By creating account or signing in, you have read and agreed to "),
                TextSpan(text: "Privacy Policy", style: TextStyle(color: NoizeColors.ultraMarine)),
                const TextSpan(text: " and "),
                TextSpan(text: "Terms of Service.", style: TextStyle(color: NoizeColors.ultraMarine)),
              ], style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold))),

              Constants.whiteSpaceVertical(36),

              const Center(child: Text("Don't have an account?"),),

              Center(child: RichText(text: TextSpan(text: "Sign up now", style: TextStyle(color: NoizeColors.ultraMarine, fontWeight: FontWeight.bold, fontSize: Constants.smallPlus2)),),),
              
            ],
          ),
        ),
      ),
    );
  }
}

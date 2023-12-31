import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/elements/myText.dart';
import 'package:portfolio/view/screens/loginScreen/Providers/loginProvider.dart';
import 'package:portfolio/view/screens/loginScreen/elements/customButton.dart';
import 'package:portfolio/view/screens/loginScreen/elements/textField.dart';
import 'package:portfolio/view/services/authService.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    print('Build');
//<----------------------------- Provider ------------------------------------------->\\
    final logprovider = Provider.of<LoginProvider>(context,
        listen:
            false); //  now we can use logprovider to access loginprovider variable and functions
    return Scaffold(
      body: LayoutBuilder(builder: ((context, Constraints) {
        return SingleChildScrollView(
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.only(
                  top: Constraints.maxHeight * 0.065,
                  left: Constraints.maxWidth * 0.034,
                  right: Constraints.maxWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                      text: 'Login',
                      fontSize: 64,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                  MyTextField(
                    obscureText: false,
                    text: 'Username',
                    controller: logprovider.usernameCOntroller,
                    left: Constraints.maxWidth * 0.032,
                    right: Constraints.maxWidth * 0.032,
                    top: Constraints.maxHeight * 0.135,
                  ),
//<-------------------------------------Added Consumer to access Provider------------------------------------------\\
                  Consumer<LoginProvider>(builder: (context, Snapshot, child) {
                    return MyTextField(
                      suffixIcon: GestureDetector(
                          //------------------------------------------------------> Button obsecure Icon
                          onTap: () {
                            Snapshot.eyeButtonSwitch();
                          },
                          child: Snapshot.obsecureText
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility)),
                      obscureText: Snapshot.obsecureText,
                      text: 'Password',
                      controller: logprovider.passController,
                      left: Constraints.maxWidth * 0.032,
                      right: Constraints.maxWidth * 0.032,
                      top: Constraints.maxHeight * 0.06,
                    );
                  }),
//----------------------------------------------------------------------------------------->\\
                  Padding(
                      padding: EdgeInsets.only(
                          top: Constraints.maxHeight * 0.035,
                          left: Constraints.maxWidth * 0.5),
                      child: GestureDetector(
                        //------------------------------------------------------->Button Forgot Pass
                        onTap: () {
                          logprovider.toForgotPassPage(context);
                        },
                        child: MyText(
                          text: 'Forgot Password?',
                          fontSize: 20,
                          color: Color(0xff7e7e7e),
                          fontWeight: FontWeight.normal,
                        ),
                      )),
                  MyButton(
                    myText: 'Login',
                    //----------------------------------------------------------->Button Login
                    ontap: () {
                      logprovider.signIn(context);
                    },
                    left: Constraints.maxWidth * 0.03,
                    top: Constraints.maxHeight * 0.018,
                    bottom: Constraints.maxHeight * 0.03,
                    height: Constraints.maxHeight * 0.077,
                    width: Constraints.maxWidth * 0.86,
                  ),
                  Center(
                    child: MyText(
                      fontWeight: FontWeight.normal,
                      text: 'or continue with',
                      fontSize: 24,
                      color: Color(0xff7e7e7e),
                    ),
                  ),
                  SizedBox(
                    height: Constraints.maxHeight * 0.03,
                  ),
                  Center(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      //--------------------------------------------------------->Button Google Signin
                      onTap: () async {
                        AuthService().signInWithGoogle();
                      },
                      child: Image.asset(
                        'lib/assets/icons/google.png',
                        height: Constraints.maxHeight * 0.08,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: Constraints.maxHeight * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                            text: 'Don\'t have an account?',
                            color: Color(0xFF7e7e7e),
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                        InkWell(
                          //----------------------------------------------------->Button SignUp
                          onTap: () {
                            logprovider.toSignupPage(context);
                          },
                          child: MyText(
                              text: ' Signup',
                              color: Color(0xff03b44a),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      })),
    );
  }
}

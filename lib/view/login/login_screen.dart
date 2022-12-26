import 'package:flutter/material.dart';
import 'package:tech_media/res/color.dart';
import 'package:tech_media/res/components/InputTextField.dart';
import 'package:tech_media/res/components/RoundButton.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/utils/utils.dart';

import '../../utils/routes/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> obsecureText = ValueNotifier<bool>(true);
  final _formKey = GlobalKey<FormState>();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.android_outlined,
                size: 70,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: InputTextField(
                            SuffixIcon: null,
                            myController: emailController,
                            focusNode: emailFocusNode,
                            onFieldSubmittedValue: (value) {
                              Utilities.changeFocus(
                                  context, emailFocusNode, passwordFocusNode);
                            },
                            KeyBoardType: TextInputType.emailAddress,
                            obsecureText: false,
                            hint: 'Email',
                            validator: (value) {
                              if (emailController.text.isEmpty) {
                                return 'Email Cannot be Empty';
                              } else if (emailController.text.length < 6) {
                                return 'Please enter a valid email address';
                              }
                            },
                            label: 'Email',
                          )),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ValueListenableBuilder(
                            valueListenable: obsecureText,
                            builder: (context, value, child) {
                              return InputTextField(
                                  myController: passwordController,
                                  SuffixIcon: InkWell(
                                    onTap: () {
                                      obsecureText.value = !obsecureText.value;
                                    },
                                    child: obsecureText.value == true
                                        ? const Icon(
                                            Icons.visibility_off,
                                          )
                                        : const Icon(Icons.visibility),
                                  ),
                                  focusNode: passwordFocusNode,
                                  onFieldSubmittedValue: (value) {},
                                  validator: (value) {
                                    if (passwordController.text.isEmpty) {
                                      return 'Password Cannot be Empty';
                                    } else if (passwordController.text.length <
                                        6) {
                                      return 'Password Length must be greater than 6';
                                    }
                                  },
                                  KeyBoardType: TextInputType.text,
                                  hint: 'Password',
                                  obsecureText: obsecureText.value,
                                  label: 'Password');
                            }),
                      ),
                    ],
                  )),
              const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ),
              RoundButton(
                  loading: false,
                  title: 'Login',
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      
                    }
                  }),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.SignUpScreen);
                },
                child: Text.rich(TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 15),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize: 15,
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline),
                      )
                    ])),
              )
            ]),
      ),
    );
  }
}

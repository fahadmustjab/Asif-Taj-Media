import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_media/res/color.dart';
import 'package:tech_media/res/components/InputTextField.dart';
import 'package:tech_media/res/components/RoundButton.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/utils/utils.dart';
import 'package:tech_media/view/view_model/services/signup/SignUpController.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  ValueNotifier<bool> obsecureText = ValueNotifier<bool>(true);
  final _signUpformKey = GlobalKey<FormState>();
  FocusNode emailFocusNode = FocusNode();
  FocusNode userNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  final usernameController = TextEditingController();

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
          body: ChangeNotifierProvider(
              create: (_) => SignUpController(),
              child: Consumer<SignUpController>(
                builder: (context, provider, child) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.android_outlined,
                              size: 70,
                            ),
                            Form(
                                key: _signUpformKey,
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: InputTextField(
                                          SuffixIcon: null,
                                          myController: usernameController,
                                          focusNode: userNode,
                                          onFieldSubmittedValue: (value) {
                                            Utilities.changeFocus(context,
                                                userNode, emailFocusNode);
                                          },
                                          KeyBoardType:
                                              TextInputType.emailAddress,
                                          obsecureText: false,
                                          hint: 'Username',
                                          validator: (value) {
                                            if (usernameController
                                                .text.isEmpty) {
                                              return 'Username Cannot be Empty';
                                            } else if (usernameController
                                                    .text.length <
                                                2) {
                                              return 'Please enter a valid Username';
                                            }
                                          },
                                          label: 'Username',
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: InputTextField(
                                          SuffixIcon: null,
                                          myController: emailController,
                                          focusNode: emailFocusNode,
                                          onFieldSubmittedValue: (value) {
                                            Utilities.changeFocus(
                                                context,
                                                emailFocusNode,
                                                passwordFocusNode);
                                          },
                                          KeyBoardType:
                                              TextInputType.emailAddress,
                                          obsecureText: false,
                                          hint: 'Email',
                                          validator: (value) {
                                            if (emailController.text.isEmpty) {
                                              return 'Email Cannot be Empty';
                                            } else if (emailController
                                                    .text.length <
                                                6) {
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
                                                myController:
                                                    passwordController,
                                                SuffixIcon: InkWell(
                                                  onTap: () {
                                                    obsecureText.value =
                                                        !obsecureText.value;
                                                  },
                                                  child: obsecureText.value ==
                                                          true
                                                      ? const Icon(
                                                          Icons.visibility_off,
                                                        )
                                                      : const Icon(
                                                          Icons.visibility),
                                                ),
                                                focusNode: passwordFocusNode,
                                                onFieldSubmittedValue:
                                                    (value) {},
                                                validator: (value) {
                                                  if (passwordController
                                                      .text.isEmpty) {
                                                    return 'Password Cannot be Empty';
                                                  } else if (passwordController
                                                          .text.length <
                                                      6) {
                                                    return 'Password Length must be greater than 6';
                                                  }
                                                },
                                                KeyBoardType:
                                                    TextInputType.text,
                                                hint: 'Password',
                                                obsecureText:
                                                    obsecureText.value,
                                                label: 'Password');
                                          }),
                                    ),
                                  ],
                                )),
                            RoundButton(
                                loading: provider.loading,
                                title: 'Sign Up',
                                onPress: () {
                                  if (_signUpformKey.currentState!.validate()) {
                                    provider.signup(
                                        usernameController.text,
                                        emailController.text,
                                        passwordController.text);
                                  }
                                }),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteName.loginScreen);
                              },
                              child: Text.rich(TextSpan(
                                  text: "Already have an account? ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(fontSize: 15),
                                  children: [
                                    TextSpan(
                                      text: 'Login',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                              fontSize: 15,
                                              color: AppColors.primaryColor,
                                              decoration:
                                                  TextDecoration.underline),
                                    )
                                  ])),
                            )
                          ]),
                    ),
                  );
                },
              ))),
    );
  }
}

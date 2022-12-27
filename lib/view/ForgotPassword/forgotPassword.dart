import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_media/res/color.dart';
import 'package:tech_media/res/components/InputTextField.dart';
import 'package:tech_media/res/components/RoundButton.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/utils/utils.dart';
import 'package:tech_media/view/view_model/Login/ForgotPasswordController.dart';
import 'package:tech_media/view/view_model/Login/LoginController.dart';

import '../../utils/routes/routes.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  ValueNotifier<bool> obsecureText = ValueNotifier<bool>(true);
  final _formKey = GlobalKey<FormState>();
  FocusNode emailFocusNode = FocusNode();

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: ChangeNotifierProvider(
              create: (_) => ForgotPasswordController(),
              child: Consumer<ForgotPasswordController>(
                builder: (context, provider, child) {
                  return SingleChildScrollView(
                    child: Column(
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
                                        onFieldSubmittedValue: (value) {},
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
                                ],
                              )),
                          RoundButton(
                              loading: provider.loading,
                              title: 'Recover',
                              onPress: () {
                                provider.recover(
                                  context,
                                  emailController.text.toString(),
                                );
                              }),
                        ]),
                  );
                },
              ),
            )),
      ),
    );
  }
}

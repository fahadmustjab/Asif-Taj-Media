// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tech_media/res/color.dart';

import 'package:tech_media/utils/utils.dart';

class InputTextField extends StatelessWidget {
  const InputTextField(
      {Key? key,
      required this.myController,
      required this.focusNode,
      required this.onFieldSubmittedValue,
      required this.validator,
      required this.KeyBoardType,
      required this.hint,
      required this.obsecureText,
      this.autoFocus = false,
      required this.label,
      required this.SuffixIcon,
      this.enable = true})
      : super(key: key);

  final TextEditingController myController;
  final FocusNode focusNode;
  final FormFieldSetter onFieldSubmittedValue;
  final FormFieldValidator validator;
  final String label;

  final TextInputType KeyBoardType;
  final String hint;
  final bool obsecureText;
  final bool enable, autoFocus;
  final InkWell? SuffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmittedValue,
      validator: validator,
      keyboardType: KeyBoardType,
      obscureText: obsecureText,
      decoration: InputDecoration(
        suffixIcon: SuffixIcon,
        labelText: label,
        hintText: hint,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: AppColors.primaryTextTextColor.withOpacity(0.8)),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(color: AppColors.textFieldDefaultFocus),
        //   borderRadius: BorderRadius.circular(16.0),
        // ),
        // enabled: true,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.alertColor),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.secondaryColor),
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.textFieldDefaultBorderColor),
          borderRadius: BorderRadius.circular(16.0),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.textFieldDefaultFocus),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}

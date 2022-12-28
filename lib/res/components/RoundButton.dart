import 'package:flutter/material.dart';
import 'package:tech_media/res/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  final textColor;
  const RoundButton({
    Key? key,
    required this.title,
    this.loading = false,
    this.textColor = AppColors.whiteColor,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: loading == true ? null : onPress,
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.height * 0.70,
          decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: loading == true
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : Center(
                  child: Text(
                    title,
                    style: TextStyle(color: textColor),
                  ),
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
   FormButton({
    super.key,
    required this.disabled,
    this.FormButtonText='Next',
  });
  final bool disabled;
  final String FormButtonText;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size5),
          color:
              disabled ? Colors.grey.shade300 : Theme.of(context).primaryColor,
        ),
        duration: const Duration(milliseconds: 200),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          //style=애니메이션 만들고 싶은 대상.
          style: TextStyle(
            color: disabled ? Colors.grey.shade400 : Colors.white,
            fontWeight: FontWeight.w600,
          ),
          
          child:  Text(
            FormButtonText,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

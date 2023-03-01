import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

class interestButton extends StatefulWidget {
  const interestButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  State<interestButton> createState() => _interestButtonState();
}

class _interestButtonState extends State<interestButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
          horizontal: Sizes.size24,
        ),
        decoration: BoxDecoration(
            color: _isSelected ? Theme.of(context).primaryColor : isDarkMode(context) ? Colors.grey.shade700 : Colors.white,
            borderRadius: BorderRadius.circular(
              Sizes.size32,
            ),
            border: Border.all(color: Colors.black.withOpacity(0.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                spreadRadius: 5,
              )
            ]),
        duration: Duration(milliseconds: 200),
        child: Text(
          widget.interest,
          style:  TextStyle(
            fontWeight: FontWeight.bold,
            color: _isSelected ? Colors.white : Colors.black87),
        ),
      ),
    );
  }
}

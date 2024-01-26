import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool hasPrefixIcon;
  final bool hasSuffixIcon;
   final  IconData prefixIcon;
    final IconData suffixIcon;

  CustomTextField({
    required this.controller,
    required this.hintText,
    this.hasPrefixIcon = false,
    this.hasSuffixIcon = false,
      this.prefixIcon = Icons.person,
      this.suffixIcon = Icons.person,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
        ),
        prefixIcon: hasPrefixIcon ?  Icon(prefixIcon) : null,
        suffixIcon: hasSuffixIcon ? Icon(suffixIcon) : null,
      ),
    );
  }
}
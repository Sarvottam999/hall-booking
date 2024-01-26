import 'package:flutter/material.dart';
import 'package:oyo/constant/constant.dart';

enum ButtonType {
  Filled,
  Outline,
}

class CustomButton extends StatelessWidget {
  final ButtonType type;
  final VoidCallback onPressed;
  final String text;
  final IconData icon;

  CustomButton({
    required this.type, 
    required this.onPressed, 
     required this.icon,
    required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        height: 48,
        // width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: type == ButtonType.Filled ? pink : Color.fromARGB(255, 255, 255, 255),
          border: type == ButtonType.Outline
              ? Border.all(color: pink, width: 2.0)
              : null,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 2,
          //     blurRadius: 10,
          //     offset: Offset(0, 3),
          //   ),
          // ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(icon),
              iconSize: 22.0,
              color:type ==ButtonType.Filled ? Colors.white: Colors.pink,
              onPressed: () {
                print(text, );
              },
            ),
            Text(
              text,
              style: TextStyle(
              color:type ==ButtonType.Filled ? Colors.white: Colors.pink,
      
                 fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 
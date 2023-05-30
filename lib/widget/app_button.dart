import 'package:flutter/material.dart';

class ApppButton extends StatelessWidget {
  const ApppButton({
    super.key, 
    required this.color, 
    required this.background, 
    required this.size, 
    required this.borderColor,
    this.text="Hi",
    this.icon,
    this.isIcon=false
  });
  final Color color;
  final Color background;
  final double size;
  final Color borderColor;
  final String? text;
  final IconData? icon;
  final bool? isIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size, 
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1
        ),
        borderRadius: BorderRadius.circular(15),
        color: background
      ),
      child: isIcon==false?Center(
        child: Text(
          text!,
          style: TextStyle(
            fontSize: 16,
            color: color
          ),
        ),
      ): Icon(icon, color: Colors.red,),
    );
  }
}
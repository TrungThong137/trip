import 'package:flutter/material.dart';

class ReponsiveButton extends StatelessWidget {
  final bool? isReponsive;
  final double? width;
  final String? text;
  const ReponsiveButton({
    super.key, 
    this.isReponsive=false,
    this.width=120,
    this.text
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width:isReponsive==true?double.maxFinite: width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue
        ),
        child: Row(
          mainAxisAlignment:isReponsive==true?MainAxisAlignment.spaceBetween: MainAxisAlignment.end,
          children: [
            isReponsive==true? Container(
              margin: const EdgeInsets.only(left: 20, ),
              child: const Text(
                "Book trip now",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ):Container(),
            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyxbRanY6HzPu0u1ZrxbfUpinmTmKnc_Wyye2lo_YVINikF2c7UNnGm6jCJfSZ17z3FxA&usqp=CAU',
              width: 40,
            )
          ],
        ),
      ),
    );
  }
}
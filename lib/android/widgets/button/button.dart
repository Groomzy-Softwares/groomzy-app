import 'package:flutter/material.dart';

class AndroidButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final double iconSize;
  final Function pressed;
  final Color backgroundColor;
  final Color color;
  final double fontSize;

  const AndroidButton({
    this.label,
    this.icon,
    this.iconSize = 24,
    this.pressed,
    this.backgroundColor = Colors.lightBlue,
    this.color = Colors.white,
    this.fontSize = 20.0,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      child: TextButton(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: color,
                size: iconSize,
              ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              label,
              style: TextStyle(color: color, fontSize: fontSize),
            )
          ],
        ),
        onPressed: pressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
      ),
    );
  }
}

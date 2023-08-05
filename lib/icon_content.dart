import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onpress});
  final IconData icon;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: onpress,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      child: Icon(icon
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff8D8E98),


    );
  }
}

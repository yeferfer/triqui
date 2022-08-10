import 'package:flutter/cupertino.dart';

class Marker extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color color;
  const Marker({Key? key, required this.text, required this.fontWeight,required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(text, style: TextStyle(fontSize: 35, fontWeight: fontWeight,color: color)),
    );
  }
}

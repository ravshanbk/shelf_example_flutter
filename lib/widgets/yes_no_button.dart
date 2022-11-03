import 'package:flutter/material.dart';

// ignore: must_be_immutable
class YesNoButton extends StatelessWidget {
  String titleL;
  String titleR;
  final VoidCallback callbackL;
  final VoidCallback callbackR;

  YesNoButton(
      {Key? key,
      this.titleL = "No",
      this.titleR = "Yes",
      required this.callbackL,
      required this.callbackR})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: const Color(0xff959f9f),
              fixedSize: Size(MediaQuery.of(context).size.width / 2 - 20, 100)),
          onPressed: callbackL,
          child: Text(titleL),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: const Color(0xff959f9f),
              fixedSize: Size(MediaQuery.of(context).size.width / 2 - 20, 100)),
          onPressed: callbackR,
          child: Text(titleR),
        )
      ],
    );
  }
}

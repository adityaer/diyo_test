import 'package:flutter/material.dart';

class ColorCube extends StatelessWidget {
  final int status;

  const ColorCube(this.status, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
            color: (() {
              switch (status) {
                case 0:
                  return Colors.white;
                case 1:
                  return Colors.red;
                case 2:
                  return Colors.red;
                case 3:
                  return Colors.yellow;
                case 4:
                  return Colors.blue;
                default:
                  return Colors.white;
              }
            })(),
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

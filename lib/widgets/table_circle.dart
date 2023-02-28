import 'package:flutter/material.dart';

class TableCircle extends StatefulWidget {
  final String tableName;
  final int status;

  const TableCircle({Key? key, required this.tableName, required this.status})
      : super(key: key);

  @override
  State<TableCircle> createState() => _TableCircleState();
}

class _TableCircleState extends State<TableCircle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: (() {
              switch (widget.status) {
                case 0:
                  return Colors.white;
                case 1:
                  return Colors.red;
                case 2:
                  return Colors.yellow;
                case 3:
                  return Colors.blue;
                default:
                  return Colors.white;
              }
            })(),
            shape: BoxShape.circle,
            border: Border.all(
              color: (() {
                switch (widget.status) {
                  case 0:
                    return Colors.red;
                  case 1:
                    return Colors.red;
                  case 2:
                    return Colors.yellow;
                  case 3:
                    return Colors.blue;
                  default:
                    return Colors.white;
                }
              })(), // warna garis border
              width: 2.0,
            ),
          ),
          child: Center(
            child: Text(
              widget.tableName,
              style: TextStyle(
                color: widget.status == 0 ? Colors.red : Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

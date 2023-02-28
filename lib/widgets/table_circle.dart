import 'package:diyo_test/presentation/providers/tablepage_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/entities/table_status.dart';

class TableCircle extends StatefulWidget {
  final TableStatus tableStatus;

  const TableCircle({Key? key, required this.tableStatus}) : super(key: key);

  @override
  State<TableCircle> createState() => _TableCircleState();
}

class _TableCircleState extends State<TableCircle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: GestureDetector(
        onTap: () {
          final tablePageProvider = context.read<TablePageNotifier>();
          tablePageProvider.updateTableChoose(widget.tableStatus.id);
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: (() {
              switch (widget.tableStatus.status) {
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
            shape: BoxShape.circle,
            border: Border.all(
              color: (() {
                switch (widget.tableStatus.status) {
                  case 0:
                    return Colors.red;
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
              })(), // warna garis border
              width: 2.0,
            ),
          ),
          child: Center(
            child: Text(
              widget.tableStatus.tableName ?? '',
              style: TextStyle(
                color:
                    widget.tableStatus.status == 0 ? Colors.red : Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

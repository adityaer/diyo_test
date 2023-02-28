import 'package:diyo_test/constants/string.dart';
import 'package:diyo_test/presentation/pages/table/table_add_order.dart';
import 'package:diyo_test/presentation/pages/table/table_make_order.dart';
import 'package:diyo_test/presentation/pages/table/table_print_qr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/tablepage_notifier.dart';
import '../table_current_bill.dart';
import '../table_payment.dart';

class TableStatusScreen extends StatefulWidget {
  final int id;

  const TableStatusScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<TableStatusScreen> createState() => _TableStatusScreenState();
}

class _TableStatusScreenState extends State<TableStatusScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      print('masuk microtask');
      //Provider.of<TablePageNotifier>(context, listen: false)
      //    .getSingleTableStatus(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TablePageNotifier>(builder: (context, data, child) {
      if (data.tableId != data.tableStatus?.id) {
        data.getSingleTableStatus(data.tableId);
      }
      return Column(
        children: [
          Text('Table ${data.tableStatus?.id}'),
          Row(
            children: [
              const Text('Status : '),
              Text((() {
                switch (data.rightSideScreen) {
                  //(data.tableStatus?.status) {
                  case 0:
                    return StringConstants.available;
                  case 1:
                    return StringConstants.seated;
                  case 2:
                    return StringConstants.seated;
                  case 3:
                    return StringConstants.ordered;
                  case 4:
                    return StringConstants.billing;
                  default:
                    return StringConstants.available;
                }
              })())
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(child: (() {
            switch (data.rightSideScreen) {
              //(data.tableStatus?.status) {
              case 0:
                return TablePrintQR(id: data.tableId);
              case 1:
                return TableMakeOrder(id: data.tableId);
              case 2:
                return TableAddOrder(id: data.tableId);
              case 3:
                return TableCurrentBill(id: data.tableId);
              case 4:
                return TablePayment(id: data.tableId);
              default:
                return TablePrintQR(
                  id: data.tableId,
                );
            }
          })())
        ],
      );
    });
  }
}

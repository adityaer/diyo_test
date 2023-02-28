import 'package:diyo_test/constants/string.dart';
import 'package:diyo_test/presentation/pages/table/table_add_order_screen.dart';
import 'package:diyo_test/presentation/pages/table/table_make_order_screen.dart';
import 'package:diyo_test/presentation/pages/table/table_print_qr_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/tablepage_notifier.dart';
import 'table_current_bill_screen.dart';
import 'table_payment_screen.dart';

class TableStatusScreen extends StatefulWidget {
  final int id;

  const TableStatusScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<TableStatusScreen> createState() => _TableStatusScreenState();
}

class _TableStatusScreenState extends State<TableStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TablePageNotifier>(builder: (context, data, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Text(
                '${data.tableStatus?.tableName}',
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              children: [
                Text(
                  '${StringConstants.statusText}${(() {
                    switch (data.tableStatus?.status) {
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
                  })()}',
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w400),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(child: (() {
              switch (data.tableStatus?.status) {
                case 0:
                  return TablePrintQRScreen(id: data.tableStatus?.id ?? 1);
                case 1:
                  return TableMakeOrderScreen(id: data.tableStatus?.id ?? 1);
                case 2:
                  return TableAddOrderScreen(id: data.tableStatus?.id ?? 1);
                case 3:
                  return TableCurrentBillScreen(id: data.tableStatus?.id ?? 1);
                case 4:
                  return TablePaymentScreen(id: data.tableStatus?.id ?? 1);
                default:
                  return TablePrintQRScreen(
                    id: data.tableStatus?.id ?? 1,
                  );
              }
            })())
          ],
        ),
      );
    });
  }
}

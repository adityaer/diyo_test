import 'package:diyo_test/widgets/color_cube.dart';
import 'package:flutter/material.dart';

import '../constants/string.dart';

class AvailabilityLegend extends StatelessWidget {
  final int status;

  const AvailabilityLegend({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
      child: Row(
        children: [
          SizedBox(
            width: 100,
          ),
          ColorCube(status),
          const SizedBox(
            width: 10,
          ),
          Text((() {
            switch (status) {
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
    );
  }
}

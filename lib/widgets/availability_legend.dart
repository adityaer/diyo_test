import 'package:diyo_test/widgets/color_cube.dart';
import 'package:flutter/material.dart';

class AvailabilityLegend extends StatelessWidget {
  final String status;

  const AvailabilityLegend({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ColorCube(Colors.red),
        const SizedBox(
          width: 10,
        ),
        const Text('Test')
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CalendarHeatMap extends StatelessWidget {
  final List<List<int>> data;

  const CalendarHeatMap({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          for (int i = 0; i < 24; i++)
            Expanded(
              child: Row(
                children: [
                  for (int j = 0; j < 7; j++)
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: _getColor(data[j][i]),
                          border: Border.all(color: Colors.grey),
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Color _getColor(int value) {
    // Your logic to determine the color based on the value
    switch (value) {
      case 0:
        return Colors.blueAccent; //horarios del chabon
      case 1:
        return Colors.green;
      case 2:
        return Colors.grey;
      default:
        return Colors.red;
    }
  }
}

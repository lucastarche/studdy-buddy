import 'package:flutter/material.dart';

class CalendarHeatMap extends StatelessWidget {
  final List<List<int>> data;

  const CalendarHeatMap({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.headlineSmall;
    final dias = ['LU', 'MA', 'MI', 'JU', 'VI', 'SA', 'DO'];
    var timeSlots = [];
    for (var i = 1; i <= 48; i++) {
      timeSlots.add("$i");
    }
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: dias
                .map((e) => Expanded(
                        child: Center(
                      child: Text(
                        e,
                        style: style,
                      ),
                    )))
                .toList(),
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
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
        return Colors.green; //libres los dos
      default:
        return Colors.grey; // libre alguno de los dos
    }
  }
}

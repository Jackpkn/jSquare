import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Table(
              border: TableBorder.symmetric(
                  inside: const BorderSide(width: 1, color: Colors.blue),
                  outside: const BorderSide(width: 1)),
              defaultColumnWidth: const FixedColumnWidth(150),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: const [
                TableRow(
                  children: [
                    Text(
                      'Sport',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Total Players',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Soccer', textAlign: TextAlign.center),
                    Text(
                      '11',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Soccer', textAlign: TextAlign.center),
                    Text('11', textAlign: TextAlign.center),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Soccer', textAlign: TextAlign.center),
                    Text('11', textAlign: TextAlign.center),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

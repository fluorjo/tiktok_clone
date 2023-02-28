import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('settings'),
      ),
      body: ListWheelScrollView(

        itemExtent: 200,
        children: [
          for (var x in [1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3])
            FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                color: Colors.teal,
                alignment: Alignment.center,
                child: const Text(
                  'Puuuuu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 33,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
        ),
      ),
      body: ListView(
        children: [
          Switch.adaptive(
            value: _notifications,
            onChanged: _onNotificationChanged,
          ),
          CupertinoSwitch(
            value: _notifications,
            onChanged: _onNotificationChanged,
          ),
          Switch(
            value: _notifications,
            onChanged: _onNotificationChanged,
          ),
          SwitchListTile.adaptive(
            activeColor: Colors.black,
            value: _notifications,
            onChanged: _onNotificationChanged,
            title: const Text(
              'Enable notifications',
            ),
            subtitle: const Text(
              'subtitle',
            ),
          ),
          Checkbox(
            value: _notifications,
            onChanged: _onNotificationChanged,
          ),
          CheckboxListTile(
            checkColor: Colors.white,
            activeColor: Colors.black,
            value: _notifications,
            onChanged: _onNotificationChanged,
            title: const Text(
              'Enable notifications',
            ),
          ),
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2030),
              );
              print(date);
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              final booking = await showDateRangePicker(
                context: context,
                firstDate: DateTime(1999),
                lastDate: DateTime(2030),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData(
                      appBarTheme: const AppBarTheme(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              print(booking);
            },
            title: const Text(
              'What is your birthday?',
            ),
          ),
          const AboutListTile(),
        ],
      ),
    );
  }
}

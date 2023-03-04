import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Localizations.override(
      context: context,
      locale: const Locale('ko'),
      child: Scaffold(
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
                if (kDebugMode) {
                  print(date);
                }
                if (!mounted) return;
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (kDebugMode) {
                  print(time);
                }
                if (!mounted) return;
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
                if (kDebugMode) {
                  print(booking);
                }
              },
              title: const Text(
                'What is your birthday?',
              ),
            ),
            ListTile(
                title: const Text(
                  'Log out(android)',
                ),
                textColor: Colors.red,
                onTap: () {
                  if (Platform.isAndroid) {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        icon: const FaIcon(FontAwesomeIcons.angular),
                        title: const Text(
                          'Are you sure?',
                        ),
                        content: const Text("Don't go~"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: const Text(
                          'Are you sure?',
                        ),
                        content: const Text("Don't go~"),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('No'),
                          ),
                          CupertinoDialogAction(
                            onPressed: () => Navigator.of(context).pop(),
                            isDestructiveAction: true,
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    );
                  }
                }),
            ListTile(
                title: const Text(
                  'Log out(ios)',
                ),
                textColor: Colors.red,
                onTap: () {
                  //modal 생성. 모달 밖 누르면 빠져나옴. 위에 안드로이드에도 사용 가능.
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) =>
                        //밑 부분으로 모달 팝업 뜸.
                        CupertinoActionSheet(
                      title: const Text(
                        'Are you sure?',
                      ),
                      message: const Text('메세지'),
                      actions: [
                        CupertinoActionSheetAction(
                          //글자가 좀 더 굵어짐.
                          isDefaultAction: true,
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('No'),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () => Navigator.of(context).pop(),
                          isDestructiveAction: true,
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
                  );
                }),
            const AboutListTile(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:picker_history/scr/features/history/presentation/pages/history_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Picker History',
      home: HistoryPage(),
    );
  }
}

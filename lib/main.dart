import 'package:flutter/material.dart';

import 'features/peresentaion/pages/home_screen/home.dart';


void main() {
  runApp(const TicketApp());
}

class TicketApp extends StatelessWidget {
  const TicketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ticket Master',
      home: TicketMasterHome(),
    );
  }
}

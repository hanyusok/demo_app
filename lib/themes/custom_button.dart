import 'package:flutter/material.dart';

final ButtonStyle btnPrimary = ElevatedButton.styleFrom(
    minimumSize: const Size(20, 20),
    foregroundColor: Colors.blue.shade100,
    elevation: 3.0,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4))));

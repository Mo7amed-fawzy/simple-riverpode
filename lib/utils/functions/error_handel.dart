import 'package:flutter/material.dart';

Center errorHandler(Object error, StackTrace stack) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Failed to load the user',
          style: TextStyle(color: Colors.red, fontSize: 18),
        ),
        const SizedBox(height: 10),
        Text(
          'Error: $error',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          'Stack Trace: $stack',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    ),
  );
}

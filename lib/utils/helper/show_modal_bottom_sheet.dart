import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_riverpode/utils/controller/user_controller.dart';

void showAddUserBottomSheet(BuildContext context, WidgetRef ref) {
  final nameController = TextEditingController();
  final jobController = TextEditingController();

  final AnimationStyle upAndDownAnimation = AnimationStyle(
    duration: const Duration(milliseconds: 40),
    reverseDuration: const Duration(milliseconds: 40),
  );

  showModalBottomSheet(
    context: context,
    sheetAnimationStyle: upAndDownAnimation,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Create User', style: TextStyle(fontSize: 18)),
              TextField(
                controller: nameController,
                decoration: customInputDecoration(label: 'name'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: jobController,
                decoration: customInputDecoration(label: 'job'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  final name = nameController.text;
                  final job = jobController.text;
                  await ref.read(adduserProvider.notifier).postUser(name, job);
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      );
    },
  );
}

InputDecoration customInputDecoration({required String label}) {
  return InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(color: Colors.blue),
    border: const OutlineInputBorder(),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2.0),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
    ),
  );
}

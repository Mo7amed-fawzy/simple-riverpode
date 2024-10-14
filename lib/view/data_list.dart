import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_riverpode/utils/controller/data_controller.dart';

class DataList extends ConsumerWidget {
  const DataList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(getDataFuture); // الوصول للـ provider
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch data'),
      ),
      body: viewModel.listDataModel.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: viewModel.listDataModel.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      viewModel.listDataModel[index].title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      viewModel.listDataModel[index].body,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w200),
                    ),
                    leading: Container(
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(viewModel.listDataModel[index].id.toString()),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_riverpode/controller/data_controller.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(getDataFuture);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fetch data'),
        ),
        body: viewModel.listDataMolde.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: viewModel.listDataMolde.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        viewModel.listDataMolde[index].title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        viewModel.listDataMolde[index].body,
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
                        child:
                            Text(viewModel.listDataMolde[index].id.toString()),
                      ),
                    ),
                  );
                }));
  }
}

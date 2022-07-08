import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/src/feature/cat/cubit/cat_cubit.dart';
import 'package:flutter_skeleton/src/feature/cat/cubit/cat_state.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Katzen")),
      body: BlocBuilder<CatCubit, CatState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (cats) {
              return RefreshIndicator(
                onRefresh: () {
                  return context.read<CatCubit>().loadCats();
                },
                child: ListView.builder(
                  itemCount: cats.length,
                  itemBuilder: (context, index) {
                    final cat = cats[index];

                    return ListTile(
                      title: Text("Id: ${cat.id})"),
                      trailing: Image.network(cat.imageUrl),
                    );
                  },
                ),
              );
            },
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
          return Container();
        },
      ),
    );
  }
}

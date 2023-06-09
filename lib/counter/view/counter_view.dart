import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/counter/counter.dart';
import 'package:flutter_counter/counter/cubit/counter_cubit.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CounterCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text(
              "$state",
              style: Theme.of(context).textTheme.displayLarge,
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            //key: const Key("counterView_increment_floatingActionButton"),
            child: const Icon(Icons.add),
            onPressed: () => cubit.increment(),
          ),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton(
            //key: const Key("counterView_decrement_floatingActionButton"),
            child: const Icon(Icons.remove),
            onPressed: () => cubit.decrement(),
          ),
        ],
      ),
    );
  }
}

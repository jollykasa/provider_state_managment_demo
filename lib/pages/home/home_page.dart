import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/pages/second/second_page.dart';
import 'package:provider_state_management/provider/list_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      builder: (context, numberlistProvider, child) =>
          Scaffold(
            appBar: AppBar(
              title: const Text("Provider Example"),
            ),
            body: Column(
                children:[
            Text(
            numberlistProvider.numbers.last.toString(),
            style: const TextStyle(fontSize: 20),
          ),
      Expanded(
        child: ListView.builder(
          itemCount: numberlistProvider.numbers.length,
          itemBuilder: (context, index) {
            return Text(
              numberlistProvider.numbers[index].toString(),
              style: const TextStyle(fontSize: 20),
            );
          },
        ),
      ),
      Hero(
          tag: 'second', child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SecondPage()));
        },
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.tealAccent)),
        child: const Text("Second"),
      ))
      ],
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: () {
    numberlistProvider.add();
    },
    child: const Icon(Icons.add),
    )
    ,
    )
    ,
    );
  }
}

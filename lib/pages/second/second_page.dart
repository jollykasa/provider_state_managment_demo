import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/list_provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      builder: (context, numberlistProvider, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Second Page"),
        ),
        body: Column(
          children: [
            const Hero(
                tag: 'second',
                child:
                    Text("Second Page", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
            Text(
              numberlistProvider.numbers.last.toString(),
              style: const TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 8, right: 8),
                itemCount: numberlistProvider.numbers.length,
                itemBuilder: (context, index) {
                  return Text(
                    numberlistProvider.numbers[index].toString(),
                    style: const TextStyle(fontSize: 20),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            numberlistProvider.add();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

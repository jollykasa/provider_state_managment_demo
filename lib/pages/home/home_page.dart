import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/pages/second/second_page.dart';
import 'package:provider_state_management/pages/sigin/signin_page.dart';
import 'package:provider_state_management/provider/auth_provider.dart';
import 'package:provider_state_management/provider/list_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      builder: (context, numberlistProvider, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Provider Example"),
          actions: [
            Consumer<AuthProvider>(
              builder: (context, authProvider, child) => IconButton(
                onPressed: () {
                  authProvider.signOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SigninPage()));
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>const SecondPage()));
                  },
                  child: Hero(
                    tag: 'logo',
                    child: ClipOval(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 60,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Text(
                  numberlistProvider.numbers.last.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondPage()));
              },
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.tealAccent)),
              child: const Text("Second"),
            )
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

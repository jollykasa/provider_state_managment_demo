import 'package:flutter/material.dart';
import 'package:provider_state_management/pages/home/home_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool passwordKey = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: [
          const Positioned(
              top: 100,
              left: 120,
              bottom: 10,
              child: Column(
                children: [
                  Text(
                    "WELCOME",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "To Logo",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                ],
              )),
          Positioned(
            top: 200,
            left: 20,
            right: 20,
            bottom: 20,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: Card(
                elevation: 6,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Image.asset(
                          'assets/images/logo.png',
                          width: 200,
                        ),
                        const SizedBox(height: 10),
                        const Text("Sign In",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 10),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: email,
                                decoration: const InputDecoration(
                                    labelText: 'Email',
                                    suffixIcon: Icon(Icons.person),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)))),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the Email';
                                  }
                                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                      .hasMatch(value)) {
                                    return 'Please enter a valid Email';
                                  }
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: password,
                                obscureText: passwordKey,
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                             passwordKey=!passwordKey;
                                          });
                                        },
                                        icon: passwordKey
                                            ? const Icon(Icons.visibility)
                                            : const Icon(Icons.visibility_off)),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)))),
                                validator: (value){
                                  if(value== null || value.isEmpty){
                                    return 'Please enter password';
                                  }
                                  if((value.length)!<3){
                                    return 'Password should be more than 3 digits';
                                  }
                                },
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage()));
                                    }
                                  },
                                  style: const ButtonStyle(
                                      backgroundColor:
                                          WidgetStatePropertyAll(Colors.blue)),
                                  child: const Text(
                                    "Sign In",
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

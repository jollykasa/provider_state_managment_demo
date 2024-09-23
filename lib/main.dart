import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/firebase_options.dart';
import 'package:provider_state_management/pages/sigin/signin_page.dart';
import 'package:provider_state_management/provider/list_provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NumberListProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.teal,
            centerTitle: true,
          )
        ),
        home: const SigninPage(),
      ),
    );
  }
}

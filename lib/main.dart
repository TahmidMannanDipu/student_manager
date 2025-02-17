import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:localstorage/localstorage.dart';

import 'data/providers/student_provider.dart';
import 'ui/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
  runApp(MyApp(localStorage: localStorage));
}

class MyApp extends StatelessWidget {
  final LocalStorage localStorage;
  const MyApp({super.key, required this.localStorage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StudentProvider>(
      create: (_) => StudentProvider(storage: localStorage),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student Management App',
        theme: ThemeData(
          primaryColor: Colors.green[400],
          appBarTheme: AppBarTheme(backgroundColor: Colors.green[400]),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[400],
              fixedSize:
                  Size(MediaQuery.of(context).size.width, 50), // Text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:netflix/application/downloads/downlaods_bloc.dart';
import 'package:netflix/core/di/injectable.dart';
import 'package:netflix/presantation/main%20page/widgets/screen_main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => getIt<DownlaodsBloc>(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              appBarTheme: AppBarTheme(backgroundColor: Colors.black),
              scaffoldBackgroundColor: Colors.black,
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
              textTheme: const TextTheme(
                  bodyLarge: TextStyle(color: Colors.white),
                  bodyMedium: TextStyle(color: Colors.white))),
          home: ScreenMainPage()),
    );
  }
}

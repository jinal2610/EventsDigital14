import 'package:events_digital14/helper_class/colors.dart';
import 'package:events_digital14/view/events/events_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:events_digital14/providers/api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => APIProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Digital14 Events',
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
        ),
        home: const EventsListPage(),
      ),
    );
  }
}

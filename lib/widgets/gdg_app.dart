import 'package:flutter/material.dart';
import 'package:gdg_community_app/screens/support_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/gdg_community_home.dart';

class GDGApp extends StatelessWidget {
  const GDGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: GDGCommunityHome(),
    );
  }
}

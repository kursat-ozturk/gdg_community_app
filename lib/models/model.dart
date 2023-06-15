import 'package:flutter/material.dart';

class Utils {
  static const Color mainColor = Color(0xFF0C3F9F);
  static const Color lightMainColor = Color(0xFFF2F6FF);
  static const Color secondaryColor = Color(0xFF6B9EFA);

  static String appBarIcon =
      'https://romanejaquez.github.io/hello-flutter-web/assets/gdglogo_grey.png';
  static String gdgCommunityLogoWhite =
      'https://romanejaquez.github.io/hello-flutter-web/assets/gdgcommunity_white.png';
  static String gdgCommunityLogoBlue =
      'https://romanejaquez.github.io/hello-flutter-web/assets/gdgcommunity_blue.png';
}

class TeamMember {
  String? fullName;
  String? photoUrl;
  String? title;

  TeamMember({this.fullName, this.photoUrl, this.title});

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      fullName: json['fullName'],
      photoUrl: json['photoUrl'],
      title: json['title'],
    );
  }
}

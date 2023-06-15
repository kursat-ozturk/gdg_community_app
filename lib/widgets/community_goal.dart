import 'package:flutter/material.dart';
import 'package:gdg_community_app/models/model.dart';

class GDGCommunityGoal extends StatelessWidget {
  const GDGCommunityGoal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          'Congrats!',
          style: TextStyle(color: Utils.mainColor, fontSize: 30),
        ),
        SizedBox(height: 5),
        Text(
          'We did it!',
          style: TextStyle(color: Utils.mainColor, fontSize: 50),
        ),
        SizedBox(height: 20),
        Icon(Icons.thumb_up, size: 100, color: Utils.mainColor),
      ],
    );
  }
}

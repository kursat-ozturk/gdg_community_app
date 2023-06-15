import 'package:flutter/material.dart';

import '../models/model.dart';

class TeamMemberCard extends StatelessWidget {
  final TeamMember? member;
  const TeamMemberCard({super.key, this.member});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              member!.photoUrl!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                member!.fullName!,
                style: const TextStyle(color: Utils.mainColor, fontSize: 25),
              ),
              Text(
                member!.title!,
                style: const TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

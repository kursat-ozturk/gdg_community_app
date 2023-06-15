import 'package:flutter/material.dart';
import 'package:gdg_community_app/models/model.dart';
import 'package:gdg_community_app/widgets/team_member_card.dart';

class TeamMemberList extends StatelessWidget {
  final List<TeamMember>? members;

  const TeamMemberList({super.key, this.members});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: members!.length,
      itemBuilder: (context, index) {
        TeamMember member = members![index];

        return TeamMemberCard(member: member);
      },
    );
  }
}

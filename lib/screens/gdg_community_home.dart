import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gdg_community_app/screens/support_page.dart';
import 'package:gdg_community_app/widgets/member_list.dart';

import '../models/model.dart';

class GDGCommunityHome extends StatelessWidget {
  const GDGCommunityHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.grey),
        title: Center(
          child: Image.asset('assets/gdglogo_grey.png',
              width: 40, height: 40, fit: BoxFit.contain),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: Image.network(
                Utils.gdgCommunityLogoBlue,
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              color: Utils.lightMainColor,
              padding: const EdgeInsets.all(10),
              child: const Row(
                children: [
                  Icon(Icons.people, size: 30, color: Utils.mainColor),
                  SizedBox(width: 10),
                  Text(
                    'Meet the Team',
                    style: TextStyle(color: Utils.mainColor, fontSize: 20),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: FirebaseFirestore.instance.collection('team').get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<QueryDocumentSnapshot> memberDocs =
                        (snapshot.data as QuerySnapshot).docs;

                    List<TeamMember> members = memberDocs
                        .map((doc) => TeamMember.fromJson(
                            doc.data() as Map<String, dynamic>))
                        .toList();

                    return TeamMemberList(members: members);
                  }

                  return const Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Utils.mainColor),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => GDGCommunitySupport()));
        },
        backgroundColor: Utils.secondaryColor,
        child: const Icon(Icons.chat_bubble, color: Colors.white),
      ),
    );
  }
}

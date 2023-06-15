import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gdg_community_app/widgets/community_button.dart';
import 'package:gdg_community_app/widgets/community_goal.dart';
import 'package:gdg_community_app/widgets/support_meter.dart';

import '../models/model.dart';

class GDGCommunitySupport extends StatelessWidget {
  final int messagesGoal = 300;

  const GDGCommunitySupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.grey),
        title: Image.network(Utils.appBarIcon,
            width: 40, height: 40, fit: BoxFit.contain),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Community Meter',
              textAlign: TextAlign.center,
              style: TextStyle(color: Utils.mainColor, fontSize: 30),
            ),
            Text(
              'Goal: $messagesGoal Messages',
              textAlign: TextAlign.center,
              style: TextStyle(color: Utils.mainColor, fontSize: 15),
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('community_support_meter')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<QueryDocumentSnapshot> messages =
                        (snapshot.data as QuerySnapshot).docs;

                    if (messages.length >= messagesGoal) {
                      return GDGCommunityGoal();
                    }

                    return Column(
                      children: [
                        Expanded(
                          child:
                              GDGCommunitySupportMeter(count: messages.length),
                        ),
                        const SizedBox(height: 40),
                        GDGCommunityButton(
                          label: 'Send Message!',
                          icon: Icons.send,
                          onTap: () {
                            FirebaseFirestore.instance
                                .collection('community_support_meter')
                                .add({'message': 'I love Flutter!'});
                          },
                        ),
                      ],
                    );
                  }
                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

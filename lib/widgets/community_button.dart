import 'package:flutter/material.dart';
import 'package:gdg_community_app/models/model.dart';

class GDGCommunityButton extends StatelessWidget {
  final String? label;
  final Function? onTap;
  final IconData? icon;
  const GDGCommunityButton({super.key, this.label, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Utils.secondaryColor,
      child: InkWell(
        onTap: () {
          onTap!();
        },
        highlightColor: Utils.lightMainColor,
        splashColor: Utils.lightMainColor,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(label!, style: TextStyle(fontSize: 20, color: Colors.white)),
              const SizedBox(width: 10),
              Icon(icon!, color: Colors.white, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}

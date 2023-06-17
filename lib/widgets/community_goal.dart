import 'package:flutter/material.dart';
import 'package:gdg_community_app/models/model.dart';

class GDGCommunityGoal extends StatefulWidget {
  const GDGCommunityGoal({super.key});

  @override
  State<GDGCommunityGoal> createState() => _GDGCommunityGoalState();
}

class _GDGCommunityGoalState extends State<GDGCommunityGoal>
    with TickerProviderStateMixin {
  AnimationController? controller;
  AnimationController? textController;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this)
      ..repeat(reverse: true);

    textController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this)
      ..forward();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: textController!, curve: Curves.easeInOut)),
          child: SlideTransition(
            position: Tween<Offset>(
                    begin: const Offset(0.0, 0.25),
                    end: const Offset(0.0, -0.25))
                .animate(CurvedAnimation(
                    parent: textController!, curve: Curves.easeInOut)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Congrats!',
                  style: TextStyle(color: Utils.mainColor, fontSize: 30),
                ),
                const SizedBox(height: 5),
                const Text(
                  'We did it!',
                  style: TextStyle(color: Utils.mainColor, fontSize: 50),
                ),
                const SizedBox(height: 20),
                ScaleTransition(
                  scale: Tween<double>(begin: 1.0, end: 1.25).animate(
                      CurvedAnimation(
                          parent: controller!, curve: Curves.easeInOut)),
                  child: RotationTransition(
                      turns: Tween<double>(begin: -0.05, end: 0.05).animate(
                          CurvedAnimation(
                              parent: controller!, curve: Curves.easeInOut)),
                      child: const Icon(Icons.thumb_up,
                          size: 100, color: Utils.mainColor)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

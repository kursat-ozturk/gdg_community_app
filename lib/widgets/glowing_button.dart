import 'package:flutter/material.dart';
import 'package:gdg_community_app/models/model.dart';

class GlowingButton extends StatefulWidget {
  final Function? onTap;
  const GlowingButton({super.key, this.onTap});

  @override
  State<GlowingButton> createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton>
    with TickerProviderStateMixin {
  AnimationController? glowingController;

  @override
  void initState() {
    super.initState();
    glowingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap!();
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Stack(
          children: [
            ScaleTransition(
              scale: Tween<double>(begin: 1.0, end: 1.5).animate(
                  CurvedAnimation(
                      parent: glowingController!, curve: Curves.easeInOut)),
              child: FadeTransition(
                opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
                    CurvedAnimation(
                        parent: glowingController!, curve: Curves.easeInOut)),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Utils.secondaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Utils.secondaryColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      offset: Offset.zero,
                      color: Utils.secondaryColor.withOpacity(0.8)),
                ],
              ),
              width: 80,
              height: 80,
              child: const Icon(Icons.textsms, color: Colors.white, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}

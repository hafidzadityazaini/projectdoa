import 'package:flutter/material.dart';

class ModernCard extends StatelessWidget {

  final Widget child;

  const ModernCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(
        bottom: 15,
      ),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(25),

        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black
                .withOpacity(0.05),
          )
        ],
      ),

      child: child,
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Image.asset(
              'assets/images/Background.png',
              fit: BoxFit.cover,
              width: 375,
              height: 170,
            ),
          ),
          Positioned.fill(
            top: 30,
            // left: 30,  // Center horizontally
            child: Image.asset(
              'assets/images/momkn_space.png',
              width: 146,
              height: 146,
            ),
          ),
          Positioned.fill(
            top: 0,
            right: -220,
            child: Image.asset(
              'assets/images/half_circle2.png',
              width: 146,
              height: 146,
            ),
          ),
          Positioned.fill(
            top: 30,
            left: -220,
            child: Image.asset(
              'assets/images/half_circle.png',
              width: 146,
              height: 146,
            ),
          ),
          Positioned(
            right: 26,
            top: (212 - kToolbarHeight) / 2,  // Center vertically
            child: Icon(Icons.notifications_none_sharp, color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

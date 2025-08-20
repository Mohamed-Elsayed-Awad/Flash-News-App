import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, required this.size});
  final IconData icon;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Positioned(
        //   right: 0,
        //   child: Container(
        //     height: 15,
        //     width: 15,
        //     decoration: BoxDecoration(
        //         color: Colors.red, borderRadius: BorderRadius.circular(10)),
        //     child: Center(
        //       child: Text(
        //         '16',
        //         style: TextStyle(fontSize: 11, color: Colors.white),
        //       ),
        //     ),
        //   ),
        // ),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: const Color.fromARGB(33, 158, 158, 158),
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            icon,
            size: size,
          ),
        ),
      ],
    );
  }
}

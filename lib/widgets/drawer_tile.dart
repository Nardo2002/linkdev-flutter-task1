import 'package:flutter/material.dart';
class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.title,
    required this.icon,
    required this.size,
  });

  final String title;
  final ImageIcon icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size * 0.01),
      child: ListTile(
        leading: icon,
        title: Text(
          title,
        ),
        onTap: () {},
      ),
    );
  }
}

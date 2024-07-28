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
  final _tilePaddingRatio = 0.01;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size * _tilePaddingRatio),
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

import 'package:flutter/material.dart';

class MyMenuBox extends StatelessWidget {
  const MyMenuBox({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.total,
    required this.satuan,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final Color iconColor;
  final String total;
  final String satuan;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: iconColor,
              ),
              SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$total $satuan',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

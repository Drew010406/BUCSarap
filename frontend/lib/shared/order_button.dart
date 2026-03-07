import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? label;

  const OrderButton({required this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        width: 153,
        decoration: BoxDecoration(
          color: Color(0xFFFF9644).withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            label!,
            style: TextStyle(
              color: Color(0xFF5D371A),
              fontFamily: 'Flame',
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

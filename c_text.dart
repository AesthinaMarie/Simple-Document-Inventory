import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final TextAlign? textAlign;
  final String text;
  final double? fontsize;
  final Color? color;
  final FontWeight? fontWeight;
  const CustomText({
    super.key,
    required this.text,
    this.fontsize,
    this.color,
    this.fontWeight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        fontSize: fontsize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}

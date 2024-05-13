import 'package:financial_literacy/Models/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ParagraphTitle extends StatelessWidget {
  Paragraph paragraph;
  ParagraphTitle({super.key, required this.paragraph});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(54, 33, 149, 243),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            paragraph.name,
            style: GoogleFonts.russoOne(
                textStyle: const TextStyle(color: Colors.black, fontSize: 14)),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                paragraph.desc,
                // textAlign: TextAlign.center,
                style: GoogleFonts.russoOne(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

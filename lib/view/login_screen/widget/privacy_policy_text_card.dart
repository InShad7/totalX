import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:totalx/view/utils/colors.dart';

class PrivacyPolicyTextCard extends StatelessWidget {
  const PrivacyPolicyTextCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By Continuing, I agree to TotalX’s ',
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: CustomColors.grey,
            ),
          ),
          TextSpan(
            text: 'Terms and condition ',
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: CustomColors.fadedblue,
            ),
          ),
          TextSpan(
            text: '& ',
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: CustomColors.grey,
            ),
          ),
          TextSpan(
            text: 'privacy policy',
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: CustomColors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

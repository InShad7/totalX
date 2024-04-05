import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:totalx/view/utils/colors.dart';
import 'package:totalx/view/utils/constants.dart';

import 'widget/custom_btn.dart';
import 'widget/custom_text_field.dart';
import 'widget/privacy_policy_text_card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.width + 100,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width / 2.5,
                child: Image.asset('assets/images/image.png'),
              ),
              KConstants.kHeight40,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter Phone Number',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: CustomColors.black,
                    ),
                  ),
                  KConstants.kHeight,
                  const CustomTextField(
                    hintText: 'Enter phone number *',
                    keyboardType: TextInputType.number,
                    maxLen: 10,
                  ),
                  KConstants.kHeight,
                  const PrivacyPolicyTextCard(),
                ],
              ),
              KConstants.kHeight40,
              CustomBtn(
                title: 'Get OTP',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

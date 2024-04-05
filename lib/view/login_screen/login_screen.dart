import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:totalx/controller/login_provider/login_provider.dart';
import 'package:totalx/view/otp_screen/otp_screen.dart';
import 'package:totalx/view/utils/colors.dart';
import 'package:totalx/view/utils/constants.dart';

import 'widget/custom_btn.dart';
import 'widget/custom_text_field.dart';
import 'widget/privacy_policy_text_card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginController>(context);
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: provider.formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  KConstants.kHeight40,
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
                      CustomTextField(
                        hintText: 'Enter phone number *',
                        keyboardType: TextInputType.number,
                        maxLen: 10,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid phone number';
                          } else if (value.length < 10) {
                            return 'Please enter a 10 digit number';
                          }
                        },
                      ),
                      KConstants.kHeight,
                      const PrivacyPolicyTextCard(),
                    ],
                  ),
                  KConstants.kHeight40,
                  CustomBtn(
                    title: 'Get OTP',
                    onPressed: () {
                      if (provider.formkey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OTPScreen(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

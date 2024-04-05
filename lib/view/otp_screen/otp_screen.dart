import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:totalx/controller/login_provider/login_provider.dart';
import 'package:totalx/view/login_screen/widget/custom_btn.dart';
import 'package:totalx/view/utils/colors.dart';
import 'package:totalx/view/utils/constants.dart';

import 'widget/otp_widget.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());
  late LoginController loginProvider;

  @override
  void initState() {
    super.initState();
    loginProvider = Provider.of<LoginController>(context, listen: false);
    loginProvider.countdownTimer(59);
  }

  @override
  void dispose() {
    super.dispose();
    loginProvider.cancelTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: Consumer<LoginController>(
        builder: (context, loginProvider, child) => SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                KConstants.kHeight40,
                SizedBox(
                  height: MediaQuery.of(context).size.width / 2.5,
                  child: Image.asset('assets/images/image2.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OTP Verification',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.black,
                      ),
                    ),
                    KConstants.kHeight30,
                    Text(
                      'Enter the verification code we just sent to your number +91 *******21.',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.fadedblack,
                      ),
                    ),
                  ],
                ),
                KConstants.kHeight20,
                OTPColumnWidget(
                  controllers: controllers,
                ),
                KConstants.kHeight20,
                Text(
                  '${loginProvider.secondsRemaining} Sec',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.red,
                  ),
                ),
                KConstants.kHeight20,
                GestureDetector(
                  onTap: () {
                    if (loginProvider.secondsRemaining == 0) {}
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t Get OTP? ',
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.fadedblack,
                      ),
                      children: const [
                        TextSpan(
                          text: 'Resend',
                          style: TextStyle(
                            color: CustomColors.blue,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                KConstants.kHeight30,
                CustomBtn(
                  title: 'Verify',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

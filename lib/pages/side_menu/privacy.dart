import 'package:flutter/material.dart';
import 'package:translate/utils/colors.dart';

class TermOfUse extends StatelessWidget {
  const TermOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Term of Use"),
        //centerTitle: true,
      ),
      backgroundColor: darkColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Terms of Use",
                style: TextStyle(
                    fontFamily: 'gothic',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Welcome to Babel: Translation App! You accepted these Terms of Use by accessing or using this mobile application. Before using the App, carefully read these terms. Do not use the App if you do not agree to these terms.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'gothic',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "1. App Usage Rules",
                style: TextStyle(
                    fontFamily: 'gothic',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '1.1. User Account:',
                      style: TextStyle(
                          fontFamily: 'gothic',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    TextSpan(
                      text:
                          " The application is designed in general, so you don't need to have an account.",
                      style: TextStyle(
                        fontFamily: 'gothic',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '1.2. Prohibited Activities:',
                      style: TextStyle(
                          fontFamily: 'gothic',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    TextSpan(
                      text:
                          " You must not use the App to:",
                      style: TextStyle(
                        fontFamily: 'gothic',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "- Violate any laws, rules, or policies that may be in force.\n- Infringe another person's intellectual property rights.\n- Transmit any impolite, harmful, or illegal content.\n- The application or its systems in attempting to obtain unauthorized access.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'gothic',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "2. Intellectual Property",
                style: TextStyle(
                    fontFamily: 'gothic',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '2.1. Ownership:',
                      style: TextStyle(
                          fontFamily: 'gothic',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    TextSpan(
                      text:
                          " The App's text, photos, graphics, logos, and other contents are all the exclusive property of Babel: Translation App or its licensors and are thus protected by intellectual property laws. Please see the Credit Links section for more details.",
                      style: TextStyle(
                        fontFamily: 'gothic',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '2.2. Limited License:',
                      style: TextStyle(
                          fontFamily: 'gothic',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    TextSpan(
                      text:
                          " You are given a constrained, non-exclusive, non-transferable, and revocable license by Babel: Translation App to access and utilize the App for private, public, and non-profit uses.",
                      style: TextStyle(
                        fontFamily: 'gothic',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "3. Limitation of Liability",
                style: TextStyle(
                    fontFamily: 'gothic',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Any direct, indirect, incidental, special, or consequential damages resulting from or connected with your use of the App are expressly disclaimed by Babel: Translation App.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'gothic',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "4. Termination",
                style: TextStyle(
                    fontFamily: 'gothic',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Your use of the App may be suspended or terminated at any time and without prior notice by Babel: Translation App, for whatever reason.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'gothic',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "5. Changes to Terms",
                style: TextStyle(
                    fontFamily: 'gothic',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Babel: Translation App still maintains the right to regularly modify these Terms of Use. Any updates will be announced within the app, and by using it once they are implemented, you agree to the revised terms.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'gothic',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Contact Us",
                style: TextStyle(
                    fontFamily: 'gothic',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Contact us at ',
                      style: TextStyle(
                          fontFamily: 'gothic',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    TextSpan(
                      text: 'babel.dev8@gmail.com ',
                      style: TextStyle(
                          fontFamily: 'gothic',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.blue),
                    ),
                    TextSpan(
                      text:
                          'or visit the feedback section directly if you happen to have any inquiries or problems regarding our terms of use.',
                      style: TextStyle(
                          fontFamily: 'gothic',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Last Updated:',
                      style: TextStyle(
                          fontFamily: 'gothic',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    TextSpan(
                      text:
                          ' July, 29, 2023',
                      style: TextStyle(
                          fontFamily: 'gothic',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.blue),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

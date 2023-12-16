import 'dart:math' as math;
// import 'package:dio/dio.dart';
// import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// import 'package:custom_check_box/custom_check_box.dart';
import 'package:Veots/screens/login.dart';
import 'package:Veots/screens/register_with_email.dart';

import 'package:Veots/screens/register_with_phone.dart';
import 'package:flutter/material.dart';
// import 'package:searchfield/searchfield.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Pre_Register_ extends StatefulWidget {
  Pre_Register_({super.key, required this.Link, required this.location_on});
  final String Link;
  final bool location_on;
  // import 'dart:math' as math;

  @override
  State<Pre_Register_> createState() => Pre_Register_State();
}

class Pre_Register_State extends State<Pre_Register_> {
  String? CountryName;
  bool checkbox=false;
  void dispose() {
    _searchController.dispose();
    focus.dispose();
    super.dispose();
  }

  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // countries = data.map((e) => Country.fromMap(e)).toList();
    print('--------------');
    print(widget.Link);
    print(widget.location_on);
    print('----------------');
  }

  final _formKey = GlobalKey<FormState>();

  final focus = FocusNode();
  List<Country> countries = [];
  Country _selectedCountry = Country.init();

  bool containsCountry(String text) {
    final Country? result = countries.firstWhere(
        (Country country) => country.name.toLowerCase() == text.toLowerCase(),
        orElse: () => Country.init());

    if (result!.name.isEmpty) {
      return false;
    }
    return true;
  }

  String idGenerator() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  bool IsPhone = false;
  bool NoPhone = false;
  TextEditingController _Others = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor;
    bool someBooleanValue = true;
 Future handleTermsAndConditionsClick() {
    // Implement the functionality to run when 'Terms and Conditions' is clicked
   return  showModalBottomSheet(
        // constraints: BoxConstraints(m),
        shape: const RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15.0),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            child:Column(
              children: [SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height* 0.0,
                    // color: Colors.blue,
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.08,
                        left: MediaQuery.of(context).size.width * 0.08),

                    child: Text(
                      "Terms and Conditions",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium",
                                                              color: const Color(0xff002060),
                        // fontStyle: FontStyle.italic,
                        fontSize: MediaQuery.of(context).size.width * 0.058,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Container(
                // height:  MediaQuery.of(context).size.height * 0.72,
                // color: Colors.blue,
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.08,
                    left: MediaQuery.of(context).size.width * 0.08),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Welcome to Veots. ',
                                                          style: TextStyle(
                            
                            // decoration: TextDecoration.underline,
                            //  
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),


                                                        ),
                                                       
                                                      ],
                                                    ),
                                                  ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "The following terms and conditions (\"Terms of Use\" or “Terms and Conditions”) govern all use of Veots Platform, Veots Anti-Counterfeiting Solution and related services and products provided by Veots (hereinafter referred to collectively as “Services”).  ",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Veots Anti-Counterfeiting Solution is a proprietary product of KSJ Rudh Private Limited and is owned by KSJ Rudh private limited, having its registered address at – no:S-693, 12th cross, 15th main, Bharath Nagar 2nd stage, BEL Layout, Bangalore, Karnataka, India – 560091.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Definitions and Interpretations",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "•	The Veots mobile app, Veots web app platform - www.veots.com and www.veots.in shall be referred to in here as “Platform”.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      Text(
                       "•	The Veots patented anti-counterfeiting solution, Dynamic QR generateion, and the authentication software shall be referred to in here as “Anti-Counterfeiting Solution”.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      Text(
                       "•	Services shall mean the provision of Platform, Anti-Counterfeiting Solution and other related services such as loyalty / cashback, digital warranty, reporting of fake products, track and trace, Product Journey, Expiry Alerts and Notifications, Advertisements, API services and other related services",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                       Text(
                       "•	The terms “user”, “you”, refer to all the users of Veots Services.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      Text(
                       "•	The users may be any of the following as the context dictates\n 	  -“manufacturers” or “Brands” or “seller” or “client” who implement the Anti-Counterfeiting Solution to affix or print QR codes on the products developed, created or manufactured by them and/or use any of our Services; \n 	  -“retailers” or “distributors” who sell or distribute the manufacturer's products and who use the Platform to scan the QR codes to verify the product's authenticity and/or use any of our Services;\n 	  -“end-user” or “buyers” who purchase the products and use the Platform to scan the QR codes to verify the product's authenticity and/or use any of our Services.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      Text(
                       "•	“we”, “us”, “Owner”, “our”, or “Veots” refers to KSJ Rudh Private Limited. ",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      Text(
                       "•	By the wording “use our Services” or similar connotations refers to the use of our Platform, Anti-Counterfeiting Solution and/or any of our other related services as applicable. ",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                       "By accessing or using any of our Services offered though the Platform, including but not limited to (verifying the authenticity of the product, product reviews, product information, Loyalty programs, etc.) you will be subject to rules, guidelines, policies, terms and conditions, limitations of the services offered as specified in these Terms and Conditions. We reserve the rights at our sole discretion, to modify, change, edit, delete, remove, add portions in these Terms and Conditions without any prior notice to you. If there are any material changes, we may promptly notify you by email. It becomes your responsibility to review these Terms and Conditions for any periodical changes. Your continued use of any of our Services will mean that you accept and agree with the modified Terms and Conditions. At any stage, if you decide to not agree with our Terms and Conditions, you are free to refrain yourself from using our Services. If you do not agree with these Terms of Use, please do not access or use any Services. We reserve the right to deny access to or offer any Services to any person or entity. \n\nBy using any Services, you represent and warrant that: (a) you are the age of majority as per the applicable laws to which you are subject, (b) you are of sound mind and have the right, authority, and capacity to agree to and abide by these Terms of Use, (c) if you are accessing any Services on behalf of another person, you are authorized to act on behalf of such person and have the full authority to bind such person to this Terms Of Use. You are a minor, you may only register for and use the Services under the supervision and guidance of an adult or your guardian or parent, in which case the adult or the guardian or parent shall be deemed to be the user and shall be responsible for any activities.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
 SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "Intellectual Property Rights",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),

                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "All the materials used on our Services including but not limited to art, video, music, audio, image, text, graphics, technology, logo, trademarks, icons, drawings and any and all intellectual property rights therein is claimed and owned by us (or our applicable licensors) and are protected under applicable copyright, trademark and other intellectual property laws. For the avoidance of doubt, Veots retains full ownership rights, title, and interest in all intellectual property associated with the Services. All patents, copyrights, trademarks, trade secrets, know-how, and any other intellectual property rights related to the Services shall remain the exclusive property of Veots.\n\n Any improvements, enhancements, or modifications to the Services made by any user shall be considered contributions to Veots’ intellectual property and shall become the sole property of Veots. User shall promptly disclose any such improvements to Veots and hereby waives any claim to ownership or rights related to these enhancements.\n\nAs a part of these Terms of Use, you agree not to misuse any content of our Services, re-produce, distribute, sell, publish using any electronic media and the like directly or assist somebody else to misuse the content materials on the Services, without prior written consent of the Owner. The content is only for your personal, non-commercial use except as otherwise provided herein. Your use of content/material for commercial use other than personal is violation of our (or our licensors’) copyrights, trademarks, intellectual property and other proprietary rights and is prohibited. We claim the license right for the text, data, images, information, reviews, video, music and any other materials you upload or provide when you use our Services. We reserve the right to use, copy,  modify, publish, transmit, disseminate, distribute, display, market, create derivative works from, and otherwise exploit or re-produce the content in any form or medium whatsoever you upload or provide, by this you agree to grant us and our affiliates, subsidiaries and our and their respective owners, employees, partners, officers, directors, contractors, agents, representatives a royalty free, unconditional, perpetual worldwide right to use your content for business purpose only including to provide, maintain, support, update or upgrade the Services and for conducting internal testing.\n\n When providing bill copies or any documents containing sensitive information, users are solely responsible for ensuring that any sensitive or confidential details (such as financial data, personal identification numbers, account numbers, PAN Number, GST Number, Card number, UPI Id, Address, transaction number, etc.) are appropriately masked or redacted before uploading or sharing such documents on our Platform. Veots strongly advises users to diligently review and mask any sensitive information visible on the documents before uploading. While Veots may provide guidance or recommendations for data masking, it is the user's responsibility to ensure that sensitive information is adequately protected. Veots shall not be held responsible or liable for any failure on the part of users to properly mask sensitive information on the uploaded documents. Users acknowledge and agree that Veots bears no responsibility for any unauthorized disclosure or exposure of sensitive information that remains visible or unmasked on the uploaded documents. By using our Services and uploading documents containing sensitive information, users accept full responsibility for the masking or redaction of any sensitive details and agree that Veots is not liable for any consequences resulting from the user's failure to mask such information.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "User Account, Password and Security",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "When you use our Services, you accept that you are solely responsible to maintain confidentiality of your profile/account and other information you provide to us. You shall be responsible for all the activity that happens under your profile/account. You agree not to provide data, which is inaccurate, in-complete, not current or untrue. At any point of time if we notice discrepancy, we shall have full rights to blacklist or delete your account or data without any prior notice. You shall agree to inform/report us immediately of any unauthorised use or breach of your account or password. You agree not to (a) create or access an account using a false identity or any false or inaccurate information, (b) create an account if you have been previously removed or banned by us, (c) have more than one account at any given time unless expressly permitted by us.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "License",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "Manufacturer: We grant the manufacturer a non-exclusive, non-transferable license to utilize our proprietary Anti-Counterfeiting Solution solely for the purpose of integrating the solution into their products. This license permits the manufacturer to embed and use our technology in their products to facilitate product authentication and verification. The manufacturer shall not sublicense, sell, distribute, modify, reverse engineer, or reproduce our Anti-Counterfeiting Solution or any Services without prior written consent. The license is solely for integrating the solution into the manufacturer's products and does not grant any rights to our intellectual property or proprietary technology. This license remains valid for the duration of the collaboration between Veots and the manufacturer and may be terminated in the event of breach of terms. Veots will assist the manufacturer in integrating and utilizing the Anti-Counterfeiting Solution for product authentication and verification purposes. The license granted is limited to the specific use within manufacturer's product lines and does not extend to sublicensing or transfer to third parties without explicit written consent from Veots.\n\nRetailer: We grant the retailer a limited, non-exclusive license to utilize our Platform for the purpose of product authentication and verification. This license allows the retailer to use the Platform to verify product authenticity within their establishment or during transactions involving products integrated with our technology. The retailer shall not modify, decompile, replicate, or resell any Services. This license is solely for utilizing the Platform within the retailer's business operations to authenticate products or to check the expiry of the product or for tracking the product journey and does not confer ownership or rights to our Platform or any Services. We reserve the right to revoke or terminate this license in case of misuse or non-compliance with the terms.\n\nEnd-User: We grant the end-user a limited, non-transferable license to use our Platform for the purpose of authenticating and verifying the authenticity of products integrated with our technology. The end-user shall use the Platform solely for personal product verification purposes and shall not modify, reverse engineer, distribute, or use the solution for any commercial purposes or in violation of applicable laws. This license does not grant ownership or rights to our technology and is contingent upon the end-user's adherence to these Terms and Conditions. We reserve the right to revoke or terminate this license in case of misuse or non-compliance with the terms.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Consideration",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                    "The manufacturer agrees to provide monetary consideration to Veots for the integration and use of the Anti-Counterfeiting Solution into their products. The consideration provided by the manufacturer enables the integration, deployment, and utilization of Veots’ anti-counterfeiting technology within their products. All fees are payable in advance and non-refundable except as stated in any applicable law. The end-users and retailers utilizing the Services may not provide monetary consideration for the Services rendered. However, the absence of monetary consideration shall not render these Terms and Conditions invalid or unenforceable. The acceptance and usage of the Services by end-users and retailers imply their acknowledgment and agreement to comply with these Terms and Conditions. The validity and enforceability of these Terms and Conditions remain intact irrespective of the absence of monetary consideration.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Users Conduct and Rules ",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "Use of our Services is strictly governed by these Terms of Use. Users shall not host, hyperlink, copy, share any information which does not belong to them from our Services. Users shall not infringe upon third party information or rights including but not limited to intellectual property and privacy contents. Users shall not infringe any of our brands, logos, trademarks, or other proprietary marks. Users shall not misuse other person’s email address, phone number and the like. You shall not interfere with the access or use of Services by other users. You shall not conduct any activities with an intention to cause loss to our business or revenue or the like or interfere with or disrupt any of the Services. You shall not use our Services for fraudulent purpose. You shall not use our Services in any way which is harmful to our interests. You shall not use any algorithm or any logic or methodology to gain unauthorised access to our Services. You shall refrain from hacking, password mining and the like. \n\nThe information provided on the platform on the Services shall be downloaded, provided that you do not remove any proprietary notice language in all copies of such documents, make no modification for information or make any additional representation or warranties to the documents available on our Services. These information on Services shall strictly used only for personal and non-commercial information purpose only and not for any commercial use.Additionally, the user shall not:\n•	Modify, reverse engineer, decompile, or attempt to extract the proprietary technology, algorithms, or methodologies used in the Services.\n•	Transfer, sublicense, sell, distribute, or assign the rights granted under the license to any third party unless prior written consent from us is obtained.\n•	Use the Anti-Counterfeiting Solution for purposes other than embedding it into their products for product authentication and verification purposes.\n•	Misrepresent or falsely claim ownership or association with our technology or intellectual property or any Services.\n•	Engage in any actions that may impair or compromise the integrity, functionality, or security of our Services.\n•	Remove any copyright, trademark registration, or other proprietary notices from the Services.\n•	Use the Services to compete with us or be involved directly or indirectly in a business that competes with us.\n•	Build a similar or competitive product or service using similar ideas, features, functionality, or graphics of the Services.\n•	Attempt to circumvent any technological measures related to the Services.\n•	Transmit or introduce any kind of virus or malware or harmful codes in the Services. \n•	Use the Services in any way not permitted or authorized by these Terms of Use.\n•	Impersonate or misrepresent yourself while using the Services.\n•	Use the Services in violation of any applicable laws.\nAdditionally, the manufacturer shall provide necessary product information, design specifications, and cooperation required for the successful integration of the Anti-Counterfeiting Solution and shall facilitate the implementation of the Anti-Counterfeiting Solution across its product lines.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Services Offered and Warranty",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "Veots provides a number of Services through the Platform. Primarily Veots helps you to authenticate the product kept on sale even before buying. Veots shall help you with brand identification and verification of the products to say if it is genuine, fake or expired based on the data provided by our clients. The use of Veots’ Services does not imply or guarantee the authenticity, quality, or performance of the physical products themselves. The purpose of our technology is to aid in product authentication and verification for applicable stakeholders. While Veots collaborates with manufacturers to integrate Veots’ technology, Veots is not responsible for the functionality, accuracy, or effectiveness of the Services in every operational scenario. The integration of Veots Anti-Counterfeiting Solution into products is based on collaboration with manufacturers. However, Veots does not assume responsibility for any potential issues, malfunctions, inaccuracies, or shortcomings that may arise in the operation or implementation of the Anti-Counterfeiting Solution within the manufacturer's products. Veots does not guarantee absolute prevention of counterfeiting or fraudulent activities related to the products. The effectiveness of the Anti-Counterfeiting Solution may vary based on several factors, and Veots cannot ensure complete elimination of counterfeit occurrences. Veots disclaims any liability for damages, losses, or adverse outcomes, whether direct or indirect, that may occur due to the use or non-functionality of the Anti-Counterfeiting Solution integrated into the products manufactured by third parties. Veots only verifies products of our client who has collaborated with us and not all the products in the market. Our Platform shall only authenticate the product and provide you the details of product but will not allow you to purchase through our Platform. Additionally, Veots, might activate warranty based on the purchase date and provides paperless warranty details which can only be used as a document to contact manufacturers of the products and exercise warranty. Veots is not responsible for the change in the warranty timeline, terms and conditions laid by Brands and the like. Veots does not manufacture the physical products or have control over their production, quality, distribution, or warranty terms. The warranty terms and coverage are subject to the policies established by the respective manufacturers of the products. We do not provide direct warranties for the products and disclaims any liability or responsibility for the terms, coverage, or fulfillment of warranties. The responsibility for the production, quality assurance, warranties, and any related issues pertaining to the physical products remains solely with the respective manufacturer(s). By using our Services, it becomes responsibility of users to read and understand the terms and conditions of Brands before buying the product. Users shall contact Brands directly to settle their warranty, Veots claims no responsibility to settle the argument between seller and buyer. Veots cannot be held responsible if the buyer has not followed the policies of seller. Retailers using Veots’ Services do so at their discretion and responsibility. Veots does not assume liability for any issues, inaccuracies, or shortcomings that may arise during the use or implementation of the Anti-Counterfeiting Solution or Services within retail environments. Users of the Services should rely on additional product information provided by the manufacturer(s) and exercise their judgment when making purchasing decisions based on product authenticity verifications facilitated by Veots. Users utilizing Services are encouraged to understand its limitations and to exercise their independent judgment and due diligence when relying on the solution for product authentication purposes. Veots does not assume responsibility for the functionality, accuracy, or effectiveness of the Services for every product authentication carried out by buyers. Buyers utilizing Veots’ Services for product verification do so at their discretion and understanding. Veots disclaims any liability for issues, inaccuracies, or shortcomings that may arise during the use or reliance on the Services by buyers. Buyers utilizing Veots’ Services are encouraged to exercise their independent judgment, verify product authenticity through additional means, and understand the limitations of the solution. While we strive to provide all the required product details to users, Veots does not take responsibility to ensure that product description or other content of the product on our Platform is accurate, reliable, current, or error-free, complete and assumes no liability in this regard. Veots will also not assure the quality of the products you purchase, we shall only verify that they are from the genuine manufacturer.\nRegarding Loyalty / Cashback service: The availability of rewards, cashback, or benefits is subject to change at our discretion without prior notice. Veots disclaims any liability or responsibility for the availability, accuracy, or quality of rewards, offers, or cashback provided through the Loyalty / Cashback service. Users are encouraged to review and comply with the specific terms and conditions (if any) governing the Loyalty / Cashback service apart from these Terms and Conditions. Participation in the Loyalty / Cashback service indicates the User's acceptance of the terms and conditions set forth by Veots.\nReport Fake Products Service: We offers a service to report suspected counterfeit products through our Platform. The reporting of suspected fake products is a voluntary initiative undertaken by users based on their judgment and observations. We do not independently verify or authenticate the reported products and disclaims any liability for the accuracy, verification, or outcomes resulting from the reported fake products. The reporting service is provided solely as a means to flag suspected counterfeit products for user awareness. Users are encouraged to exercise caution and use additional verification measures when relying on reported fake products. We recommend contacting relevant authorities or original product manufacturers for further investigation or verification.\nAdvertisement Service: Advertisements displayed on our Platform are intended to promote products or services offered by third-party advertisers. We do not endorse, guarantee, or warrant the accuracy, quality, or effectiveness of the products or services advertised. The information, offers, or promotions displayed in advertisements are the sole responsibility of the respective advertisers. Users engaging with advertisements do so at their own discretion and risk. We disclaim any liability for transactions, agreements, or interactions resulting from engaging with the advertisements displayed on our Platform.\nData Analytics Service: We offer data analytics services to provide insights and analysis based on aggregated and anonymized data collected through our Platform. The analysis is conducted to derive trends, patterns, or insights from the data available. We will ensure that the data is anonymized and aggregated to protect user privacy. However, the accuracy, completeness, or outcomes derived from the data analysis cannot be guaranteed. The data analytics results provided by Veots are for informational purposes only and should not be construed as professional advice or absolute representations. Users are advised to interpret the results with caution and verify them through independent means if required.\nAPI as a Service: We offer API services to facilitate integration and connectivity with our Services. We disclaim any liability for disruptions, interruptions, or errors in API functionality that may occur due to technical issues or external factors beyond our control. The use of our APIs is at the user's own risk and responsibility. We reserve the right to modify, suspend, or terminate API services without prior notice. Users are encouraged to review and comply with the API usage guidelines provided by Us.\nWhite Labelling Service: We offer white labelling services to enable clients to brand and customize our solutions as per their requirements. The white labelling service allows clients to use our technology under their brand name. We disclaim any responsibility or liability for the client's use of the white-labelled solution, including branding, customization, or deployment. The client assumes responsibility for the application, use, and support of the white-labelled solution under their brand. We reserve the right to provide guidelines and support for the white labelling process but does not guarantee the success or outcomes of the white labelling service.\nTHE SERVICES ARE PROVIDED ON AN \"AS IS\" BASIS AND AN \"AS AVAILABLE\" BASIS WITH ALL FAULTS. WE EXPRESSLY DISCLAIM ANY WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, QUIET ENJOYMENT OR NON-INFRINGEMENT, PERFORMANCE, AND ANY WARRANTIES ARISING OUT OF THE COURSE OF DEALING OR USAGE OF TRADE.	THE ACCESS AND USE OF SERVICES MAY BE SUBJECT TO LIMITATIONS, DELAYS, AND OTHER PROBLEMS INHERENT IN THE USE OF THE INTERNET AND ELECTRONIC COMMUNICATIONS. WE ARE NOT RESPONSIBLE FOR ANY SUCH DELAYS, DELIVERY FAILURES, OR OTHER DAMAGES OR LOSS, OR CLAIMS RESULTING FROM SUCH PROBLEMS. WE DO NOT WARRANT THAT THE SERVICES WILL BE ERROR-FREE OR VIRUS-FREE OR BUG-FREE OR UNINTERRUPTED OR SECURE, OR THAT ANY OF THE SERVICES WILL MEET YOUR REQUIREMENTS OR EXPECTATIONS.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Indemnity",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "You shall not hold Veots, its affiliates, subsidiaries and its and their respective owners, owners, employees, employees, officers, directors, contractors, agents, representatives responsible for your breach of contract or terms and conditions with seller or brands or retailer for any quality, warranty, guarantee, refund, coupons and any other issues arising before, during or after purchase of product.\nYou agree to defend, indemnify, and hold Veots, its affiliates, subsidiaries and its and their respective owners, owners, employees, employees, officers, directors, contractors, agents representatives, harmless from and against any claims, damages, costs, causes of actions, liabilities, including without limitation, reasonable attorney fees, resulting or arising from, your use or inability to use any of the Services, your breach of any provisions in this Terms of Use, your violation of any rights (including but not limited to intellectual property rights and privacy rights) of any party including any other user, or your violation of any applicable laws. This provision will survive termination of the Terms of Use.\nIn the event of your breach or threatened or alleged breach of this Terms of Use, Veots will be irreparably harmed and may not have an adequate remedy in money or damages and shall be entitled to an injunction against such a breach from any court of competent jurisdiction. Notwithstanding the foregoing, Veots shall also have the right to obtain other applicable remedies available at law.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                       Text(
                       "E-Platform for Communication",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "By using our Platform, you agree that Veots is only an online platform that enables you to verify the products you purchase, activate warranty and the like, however, Veots cannot control any 3rd party transaction in any manner and you cannot hold Veots, its affiliates, subsidiaries and its and their respective owners, owners, employees, employees, officers, directors, contractors, agents representatives liable for this.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Limitation of Liability",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "VEOTS AND ITS AFFILIATES, SUBSIDIARIES AND ITS AND THEIR RESPECTIVE OWNERS, OWNERS, EMPLOYEES, EMPLOYEES, OFFICERS, DIRECTORS, CONTRACTORS, AGENTS REPRESENTATIVES  SHALL NOT BE LIABLE FOR ANY INDIRECT, PUNITIVE, SPECIAL, EXEMPLARY, INCIDENTAL, CONSEQUENTIAL OR OTHER DAMAGES OF ANY KIND OR ANY DAMAGES FOR EMOTIONAL DISTRESS OR LOST PROFITS OR LOST BUSINESS OPPORTUNITIES, REPUTATION, LOSS OF DATA OR  INFORMATION OR CONTENT ARISING OUT OF OR IN CONNECTION WITH THE SERVICES. VEOTS SHALL NOT BE RESPONSIBLE FOR NON-AVAILABILITY OF THE SERVICES DURING MAINTENANCE. FURTHER USERS SHALL UNDERSTAND THERE MIGHT BE DELAY IN PROCESSING DATA OR UPDATING DUE TO TECHNICAL GLITCHES AND VEOTS SHALL NOT BE RESPONSIBLE FOR THIS. USERS UNDERSTAND AND AGREES THAT ANY DISPUTES AND DISAGREEMENT BETWEEN SELLER AND BUYERS SHALL BE SETTLED BETWEEN THEMSELVES.\nIN NO EVENT SHALL THE AGGREGATE LIABILITY OF VEOTS RELATED TO THESE TERMS OF USE EXCEED THE TOTAL AMOUNT OF FEES RECEIVED BY VEOTS FROM YOU FOR THE USE OF ANY PAID SERVICES DURING THE PAST THREE MONTHS.\n\nTHE LIMITATIONS OF LIABILITY OUTLINED IN THIS SECTION CONSTITUTE THE FUNDAMENTAL ELEMENTS OF THE BASIS OF THE BARGAIN BETWEEN VEOTS AND YOU AND SHALL APPLY TO ALL CLAIMS OF LIABILITY SUCH AS INCLUDING BUT NOT LIMITED TO WARRANTY, TORT, STRICT LIABILITY, AND NEGLIGENCE EVEN IF VEOTS HAS BEEN ADVISED OF THE POSSIBILITY OF ANY SUCH DAMAGES.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Termination",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "Veots may without prior notice discontinue your use of any of the Services, block your access to the Services or delete your account, with or without notice, for reasons including but not limited to: a) your breach of any provisions in the Terms of Use, b) as required by any applicable law, c) any security issues, d) our decision to discontinue the Services (or any part thereof).\n\nIn case you or we decide to terminate your account, all the data corresponding to your usage and services might be deleted. If you provide incorrect, false identification, phone numbers or any details to gain access to our Services, Veots reserves all the rights to refuse access, block, delete accounts including the linked accounts without any prior notice to you.\n\nWe may from time to time suspend or terminate access to all or a part of any Services, or limit the availability and accessibility to you as per Our discretion and without any reason.\n\nUpon termination of your account or any part of it, your right to use such Services will automatically terminate immediately. You agree that all suspensions or terminations shall be made at our sole discretion, and we shall not be liable or responsible to you or any third party for any resultant damages or claims arising or resulting to you or any third party due to such termination.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Governing Law:",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "These  Terms and Conditions are governed by laws of India. Disputes arising in relation hereto shall be subject to exclusive jurisdiction of the courts of Bengaluru, India.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Coupons",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "Veots may sometime provide coupons as a loyalty program, by partnering with brands. Coupons cannot be transferred if you change your number/email address of your account. Coupons may come with expiry date and terms and conditions, how to use and the like. It’s user’s responsibility to read through the terms and conditions and follow the rules accordingly as stated by our partners. Veots holds no responsibility if the coupons don’t work as intended, and it is the discretion of our partners to revoke any coupon codes or promotion code. Coupons allocated are not exchangeable. Each coupon can only be redeemed once.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Third Party Sites",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "The Platform may contain links to third-party websites or resources which are not part of Veots. \nWe do not: Control, review or monitor such sites; Make any warranties or representations concerning such sites; Endorse such sites or any of their products or services.\nVeots shall not be responsible or liable for these websites including but not limited to their resources, content, availability of the content, and information therein. You agree to use all such third-party sites at your own risk.\nSome of the content available from any of the Services may be sourced through third-party sources and you should respect and comply with the terms and conditions of such third-party content as per their license terms.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Privacy Policy",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "The Privacy policy available on our Platform provides information about our collection, use, and disclosure practices related to the personal information of users and is incorporated into this Terms of Use. You agree to use the Services as per the Privacy Policy."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Confidentiality",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "By using the Services, you agree that any and all information, data, algorithms, methodologies, trade secrets, or other proprietary information ('Confidential Information') provided or made accessible to you by us for the purpose of utilizing the Services is strictly confidential. You agree to maintain the utmost confidentiality of this Confidential Information and undertake not to disclose, disseminate, reproduce, or otherwise make accessible any Confidential Information to any third party without the prior written consent of Veots. You shall take reasonable measures to protect the Confidential Information from unauthorized access, disclosure, or use, and you shall not use the Confidential Information for any purposes other than those expressly permitted by Veots. This confidentiality obligation shall survive the termination of your use of the Services.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "General",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "You will not transfer your account or access to the Services to any other person or entity without our prior written consent. This Terms of Use, your rights, and obligations hereunder, shall not be assigned, subcontracted, or transferred by you without our prior written consent, and any attempted transfer shall be considered as a violation of these Terms of Use. We reserve the right to assign these Terms of Use to any third party without your consent.\n\nWe may in our sole discretion, make any changes to the Services that we deem necessary or useful to maintain or enhance the quality or delivery of the Services. We will send you to notice to the last email address you provided to us. Our dispatch of the email containing any notice will be considered effective notice to you notwithstanding such notice may not be delivered to you for reasons such as including but not limited to the invalidity of your email address, your inbox being full, or your email being inaccurate. We are not responsible nor liable for any delays or failures in performance from any cause beyond our control, including, but not limited to acts of God, changes to law or regulations, embargoes, war, terrorist acts, acts or omissions of third party technology providers, lockdowns, riots, fires, earthquakes, floods, power blackouts, strikes, weather conditions or acts of hackers, internet service providers or any other third party or acts or omissions of Users. These Terms of Use constitute the entire agreement between you and us as to the subject matter stated herein. If any provision of this Terms of Use is found to be invalid or unenforceable for any reason, the remaining provisions will continue to be valid and enforceable. Your use of any of the Services shall not make you an employee or agent or partner or joint venturer of Veots unless expressly sated otherwise by the parties in writing. You shall at all times comply with all applicable laws while using any of the Services. Nothing in this Terms of Use will provide or accrue any benefit to any third party or entitle any third party to any claim, cause of action, remedy, or right of any kind. Any waiver or failure to enforce any provision of the Terms of Use on one occasion will not be deemed a waiver of any other provision or such provision on any other occasion. Delay in exercising or non-exercise any such right or remedy does not constitute a waiver of that right or remedy, or any other right or remedy. This Terms of Use binds and benefits the parties and their respective permitted successors and assigns."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
 SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Contact us / Queries",
                        style: TextStyle(
                            
                            //  
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "You can write to us on Customersupport@veots.com or call us on 9632123543.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                    
                      Text(
                        "Last updated: December 15, 2023.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ],
                  ),
                  // child: Text("Q. How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2: How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:"),
                ),
              )),],
            )
          );
        });
    // print('Terms and Conditions clicked!');
  }
 Future handlePrivacyPoliciesClick() {
    // Implement the functionality to run when 'Terms and Conditions' is clicked
   return  showModalBottomSheet(
        // constraints: BoxConstraints(m),
        shape: const RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15.0),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Column(children: [SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height* 0.0,
                    // color: Colors.blue,
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.08,
                        left: MediaQuery.of(context).size.width * 0.08),

                    child: Text(
                      "Privacy Policy",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium",
                         color: Color(0xff003274),
                        // fontStyle: FontStyle.italic,
                        fontSize: MediaQuery.of(context).size.width * 0.07,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Container(
                // height:  MediaQuery.of(context).size.height * 0.72,
                // color: Colors.blue,
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.08,
                    left: MediaQuery.of(context).size.width * 0.08),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                   
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                     
                      Text(
                        "This Privacy Policy (“Privacy Policy”) describes the policies of KSJ Rudh Private Limited (“we”, “us”, “our”, or “Veots”) regarding the collection, use, disclosure and processing of your personal data when you access or use the Anti-Counterfeiting Solution, Platform, and/or the Services. The term “personal data” refers to data that could be used, alone or in combination with other data, to identify you as an individual.\n\nThis Privacy Policy is a part of and incorporated with the Terms and Conditions. Any term not defined herein shall have the same meaning as provided in the Terms and Conditions. \n\nYou are requested to read this Privacy Policy and the Terms and Conditions carefully before accessing or using the Anti-Counterfeiting Solution, Platform, and/or the Services or submitting your personal information to us. If you do not agree with the Privacy Policy, please do not use or access the Anti-Counterfeiting Solution, Platform, and/or the Services.",
                        style: TextStyle(
                            // 
                            //  
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                     
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ), SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Information Collection-What and How?",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "We collect the following personal information about you when you register and use our services using Veots web app, mobile app or any of our platform or services."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "From the Buyers: "
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "•	Name\n•	Entity Name (if applicable)\n•	Contact Phone Number\n•	Contact Email Address\n•	Customer Gender \n•	Customer Date of Birth \n•	Client Purchase history, Purchase Date, Copy of the purchase receipt or invoice.\n•	Enrolment Details: Information related to the enrolment process, program participation, rewards earned, redeemed, or pending.\n•	Preferences: Information related to preferred products, shopping habits, or any preferences specified by you.\n•	Report Details: Information about the suspected fake product(s), including details of the encounter or purchase.\n•	UPI ID, Bank details"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                       Text(
                       "From the Retailers: "
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "•	Name\n•	Entity/shop Name\n•	Address\n•	Contact phone Number\n•	Contact Email address\n•	Location"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                       "From the Manufacturer:  "
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "•	Name\n•	Entity Name\n•	Address\n•	Contact Phone number\n•	Contact Email address\n•	Location\n•	Manufacturer License no\n•	Product Details\n•	Staff Phone number\n•	Staff Email Address\n•	Incorporation Certificate (if applicable)\n•	PAN number (if applicable)\n•	GST Number (if applicable)\n•	When using white labelling services, we may collect:\n   -	Branding Information: Logo, brand identity elements, or other brand-related materials provided for white labelling purposes.\n   -  Contact Information: If applicable, contact details shared for communication related to the white labelling service\n   - 	Bank A/c or Payment Gateway details: If applicable for Cash back services\n•	When using our API services, we may collect:\n  -	Usage Information: Details of API requests, usage patterns, and interactions.\n -	Account Information: If applicable, account credentials, contact details, or any information shared for API access."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "Collection "
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "When you use our Platform as a user or visitor, we shall collect your personal information including but not limited to your identity and demographics such as name, email, phone, location, gender and also some of the sensitive information such as bank UPI id to credit cash backs (if applicable). We also collect products details, shopping behaviour, preferences, device location, browsing history. This provides us with the information to provide you with the services which best suits you. You will have to download our app or log into our app web app or mobile app, in order to start using our Services and you cannot use it anonymously; this is because if you are claiming the product, we would need your product details to block the digital signature of the product. We as a company or our employees would never ask for any password or pin number which is highly confidential, please do not disclose that with anybody. We may track your buying patterns, preferences, and other information that you choose to provide on our Platform. We use this information to do research on our users. We may use your contact number to send you offers and discounts when you use our platform, you are free to unsubscribe to any of these notifications, if you wish not to receive any offers or discounts notifications."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                      Text(
                       "Use"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "We may use your personal information to provide you with the Services including managing and administering the Services. In case of Loyalty/Cashback program, we will use the information for awarding and tracking earned rewards or cashback, analyzing program performance and trends to enhance user experience, communicating program updates, offers, or relevant information. We will use the information for verifying and validating warranty claims, contacting you for warranty-related communication. We may use your buying behaviour, purchases history, device location and the like to help our business partners to understand the market better, enhance user experience, to resolve any disputes, to troubleshoot any problems, to understand the customer choices and to improve the products range in market. We use the information for analyzing aggregated data to derive insights, trends, and patterns for analytical purposes and improving our services. We use the information for analyzing usage patterns to optimize API performance and user experiences. We do not sell any personal information or any data pertaining to you to 3rd party. By consenting to this Privacy Policy, you agree that will be send you promotional emails, messages, SMS, or message related to discounts and like, you may at any time unsubscribe to it at your own discretion by using the unsubscribe link in your email. We use your IP address to identify you and to gather information, we may use this for market research. We may ask for you permission to gain access to your messages, camera , photo gallery, device location information, we use this to scan and verify products, send you messages, block digital signature while you claim the product, find the demographics of where the products are scanned and reported for fakes and the like. We may use the information for investigating and analyzing reported instances of suspected fake products, contacting you for further details or updates regarding the reported products and taking necessary actions as per our policies against reported counterfeit products."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                      Text(
                       "Sharing"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "We would share your data with our affiliates, subsidiaries and our and their respective owners, employees, partners, officers, directors, contractors, agents representatives and the like to provide you the Services offered by Veots such as verification, discounts, cashback, program administration, reporting, trouble shooting, helping you with your queries, investigate fraudulent or illegal activities, facilitate our marketing and advertising activities. We may disclose your personal data/confidential data to government entities or agencies or any other authorised law enforcement agencies if required to do so by law. We might share your personal data in case of amalgamation, restructuring of our company or the like by deleting your account with us and by refraining yourself from using our services, you can also contact us at the contact details below:"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                           SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                        Text(
                       "Consent given by: Retailer."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "Type of Data shared : names, contact details, locations,\n\nUsers with whom data shared : Manufacturers.\n\nPurposes : anti-counterfeiting efforts including for enabling the manufacturers to track the product movement across all the distributors and retailers involved in the supply chain"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                          SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                       Text(
                       "Consent given by: Retailer."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "Type of Data shared : names, contact details, locations,\n\nUsers with whom data shared : Buyer.\n\nPurposes : To enable the buyers to see the movement of the product in the supply chain"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                          SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                       Text(
                       "Consent given by: Manufacturer."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "Type of Data shared : Manufacturer license number, address, and all the details pertaining to product.\n\nUsers with whom data shared : Buyer.\n\nPurposes : To enable the buyers to understand the origin of the product manufactured and to know about the manufacturer and product they are purchasing"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Consent given by: Buyer."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "Type of Data shared : names, contact details, purchase history.\n\nUsers with whom data shared : Manufacturers.\n\nPurposes : enhance product quality, provide support, etc."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Links to Other Sites"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "Veots may contains links to other websites during advertisements, which may collect your personal information. Veots holds no responsibility on this and it is user’s responsibility to read 3rd party privacy policies, terms of use and conditions before clicking on linked websites. "
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                        SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Security Precautions"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "While we take almost caution to protect our users data and secure them, the transmission of information is not 100% secure for reasons beyond our control, however our team would be updating our systems frequently to protect your personal information against any virus or hacking. By using our Services, you accept that there might be certain security risks and you agree to it that your data is not completely secure. Its user’s responsibility to ensure protecting their login password and not share it with anybody to protect their account from misuses. "
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Use of Children Information"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "Our Services can be used by anybody who is 13+. We do not knowingly collect any personal information from children under the age of 13 years, if you have shared any personal information of children under the age of 13 years, you take complete responsibility of it and permit us to use the information in accordance with this Privacy Policy. If you feel you have shared the details of anybody under the age of 13 years, you may go ahead and delete the account or call our customer support for assistance. "
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                        SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Data Retention"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "We shall retain your data for period no longer than it is intended or required for the purpose for which it is collected, or as long as your relationship with us continues. We may retain certain data if bound by legal obligation to comply with regulatory retention requirement by law or as otherwise required to be retained by any applicable law. We may also retain your data anonymously only for research and analytical purposes. On the expiry of above stated periods, as applicable, we will either permanently delete, destroy, or de-identify your personal data. "
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                        SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Transfer of Data"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "We may act as controller or processor depending on the applicable scenarios. For instance, if we collect the data directly from individuals (e.g., customers, retailers), we may determine the purposes for processing (e.g., for our own analytics or marketing), and we will likely act as a data controller. However, if we process the data strictly based on the instructions provided by the manufacturers without determining the purposes or means of processing, we may be considered a data processor in that specific context.\n\nWe hereby inform users that in connection with the provision of Services, personal data may be transferred to and processed in India. By using our Services, you expressly consent to the transfer of your personal data to India, understanding that data protection laws and regulations in India may differ from those in your country of residence. The data transfer to India is primarily for the purposes outlined in our Privacy Policy. We commit to implementing appropriate safeguards and security measures to ensure the protection and confidentiality of transferred data, adhering to applicable data protection laws and regulations."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                        SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Lawful Basis:"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "We process personal data based on one or more lawful bases as defined under applicable data protection laws.\n\n•	Consent: We may process personal data provided by users based on explicit consent obtained for purposes such as account management, service provision, reporting, fraud prevention and communication.\n•	Contractual Necessity: Processing of personal data is necessary for fulfilling contractual obligations, ensuring the provision of anti-counterfeiting solutions and associated services, ensuring access to anti-counterfeiting solutions and associated services\n•	Legitimate Interests: Veots processes relevant data to address legitimate interests, such as improving product security measures or conducting analytics to enhance services, without compromising manufacturers' rights, address legitimate interests, such as analyzing product authenticity reports, providing support, and enhancing service quality for retailers.\n•	Legal Compliance: Data processing may occur to comply with legal obligations applicable to the services provided by Veots ensuring adherence to relevant laws and regulations.\n•	Vital Interests: In exceptional situations involving the protection of vital interests of individuals related to anti-counterfeiting measures, data may be processed to prevent harm or unauthorized use of products.\n•	Contractual Necessity: Processing of personal data is essential for fulfilling contractual agreements between Veots and retailers, ensuring access to anti-counterfeiting solutions and associated services."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                        SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                      "Your Rights"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "We shall take utmost care and responsibility to ensure your personal data we process is accurate and true. However, at any point of time if you feel the data processed is inaccurate, incomplete or not true,  you may contact our customer service to get the data rectified or you may access your account and correct or update you personal information directly using our Platform. You may also delete your account if you wish to stop using our Services, however you can register back when you wish to; unless, we have blocked or blacklisted by finding you guilty or illegal or for breach of our Terms of Use or Privacy Policy or any other reason.\n\nAlso, in accordance with applicable law, you may have the following rights related to your personal data: \b•	The right to access your personal data. \n•	The right to request for erasing your personal data under certain conditions.\n•	The right to restrict processing under certain conditions. That means you have the right to limit the way that we use your personal data. \n•	The right to data portability. You have the right to obtain your personal data from us in a format that makes it easier to reuse your information in another context, and to transmit your personal data to another data controller of your choice.\n•	The right to object to processing. You have the right to object to our processing of your personal information under certain conditions.\n•	The right to revoke your consent any time.\nYou may exercise your rights by contacting us as per stated herein. We will process your requests in accordance with applicable laws. We may verify your identity before fulfilling any of your request. We may also charge any administrative fee as per applicable law and will notify you of the same."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                        SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Consent"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "By using our Services or by providing your personal data you provide us with the consent to collect, use, process, store, disclose your data including but not limited to your sensitive personal data in accordance with Privacy Policy. If you provide us with personal information relating to others, then you take complete responsibility of it and provide us the consent to use the information. Veots and its affiliates, subsidiaries and its and their respective owners, employees, partners, officers, directors, contractors, agents representatives cannot be held responsible for any claims or liabilities related to the same. "
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                        SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Changes to this Privacy Policy"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "We may update this Privacy Policy from time to time if necessary. Its user’s responsibility to check our Privacy policy for periodical changes.  To the extent permitted under the applicable law, your continued use of any of the Services after any change is made in this Privacy Policy will constitute your acceptance of such change. By using any of our Services, you agree to be bound by the updated policy."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                        SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                        "Contact us / Queries",
                        style: TextStyle(
                            
                         fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ), Text(
                        "If you have any query, concerns or complaint in relation to collection or usage of your personal information under this privacy policy, you can write to us on Customersupport@veots.com or call us on 9632123543",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      
                        SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ), Text(
                        "Last updated: December 15, 2023.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ],
                  ),
                  // child: Text("Q. How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2: How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:"),
                ),
              )),],)
          );
        });
    // print('Terms and Conditions clicked!');
  }
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: ((context) => Login(
                      mainLink: widget.Link,
                      location_on: widget.location_on,
                    ))),
            (Route<dynamic> route) => false,
          );

          return true;
        },
        child: SafeArea(
            child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.jpeg'), // <-- BACKGROUND IMAGE
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height * 0.55,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height * 0.4,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(35.0),
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width *
                                          0.05,
                                      left: MediaQuery.of(context).size.width *
                                          0.05),
                                  child: Text(
                                    "Select your Country",
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins Medium",
                                      color: Colors.black,
                                      // fontStyle: FontStyle.italic,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Container(
                                  height: 70,
                                  child: DropdownSearch<String>(
                                    searchBoxStyle: TextStyle(
                                        color: const Color(0xFF4d4c4c),
                                        fontFamily: "Poppins Medium",
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                45),
                                    showSelectedItem: false,
                                    mode: Mode.DIALOG,
                                    searchBoxDecoration: InputDecoration(
                                      fillColor: const Color(0xFFfafafa),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 0,
                                            color: const Color(0xFFfafafa)),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 0,
                                            color: const Color(0xFFfafafa)),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      filled: true,
                                      // fillColor: const Color(0xFF1E1E1E),
                                    ),
                                    dropdownSearchDecoration: InputDecoration(
                                      fillColor: const Color(0xFFfafafa),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 0,
                                            color: const Color(0xFFfafafa)),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 0,
                                            color: const Color(0xFFfafafa)),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      filled: true,
                                      // fillColor: const Color(0xFF1E1E1E),
                                    ),
                                    //to show search box
                                    showSearchBox: true,
                                    // showSelectedItem: true,
                                    //list of
                                    //showSelectedItem:false, items
                                    items: [
                                      "Afghanistan",
                                      "Albania",
                                      "Algeria",
                                      "Andorra",
                                      "Angola",
                                      "Antigua and Barbuda",
                                      "Argentina",
                                      "Armenia",
                                      "Australia",
                                      "Austria",
                                      "Azerbaijan",
                                      "Bahamas",
                                      "Bahrain",
                                      "Bangladesh",
                                      "Barbados",
                                      "Belarus",
                                      "Belgium",
                                      "Belize",
                                      "Benin",
                                      "Bhutan",
                                      "Bolivia",
                                      "Bosnia and Herzegovina",
                                      "Botswana",
                                      "Brazil",
                                      "Brunei",
                                      "Bulgaria",
                                      "Burkina Faso",
                                      "Burundi",
                                      "Cambodia",
                                      "Cameroon",
                                      "Canada",
                                      "Cape Verde",
                                      "Central African Republic",
                                      "Chad",
                                      "Chile",
                                      "China",
                                      "Colombia",
                                      "Comoros",
                                      "Congo (Democratic Republic of the)",
                                      "Congo (Republic of the)",
                                      "Costa Rica",
                                      "Croatia",
                                      "Cuba",
                                      "Cyprus",
                                      "Czech Republic",
                                      "Denmark",
                                      "Djibouti",
                                      "Dominica",
                                      "Dominican Republic",
                                      "East Timor",
                                      "Ecuador",
                                      "Egypt",
                                      "El Salvador",
                                      "Equatorial Guinea",
                                      "Eritrea",
                                      "Estonia",
                                      "Eswatini",
                                      "Ethiopia",
                                      "Fiji",
                                      "Finland",
                                      "France",
                                      "Gabon",
                                      "Gambia",
                                      "Georgia",
                                      "Germany",
                                      "Ghana",
                                      "Greece",
                                      "Grenada",
                                      "Guatemala",
                                      "Guinea",
                                      "Guinea-Bissau",
                                      "Guyana",
                                      "Haiti",
                                      "Honduras",
                                      "Hungary",
                                      "Iceland",
                                      "India",
                                      "Indonesia",
                                      "Iran",
                                      "Iraq",
                                      "Ireland",
                                      "Israel",
                                      "Italy",
                                      "Ivory Coast",
                                      "Jamaica",
                                      "Japan",
                                      "Jordan",
                                      "Kazakhstan",
                                      "Kenya",
                                      "Kiribati",
                                      "Kosovo",
                                      "Kuwait",
                                      "Kyrgyzstan",
                                      "Laos",
                                      "Latvia",
                                      "Lebanon",
                                      "Lesotho",
                                      "Liberia",
                                      "Libya",
                                      "Liechtenstein",
                                      "Lithuania",
                                      "Luxembourg",
                                      "Madagascar",
                                      "Malawi",
                                      "Malaysia",
                                      "Maldives",
                                      "Mali",
                                      "Malta",
                                      "Marshall Islands",
                                      "Mauritania",
                                      "Mauritius",
                                      "Mexico",
                                      "Micronesia",
                                      "Moldova",
                                      "Monaco",
                                      "Mongolia",
                                      "Montenegro",
                                      "Morocco",
                                      "Mozambique",
                                      "Myanmar (Burma)",
                                      "Namibia",
                                      "Nauru",
                                      "Nepal",
                                      "Netherlands",
                                      "New Zealand",
                                      "Nicaragua",
                                      "Niger",
                                      "Nigeria",
                                      "North Korea",
                                      "North Macedonia",
                                      "Norway",
                                      "Oman",
                                      "Pakistan",
                                      "Palau",
                                      "Palestine",
                                      "Panama",
                                      "Papua New Guinea",
                                      "Paraguay",
                                      "Peru",
                                      "Philippines",
                                      "Poland",
                                      "Portugal",
                                      "Qatar",
                                      "Romania",
                                      "Russia",
                                      "Rwanda",
                                      "Saint Kitts and Nevis",
                                      "Saint Lucia",
                                      "Saint Vincent and the Grenadines",
                                      "Samoa",
                                      "San Marino",
                                      "Sao Tome and Principe",
                                      "Saudi Arabia",
                                      "Senegal",
                                      "Serbia",
                                      "Seychelles",
                                      "Sierra Leone",
                                      "Singapore",
                                      "Slovakia",
                                      "Slovenia",
                                      "Solomon Islands",
                                      "Somalia",
                                      "South Africa",
                                      "South Korea",
                                      "South Sudan",
                                      "Spain",
                                      "Sri Lanka",
                                      "Sudan",
                                      "Suriname",
                                      "Sweden",
                                      "Switzerland",
                                      "Syria",
                                      "Taiwan",
                                      "Tajikistan",
                                      "Tanzania",
                                      "Thailand",
                                      "Togo",
                                      "Tonga",
                                      "Trinidad and Tobago",
                                      "Tunisia",
                                      "Turkey",
                                      "Turkmenistan",
                                      "Tuvalu",
                                      "Uganda",
                                      "Ukraine",
                                      "United Arab Emirates",
                                      "United Kingdom",
                                      "United States of America",
                                      "Uruguay",
                                      "Uzbekistan",
                                      "Vanuatu",
                                      "Vatican City (Holy See)",
                                      "Venezuela",
                                      "Vietnam",
                                      "Yemen",
                                      "Zambia",
                                      "Zimbabwe"
                                    ],
                                    label: "Country",
                                    onChanged: (newValue) {
                                      CountryName = newValue;
                                      print(
                                          "COuntry Name assigned to country name variable");
                                      print(CountryName);
                                    },

                                    //show selected item
                                    // selectedItem: "India",
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: checkbox,
                                        onChanged: (value) {
                                           setState(() {
      checkbox = value!;
    });
                                        },
                                      ),
                                   Expanded(child:  Container(
// height: 50,
                                      child:  RichText(
  text: TextSpan(
    text: 'I understand and agree with the ',
    style: TextStyle(fontSize: 10,color: Colors.black),
    children: <TextSpan>[
      TextSpan(
        text: 'Terms and Conditions',
        style: TextStyle(
          color: Color(0xff764af1),
          fontSize: 10,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
             recognizer: TapGestureRecognizer()
                ..onTap=handleTermsAndConditionsClick,
                  // print('Terms and Conditions clicked!');
                
      ),
      TextSpan(text: ' and '),
      TextSpan(
        text: 'Privacy Policy',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xff764af1),
          decoration: TextDecoration.underline,
        fontSize: 10,
        
        ),
         recognizer: TapGestureRecognizer()
                ..onTap=handlePrivacyPoliciesClick
      ),
      TextSpan(text: ' and agree to comply with them.'),
    ],
  ),
)
                                    ))
                                      
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular((4.0)),
                                            color: Colors.red.shade500),
                                        child: MaterialButton(
                                          // color: Colors.amber,
                                          onPressed: () {
                                            if(checkbox==false)
                                            {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                        "Error",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      content: Text(
                                                          'Please agree with the Terms and Conditions and Privacy Policy to proceed.'),
                                                    );
                                                  });
                                              
                                            }
                                            else if (CountryName == null) {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                        "Error",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      content: Text(
                                                          'Please provide your country to proceed'),
                                                    );
                                                  });
                                            } else {
                                              if (CountryName == "India") {
                                                (Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Register_with_phone_(
                                                            Link: widget.Link,
                                                            location_on: widget
                                                                .location_on,
                                                          )),
                                                ));
                                              } else {
                                                (Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Register_with_Email_(
                                                            Link: widget.Link,
                                                            location_on: widget
                                                                .location_on,
                                                            Country:
                                                                CountryName!
                                                                    .toString(),
                                                          )),
                                                ));
                                              }
                                            }
                                            // ROUTE TO EMAIL VERIFICATION
                                          },
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                              "Next",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  // fontWeight: FontWeight.bold,
                                                  fontFamily: "Poppins Medium"),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                //
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Container(
                                      // color: Colors.blue,
                                      // width: MediaQuery.of(context).size.width / 3.0,
                                      // height:20 ,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          "Already have an account?",
                                          style: TextStyle(
                                              color: Colors.black,
                                              //  fontWeight: FontWeight.w900,
                                              fontFamily: "Poppins Medium"),
                                        ),
                                      ),
                                    )),
                                Container(
                                  // color: Colors.blue,
                                  // width: MediaQuery.of(context).size.width / 2.0,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  // margin: EdgeInsets.only(
                                  //   right: MediaQuery.of(context).size.width * 0.1
                                  //   ,
                                  //   left: MediaQuery.of(context).size.width * 0.1),

                                  child: TextButton(
                                      // color: Colors.amber,
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: ((context) => Login(
                                                    mainLink: widget.Link,
                                                    location_on:
                                                        widget.location_on,
                                                  ))),
                                          (Route<dynamic> route) => false,
                                        );
                                      },
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          "Log In",
                                          style: TextStyle(
                                            // fontWeight: FontWeight.w900,
                                            fontFamily: "Poppins Medium",
                                            color: const Color(0xFF1a0bbe),
                                            // fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            )) // comment section & recommended videos
          ],
        )));
  }

  showMenu() {
    showModalBottomSheet(
        // constraints: BoxConstraints(m),
        shape: const RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15.0),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [Text("SAdsads")],
                )),
          );
        });
  }

  Widget buildFittedWidthText(String text) => Container(
        // color: Colors.blue,
        width: MediaQuery.of(context).size.width / 2.5,
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
  Widget buildFittedWidthText2(String text) => Container(
        // color: Colors.blue,
        width: MediaQuery.of(context).size.width / 8,
        child: FittedBox(
          child: Text(text),
        ),
      );
  Widget buildFittedWidthText3(String text) => Container(
        // color: Colors.blue,
        width: MediaQuery.of(context).size.width / 8,
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
}
//

class CountryDetail extends StatefulWidget {
  final Country? country;

  CountryDetail({Key? key, required this.country}) : super(key: key);
  @override
  _CountryDetailState createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {
  Widget dataWidget(String key, int value) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$key:'),
          SizedBox(
            width: 16,
          ),
          Flexible(
            child: Text(
              '$value',
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          alignment: Alignment.center,
          child: Text(
            widget.country!.name,
            style: TextStyle(fontSize: 40),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        dataWidget('Population:', widget.country!.population),
        dataWidget('Density', widget.country!.density),
        dataWidget('Land Area (in Km\'s)', widget.country!.landArea)
      ],
    );
  }
}

class Country {
  final String name;
  final int population;
  final int landArea;
  final int density;
  Country(this.name, this.population, this.landArea, this.density);

  Country.init()
      : name = '',
        population = 0,
        landArea = 0,
        density = 0;

  Country.fromMap(Map<String, Object> map)
      : name = map['country'] as String,
        population = map['population'] as int,
        landArea = map['land Area'] as int,
        density = map['density'] as int;
}

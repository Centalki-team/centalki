import 'package:flutter/material.dart';

import '../../../../../../base/define/styles.dart';
import '../../../../../../base/define/theme.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        //backgroundColor: AppColor.background,
        appBar: AppBar(
          //backgroundColor: AppColor.background,
          title: const Text(
            'Terms and Conditions',
            style: TextStyle(
              fontSize: headlineSmallSize,
              fontWeight: headlineSmallWeight,
              color: AppColor.mainColor1,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColor.mainColor1),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Terms and Conditions',
                  style: TextStyle(
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """Your use of this application is subject to these Terms of Conditions. By accessing or utilizing this application, you agree to these Terms and Conditions. These terms may be changed from time to time by posting here, so please check periodically to ensure you understand the terms covering your use of the application.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing8),
                Text(
                  """If you purchase, subscribe to or register for a trial of our products and services, you will be asked to accept additional terms governing your use of such products and services.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing8),
                Text(
                  """We are owned and operated by a small group called Centalki Team. The terms "we" and "our" as used herein refer to such group of people.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing12),
                Text(
                  'What we provide',
                  style: TextStyle(
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """Centalki is an application that allows you to practice speaking English 1-1 with a foreign teacher. Unlike other products on the market, our services allow you to improve both your speaking skill and vocabulary with reasonable fees. Uses of the products and services offered through the Centalki Application will be subject to additional terms and conditions to which you will be given access at the time of purchase or signup.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing8),
                Text(
                  """Please note that, other than purely billing (i.e., credit card numbers) and contact information, other information you post to the application may become publicly viewable. Therefore, you should not submit information that you consider confidential.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing12),
                Text(
                  'Who Our Services Are for',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """Use of the Centalki available to all persons age 13 and over who agree to these Terms and Conditions. They may not be used for purposes not in accordance with local law. Allowable Content and Use Our user participation areas (including reviews, comment and reply areas, and posting from other social media sites) are an easy way to share your personal activities, thoughts and comments on others' activities relating to the Centalki and our services. We want to keep it a safe, fun, friendly place, and that means a few rules. You may NOT:""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ • Post unlawful, harmful, or obscene content.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ • Forge headers or otherwise impersonate someone.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ • Post content you do not have the right to transmit.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ • Post content that infringes on trademarks or copyrights.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ • Post viruses or malicious scripts.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ • Post spam or link bait.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ • Stalk or collect data about others.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ • Crawl content without permission.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing12),
                Text(
                  'Rights Reserved',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """We reserve the right to filter any content posted and remove objectionable posts in our sole discretion without notice. We may also deactivate accounts for users who violate the Terms and Conditions. We respect your copyright. You retain full copyright of any original content that you send us. To protect your privacy and security, we may take reasonable steps to verify your identity mainly through your email address. Please always use a valid and up-to-date e-mail address.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing8),
                Text(
                  """In case you want to cancel your subscription, you will not receive a refund, but will continue to have access at the remaining learning hours until they are all used up or your account is deactivated.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing12),
                Text(
                  'User Submissions',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """Materials, including but not limited to text, data, images, graphics, photos, audio, audiovisual, videos, and content of any nature provided by us or by you or other users of our products and services to the Centalki App is owned by the party contributing such content, subject to our rights to display and use such content as provided herein.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing8),
                Text(
                  """When using the Centalki App, you may be exposed to User Submissions from a variety of sources (i.e., comments and reviews) we are not responsible for the accuracy, usefulness, safety, or intellectual property rights of or relating to such User Submissions, which may be inaccurate, infringing, offensive, indecent or objectionable.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing8),
                Text(
                  """You understand that all information posted through our services is the sole responsibility of the person from which such content originated and that we are not and will not be liable for any errors or omissions in any content.  Furthermore, we cannot guarantee the identity of any other users you may interact with while using your app. Additionally, we cannot and do not guarantee the authenticity or accuracy of any data that users may provide about themselves or relationships they may describe.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing12),
                Text(
                  'Trademarks',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """Centalki and the Centalki logo, Centalki Mobile, Centalki Web, and the logos for each, and other logos and names relating to our products and services are trademarks of Centalki Team. You agree not to display or use these trademarks in any manner without our prior written permission.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing12),
                Text(
                  'Miscellaneous',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """You will not attempt to reverse engineer, decompile or otherwise reconstruct our software code, whether the code relating to our websites or our products and services. You agree not to link to Centalki in a manner designed to represent or imply that any of our products or services are yours or another third party's.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing12),
                Text(
                  'End User License Agreement',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: headlineMediumSize,
                    fontWeight: headlineMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """By registering, accessing or using Centalki App and Centalki Web (a "Software Application"), you are acknowledging that you are bound by the terms and conditions in this End User License Agreement (this "EULA"). Please review these carefully before accepting and utilizing our products or services.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing12),
                Text(
                  'Additional Software Applications',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """This EULA also applies to any additional widgets, add-ons or other applications provided by the Centalki Team for use with the Software Application(s) you are subscribing for, which shall also be considered Software Application(s) hereunder. Such additional Software Application(s) may also have additional terms and conditions set forth on the applicable webpage, form or documentation.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing12),
                Text(
                  'User Account and Service Security',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """Use of Software Applications is available only to persons who can enter into legally binding contracts under applicable law. If you are a minor, i.e. under the age of 18 years, not competent or otherwise do not have the capacity to enter into a legally binding contract without the consent or assistance of another person, you may use the application and/or the website only under the supervision of a parent or legal guardian, as applicable, who agrees to be bound by this EULA.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing12),
                Text(
                  'License to Use',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """Subject to compliance with this EULA (including payment of applicable fees), Developer grants you a limited, non-transferable, revocable, non-exclusive, non-sub-licensable license to access the Software Application(s) for which you have paid, through the provided user interfaces, to access your User Data and to utilize such Software Application(s) via the user interfaces provided by Developer to assist in practicing speaking English with a foreign teacher.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing12),
                Text(
                  'Account and Password',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """As a registered user of the Software Application(s), you may receive or establish an account ("Account"). You are solely responsible for maintaining the confidentiality and security of your Account. You should not reveal your Account information to anyone else, and must not use, or attempt to access or use anyone else’s Account. You are entirely responsible for all activities that occur on or through your Account, and you agree to immediately notify the Developer of any unauthorized use of your Account or any other breach of security. Developer shall not be responsible for any losses arising out of unauthorized use of your Account.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing12),
                Text(
                  'Content and Certain Restrictions',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """By submitting, entering or linking to any information, data, text, photographs, graphics, messages or other materials, you are representing to the Developer that you have the right and authority to submit, enter or link to such content without violation of law or infringement of any third party’s intellectual property rights or privacy rights. Additionally, any such content submitted by you through the Software Application(s) constitutes a representation by you to the Developer that you have the right to display, play back and/or perform such content publicly. By submitting any such information, you are granting us the rights to publish such information to our mobile application and website.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing8),
                Text(
                  """You may not use the Software Application(s) for any unlawful purpose, including infringement of the copyrights or other proprietary rights of others, or in any illegal manner or for creation or distribution of illegal content. Without limiting the foregoing, you may not use the Software Application(s) for any of the following purposes:""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ • Disseminating any unlawful, harassing, libelous, abusive, threatening, harmful, vulgar, obscene, or otherwise objectionable material.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ • Transmitting material that encourages conduct that constitutes a criminal offense, results in civil liability or otherwise breaches any relevant laws, regulations or code of practice.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ • Gaining unauthorized access to other computer systems.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ • Interfering with any other person's use or enjoyment of the application.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ • Breaching any applicable laws.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ • Interfering or disrupting networks or services connected to the application""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ • Making, transmitting or storing electronic copies of materials protected by copyright without the permission of the owner, including using or providing images or text for which you do not own or have sufficient use rights to the copyright for such materials.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ • You agree to indemnify Developer and its licensors for any and all claims arising from any violation by you of the terms of this EULA.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing12),
                Text(
                  'Disconnection',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """Upon joining a learning session through our Centalki App, you may encounter disconnections in between the 30-minute video call session. This problem may either occur on your side as well as the teacher's side. Under such situations:""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ • If you are the one who disconnected, you will have a 5-minute time period to rejoin the current session. Upon reconnecting successfully, the session will continue as usual. If you are unable to rejoin, the session will end and the system will count it as you have finished a session.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ • If the teacher is the one who disconnected, they will have a 1-minute time period to rejoin the current session. Upon reconnecting successfully, the session will continue as usual. If they are unable to rejoin, the system will find another teacher for you so that you may continue your learning processes.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing12),
                Text(
                  'Loss of Content; Security',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """The Developer utilizes industry standard reliability and security measures in an attempt to protect and preserve your data. However, due to the relative insecurity of any information which is transmitted over the internet (and over wireless networks or intranets in connection with transmission to or from the internet), stored on servers which are accessible via the internet and other means, it is impossible to guarantee complete security. Additionally, if our servers or the servers of third party providers fail or become corrupt, we may lose and be unable to retrieve data you have submitted via the Software Application. Additionally, if your account is deactivated for any reason, your content within the Software Application will be lost and/or inaccessible.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing12),
                Text(
                  'Payment Information',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """You shall make necessary payments using your credit cards, internet banking accounts or any other recognized electronic/digital modes of payment through Developer’s or one of its payment partner’s websites. Developer currently uses a third party payment processor and additional terms and conditions will apply to your transactions with such processor.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing8),
                Text(
                  """You agree, understand and confirm that the credit card details provided by you will be correct and accurate and you are using a credit card that you are legally authorized to use for this purpose. We will not be liable for any credit card fraud, abuse or unauthorized use by you or others. The liability to use a card fraudulently will be on the user and the onus to ‘prove otherwise’ shall be exclusively on the user.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing8),
                Text(
                  """The said information will not be utilized and shared by us with any third parties other than our payment service unless required by law, regulation or court order.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing8),
                Text(
                  """In consideration of the license granted pursuant to this EULA, you agree to pay the Developer, the Fees as set forth in the website or other location from which you are subscribing for the Software Application(s) and you agree that Developer or its payment processor may charge such amounts against the account information provided by you. Developer reserves the right to amend or revise the Fees for Software Applications from time to time. Licensee shall be responsible to pay the applicable taxes, i.e. any and all federal, foreign, state or local sales, use and excise taxes, duties, levies, and any other assessments in the nature of taxes however designated on the purchase/license and/or use of the Software Applications, including without limitation VAT if applicable to your license/purchase and use of the Software Application(s). It is understood and agreed that the Fees are exclusive of such taxes, duties and other assessments unless expressly stated otherwise.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing12),
                Text(
                  'License Restrictions',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """You shall NOT:""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ (a) Modify, adapt, decompile, disassemble, extract, hack, exploit unauthorized access to, reverse engineer any software Applications or otherwise derive the source code and any other ideas, algorithms, concepts or procedures from the Software Application(s) unless and to the extent expressly permitted by applicable statutory law""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ (b) Create derivative works based on any Software Application(s)""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ (c) Make copies of Software Application(s)""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ (d) Allow a third party to use or have access to any Software Application(s)""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ (e) Sublicense to any third party, Software Application(s), or any part thereof""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ (f) Rent, lease or provide services to or for others via or based upon the Software Application(s). Any copy of Software Application(s) made by you, including any partial copy, is the property of the Developer.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing12),
                Text(
                  'Third Party Licenses',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """Other third party software or technology that may be distributed together with the Software Application(s) will be subject to you explicitly accepting a license agreement with that third party. Developer is not responsible for any non-performance or breach of any contract entered into between you and the third party. You release and indemnify the Developer and/or any of its officers and representatives from any cost, damage, liability or other consequence of any of the actions of third-party providers and specifically waive any claims that you may have in this behalf under any applicable law. Developer may, but is not obligated, to add and make available additional features or functions, programming fixes, updates, upgrades or versions to the Software Application(s) ("Updates"). You may have to enter into a new version of this EULA if you want such Updates.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing12),
                Text(
                  'Developer\'s Confidential Information',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ 1. You acknowledge and agree that ownership of and title in and to all intellectual property rights, including patent, trademark, service mark, copyright, and trade secret rights, in the Software Application(s) are and shall remain with the Developer. You are acquiring only the right to use the Software Application(s) under this EULA and you are not acquiring any ownership rights or title in or to the Software Application(s) or any copy thereof, including without limitation in or to any copyright or other proprietary rights in the Software Application(s), either express or implied.""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ 2. You shall not remove any proprietary, copyright, trademark, or service mark legend from the Software Application(s).""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """ 3. All modifications and extensions to the Software Application(s) shall be considered part of the Software Application(s).""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing12),
                Text(
                  'Termination',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  """The rights granted under this EULA to you are effective until terminated by us upon your breach of this EULA or end of any period(s) for which Fees have been paid (except as otherwise provided above). Developers may terminate your rights hereunder by denying access to Software Application(s), or by written notice including by electronic transmission to an email address or device indicated by you. Developer’s rights and your representations and covenants under this EULA shall survive any termination or expiration hereof or your rights hereunder. Upon termination of your rights, you shall immediately cease use of the Software Application(s). You may not be able to retrieve any data you have submitted to us, including via the Software Application(s).""",
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
              ],
            )),
      );
}

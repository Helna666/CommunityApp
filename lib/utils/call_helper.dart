import 'package:url_launcher/url_launcher.dart';


class CallHelper {


  static Future<void> makeCall(String phoneNumber) async {


    final Uri url = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );


    if(await canLaunchUrl(url)){

      await launchUrl(url);

    }

  }

}
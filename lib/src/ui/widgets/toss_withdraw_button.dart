import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// supertoss://send?amount=0&bank=대구은행&accountNo=77802467094&origin=qr
class TossWithdrawButton extends StatelessWidget {
  static const String tossPrefixUrl = "supertoss://send";

  final int amount;
  final String bank;
  final String account;

  const TossWithdrawButton(
      {Key? key,
      required this.bank,
      required this.account,
      required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        String deepLink =
            "$tossPrefixUrl?amount=$amount&bank=$bank&accountNo=$account&origin=qr";
        final url = Uri.parse(deepLink);
        if (await canLaunchUrl(url)) {
          launchUrl(
            url,
            mode: LaunchMode.externalNonBrowserApplication,
          );
        }
      },
      child: Text(
        "토스 송금하기",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

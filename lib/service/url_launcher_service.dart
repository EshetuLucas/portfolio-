import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  Future<void> openLink(String url) async {
    final Uri linkUri = Uri.parse(url);
    if (await canLaunchUrl(linkUri)) {
      await launchUrl(linkUri);
    } else {
      throw UrlLauncherServiceException('Could not launch $url');
    }
  }

  Future<void> sendEmail(String? email) async {
    if (email == null || email.isEmpty) {
      return;
    }
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw UrlLauncherServiceException('Could not launch email client');
    }
  }

  Future<void> makePhoneCall(String? phoneNumber) async {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return;
    }
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> sendSMS(String? phoneNumber,
      {Map<String, String> query = const {}}) async {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return;
    }
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      query: query.isNotEmpty
          ? encodeQueryParameters(
              query,
            )
          : null,
    );
    await launchUrl(smsUri);
  }

  Future<void> openWhatsapp(String? phoneNumber) async {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return;
    }

    final whatsappUrl = Uri.parse('https://wa.me/$phoneNumber');

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl);
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}

class UrlLauncherServiceException {
  final String exception;

  UrlLauncherServiceException(this.exception);

  @override
  String toString() {
    return '''
    UrlLauncherServiceException: $exception
    ''';
  }
}

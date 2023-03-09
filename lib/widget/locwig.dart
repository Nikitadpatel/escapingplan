import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class locview extends StatefulWidget {
  final String? data;
  locview({Key? key, this.data}) : super(key: key);

  @override
  State<locview> createState() => _locviewState();
}

class _locviewState extends State<locview> {
  String? encodedURl;

  String? url;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest:
            URLRequest(url: Uri.parse(Uri.encodeFull(widget.data.toString()))),
        androidOnGeolocationPermissionsShowPrompt:
            (InAppWebViewController controller, String origin) async {
          return GeolocationPermissionShowPromptResponse(
              origin: origin, allow: true, retain: true);
        },
      ),
    );
  }
}

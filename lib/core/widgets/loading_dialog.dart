import 'package:flutter/material.dart';

class LoadingDialog {
  static void show(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false, // prevent closing by tapping outside
      builder: (ctx) {
        return WillPopScope(
          onWillPop: () async => false, // disable back button
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 8,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 18.0),
              child: _LoadingContent(message: message),
            ),
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}

class _LoadingContent extends StatelessWidget {
  final String? message;

  const _LoadingContent({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = message ?? "Loading...";
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Nice spinner
        const SizedBox(
          width: 28,
          height: 28,
          child: CircularProgressIndicator(
            strokeWidth: 3.0,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16.0, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

Future<dynamic> showAppDialog(BuildContext context, Widget dialog,
    {bool? dismissible}) async {
  var result = await showModal(
      context: context,
      configuration: FadeScaleTransitionConfiguration(
          barrierDismissible: dismissible ?? true,
          transitionDuration: Duration(milliseconds: 500)),
      builder: (context) => dialog);
  return result;
}

extension Dialogs on BuildContext {
  closeDialog({Object? data}) {
    Navigator.of(this).pop(data);
  }

  showLoadingDialog() {
    showAppDialog(this, LoadingWidget());
  }
}

class LoadingWidget extends StatelessWidget {
  final Color? backgroundColor;

  const LoadingWidget({super.key, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircularProgressIndicator(),
            ),
            //Text(AppLocalizations.of(context)!.translate("loading"),style: Theme.of(context).textTheme.bodyText1?.copyWith(color: AppTheme.appSwatch),)
          ],
        ),
      ),
    );
  }
}

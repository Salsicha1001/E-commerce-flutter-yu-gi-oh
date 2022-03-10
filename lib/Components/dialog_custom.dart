import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';

class DialogsCustom {
  showDialogAlert(context, titleMsg, descMsg) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.warning,
      title: titleMsg,
      text: descMsg,
    );
  }

  showAlertSucess(context, sucessMsg) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      text: sucessMsg,
      autoCloseDuration: const Duration(seconds: 4),
    );
  }


}

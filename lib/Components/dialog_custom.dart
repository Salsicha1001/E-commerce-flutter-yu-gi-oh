import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogsCustom {
  showDialogAlert(context, titleMsg, descMsg) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.warning,
      title: titleMsg,
      text: descMsg,
    );
  }

  showDialogError(context, titleMsg, descMsg) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.error,
      title: titleMsg,
      text: descMsg,
    );
  }

  showAlertErro(context, errMsg) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.error,
      title: 'Oops...',
      text: errMsg,
    );
  }

  showAlertSucessRedirectMenu(context, sucessMsg) {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        title: 'Sucesso',
        text: sucessMsg,
        confirmBtnText: "OK",
        onConfirmBtnTap: () {
          Navigator.of(context).pushNamed('/');
        });
  }

  showAlertSucessCart(context) {
    CoolAlert.show(
        context: context,
        title: 'Aonde deseja ir?',
        type: CoolAlertType.confirm,
        confirmBtnText: "Home",
        onConfirmBtnTap: () {
          Navigator.of(context).popAndPushNamed('/');
        },
        cancelBtnText: 'Voltar',
        onCancelBtnTap: () {
          Navigator.of(context).pop();
        });
  }
}

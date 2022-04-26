import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadCustom {
  openLoadMsg(string) {
    EasyLoading.show(
      status: string,
      maskType: EasyLoadingMaskType.black,
    );
  }

  closeLoad() {
    EasyLoading.dismiss();
  }


}

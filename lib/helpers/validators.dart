import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

bool isEmail(String string) {
  // Null or empty string is invalid
  if (string == null || string.isEmpty) {
    return false;
  }

  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(string)) {
    return false;
  }
  return true;
}

Map<String, dynamic>? requiredCPF(AbstractControl<dynamic> control) {
  return GetUtils.isCpf(control.value.toString())
      ? null
      : {'CPF inválido': true};
}

Map<String, dynamic>? requiredPhone(AbstractControl<dynamic> control) {
  return GetUtils.isPhoneNumber(control.value.toString())
      ? null
      : {'Número inválido': true};
}

ValidatorFunction mustMatch(String controlName, String matchingControlName) {
  return (AbstractControl<dynamic> control) {
    final form = control as FormGroup;

    final formControl = form.control(controlName);
    final matchingFormControl = form.control(matchingControlName);

    if (formControl.isNotNull && matchingFormControl.isNotNull) {
      if (formControl.value != matchingFormControl.value) {
        matchingFormControl.setErrors({'Senhas não compatíveis': true});
        // force messages to show up as soon as possible
        matchingFormControl.markAsTouched();
      } else {
        matchingFormControl.removeError('Senhas não compatíveis');
      }
    }
    return null;
  };
}

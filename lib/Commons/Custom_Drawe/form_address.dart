// import 'package:brasil_fields/brasil_fields.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_ecommerce/helpers/cep_find.dart';
// import 'package:flutter_ecommerce/model/address.dart';
// import 'package:flutter_ecommerce/services/authtenticador-service.dart';
// import 'package:reactive_forms/reactive_forms.dart';

// class AddressForm extends StatefulWidget {
//   var user;
//   AddressForm({this.user});

//   @override
//   _AddressFormState createState() => _AddressFormState();
// }

// class _AddressFormState extends State<AddressForm> {
//   final address_user = FormGroup({
//     'cep': FormControl<String>(validators: [Validators.required]),
//     'city': FormControl<String>(validators: [Validators.required]),
//     'complement': FormControl<String>(),
//     'district': FormControl<String>(validators: [Validators.required]),
//     'number_address': FormControl<String>(validators: [Validators.required]),
//     'state': FormControl<String>(validators: [Validators.required]),
//     'street': FormControl<String>(validators: [Validators.required]),
//   });

//   void _showDialog() {
//     EasyLoading.dismiss();
//     FocusManager.instance.primaryFocus?.unfocus();
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(15.0))),
//           contentPadding: const EdgeInsets.only(top: 10.0),
//           title: const Text(
//             "Erro na Busca de CEP",
//             textAlign: TextAlign.center,
//           ),
//           content: const Text("O CEP digitado não e valido",
//               textAlign: TextAlign.center),
//           actions: <Widget>[
//             // define os botões na base do dialogo
//             TextButton(
//               child: const Text("Fechar"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   _callViaCep(String cep) {
//     EasyLoading.show(
//       status: 'Procurando...',
//       maskType: EasyLoadingMaskType.black,
//     );
//     ViaCepService.fetchCep(cep: UtilBrasilFields.removeCaracteres(cep)).then(
//       (value) => {
//         setState(() {
//           if (value != null) {
//             address_user.control('cep').updateValue(value.cep);
//             address_user.control('city').updateValue(value.city);
//             address_user.control('district').updateValue(value.district);
//             address_user.control('state').updateValue(value.state);
//             address_user.control('street').updateValue(value.street);
//             print(address_user.value);
//             EasyLoading.dismiss();
//           } else {
//             return _showDialog();
//           }
//         })
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ReactiveForm(
//       formGroup: address_user,
//       child: (Column(
//         children: [
//           const SizedBox(height: 20),
//           const Text("Endereço para Entrega",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//           TextFormField(
//             decoration: const InputDecoration(hintText: "CEP"),
//             keyboardType: TextInputType.number,
//             inputFormatters: [
//               FilteringTextInputFormatter.digitsOnly,
//               CepInputFormatter(),
//               LengthLimitingTextInputFormatter(10)
//             ],
//             onChanged: (cep) {
//               if (cep.length == 10) {
//                 FocusManager.instance.primaryFocus?.unfocus();
//                 _callViaCep(cep);
//               }
//             },
//           ),
//           ReactiveTextField(
//             decoration: const InputDecoration(hintText: "Rua"),
//             formControlName: 'street',
//             keyboardType: TextInputType.streetAddress,
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
//                   child: ReactiveTextField(
//                     decoration: const InputDecoration(hintText: "Número"),
//                     keyboardType: TextInputType.number,
//                     formControlName: 'number_address',
//                     validationMessages: (control) => {
//                       ValidationMessage.required: 'Esse campo é obrigatorio',
//                     },
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                   child: ReactiveTextField(
//                     decoration: const InputDecoration(hintText: "Bairro"),
//                     keyboardType: TextInputType.text,
//                     formControlName: 'district',
//                     validationMessages: (control) => {
//                       ValidationMessage.required: 'Esse campo é obrigatorio',
//                     },
//                   ),
//                 ),
//               )
//             ],
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
//                   child: ReactiveTextField(
//                     decoration: const InputDecoration(hintText: "Cidade"),
//                     keyboardType: TextInputType.text,
//                     formControlName: 'city',
//                     validationMessages: (control) => {
//                       ValidationMessage.required: 'Esse campo é obrigatorio',
//                     },
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                   child: ReactiveTextField(
//                     decoration: const InputDecoration(hintText: "Estado"),
//                     keyboardType: TextInputType.text,
//                     formControlName: 'state',
//                     validationMessages: (control) => {
//                       ValidationMessage.required: 'Esse campo é obrigatorio',
//                     },
//                   ),
//                 ),
//               )
//             ],
//           ),
//           MySubmitButton()
//         ],
//       )),
//     );
//   }
// }

// class MySubmitButton extends StatelessWidget {
//   MySubmitButton({user});
//   @override
//   Widget build(BuildContext context) {
//     final form = ReactiveForm.of(context);
//     void _saveUser() {
//       if (form!.valid) {
//         Address address = Address(
//             street: form.findControl('street')!.value,
//             district: form.findControl('district')!.value,
//             city: form.findControl('city')!.value,
//             state: form.findControl('state')!.value,
//             number_address: form.findControl('number_address')!.value,
//             cep: form.findControl('cep')!.value);
//         // print(address.toString());
//         List<Address> address_user=[];
//         address_user.add(address);
//       }
//     }

//     return ElevatedButton(
//       child: const Text('Salvar'),
//       onPressed: form!.valid ? _saveUser : null,
//     );
//   }
// }

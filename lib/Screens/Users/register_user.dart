import 'dart:async';
import 'dart:developer';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/Components/dialog_custom.dart';
import 'package:flutter_ecommerce/Components/load_custom.dart';
import 'package:flutter_ecommerce/helpers/cep_find.dart';
import 'package:flutter_ecommerce/helpers/validators.dart';
import 'package:flutter_ecommerce/model/address.dart';
import 'package:flutter_ecommerce/model/register_user.dart';
import 'package:flutter_ecommerce/model/user_login.dart';
import 'package:flutter_ecommerce/services/authtenticador-service.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegisterUser extends StatefulWidget {
  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final formUser = FormGroup({
    'name':
        FormControl<String>(validators: [Validators.required], value: 'Teste'),
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
        value: 'Teste@teste.com'),
    'cpf': FormControl<String>(validators: [
      requiredCPF,
    ], value: '114.969.296-08'),
    'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(6)],
        value: 'felipe1001'),
    'confirmPassword': FormControl<String>(
        validators: [Validators.required], value: 'felipe1001'),
    'phone': FormControl<String>(
        validators: [requiredPhone], value: '(00) 0000-0000'),
    'typeUser': FormControl<int>(value: 1),
  }, validators: [
    mustMatch('password', 'confirmPassword')
  ]);
  final address = FormGroup({
    'cep': FormControl<String>(validators: [Validators.required]),
    'city': FormControl<String>(validators: [Validators.required]),
    'district': FormControl<String>(validators: [Validators.required]),
    'number_address': FormControl<String>(validators: [Validators.required]),
    'state': FormControl<String>(validators: [Validators.required]),
    'street': FormControl<String>(validators: [Validators.required]),
  });

  void _showDialog() {
    LoadCustom().closeLoad();

    FocusManager.instance.primaryFocus?.unfocus();
    DialogsCustom().showDialogAlert(
        context, "Erro na Busca de CEP", "O CEP digitado não e valido");
    setState(() {
      address.control('cep').updateValue('');
      address.control('city').updateValue('');
      address.control('district').updateValue('');
      address.control('state').updateValue('');
      address.control('street').updateValue('');
      LoadCustom().closeLoad();
      return;
    });
  }

  Future<void> _saveUser() async {
    LoadCustom().openLoadMsg("Salvando....");
    FocusManager.instance.primaryFocus?.unfocus();
    if ((!formUser.errors.isEmpty)) {
      LoadCustom().closeLoad();

      DialogsCustom().showDialogAlert(context, 'Erro de Cadastro',
          'Preencha todos os campos para concluir o cadastro');

      return;
    } else {
      if (!address.errors.isEmpty) {
        LoadCustom().closeLoad();

        DialogsCustom().showDialogAlert(context, 'Erro de Cadastro',
            'Preencha todos os campos para concluir o cadastro');
        return;
      }

      Address userAddress = Address(
          street: address.findControl('street')!.value,
          district: address.findControl('district')!.value,
          city: address.findControl('city')!.value,
          state: address.findControl('state')!.value,
          number_address: address.findControl('number_address')!.value,
          cep: address.findControl('cep')!.value);
      List<Address> address_user = [];
      address_user.add(userAddress);
      UserRegister user = UserRegister(
        name: formUser.findControl('name')!.value,
        email: formUser.findControl('email')!.value,
        phone: formUser.findControl('phone')!.value,
        password: formUser.findControl('password')!.value,
        cpf: formUser.findControl('cpf')!.value,
        address_user: address_user,
      );
      var response = await UserService().registerUserAdd(user, context);
      LoadCustom().closeLoad();
      if (response.contains('CPF')) {
        formUser.control('cpf').updateValue('');
        formUser.control('cpf').markAsTouched();  
        return;
      }
      UserLogin login = UserLogin(user.email, user.password);
      UserService().loginUser(login, context);
    }
  }

  _callViaCep(String cep) {
    LoadCustom().openLoadMsg("Procurando CEP....");
    ViaCepService.fetchCep(cep: UtilBrasilFields.removeCaracteres(cep)).then(
      (value) => {
        setState(() {
          if (value != null) {
            address.control('cep').updateValue(value.cep);
            address.control('city').updateValue(value.city);
            address.control('district').updateValue(value.district);
            address.control('state').updateValue(value.state);
            address.control('street').updateValue(value.street);
            LoadCustom().closeLoad();
          } else {
            return _showDialog();
          }
        })
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Usuários"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ReactiveForm(
            formGroup: formUser,
            child: ListView(
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.all(16),
              shrinkWrap: false,
              children: [
                const Text("Dados Pessoais",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ReactiveTextField(
                  decoration: const InputDecoration(hintText: "Nome Completo"),
                  keyboardType: TextInputType.text,
                  formControlName: 'name',
                  validationMessages: (control) => {
                    ValidationMessage.required: 'Esse campo é obrigatorio',
                  },
                ),
                ReactiveTextField(
                  decoration: const InputDecoration(hintText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  formControlName: 'email',
                  validationMessages: (control) => {
                    ValidationMessage.required: 'Esse campo é obrigatorio',
                    ValidationMessage.email: 'Insira um email valido',
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: ReactiveTextField(
                          decoration: const InputDecoration(hintText: "Número"),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter()
                          ],
                          formControlName: 'phone',
                          validationMessages: (control) => {
                            ValidationMessage.required:
                                'Esse campo é obrigatorio',
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: ReactiveTextField(
                          decoration: const InputDecoration(hintText: "CPF"),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CpfInputFormatter()
                          ],
                          formControlName: 'cpf',
                          validationMessages: (control) => {
                            ValidationMessage.required:
                                'Esse campo é obrigatorio',
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: ReactiveTextField(
                          decoration: const InputDecoration(hintText: "Senha"),
                          obscureText: true,
                          formControlName: 'password',
                          validationMessages: (control) => {
                            ValidationMessage.required:
                                'Esse campo é obrigatorio',
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: ReactiveTextField(
                          decoration: const InputDecoration(
                              hintText: "Repita sua senha"),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          formControlName: 'confirmPassword',
                          validationMessages: (control) => {
                            ValidationMessage.required:
                                'Esse campo é obrigatorio',
                          },
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                ReactiveForm(
                  formGroup: address,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text("Endereço para Entrega",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      TextFormField(
                        decoration: const InputDecoration(hintText: "CEP"),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CepInputFormatter(),
                          LengthLimitingTextInputFormatter(10)
                        ],
                        onChanged: (cep) {
                          if (cep.length == 10) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            _callViaCep(cep);
                          }
                        },
                      ),
                      ReactiveTextField(
                        decoration: const InputDecoration(hintText: "Rua"),
                        formControlName: 'street',
                        keyboardType: TextInputType.streetAddress,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: ReactiveTextField(
                                decoration:
                                    const InputDecoration(hintText: "Número"),
                                keyboardType: TextInputType.number,
                                formControlName: 'number_address',
                                validationMessages: (control) => {
                                  ValidationMessage.required:
                                      'Esse campo é obrigatorio',
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: ReactiveTextField(
                                decoration:
                                    const InputDecoration(hintText: "Bairro"),
                                keyboardType: TextInputType.text,
                                formControlName: 'district',
                                validationMessages: (control) => {
                                  ValidationMessage.required:
                                      'Esse campo é obrigatorio',
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: ReactiveTextField(
                                decoration:
                                    const InputDecoration(hintText: "Cidade"),
                                keyboardType: TextInputType.text,
                                formControlName: 'city',
                                validationMessages: (control) => {
                                  ValidationMessage.required:
                                      'Esse campo é obrigatorio',
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: ReactiveTextField(
                                decoration:
                                    const InputDecoration(hintText: "Estado"),
                                keyboardType: TextInputType.text,
                                formControlName: 'state',
                                validationMessages: (control) => {
                                  ValidationMessage.required:
                                      'Esse campo é obrigatorio',
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Container(
                        height: 50.0,
                        margin: const EdgeInsets.all(10),
                        child: RaisedButton(
                          onPressed: _saveUser,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: const EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff374ABE),
                                    Color(0xff64B6FF)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: const BoxConstraints(
                                  maxWidth: 250.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: const Text(
                                "Cadastrar",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

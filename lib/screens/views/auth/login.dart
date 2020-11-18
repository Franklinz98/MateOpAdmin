import 'package:flutter/material.dart';
import 'package:mateop_admin/backend/auth.dart';
import 'package:mateop_admin/constants/text_style.dart';
import 'package:mateop_admin/provider/state.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController email, password;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Provider.of<StaffProvider>(context).user != null) {
          return true;
        }
        return false;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/logo.png'),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Correo electrónico',
                          labelStyle: AppFonts.nunitoSemibold(fontSize: 16),
                          border: OutlineInputBorder(),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Ingresa el correo electrónico';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          labelStyle: AppFonts.nunitoSemibold(fontSize: 16),
                          border: OutlineInputBorder(),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                        obscureText: true,
                        controller: password,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Ingresa la contraseña';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        "Recuperar contraseña",
                        textAlign: TextAlign.right,
                        style: AppFonts.nunitoSemibold(
                          fontSize: 16,
                          color: Color(0xff3d85d7),
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        height: 50.00,
                        decoration: BoxDecoration(
                          color: Color(0xff7c419d),
                          borderRadius: BorderRadius.circular(4.00),
                        ),
                        child: FlatButton(
                            child: Text(
                              "Iniciar Sesión",
                              style: AppFonts.nunitoSemibold(fontSize: 20),
                            ),
                            onPressed: () {
                              if (formKey.currentState.validate()) {
                                signIn(email.text, password.text).then((value) {
                                  Provider.of<StaffProvider>(context,
                                          listen: false)
                                      .setUser(value);
                                  Navigator.pop(context);
                                }).catchError((error) {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(
                                          'Problema al iniciar sesión, vuelve a intentarlo.')));
                                });
                              }
                            }),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}

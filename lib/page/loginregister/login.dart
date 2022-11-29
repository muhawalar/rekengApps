import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:rekeng_apps/page/homepage/home_page_navbar.dart';
import 'package:rekeng_apps/page/loginregister/register.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);

    return Scaffold(
      backgroundColor: ColorApp.primary,
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(38),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                        fontFamily: 'Lontara',
                        fontSize: 50,
                        color: ColorApp.white),
                  ),
                  SizedBox(
                    height: 42,
                  ),
                  Container(
                    height: 450,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorApp.white.withOpacity(0.7)),
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: FontStyle.subtitle6,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            formField(emailController, false),
                            SizedBox(
                              height: 17,
                            ),
                            Text(
                              'Password',
                              style: FontStyle.subtitle6,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            formField(passController, true),
                            SizedBox(
                              height: 42,
                            ),
                            InkWell(
                              child: Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorApp.fontThree),
                                child: Center(
                                  child: Text(
                                    'login',
                                    style: FontStyle.heading4,
                                  ),
                                ),
                              ),
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  model.signIn(
                                      emailController, passController, context);
                                }
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                  style: FontStyle.subtitle6,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return RegisterPage();
                                        },
                                      ));
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: FontStyle.countValue2,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField formField(TextEditingController controller, bool obscureText) {
    return TextFormField(
      decoration: InputDecoration(
          fillColor: ColorApp.primary.withOpacity(0.4),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorApp.primary.withOpacity(0.4),
            ),
          )),
      obscureText: obscureText,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "Field cannot be empty";
        }
        return null;
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:rekeng_apps/page/loginregister/login.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passController = TextEditingController();

  var confirmPassController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                        fontFamily: 'Lontara',
                        fontSize: 50,
                        color: ColorApp.white),
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  Container(
                    height: 570,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorApp.white.withOpacity(0.7)),
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: FontStyle.subtitle6,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            formField(emailController, false),
                            const SizedBox(
                              height: 17,
                            ),
                            Text(
                              'Password',
                              style: FontStyle.subtitle6,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            formField(passController, true),
                            const SizedBox(
                              height: 17,
                            ),
                            Text(
                              'Confirm Password',
                              style: FontStyle.subtitle6,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            formField(confirmPassController, true),
                            const SizedBox(
                              height: 60,
                            ),
                            InkWell(
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorApp.fontThree),
                                child: Center(
                                  child: Text(
                                    'Register',
                                    style: FontStyle.heading4,
                                  ),
                                ),
                              ),
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  if (passController.text ==
                                          confirmPassController.text &&
                                      passController.text.length >= 6) {
                                    model.signUp(emailController,
                                        passController, context);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Your password does\'nt match or less than sixth character')));
                                  }
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Have an account?',
                                  style: FontStyle.subtitle6,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return const LoginPage();
                                        },
                                      ));
                                    },
                                    child: Text(
                                      'Login',
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
      controller: controller,
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return "Field cannot be Empty";
        }

        return null;
      },
    );
  }
}

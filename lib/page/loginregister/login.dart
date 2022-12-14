import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:rekeng_apps/page/homepage/home_page_navbar.dart';
import 'package:rekeng_apps/page/loginregister/register.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';
import 'package:rekeng_apps/provider/user_provider.dart';
import 'package:rekeng_apps/services/user_services/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
    UserProvider userProvider = Provider.of<UserProvider>(context);
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
                  const SizedBox(
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
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                  );

                                  if (await userProvider.login(
                                    email: emailController.text,
                                    password: passController.text,
                                  )) {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return const HomePageBottomBar();
                                      },
                                    ));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Kesalahan'),
                                      ),
                                    );
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
                                  'Don\'t have an account?',
                                  style: FontStyle.subtitle6,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return const RegisterPage();
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

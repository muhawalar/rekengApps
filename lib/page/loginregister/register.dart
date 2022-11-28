import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(38),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register',
                style: TextStyle(
                    fontFamily: 'Lontara', fontSize: 50, color: ColorApp.white),
              ),
              SizedBox(
                height: 42,
              ),
              Container(
                height: 540,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorApp.white.withOpacity(0.7)),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: FontStyle.subtitle6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      formField(),
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
                      formField(),
                      SizedBox(
                        height: 17,
                      ),
                      Text(
                        'Confirm Password',
                        style: FontStyle.subtitle6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      formField(),
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        height: 50,
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
                      SizedBox(
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
                              onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }

  TextFormField formField() {
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
    );
  }
}

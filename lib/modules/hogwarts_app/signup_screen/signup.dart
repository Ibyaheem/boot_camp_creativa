import 'package:boot_camp_creativa/modules/hogwarts_app/login_screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/controllers/userController/user_controller.dart';
import '../layout_screen/layout.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signupKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();
  var userController = Get.put(UserController());
  List<bool> selections = [];
  var valueRadio = 0;
  bool isPassword = true;
  bool isConfirmed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/TheDeathlyHallows.png'),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: signupKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          //UserName
                          TextFormField(
                            cursorColor: Colors.white,
                            controller: nameController,
                            validator: (value) {
                              if ((value == null || value.isEmpty)) {
                                {
                                  return 'Wizard, don\'t forget your name!';
                                }
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.name,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              labelText: 'User Name',
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              prefixIcon: Icon(
                                Icons.person_outlined,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 3.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          //Email
                          TextFormField(
                            cursorColor: Colors.white,
                            controller: emailController,
                            validator: (value) {
                              if ((value == null || value.isEmpty)) {
                                {
                                  return 'Your email also!';
                                }
                              }
                              if (!(value.contains('@'))) {
                                return 'Email must contain "@" ';
                              }
                              if (!(value.contains('.'))) {
                                return 'Email must contain "." ';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              prefixIcon: Icon(
                                Icons.mail_outline,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 3.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          //Password
                          TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            cursorColor: Colors.white,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Your password as well!';
                              }
                              if (value.length < 6) {
                                return 'Password is too short!';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            obscureText: isPassword,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.white,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPassword = !isPassword;
                                  });
                                },
                                icon: Icon(
                                  isPassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 3.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          //ConfirmPassword
                          TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            cursorColor: Colors.white,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please, Confirm your password!';
                              }
                              if (value.length < 6) {
                                return 'Password is too short!';
                              }
                              if (confirmController.text !=
                                  passwordController.text) {
                                return 'Passwords isn\'t matching!';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            controller: confirmController,
                            obscureText: isConfirmed,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.white,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isConfirmed = !isConfirmed;
                                  });
                                },
                                icon: Icon(
                                  isConfirmed
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 3.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          //Phone
                          TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            cursorColor: Colors.white,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Also, your phone number!';
                              }
                              if (value.length < 11) {
                                return 'Phone number is too short!';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 3.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          // ToggleButtons(
                          //   children: [
                          //     Icon(
                          //       Icons.male_outlined,
                          //     ),
                          //     Icon(
                          //       Icons.female_outlined,
                          //     ),
                          //     Icon(
                          //       Icons.female_outlined,
                          //     ),
                          //   ],
                          //   isSelected: selections,
                          //   onPressed: (int index) {
                          //     setState(() {
                          //       selections[index] = !selections[index];
                          //     });
                          //   },
                          // ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    activeColor: Colors.white,
                                    autofocus: false,
                                    hoverColor: Colors.white,
                                    value: 1,
                                    groupValue: valueRadio,
                                    onChanged: (value) {
                                      setState(() {
                                        valueRadio = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Wizard',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 120.0,
                              ),
                              Center(
                                child: Row(
                                  children: [
                                    Radio(
                                      focusColor: Colors.white,
                                      activeColor: Colors.white,
                                      hoverColor: Colors.white,
                                      autofocus: false,
                                      value: 2,
                                      groupValue: valueRadio,
                                      onChanged: (value) {
                                        setState(() {
                                          valueRadio = value!;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Witch',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 10.0,
                          ),
                          Center(
                            child: Container(
                              width: 200.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (signupKey.currentState!.validate()) {
                                      print(emailController.text);
                                      print(passwordController.text);
                                      FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);
                                      userController.register(
                                        localEmail: emailController.text,
                                        localName: nameController.text,
                                        localPhone: phoneController.text,
                                      );
                                      Get.showSnackbar(
                                        GetSnackBar(
                                          title: 'Excellent!',
                                          message: 'Welcome to Hogwarts!! ',
                                          duration: Duration(
                                            seconds: 2,
                                          ),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                      Get.to(() => LayoutScreen());
                                    } else {
                                      Get.showSnackbar(
                                        GetSnackBar(
                                          title: 'Error!',
                                          message: 'Don\'t forget your info!! ',
                                          duration: Duration(
                                            seconds: 2,
                                          ),
                                          backgroundColor: Colors.redAccent,
                                        ),
                                      );
                                    }
                                  });
                                },
                                child: Text(
                                  'Accio Characters!',
                                  style: TextStyle(
                                    color: Colors.brown,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Have an account?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      20.0,
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Get.to(() => LoginScreen());
                                    },
                                    child: Text(
                                      'Login now',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

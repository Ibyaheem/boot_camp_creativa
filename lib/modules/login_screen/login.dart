import 'package:flutter/material.dart';

import '../view_screen/view.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/train.png'),
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
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          TextFormField(
                            cursorColor: Colors.white,
                            controller: emailController,
                            validator: (value) {
                              if ((value == null || value.isEmpty)) {
                                {
                                  return 'Wizard, don\'t forget your email!';
                                }
                              }
                              if (!(value.contains('.'))) {
                                return 'Email must contain "." ';
                              }
                              if (!(value.contains('@'))) {
                                return 'Email must contain "@" ';
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
                            height: 20.0,
                          ),
                          TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            cursorColor: Colors.white,
                            validator: (value) {
                              if (value!.length < 6) {
                                return 'Password is too short';
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
                            height: 20.0,
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
                                    if (_formKey.currentState!.validate()) {
                                      print(emailController.text);
                                      print(passwordController.text);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewScreen()));
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
                            height: 70.0,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      20.0,
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Register now',
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

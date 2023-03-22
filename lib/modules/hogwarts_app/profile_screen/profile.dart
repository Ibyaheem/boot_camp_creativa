import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/controllers/userController/user_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 240.0,
                height: 120.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(300),
                    bottomRight: Radius.circular(300),
                  ),
                ),
              ),
              Text(
                'Wizard\'s Profile',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              //),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 6,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.brown,
                        ),
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://i0.wp.com/gamingballistic.com/wp-content/uploads/2015/09/wizard_by_gerezon-d5d1i0h-1.jpg?fit=600%2C840&ssl=1"))),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 3,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      color: Colors.brown,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Column(
            children: [
              //username
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 18.0),
                child: TextFormField(
                  cursorColor: Colors.brown,
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
                    color: Colors.brown,
                  ),
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    labelStyle: TextStyle(
                      color: Colors.brown,
                    ),
                    prefixIcon: Icon(
                      Icons.person_outlined,
                      color: Colors.brown,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3.0,
                        color: Colors.brown,
                      ),
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                  ),
                ),
              ),
              //email
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 18.0),
                child: TextFormField(
                  cursorColor: Colors.brown,
                  controller: emailController,
                  validator: (value) {
                    if ((value == null || value.isEmpty)) {
                      {
                        return 'Wizard, don\'t forget your email!';
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
                    color: Colors.brown,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.brown,
                    ),
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: Colors.brown,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3.0,
                        color: Colors.brown,
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                  ),
                ),
              ),
              //phone
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 18.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.brown,
                  ),
                  cursorColor: Colors.brown,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Don\'t forget your phone number!';
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
                      color: Colors.brown,
                    ),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.brown,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3.0,
                        color: Colors.brown,
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              width: 200.0,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
              child: MaterialButton(
                onPressed: () {
                  nameController.text = userController.name!.value;
                  emailController.text = userController.email!.value;
                  phoneController.text = userController.phone!.value;
                },
                child: Text(
                  'Get Info',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

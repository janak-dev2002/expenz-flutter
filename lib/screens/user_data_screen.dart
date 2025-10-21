import 'package:expenz/utils/colors.dart';
import 'package:expenz/utils/constants.dart';
import 'package:expenz/widgets/custum_button.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  //for the check box
  bool _rememberMe = false;

  //form Key for the form validations
  final _formKey = GlobalKey<FormState>();

  //controllers for save the states in the inputs
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordContorller = TextEditingController();
  final TextEditingController _confirmPasswordContorller =
      TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordContorller.dispose();
    _confirmPasswordContorller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kDefalutPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter your \npersonal Details",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 30),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            //TextField eke value eka aran denawa mee value variable eken
                            return "Please enter your name";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            //TextField eke value eka aran denawa mee value variable eken
                            return "Please enter your Email";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(height: 15),

                      TextFormField(
                        controller: _passwordContorller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            //TextField eke value eka aran denawa mee value variable eken
                            return "Please enter valid password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(height: 15),

                      TextFormField(
                        controller: _confirmPasswordContorller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            //TextField eke value eka aran denawa mee value variable eken
                            return "Please enter your name";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "confirm password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // remember me ------------------------
                      Row(
                        children: [
                          Text(
                            "Remeber me for the next time",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kGrey,
                            ),
                          ),

                          Expanded(
                            child: CheckboxListTile(
                              activeColor: kMainColor,
                              value: _rememberMe,
                              onChanged: (value) => {
                                setState(() {
                                  _rememberMe = value!;
                                }),
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Submit button
                      // TextButton(
                      //   style: ButtonStyle(
                      //     foregroundColor: WidgetStateProperty.all<Color>(
                      //       Colors.blue,
                      //     ),
                      //     overlayColor: WidgetStateProperty.resolveWith<Color?>(
                      //       (Set<WidgetState> states) {
                      //         if (states.contains(WidgetState.hovered))
                      //           return Colors.blue.withOpacity(0.04);
                      //         if (states.contains(WidgetState.focused) ||
                      //             states.contains(WidgetState.pressed))
                      //           return Colors.blue.withOpacity(0.12);
                      //         return null; // Defer to the widget's default.
                      //       },
                      //     ),
                      //   ),
                      //   onPressed: () {},
                      //   child: Text('TextButton'),
                      // ),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            String userName = _usernameController.text;
                            String email = _emailController.text;
                            String password = _passwordContorller.text;
                            String confirmPassword =
                                _confirmPasswordContorller.text;

                            print("$userName $password $email");
                          }
                        },
                        child: CustumButton(
                          buttonName: "Next",
                          buttonColor: kMainColor,
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
    );
  }
}

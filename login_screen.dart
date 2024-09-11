import 'package:flutter/material.dart';
import 'package:form_validation/Screens/home_page.dart';
import 'package:form_validation/Screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.email, this.password});
  final String? email;
  final String? password;
  @override
  State<LoginScreen> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginScreen> {
  bool obscureText = true;
  bool rememberMe = false;
  bool userValid = false;
  final TextEditingController useremailController = TextEditingController();
  final TextEditingController userpasswordController = TextEditingController();

  @override
  void dispose() {
    useremailController.dispose();
    userpasswordController.dispose();
    super.dispose();
  }

  late String? userEmail = widget.email;
  late String? userPassword = widget.password;

  void verifyUser() {
    print(useremailController.text);
    print(userpasswordController.text);
    print(userEmail);
    print(userPassword);
    if (userEmail == useremailController.text &&
        userPassword == userpasswordController.text) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect email or password'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3), // Show for 3 seconds
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(252, 75, 118, 136)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontSize:
                          24, // You can adjust the size and style as needed
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: useremailController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Rounded corners
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Rounded when focused
                      borderSide: const BorderSide(
                        color: Color.fromARGB(
                            255, 132, 50, 44), // Change color on focus
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  obscureText: obscureText,
                  controller: userpasswordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText; // Toggle visibility
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Rounded corners
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Rounded when focused
                      borderSide: const BorderSide(
                        color: Colors.blue, // Change color on focus
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          rememberMe = value ?? false; // Update checkbox state
                        });
                      },
                    ),
                    const Text(
                      'Remember Me',
                      style: TextStyle(),
                    ),
                    const SizedBox(width: 50),
                    const Text(
                      'Forget Password',
                      style: TextStyle(color: Color.fromARGB(255, 138, 36, 36)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: verifyUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 11, 11, 11), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      minimumSize:
                          const Size(double.infinity, 50), // Button padding
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // print('in on tap function');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(
                                255, 233, 235, 237), // Sign Up link color
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
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

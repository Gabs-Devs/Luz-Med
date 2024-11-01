import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './SignIn.dart';
import './HomePage.dart';
import './widgets/BtnNext.dart';
import './widgets/InputField.dart';
import './widgets/InputFieldPswrd.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(94, 110, 165, 4),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(94, 110, 165, 50),
            ),
            child: const Center(
              child: Text(
                "LuzMed",
                style: TextStyle(
                    fontSize: 38, color: Color.fromRGBO(234, 239, 255, 20)),
              ),
            ),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(234, 239, 255, 20),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(64),
              ),
            ),
            child: SafeArea(
              top: false,
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Entre na sua conta",
                        style: TextStyle(
                            fontSize: 38,
                            color: Color.fromRGBO(94, 110, 165, 50),
                            fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          InputWidgetEmail(
                            emailLabelText: "Email",
                            emailHintText: "Exemplo@gmail.com",
                            controller: _emailController,
                          ),
                          const SizedBox(height: 30),
                          InputWidgetPswrd(
                            passwordLabelText: "Senha",
                            controller: _passwordController,
                          ),
                          const SizedBox(height: 40),
                          Btnnext(buttonText: "ENTRAR", onPressed: _signIn),
                          const SizedBox(height: 30),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Não tem uma conta? ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(94, 110, 165, 50)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()),
                              );
                            },
                            child: const Text(
                              "Crie uma!",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(94, 110, 165, 50),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './login.dart';
import './widgets/BtnNext.dart';
import './widgets/InputField.dart'; // Atualize se o nome do arquivo for diferente
import './widgets/InputFieldPswrd.dart'; // Atualize se o nome do arquivo for diferente

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _crmController = TextEditingController();

  Future<void> _signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Salva o CRM no Firestore
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
        'email': userCredential.user?.email,
        'crm': _crmController.text.trim(),
      });

      // Cadastro bem-sucedido
      print("Usuário criado: ${userCredential.user?.email}");
      // Redirecionar ou mostrar mensagem de sucesso
    } catch (e) {
      print("Erro ao criar usuário: $e");
      // Tratar erro (exibir mensagem ao usuário, etc.)
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
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(94, 110, 165, 50),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
                        "Crie sua conta",
                        style: TextStyle(
                          fontSize: 38,
                          color: Color.fromRGBO(94, 110, 165, 50),
                          fontWeight: FontWeight.bold,
                        ),
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
                          const SizedBox(height: 30),
                          InputWidgetEmail(
                            emailLabelText: "CRM",
                            emailHintText: "CRM/[Seu estado] [Seu número]",
                            controller: _crmController,
                          ),
                          const SizedBox(height: 40),
                          Btnnext(
                            buttonText: "CRIAR CONTA",
                            onPressed: _signUp,
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Já tem uma conta? ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(94, 110, 165, 50),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LogIn(),
                                ),
                              );
                            },
                            child: const Text(
                              "Entre nela!",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(94, 110, 165, 50),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

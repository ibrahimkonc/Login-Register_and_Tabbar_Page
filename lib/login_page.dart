import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String email = "email@email.com";
  String password = "123";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text(
          "Giriş Yap",
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 22,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: LottieBuilder.asset("assets/lottie/lottie_login.json"),
              height: 250,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value.toString());
                        return !emailValid
                            ? "Geçerli bir mail adresi giriniz"
                            : null;
                      },
                      controller: _emailController,
                      decoration: const InputDecoration(
                          hintText: "Email Giriniz...",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          prefixIcon: Icon(Icons.email)),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (password == value) {
                          return null;
                        }
                        return "Lütfen şifreyi 123 giriniz.";
                      },
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          hintText: "Şifre Giriniz...",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          prefixIcon: Icon(Icons.lock)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 45,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                              shape: const StadiumBorder()),
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    "Lütfen alanlarınızı kontrol ediniz !",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                              return;
                            }
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text(
                                      "Tebrikler Giriş Başarılı...",
                                      style: TextStyle(color: Colors.white),
                                    )));
                          },
                          child: const Text(
                            "Giriş Yapınız",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16),
                          )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

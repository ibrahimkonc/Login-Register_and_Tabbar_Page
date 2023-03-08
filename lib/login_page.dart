import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mart_8_calismalar/home_page.dart';
import 'package:mart_8_calismalar/register_page.dart';
import 'package:mart_8_calismalar/tabs_subwidgets/home.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

const Color myColorTheme = Colors.blueGrey;

class _MyLoginPageState extends State<MyLoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String email = "email@email.com";
  String password = "123";
  bool isVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColorTheme,
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
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  const BorderSide(color: myColorTheme)),
                          hintText: "Email Giriniz... ",
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          prefixIcon:
                              const Icon(Icons.email, color: myColorTheme)),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      obscureText: isVisibility,
                      validator: (value) {
                        if (password == value) {
                          return null;
                        }
                        return "Lütfen şifreyi 123 giriniz.";
                      },
                      controller: _passwordController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: myColorTheme)),
                        hintText: "Şifre Giriniz...",
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        prefixIcon: const Icon(Icons.lock, color: myColorTheme),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isVisibility = !isVisibility;
                            });
                          },
                          child: Icon(isVisibility == true
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 45,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: myColorTheme,
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
                                    backgroundColor: myColorTheme,
                                    content: Text(
                                      "Tebrikler Giriş Başarılı...",
                                      style: TextStyle(color: Colors.white),
                                    )));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: const Text(
                            "Giriş Yapınız",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyRegisterPage()));
                      },
                      child: Text("Hesabınız Yok Mu? Kayıt ol"),
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

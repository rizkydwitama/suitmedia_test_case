import 'package:flutter/material.dart';
import 'package:suitmedia_test_case/screens/second_screen.dart';
import 'package:suitmedia_test_case/themes/theme.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  TextEditingController palindromeInput = TextEditingController();
  TextEditingController nameInput = TextEditingController();

  bool isPalindrome(String palindrome){
    return palindrome == palindrome.split('').reversed.join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            Image.asset(
              'assets/ic_photo.png',
              width: 116,
              height: 116,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 561,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 40
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: labelTextStyle,
                      ),
                      const SizedBox(height: 8,),
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: TextFormField(
                          controller: nameInput,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                            ),
                            hintText: 'Type your name here...',
                            hintStyle: hintTextStyle,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16
                            ),
                          )
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        'Palindrome',
                        style: labelTextStyle,
                      ),
                      const SizedBox(height: 8,),
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: TextFormField(
                          controller: palindromeInput,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              hintText: 'Type palindrome here...',
                              hintStyle: hintTextStyle,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16
                              ),
                            )
                        ),
                      ),
                      const SizedBox(height: 30,),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: TextButton(
                          onPressed: () {
                            isPalindrome(palindromeInput.text)?
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("True"),
                                titleTextStyle: nameTextStyle,
                                backgroundColor: Colors.greenAccent,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                content: Text("${palindromeInput.text.toString()} is Palindrome"),
                              )
                            )
                                :
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("False"),
                                titleTextStyle: nameTextStyle,
                                backgroundColor: Colors.redAccent,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                content: Text("${palindromeInput.text.toString()} is not Palindrome"),
                              )
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Check',
                            style: buttonTextStyle,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondScreen(
                                    userName: nameInput.text.toString(),
                                  )
                              )
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Next',
                            style: buttonTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

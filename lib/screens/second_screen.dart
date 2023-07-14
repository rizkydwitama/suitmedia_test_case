import 'package:flutter/material.dart';
import 'package:suitmedia_test_case/screens/third_screen.dart';
import 'package:suitmedia_test_case/themes/theme.dart';

class SecondScreen extends StatefulWidget {
  final String userName;
  const SecondScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}



class _SecondScreenState extends State<SecondScreen> {
  late final String userName;
  String text = 'Selected User Name';

  Future<void> awaitReturnValue(BuildContext buildContext) async {
    final userSelectedName = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ThirdScreen()
        )
    );
    setState(() {
      text = userSelectedName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Second Screen',
          style: titleTextStyle,
        ),
      ),
      body: SafeArea(
        child: Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 501,
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
                    'Welcome,',
                    style: nameTextStyle.copyWith(
                      fontWeight: regular
                    )
                  ),
                  const SizedBox(height: 5,),
                  Text(
                      widget.userName,
                      style: nameTextStyle.copyWith(
                        fontWeight: semiBold
                      )
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        text,
                        style: nameTextStyle.copyWith(
                          fontWeight: bold
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(20),
        elevation: 0,
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: TextButton(
            onPressed: ()  {
             awaitReturnValue(context);
            },
            style: TextButton.styleFrom(
                backgroundColor: purpleColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
            ),
            child: Center(
              child: Text(
                'Choose a User',
                style: buttonTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

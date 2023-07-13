import 'package:flutter/material.dart';

import '../themes/theme.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Third Screen',
          style: titleTextStyle,
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5
            ),
            child: Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.symmetric(
                horizontal: 20
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/img_user.png'
                        ),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Firstname Lastname',
                        style: nameTextStyle.copyWith(
                          fontWeight: semiBold
                        ),
                      ),
                      const SizedBox(height: 4,),
                      Text(
                        'email@email.com',
                        style: hintTextStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../themes/theme.dart';
import 'package:http/http.dart' as http;

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

Future<List<UserModel>> fetchUser() async {
  final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=1&per_page=10'));
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    var parsed = data['data'].cast<Map<String, dynamic>>();
    return parsed.map<UserModel>((json) => UserModel.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed');
  }
}

class _ThirdScreenState extends State<ThirdScreen> {

  late Future<List<UserModel>> users;

  @override
  void initState() {
    super.initState();
    users = fetchUser();
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
          'Third Screen',
          style: titleTextStyle,
        ),
      ),
      body: FutureBuilder<List<UserModel>> (
        future: users,
        builder: (context, snapshot){
          if(snapshot.hasData){
            if(snapshot.data!.isEmpty) {
              return Center(child: Image.asset('assets/img_no_data.png'));
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context, '${snapshot.data![index].firstName} ${snapshot.data![index].lastName}');
                      },
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          snapshot.data![index].avatar
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
                                  '${snapshot.data![index].firstName} ${snapshot.data![index].lastName}',
                                  style: nameTextStyle.copyWith(
                                      fontWeight: semiBold
                                  ),
                                ),
                                const SizedBox(height: 4,),
                                Text(
                                  snapshot.data![index].email,
                                  style: hintTextStyle,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
            );
          } else {
            return Center(child: CircularProgressIndicator(
              color: navyColor,
            ));
          }
        }
      )
    );
  }
}

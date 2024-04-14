import 'package:database_api/controller/methods_controller.dart';
import 'package:database_api/model/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersPage extends StatefulWidget {
  static const String id = "users_page";

  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  MethodController? methodController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    methodController = Get.put(MethodController());
    methodController!.parsingData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Users"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Obx(
          () => ListView.builder(
              itemCount: methodController?.items.length,
              itemBuilder: (context, index) {
                return listItems(methodController!.items[index]);
              }),
        ));
  }

  Widget listItems(Users user) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            user.title!.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Text(
            user.body!,
            style: TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    methodController!.deleteData(user);
                  },
                  icon: Icon(Icons.delete)),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:database_api/model/users.dart';
import 'package:database_api/server/network_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class UsersPage extends StatefulWidget {
  static const String id = "users_page";

  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();

}

class _UsersPageState extends State<UsersPage> {


  List <Users> item =[];


  getUserInfo(){
    NetService.GET_METHOD(NetService.GET_API, NetService.get_params()).then((response) => Logger().i(response));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(),
    );
  }
}

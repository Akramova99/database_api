import 'package:database_api/model/users.dart';
import 'package:database_api/server/network_service.dart';
import 'package:get/get.dart';

class MethodController extends GetxController{
var items = [].obs;
  Future<void> parsingData() async {
var response=   await NetService.GET_METHOD(NetService.GET_API, NetService.get_params());
if(response!=null){
  items.value =NetService.parsingResponse(response);
}
  }
  Future<void> deleteData(Users users) async {
    var response=   await NetService.DELETE_METHOD(NetService.DELETE_API+users.id.toString(), NetService.delete_params());
   if(response != null){
     items.removeWhere((item) => item ==users.id);

   }
  }
}
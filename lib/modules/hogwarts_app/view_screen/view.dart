import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/characters/characters.dart';
import '../../../models/controllers/userController/user_controller.dart';
import '../../../models/functions/functions.dart';
import '../../../models/service/characters_service.dart';
import '../details_screen/characteer_details.dart';

class ViewScreen extends StatefulWidget {
  @override
  _ViewScreen createState() => _ViewScreen();
}

// void initState() {
//   // TODO: implement initState
//   super.initState();
// }

class _ViewScreen extends State<ViewScreen> {
  CharacterService service = CharacterService();
  late final Character character;
  var userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    // appBar: AppBar(
    //   title: Obx(() {
    //     return Text(
    //       "Welcome ${userController.email},",
    //       style: TextStyle(
    //         fontSize: 20.0,
    //       ),
    //     );
    //   }),
    //   backgroundColor: Colors.brown,
    // ),
    return SingleChildScrollView(
        child: FutureBuilder<List<Character>?>(
      future: service.fetchCharacters() as Future<List<Character>?>,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'There was an error!'.toString(),
            ),
          );
        } else if (snapshot.hasData) {
          return Column(
              children: snapshot.data!
                  .map((e) => Container(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 8),
                        child: GestureDetector(
                          child: Card(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8),
                              child: ListTile(
                                title: Text(
                                  e.name,
                                  style: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 15.0,
                                  ),
                                ),
                                leading: Container(
                                  height: 60,
                                  width: 60,
                                  child: CircleAvatar(
                                    backgroundImage: Image.network(
                                      e.image != ""
                                          ? e.image
                                          : 'https://i0.wp.com/gamingballistic.com/wp-content/uploads/2015/09/wizard_by_gerezon-d5d1i0h-1.jpg?fit=600%2C840&ssl=1',
                                      errorBuilder: (BuildContext context,
                                          Object, StackTrace? trace) {
                                        return Image(
                                          image: AssetImage(
                                              'assets/DeathlyHallows.png'),
                                        );
                                      },
                                    ).image,
                                  ),
                                ),
                                trailing: Text(
                                  e.house,
                                  style: TextStyle(color: houseColor(e.house)),
                                ),
                              ),
                            ),
                          ),
                          onTap: () async {
                            await Get.to(() => CharacterDetails(e));
                          },
                        ),
                      ))
                  .toList());
        } else {
          return Container(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.brown,
              ),
            ),
          );
        }
      },
    ));
  }
}

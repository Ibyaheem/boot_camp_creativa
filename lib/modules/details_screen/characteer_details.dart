import 'package:flutter/material.dart';

import '../../functions/functions.dart';
import '../../models/characters/characters.dart';

class CharacterDetails extends StatefulWidget {
  final Character character;

  CharacterDetails(this.character);
  @override
  _CharacterDetailsState createState() => _CharacterDetailsState();
}

class _CharacterDetailsState extends State<CharacterDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.character.name),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 500.0,
              child: Image(
                image: Image.network(
                  widget.character.image != ""
                      ? widget.character.image
                      : 'https://i0.wp.com/gamingballistic.com/wp-content/uploads/2015/09/wizard_by_gerezon-d5d1i0h-1.jpg?fit=600%2C840&ssl=1',
                  errorBuilder:
                      (BuildContext context, Object object, StackTrace? trace) {
                    return Image(
                      image: AssetImage('assets/DeathlyHallows.png'),
                    );
                  },
                ).image,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: widget.character.house == ""
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "House: ",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.brown,
                              ),
                            ),
                            Text(
                              widget.character.house,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: houseColor(widget.character.house)),
                            )
                          ],
                        ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Card(
                child: Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Hogwarts Student: ",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.brown,
                        ),
                      ),
                      Text(
                        widget.character.isStudent.toString(),
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.brown,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Card(
                child: Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          "Starring: ${widget.character.actor}",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.brown,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

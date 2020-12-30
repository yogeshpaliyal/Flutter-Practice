import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
            elevation: 3,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: InkWell(
              onTap: (){

              },
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: ClipOval(
                            child: Image.network(
                              "https://randomuser.me/api/portraits/men/62.jpg",
                              fit: BoxFit.fill,
                            ),
                          )),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Title $index"),
                            Text("Content $index")
                          ],
                        ),
                      )
                    ],
                  )),
            ));
      },
      itemCount: 10,
    );
  }
}

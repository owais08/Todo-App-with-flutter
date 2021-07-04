import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<dynamic> lst = [];

  var output = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Todo App",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (
            context,
            index,
          ) {
            return Card(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              color: Colors.blue[100],
              child: ListTile(
                title: Text(
                  "${lst[index]}",
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Container(
                  width: 80,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (
                                context,
                              ) {
                                return AlertDialog(
                                  title: Text(
                                    "edit item",
                                  ),
                                  content: TextField(
                                    onChanged: (value) {
                                      output = value;
                                    },
                                  ),
                                  actions: [
                                    FloatingActionButton(
                                      onPressed: () {
                                        Navigator.of(
                                          context,
                                        ).pop();
                                        setState(() {
                                          lst.replaceRange(
                                            index,
                                            index + 1,
                                            {
                                              output,
                                            },
                                          );
                                        });
                                      },
                                      child: Icon(Icons.edit),
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: Icon(
                          Icons.edit,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            lst.removeAt(
                              index,
                            );
                          });
                        },
                        icon: Icon(
                          Icons.delete,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (
                context,
              ) {
                return AlertDialog(
                  title: Text(
                    "add item",
                  ),
                  content: TextField(
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pop();
                        setState(() {
                          lst.add(
                            output,
                          );
                        });
                      },
                      child: Icon(Icons.add),
                    ),
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DynamicList(title: 'TODO List'),
    );
  }
}

class DynamicList extends StatefulWidget {
  @override
  DynamicList({Key key, this.title}) : super(key: key);

  final String title;
  _DynamicListState createState() => _DynamicListState();
}

class _DynamicListState extends State<DynamicList> {
  List<String> listItems = [];
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: textEditingController,
                onSubmitted: (text) {
                  listItems.add(text);
                  textEditingController.clear();
                  setState(() {});
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(listItems[index]);
                  },
                ),
              ),
            ],
          )
      ),
    );
  }
}
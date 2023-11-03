import 'package:flutter/material.dart';

class RecordListScreen extends StatefulWidget {
  @override
  _RecordListScreenState createState() => _RecordListScreenState();
}

class _RecordListScreenState extends State<RecordListScreen> {
  List<String> records = List.generate(300, (index) => 'Record $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RecordListView(records: records),
    );
  }
}

class RecordListView extends StatefulWidget {
  final List<String> records;

  RecordListView({required this.records});

  @override
  _RecordListViewState createState() => _RecordListViewState();
}

class _RecordListViewState extends State<RecordListView> {
  final int itemsPerPage = 12;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    int start = currentPage * itemsPerPage;
    int end = (currentPage + 1) * itemsPerPage;
    List<String> currentPageRecords = widget.records.sublist(start, end);
    int totalPageCount = (widget.records.length / itemsPerPage).ceil();

    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[],
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: totalPageCount,
              itemBuilder: (context, page) {
                return ListView.builder(
                  itemCount: currentPageRecords.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(currentPageRecords[index]),
                    );
                  },
                );
              },
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

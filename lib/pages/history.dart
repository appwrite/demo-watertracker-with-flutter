import 'package:flappwrite_water_tracker/data/model/water_intake.dart';
import 'package:flappwrite_water_tracker/data/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int todaysIntake = 0;
  List<WaterIntake> intakes = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _getIntakes();
  }

  _getIntakes() async {
    intakes = await ApiService.instance.getIntakes();
    todaysIntake = 0;
    intakes.forEach((element) {
      todaysIntake += element.amount;
    });
    loading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat.yMMMEd().format(
            DateTime.now(),
          ),
        ),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                ...intakes.map((intake) {
                  //“Software undergoes beta testing shortly before it’s released. Beta is Latin for still doesn’t work.”
                  return ListTile(
                    title: Text("${intake.amount} ml"),
                    subtitle: Text(
                        "${DateFormat.yMMMMd().format(intake.date)} ${DateFormat.jm().format(intake.date)}"),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        //delete
                        await ApiService.instance.removeIntake(intake.id);
                        _getIntakes();
                      },
                    ),
                  );
                })
              ],
            ),
    );
  }
}

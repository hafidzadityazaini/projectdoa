import 'package:flutter/material.dart';
import '../components/amalantile.dart';
import '../components/customappbar.dart';
import '../database/databasehelper.dart';

class AmalanPage extends StatefulWidget {
  const AmalanPage({super.key});

  @override
  State<AmalanPage> createState() => _AmalanPageState();
}

class _AmalanPageState extends State<AmalanPage> {

  List data = [];

  getData() async {
    data = await DBHelper.getAmalan();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const CustomAppBar(),

        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(15),

            children: [

              const Text(
                "Amalan & Sunnah Harian",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Kumpulan doa, dzikir, dan amalan sunnah sehari-hari",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 20),

              ...data.map(
                (e) => AmalanTile(
                  title: e['title'],
                  category: e['category'],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
import 'package:covid/api_helper/helper.dart';
import 'package:covid/models.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Covid Data"),
      ),
      body: FutureBuilder(
        future: APIHelper.apiHelper.fetchCOVIDDataAPI(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error is  ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            List<CovidModel>? data = snapshot.data as List<CovidModel>;
            // Global.country = data.map((e) => e.country).toList();
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, i) {
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('case_page', arguments: data[i]);
                    },
                    title: Center(
                      child: Text(
                        data[i].country,
                        style: const TextStyle(
                          color: Color(0xff395B64),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

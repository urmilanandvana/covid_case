import 'package:covid/models.dart';
import 'package:flutter/material.dart';

class CasePage extends StatefulWidget {
  const CasePage({Key? key}) : super(key: key);

  @override
  State<CasePage> createState() => _CasePageState();
}

class _CasePageState extends State<CasePage> {
  TextStyle titleStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Color(0xff395B64),
  );
  TextStyle resultStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color(0xff395B64),
  );
  @override
  Widget build(BuildContext context) {
    final res = ModalRoute.of(context)!.settings.arguments as CovidModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Covid Detail"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.circle,
                  size: 20,
                  color: Color(0xff395B64),
                ),
                const SizedBox(width: 10),
                Text(
                  "${res.country} Information....",
                  style: const TextStyle(
                    color: Color(0xff395B64),
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 250,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xffE7F6F2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "Testing :  ", style: titleStyle),
                        TextSpan(text: res.tested, style: titleStyle),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "Infected :  ", style: titleStyle),
                        TextSpan(text: "${res.infected}", style: titleStyle),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "Death :  ", style: titleStyle),
                        TextSpan(text: "${res.deceased}", style: titleStyle),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "Recover :  ", style: titleStyle),
                        TextSpan(
                            text: "${res.latestRecovered}", style: titleStyle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

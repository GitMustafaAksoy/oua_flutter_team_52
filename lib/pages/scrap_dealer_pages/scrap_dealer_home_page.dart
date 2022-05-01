import 'package:flutter/material.dart';


class ScrapDealerHomePage extends StatefulWidget {
  const ScrapDealerHomePage({Key? key}) : super(key: key);

  @override
  State<ScrapDealerHomePage> createState() => _ScrapDealerHomePageState();
}

class _ScrapDealerHomePageState extends State<ScrapDealerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Scrap Dealer HomePage'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {

                  });
                },
                child: Text('Make a plan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


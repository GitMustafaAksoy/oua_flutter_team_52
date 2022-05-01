import 'package:flutter/material.dart';

class ScrapDealerHistoryPage extends StatefulWidget {
  const ScrapDealerHistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ScrapDealerHistoryPage> createState() => _ScrapDealerHistoryPageState();
}

class _ScrapDealerHistoryPageState extends State<ScrapDealerHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
              child: Center(child: Text('ScrapDealerHistoryPage')),
            ),
          ),
          Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => PlanRow(),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 3,
              )),
        ],
      ),
    );
  }
}

class PlanRow extends StatefulWidget {
  const PlanRow({
    Key? key,
  }) : super(key: key);

  @override
  State<PlanRow> createState() => _PlanRowState();
}

class _PlanRowState extends State<PlanRow> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Eskişehir Gezisi'),
      trailing: IconButton(
        onPressed: () {
          setState(() {});
        },
        icon: Icon(Icons.delete),
      ),
    );
  }
}

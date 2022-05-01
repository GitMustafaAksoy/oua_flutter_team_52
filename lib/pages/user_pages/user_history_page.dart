import 'package:flutter/material.dart';

class UserHistoryPage extends StatefulWidget {
  const UserHistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<UserHistoryPage> createState() => _UserHistoryPageState();
}

class _UserHistoryPageState extends State<UserHistoryPage> {
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
              child: Center(child: Text('UserHistoryPage')),
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

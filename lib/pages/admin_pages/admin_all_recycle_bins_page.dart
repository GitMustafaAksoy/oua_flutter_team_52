import 'package:flutter/material.dart';

class AdminRecycleListPage extends StatefulWidget {
  const AdminRecycleListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AdminRecycleListPage> createState() => _AdminRecycleListPageState();
}

class _AdminRecycleListPageState extends State<AdminRecycleListPage> {
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
              child: Center(child: Text('Favorite plans: 3')),
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

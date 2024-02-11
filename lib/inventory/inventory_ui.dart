import 'package:flutter/material.dart';
import 'package:warehousemanagement/inventory/sqlite.dart';

class InventoryCrudAndUi extends StatefulWidget {
  const InventoryCrudAndUi({super.key});

  @override
  State<InventoryCrudAndUi> createState() => _InventoryCrudAndUiState();
}

class _InventoryCrudAndUiState extends State<InventoryCrudAndUi> {
  List<Map<String, dynamic>> journal = [];

  void refreshJournal() async {
    final data = await CurrentInventoryHistory.getItems();
    setState(() {
      journal = data;
    });
  } //item display garna

  @override
  void initState() {
    refreshJournal();
    print("item count $journal.length");
    super.initState();
  } // yeta bata display hunxa

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Center(child: Text("OUR INVENTORY"))),
      body: ListView.builder(
          itemCount: journal.length,
          itemBuilder: (context, index) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(journal[index]['title']),
                      Text(journal[index]['description']),
                      IconButton(
                          onPressed: () => showForm(journal[index]['id']),
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () => deleteItem(journal[index]['id']),
                          icon: Icon(Icons.delete)),
                    ],
                  )
                ],
              )
          // Card(
          //   // child: ListTile(
          //   //     title:
          //   //     subtitle:
          //   //     trailing: SizedBox(
          //   //       width: 100,
          //   //       child: Row(children: [
          //   //
          //   //       ]),
          //   //     )),
          // )
          ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 15,
          ),
          onPressed: () => showForm(null)),
    );
  }

  void showForm(int? id) async {
    if (id != null) {
      final existingJournal =
          journal.firstWhere((element) => element['id'] == id);
      titleController.text = existingJournal['title'];
      descriptionController.text = existingJournal['description'];
    }
    showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        child: Column(
          children: [
            Center(
              child: Text(
                "PRODUCT DETAILS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'FullName',
                labelText: 'Name *',
              ),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                icon: Icon(Icons.email),
                hintText: 'Abc@gmail.com',
                labelText: 'Email Address *',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                print(id);

                if (id == null) {
                  await addItem();
                } else {
                  await updateItem(id);
                }
              },
              child: Text(id == null ? 'Create' : "Update"),
            ),
          ],
        ),
      ),
    );
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  Future<void> addItem() async {
    await CurrentInventoryHistory.createItem(
        titleController.text, descriptionController.text);
    refreshJournal();
    Navigator.of(context).pop();
    titleController.clear();
    descriptionController.clear();
  }

  Future<void> updateItem(int id) async {
    await CurrentInventoryHistory.updateItem(
        id, titleController.text, descriptionController.text);
    refreshJournal();
    Navigator.of(context).pop();

    titleController.clear();
    descriptionController.clear();
  }

  Future<void> deleteItem(int id) async {
    await CurrentInventoryHistory.deleteItem(id);
    refreshJournal();
  }
}

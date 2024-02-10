import 'package:flutter/material.dart';
import 'package:warehousemanagement/inventory/sqlite.dart';

class InventoryCrudAndUi extends StatefulWidget {
  const InventoryCrudAndUi({super.key});

  @override
  State<InventoryCrudAndUi> createState() => _InventoryCrudAndUiState();
}

class _InventoryCrudAndUiState extends State<InventoryCrudAndUi> {
  List<Map<String, dynamic>> jornal = [];

  void refreshJornal() async {
    final data = await SqlHelper.getItems();
    setState(() {
      jornal = data;
    });
  } //item display garna

  @override
  void initState() {
    refreshJornal();
    print("item count $jornal.length");
    super.initState();
  } // yeta bata display hunxa

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: ListView.builder(
          itemCount: jornal.length,
          itemBuilder: (context, index) => Card(
                color: Colors.red,
                child: ListTile(
                    title: Text(jornal[index]['title']),
                    subtitle: Text(jornal[index]['description']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(children: [
                        IconButton(
                            onPressed: () => showform(jornal[index]['id']),
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () => deleteItem(jornal[index]['id']),
                            icon: Icon(Icons.delete))
                      ]),
                    )),
              )),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 15,
          ),
          onPressed: () => showform(null)),
    );
  }

  void showform(int? id) async {
    if (id != null) {
      final existingJornal =
          jornal.firstWhere((element) => element['id'] == id);
      titleController.text = existingJornal['title'];
      descriptionController.text = existingJornal['description'];
    }
    showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        color: Colors.blue,
        child: Column(
          children: [
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
    await SqlHelper.createItem(
        titleController.text, descriptionController.text);
    refreshJornal();
    Navigator.of(context).pop();
    titleController.text = '';
    descriptionController.text = '';
  }

  Future<void> updateItem(int id) async {
    await SqlHelper.updateItem(
        id, titleController.text, descriptionController.text);
    refreshJornal();
    Navigator.of(context).pop();
    titleController.text = '';
    descriptionController.text = '';
  }

  Future<void> deleteItem(int id) async {
    await SqlHelper.deleteItem(id);
    refreshJornal();
  }
}

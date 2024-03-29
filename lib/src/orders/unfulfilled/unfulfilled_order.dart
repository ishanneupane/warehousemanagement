import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warehousemanagement/core/widget/custom_text.dart';
import 'package:warehousemanagement/src/orders/model/order_model.dart';
import 'package:warehousemanagement/src/orders/unfulfilled/unfulfiled_order_state.dart';

import '../order_sql.dart';

class UnfulfilledOrder extends StatefulWidget {
  const UnfulfilledOrder({Key? key}) : super(key: key);

  @override
  State<UnfulfilledOrder> createState() => _UnfulfilledOrderState();
}

class _UnfulfilledOrderState extends State<UnfulfilledOrder> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<UnfulfilledState>(context, listen: false).getTask();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UnfulfilledState>(builder: (context, state, child) {
      return Scaffold(
        backgroundColor: Colors.grey.shade700,
        appBar: AppBar(
          title: Center(
              child: CustomText(
            "ORDERS TO BE DISPATCHED",
            color: Colors.white,
            fontSize: 22,
          )),
          backgroundColor: Colors.grey.shade800,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListView.builder(
            itemCount: state.dispatchRequests.length,
            itemBuilder: (context, index) {
              OrderModel task = state.dispatchRequests[index];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.orange.shade400,
                  ),
                  child: ListTile(
                    leading: Checkbox(
                      checkColor: Colors.green,
                      fillColor: MaterialStateProperty.all(Colors.white),
                      value: task.isCompleted,
                      onChanged: (bool? value) {
                        setState(() {
                          task.isCompleted = value ?? false;
                        });
                      },
                    ),
                    title: Text(task.productName),
                    subtitle: Text("Order Weight:" + task.weight.toString()),
                    trailing: Text("Posted on:" +
                        task.publishedDate.toIso8601String().substring(0, 10)),
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red.shade100,
          onPressed: () async {
            // Get the list of checked tasks
            List<OrderModel> checkedTasks = state.dispatchRequests
                .where((task) => task.isCompleted)
                .toList();

            // Delete checked tasks
            for (OrderModel checkedTask in checkedTasks) {
              await Order.deleteProduct(checkedTask.id!);
            }
            await state.getTask();
          },
          child: const Icon(Icons.delete),
        ),
      );
    });
  }
}

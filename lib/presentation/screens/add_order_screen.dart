import 'package:ahwa_manager/presentation/widgets/custom_text_feild.dart';
import 'package:ahwa_manager/presentation/widgets/drop_down_list.dart';
import 'package:flutter/material.dart';
import 'package:ahwa_manager/models/drink.dart';
import 'package:ahwa_manager/services/order_manager.dart';


class AddOrderScreen extends StatefulWidget {
  final OrderManager orderManager;
  const AddOrderScreen({super.key, required this.orderManager});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController instructionsController = TextEditingController();
  DrinkModel? selectedDrink;

  final List<DrinkModel> drinks = const [Shai(), TurkishCoffee(), HibiscusTea()];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              controller: nameController,
              label: "Customer Name",
              validator: (val) =>
                  val == null || val.isEmpty ? "Please enter a name" : null,
            ),
            const SizedBox(height: 10),
            CustomDropdown<DrinkModel>(
              value: selectedDrink,
              hint: "Select a drink",
              items: drinks,
              itemLabel: (d) => d.name,
              onChanged: (val) => setState(() => selectedDrink = val),
              validator: (val) =>
                  val == null ? "Please select a drink" : null,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: instructionsController,
              label: "Special Instructions",
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.orderManager.addOrder(
                    nameController.text,
                    selectedDrink!,
                    instructionsController.text,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Order added!")),
                  );
                  nameController.clear();
                  instructionsController.clear();
                  setState(() => selectedDrink = null);
                }
              },
              child: const Text("Add Order"),
            ),
          ],
        ),
      ),
    );
  }
}

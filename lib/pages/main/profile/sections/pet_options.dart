import 'package:flutter/material.dart';
import 'package:lucy/components/accordion.dart';
import 'package:lucy/components/full_width_button.dart';
import 'package:lucy/pages/main/profile/add_pet/add_pet_stepper.dart';

class PetOptionsSection extends StatefulWidget {
  @override
  State<PetOptionsSection> createState() => _PetOptionsSectionState();
}

class _PetOptionsSectionState extends State<PetOptionsSection> {
  @override
  Widget build(BuildContext context) {
    Widget _getPetList() {
      return Text("data");
    }

    Widget _getAddPetButton() {
      return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddPetStepper()));
                  },
                  child: const Text("Add Pet"))
            ],
          ));
    }

    return Accordion(
        isOpen: false,
        title: "My Pets",
        content: Column(children: [_getPetList(), _getAddPetButton()]));
  }
}

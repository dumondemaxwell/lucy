import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cross_file_image/cross_file_image.dart';

class AddPetStepper extends StatefulWidget {
  @override
  State<AddPetStepper> createState() => _AddPetStepperState();
}

class _AddPetStepperState extends State<AddPetStepper> {
  ImagePicker imagePicker = ImagePicker();
  var petModel = <String, dynamic>{
    "petName": "",
    "age": 0,
    "weight": 0,
    "ratePerHour": 0,
  };

  var photos = <XFile?>[];
  var maxPhotosAllowed = 6;

  int _index = 0;

  _addPhotoButton() {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
            child: ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(Icons.add_a_photo),
              Text("Add Photo")
            ],
          ),
          onTap: () async {
            final XFile? importImage =
                await ImagePicker().pickImage(source: ImageSource.gallery);

            setState(() {
              if(importImage != null){
                photos.add(importImage);
              }
            });
          },
        )));
  }

  Iterable<Widget> _getPhotos() {
    return photos.where((element) => element != null).map((e) => Card(
            child: ListTile(
              title: Image(image: XFileImage(e as XFile))
        )));
  }

  _getSteps() {
    return <Step>[
      Step(
          title: const Text("Details"),
          content: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Pet Name'),
                onChanged: (value) => petModel["name"] = value,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Age'),
                onChanged: (value) => petModel["age"] = value,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Weight'),
                onChanged: (value) => petModel["weight"] = value,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Rate Per Hour'),
                onChanged: (value) => petModel["ratePerHour"] = value,
              ),
            ],
          )),
      Step(
          title: const Text("Photos"),
          content: Column(
            children: [
              GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: [..._getPhotos(), _addPhotoButton()])
            ],
          )),
    ];
  }

  onStepCancel() {
    if (_index > 0) {
      setState(() {
        _index -= 1;
      });
    }
  }

  onStepContinue() {
    if (_index <= 0) {
      setState(() {
        _index += 1;
      });
    }
  }

  onStepTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  Widget _getStepper() {
    return Stepper(
        currentStep: _index,
        type: StepperType.horizontal,
        steps: _getSteps(),
        onStepCancel: onStepCancel,
        onStepContinue: onStepContinue,
        onStepTapped: onStepTapped);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Pet'),
        ),
        body: Center(
          child: _getStepper(),
        ));
  }
}

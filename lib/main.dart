import 'package:flutter/material.dart';

extension IsDigit on String? {
  bool digit() {
    var length = this?.length;
    if (length != 0) {
      for (var i = 0; i < length!; i++) {
        var code = (this?.codeUnits[i]) ?? 0;
        if (!(code >= 48 && code <= 57)) {
          return false;
        }
        return true;
      }
    }
    return false;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: MyFormFields());
  }
}

class MyFormFields extends StatefulWidget {
  const MyFormFields({super.key});

  @override
  State<MyFormFields> createState() => _MyFormFieldsState();
}

class _MyFormFieldsState extends State<MyFormFields> {
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _obsecure = true;

  void _isVisible() {
    setState(() {
      _obsecure = !_obsecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('TextFormField'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 450,
                    width: 300,
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Form(
                      key: formKey,
                      child: Column(children: [
                        SizedBox(
                          width: 270,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: PhysicalModel(
                              color: Colors.green,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              elevation: 30,
                              shadowColor: Colors.black,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email should not be Empty';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    label: Text('Email'),
                                    hintText: 'i.e arslan@gmail.com',
                                    prefixIcon: Icon(Icons.person),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)))),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 270,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: PhysicalModel(
                              color: Colors.green,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              elevation: 30,
                              shadowColor: Colors.black,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password should not be Empty';
                                  }
                                  if (value.length <= 4) {
                                    return 'Too short Its length must be more than four digits';
                                  }
                                  return null;
                                },
                                obscureText: _obsecure,
                                decoration: InputDecoration(
                                    label: const Text('password'),
                                    suffixIcon: IconButton(
                                        onPressed: _isVisible,
                                        icon: Icon(_obsecure
                                            ? Icons.visibility_off
                                            : Icons.visibility)),
                                    hintText: 'i.e arslan12',
                                    prefixIcon: const Icon(Icons.lock),
                                    border: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)))),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 270,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: PhysicalModel(
                              color: Colors.green,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              elevation: 30,
                              shadowColor: Colors.black,
                              child: Form(
                                key: formKey2,
                                child: TextFormField(
                                  onChanged: (value) {
                                    formKey2.currentState!.validate();
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Mobile Number should not be Empty';
                                    } else if (!(value.digit())) {
                                      return 'Invalid input is not digits';
                                    }
                                    return null;

                                    //   for (var i = 0; i < value.length; i++) {
                                    //     if (!(value.codeUnits[i] >= 48 &&
                                    //         value.codeUnits[i] <= 57)) {
                                    //       return 'Invalid input is not digits';
                                    //     }
                                    //   }
                                    //   return null;
                                  },
                                  decoration: const InputDecoration(
                                      label: Text('Mobile Number'),
                                      hintText: 'i.e 03153891302',
                                      prefixIcon: Icon(Icons.phone),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)))),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 20,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  backgroundColor: Colors.green),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("Submitted Successfully")));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Unsuccessful')));
                                }
                              },
                              child: const Text('Submit')),
                        )
                      ]),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

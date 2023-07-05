import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_learning/project/dog/store/dog_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class DogScreen extends StatefulWidget {
  const DogScreen({Key? key}) : super(key: key);
  static const String route = '/workScreen';

  @override
  State<DogScreen> createState() => _DogScreenState();
}

class _DogScreenState extends State<DogScreen> {
  DogStore dogStore = DogStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dogStore = Provider.of<DogStore>(context, listen: false);
    _callApi();

    Timer.periodic(const Duration(seconds: 5), (Timer t) => _callApi());
  }

  _callApi() async {
    await dogStore.getWork();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Center(child: Text('Choose your Dogs')),
        ),
        body: Stack(
          children: [
            _createBody(),
          ],
        ),
      ),
    );
  }

  Widget _createBody() {
    Size size = MediaQuery.of(context).size;
    return Observer(
      builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Center(
                child: dogStore.isDogLoading
                    ? const RefreshProgressIndicator()
                    : dogStore.dogContainer == null
                        ? const Text('No work available')
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 8),
                                Container(
                                  height: size.height * 0.3,
                                  width: size.width * 0.85,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: GestureDetector(
                                      onTap: () {
                                        _callApi();
                                      },
                                      child: Image.network(
                                        dogStore.dogContainer!.message,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 75),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 15)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30))),
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.purple.shade400;
                                        }
                                        return null; // Null color means using default.
                                      },
                                    ),
                                  ),
                                  onPressed: _callApi,
                                  child: const Text(
                                    'Show me another',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
              ),
            ),
          ],
        );
      },
    );
  }
}

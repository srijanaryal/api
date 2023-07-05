import 'package:flutter/material.dart';
import 'package:flutter_learning/project/work/store/work_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class WorkScreen extends StatefulWidget {
  const WorkScreen({Key? key}) : super(key: key);
  static const String route = '/workScreen';

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  late WorkStore workStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    workStore = Provider.of<WorkStore>(context, listen: false);
    _callApi();

    // Timer.periodic(
    //     const Duration(seconds: 5), (Timer t) => _callApi(showLoading: false));
  }

  _callApi() async {
    await workStore.getWork();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple,
        body: Stack(
          children: [
            _createBody(),
            Observer(builder: (context) {
              return Visibility(
                visible: workStore.isWorkLoading,
                child: const CircularProgressIndicator(),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _createBody() {
    return Observer(builder: (_) {
      return RefreshIndicator(
        onRefresh: () => _callApi(),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                child: workStore.isWorkLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : workStore.workContainer == null
                        ? const Text('No work availbale')
                        : Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.work, size: 48),
                                  const SizedBox(height: 8),
                                  Center(
                                    child: Text(
                                      workStore.workContainer?.activity ?? '',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ListTile(
                                    leading: const Icon(Icons.group,
                                        color: Colors.white),
                                    title: Text(
                                      'Participants: ${workStore.workContainer?.participants ?? ''}',
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.money,
                                        color: Colors.white),
                                    title: Text(
                                      'Price: ${workStore.workContainer?.price ?? ''}',
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.link,
                                        color: Colors.white),
                                    title: Text(
                                      'Link: ${workStore.workContainer?.link ?? ''}',
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.vpn_key,
                                        color: Colors.white),
                                    title: Text(
                                      'Key: ${workStore.workContainer?.key ?? ''}',
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.accessibility,
                                        color: Colors.white),
                                    title: Text(
                                      'Accessibility: ${workStore.workContainer?.accessibility ?? ''}',
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: _callApi,
                                      child: const Text(
                                          'Give me other things to do'))
                                ],
                              ),
                            ),
                          ))
          ],
        ),
      );
    });
  }
}

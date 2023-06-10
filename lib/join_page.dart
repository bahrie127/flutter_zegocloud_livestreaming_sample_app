import 'package:flutter/material.dart';
import 'package:flutter_zego_livestreaming_sample_app/live_page.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({super.key});

  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController liveIDController = TextEditingController();
  bool isHost = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zegocloud live streaming app'),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(child: Text('Join Live Streaming')),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: liveIDController,
              decoration: const InputDecoration(labelText: 'LiveID'),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text('Host ?'),
                const SizedBox(
                  width: 4,
                ),
                Switch(
                    value: isHost,
                    onChanged: (val) {
                      setState(() {
                        isHost = val;
                      });
                    }),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LivePage(
                        liveID: liveIDController.text,
                        isHost: isHost,
                        userName: usernameController.text,
                        userId:
                            usernameController.text.replaceAll(' ', '').trim());
                  }));
                },
                child: const Text('Join')),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/chat_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final pesanController = TextEditingController();

  void kirimPesan() {
    context.read<ChatModel>().kirimPesan(
      pesanController.text,
      true,
    );

    pesanController.clear();
  }

  @override
  void dispose() {
    pesanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ChatModel>();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: model.daftarPesan.length,
              itemBuilder: (context, index) {
                final pesan = model.daftarPesan[
                  model.daftarPesan.length - 1 - index
                ];

                return Align(
                  alignment: pesan.dariPembeli
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: pesan.dariPembeli
                          ? Colors.green
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      pesan.teks,
                      style: TextStyle(
                        color: pesan.dariPembeli
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: pesanController,
                    decoration: const InputDecoration(
                      hintText: 'Tulis pesan kepada penjual...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                IconButton(
                  onPressed: kirimPesan,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
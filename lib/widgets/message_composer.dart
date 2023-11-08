import 'package:flutter/material.dart';

class MessageComposer extends StatelessWidget {
  MessageComposer({
    required this.onSubmitted,
    required this.awaitingResponse,
    super.key,
  });

  final TextEditingController _messageController = TextEditingController();

  final void Function(String) onSubmitted;
  final bool awaitingResponse;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.05),
      child: SafeArea(
         child: Row(
          children: [
            Expanded(
              child: !awaitingResponse
                  ? TextField(
                      cursorColor: Colors.black,
                      controller: _messageController,
                      onSubmitted: onSubmitted,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        hintText: 'Type here...',
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 210, 187, 255),
                          ),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff444653),
                          ),
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 210, 187, 255),
                      ),
                    )
                  : const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Text('Fetching response...'),
                        ),
                      ],
                    ),
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              color: const Color(0xff19bc99),
              child: SizedBox(
                width: 60,
                height: 65,
                child: IconButton(
                  onPressed: !awaitingResponse
                      ? () => onSubmitted(_messageController.text)
                      : null,
                  icon: const Icon(Icons.send),
                  color: const Color.fromARGB(255, 255, 255, 255)             ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

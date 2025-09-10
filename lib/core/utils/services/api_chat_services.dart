import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final model = GenerativeModel(
    model: 'gemini-2.0-flash',
    apiKey: 'AIzaSyCEKyXde9npZGm1BFEon8I9Z0nQjBaqHyc',
  );

  Stream<String> generateResponse(String prompt) async* {
    try {
      final content = [Content.text(prompt)];
      final responseStream = model.generateContentStream(content);

      await for (var response in responseStream) {
        if (response.text != null) {
          for (var word in response.text!.split(" ")) {
            yield "$word ";
            await Future.delayed(const Duration(milliseconds: 100));
          }
        }
      }
    } catch (e) {
      throw Exception('Error generating response: $e');
    }
  }
}

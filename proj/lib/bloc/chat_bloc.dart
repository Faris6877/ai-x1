import 'dart:async';

import 'package:ai_x1/services/api_post.dart';
import 'package:ai_x1/models/chat_massage_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatSuccessState(messages: const [])) {
    on<ChatGeneratNewTextMassageEvent>(chatGeneratNewTextMassageEvent);
  }
  List messages = [];
  bool loading = false;
  FutureOr<void> chatGeneratNewTextMassageEvent(
      ChatGeneratNewTextMassageEvent event, Emitter<ChatState> emit) async {
    loading = true;
    messages.add(
      ContentsModels(
        role: "user",
        parts: [
          PartsModel(text: event.inputMessage),
        ],
      ),
    );
    emit(ChatSuccessState(messages: messages));
    String generatedText = await ApiPost.chatTextGenerationContainer(messages);

    if (generatedText.isNotEmpty) {
      messages.add(
        ContentsModels(
          role: "model",
          parts: [
            PartsModel(text: generatedText),
          ],
        ),
      );
      emit(ChatSuccessState(messages: messages));
    } else {
      emit(NetworckErrorState(message: "Chack You Inter Connction "));
    }
    loading = false;
  }
}

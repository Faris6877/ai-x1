part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}

final class ChatGeneratNewTextMassageEvent extends ChatEvent {
  final String inputMessage;
  ChatGeneratNewTextMassageEvent({
    required this.inputMessage,
  });
}

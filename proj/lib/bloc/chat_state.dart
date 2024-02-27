part of 'chat_bloc.dart';

sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class LoadingState extends ChatState {}

final class ChatSuccessState extends ChatState {
  final List messages;

  ChatSuccessState({required this.messages});
}

final class ChatTimeState extends ChatState {
  final String time ;

  ChatTimeState({required this.time });
}

final class NetworckErrorState extends ChatState {
  final String message;

  NetworckErrorState({required this.message});
}

final class TimeoutErrorState extends ChatState {
  final String message;

  TimeoutErrorState({required this.message});
}

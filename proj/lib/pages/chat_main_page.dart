import 'package:ai_x1/bloc/chat_bloc.dart';
import 'package:ai_x1/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final ChatBloc _bloc = ChatBloc();
  ScrollController scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc: _bloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case (const (ChatSuccessState)):
              List messages = (state as ChatSuccessState).messages;

              return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListView.builder(
                          controller: scroll,
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(3),
                                child: Card(
                                    child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Builder(
                                    builder: (context) {
                                      return messages[index].role == "user"
                                          ?
                                          // user
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.amber,
                                                        radius: 21,
                                                        child: Icon(
                                                          Icons.person,
                                                          color: Colors
                                                              .teal.shade600,
                                                        ),
                                                      ),
                                                    ),
                                                    Card(
                                                      color:
                                                          Colors.amber.shade600,
                                                      child: Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5),
                                                          child: Text(
                                                              DateTime.now()
                                                                  .toString(),
                                                              style: TextStyle(
                                                                fontSize: 8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .teal
                                                                    .shade700,
                                                              )),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Card(
                                                  color: Colors.amber.shade600,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Text(
                                                        messages[index]
                                                            .parts
                                                            .first
                                                            .text,
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .teal.shade700,
                                                        )),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                )
                                              ],
                                            )
                                          :

                                          // MODEL
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Card(
                                                      color:
                                                          Colors.amber.shade600,
                                                      child: Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5),
                                                          child: Text(
                                                              DateTime.now()
                                                                  .toString(),
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: CircleAvatar(
                                                        backgroundColor: Colors
                                                            .teal.shade600,
                                                        radius: 21,
                                                        child: Icon(
                                                          Icons.computer,
                                                          color: Colors
                                                              .amber.shade600,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Card(
                                                  color: Colors.teal.shade600,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Text(
                                                        messages[index]
                                                            .parts
                                                            .first
                                                            .text,
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .amber.shade600,
                                                        )),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                              ],
                                            );
                                    },
                                  ),
                                )));
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.end,
                                enableSuggestions: false,
                                autocorrect: false,
                                minLines: 1,
                                maxLines: 10,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal.shade600,
                                ),
                                cursorColor: Colors.teal.shade600,
                                controller: _controller,
                                decoration: InputDecoration(
                                  enabledBorder: myinputborder(),
                                  focusedBorder: myfocusborder(),
                                  fillColor: Colors.amber.shade600,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(34),
                                    borderSide: BorderSide(
                                      color: Colors.teal.shade600,
                                      width: 1,
                                    ),
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal.shade600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: CircleAvatar(
                                radius: 31,
                                backgroundColor: Colors.teal.shade600,
                                child: CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  radius: 29,
                                  child: _bloc.loading
                                      ? Center(
                                          child: LoadingIndicator(
                                            indicatorType:
                                                Indicator.circleStrokeSpin,
                                            colors: [Colors.teal.shade600],
                                            strokeWidth: 5,
                                          ),
                                        )
                                      : IconButton(
                                          icon: Icon(
                                            Icons.send,
                                            color: Colors.teal.shade600,
                                          ),
                                          onPressed: () {
                                            if (_controller.text.isNotEmpty) {
                                              String text = _controller.text;
                                              _bloc.add(
                                                ChatGeneratNewTextMassageEvent(
                                                  inputMessage: text,
                                                ),
                                              );

                                              _controller.clear();
                                            }
                                            messages.isNotEmpty
                                                ? scroll.animateTo(
                                                    scroll.position
                                                        .maxScrollExtent,
                                                    duration: const Duration(
                                                        milliseconds: 150),
                                                    curve: Curves.easeOut,
                                                  )
                                                : null;
                                          },
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              );
            case const (LoadingState):
            default:
              return Container();
          }
        },
      ),
    );
  }
}

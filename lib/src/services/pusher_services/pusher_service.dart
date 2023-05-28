/*
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_project_arch/src/business_logics/utils/log_debugger.dart';
import 'package:pusher_client/pusher_client.dart';

class PusherController {
  static final PusherController _pusherController =
      PusherController._internal();

  factory PusherController() {
    return _pusherController;
  }

  PusherController._internal();

  late PusherClient pusher;
  late Channel channel;
  final StreamController<String> _eventData = StreamController<String>.broadcast();

  Sink get _inEventData => _eventData.sink;

  Stream get eventStream => _eventData.stream;
  String channelName = "";
  String prevChannelName = "";
  String eventName = "";

  void initPusher() {
    PusherOptions options = PusherOptions(
      cluster: "ap2",
    );
    try {
      pusher = PusherClient("a84df13dfe915e5daf6a", options,
          autoConnect: true, enableLogging: true);
    } catch (e) {
      LogDebugger.instance.w(e.toString());
    }

  }

  void setChannelName(String name) {
    channelName = name;
    LogDebugger.instance.w("channelName: $channelName");
  }

  void setEventName(String name) {
    eventName = name;
    LogDebugger.instance.w("eventName: $eventName");
  }

  void subscribePusher(BuildContext context) {
    channel = pusher.subscribe(channelName);

    //Bind to listen for events called and sent to channel
    channel.bind(eventName, (PusherEvent? event) async {
      if (event!.data != null) {
        final value = jsonDecode(event.data!);
        // if (value['message']['recipient'] == '${UserData.id}') {
        //
        //   _inEventData.add(event.data);
        //
        //   prevChannelName = eventName;
        // }
      }
    });
  }

  void connectPusher() {
    pusher.connect();
  }

  void disconnectPusher() async {
    await channel.unbind(eventName);
    await pusher.disconnect();
  }
}
*/

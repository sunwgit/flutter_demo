import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();

class MyEventBus {
  String text;
  MyEventBus(this.text);
}
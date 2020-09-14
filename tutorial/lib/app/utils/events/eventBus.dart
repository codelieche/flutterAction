// event_bus
import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

// 错误页
class FetchApiError {
  int code;
  FetchApiError(this.code);
}

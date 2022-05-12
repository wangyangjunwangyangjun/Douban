import 'package:stack_trace/stack_trace.dart';

class HyCustomTrace {
  final StackTrace _trace;
  final Object message;

  HyCustomTrace(this.message, this._trace){
    _parseTrace();
  }

  void _parseTrace() {
    final chain = Chain.forTrace(_trace);
    // 拿出其中一条信息
    final frames = chain.toTrace().frames;
    final frame = frames[1];
    // 打印
    print("所在文件：${frame.uri} 所在行 ${frame.line} 所在列 ${frame.column}；打印信息：$message");
  }
}
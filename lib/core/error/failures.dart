// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Failures {
  final String? message;
  Failures({
    this.message,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Failures && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class ServerFailure extends Failures {
  ServerFailure({super.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
     return other is ServerFailure && other.message == message;
  }

 @override
  int get hashCode => message.hashCode;
}


class NetworkFailure extends Failures {
  NetworkFailure({super.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NetworkFailure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
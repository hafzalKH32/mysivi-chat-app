part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {}

class HomeLoadChat extends HomeEvent {
  final BuildContext context;

  HomeLoadChat({required this.context});

  @override
  List<Object?> get props => [context];
}

class HomeClear extends HomeEvent {
  final BuildContext context;

  HomeClear({required this.context});

  @override
  List<Object?> get props => [context];
}

class HomeWordSearch extends HomeEvent {
  final String word;

  HomeWordSearch({required this.word});

  @override
  List<Object?> get props => [word];
}

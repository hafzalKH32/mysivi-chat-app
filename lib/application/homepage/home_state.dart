part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final bool isLoading;
  final String meaning;
  final List<CommentModel> chatList;
  final int total;

  const HomeState({
    this.isLoading = false,
    this.chatList = const [],
    this.meaning = "",
    this.total = 0,
  });

  HomeState copyWith({
    List<CommentModel>? chatList,
    int? total,
    bool? isLoading,
    String? meaning,
  }) {
    return HomeState(
      total: total ?? this.total,
      chatList: chatList ?? this.chatList,
      isLoading: isLoading ?? this.isLoading,
      meaning: meaning ?? this.meaning,
    );
  }

  @override
  List<Object?> get props => [meaning, isLoading, total, chatList];
}

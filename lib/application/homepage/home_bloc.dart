import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi/constant/app_constant/constant.dart';
import 'package:mysivi/core/model/common_model/commonmodel.dart';
import 'package:mysivi/core/model/wordmodel/Word_model.dart';
import 'package:mysivi/domain/repository/chat_repo/Chat_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeLoadChat>(_onHomeLoadChatEvent);
    on<HomeClear>(_onHomeClearEvent);
    on<HomeWordSearch>(_onHomeWordSearchEvent);
  }

  final ChatRepository chatRepo = ChatRepository();

  Future<void> _onHomeLoadChatEvent(
    HomeLoadChat event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final chatHistory = await chatRepo.chatFetching(AppConstants.baseUrl);
      if (kDebugMode) {
        print("acd_ ${chatHistory}");
      }
      emit(state.copyWith(chatList: chatHistory));
    } catch (e) {
      print(e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onHomeWordSearchEvent(
    HomeWordSearch event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final dic = await chatRepo.dictionarySearch(event.word);
      if (kDebugMode) {
        print("dictionary ${dic}");
      }
      if (dic != null && dic.definitions.isNotEmpty) {
        final firstDef = dic.definitions[0].definition.isNotEmpty
            ? dic.definitions[0].definition
            : "No definition found";
        print(
          "meaning ${firstDef}",
        ); // awesome (comparative more awesome or awesomer, ...)
        emit(state.copyWith(meaning: firstDef));
        AppConstants.showCustomSnackbar(title: "Meaning", message: firstDef);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  FutureOr<void> _onHomeClearEvent(HomeClear event, Emitter<HomeState> emit) {
    emit(state.copyWith(meaning: "", isLoading: false));
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crud_api_with_bloc/data/model/list_model_person.dart';
import 'package:crud_api_with_bloc/data/network/api_client_response.dart';
import 'package:equatable/equatable.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final ApiClientResponse _apiClientResponse = ApiClientResponse();
  PersonBloc() : super(PersonInitial()) {
    on<GetDataPersonEvent>(_mapDataPerson);
    // on<GetLoadMoreData>(_mapLoadDataPerson);
  }

  FutureOr<void> _mapDataPerson(
      GetDataPersonEvent event, Emitter<PersonState> emit) async {
    emit(PersonLoading());
    try {
      final fDataPerson = await _apiClientResponse.fetchData();

      if (fDataPerson?.data.isNotEmpty ?? false) {
        emit(PersonLoadingSucces(person: fDataPerson));
      } else {
        emit(PersonEmpatyState());
      }
    } catch (e) {
      emit(const PersonLoadingError(message: 'Error to load Data'));
    }
  }

  // FutureOr<void> _mapLoadDataPerson(
  //     GetLoadMoreData event,  emit) async {
  //   emit(PersonLoading());
  //   try {
  //     final p = _apiClientResponse.fetchData(page: 1);
  //     emit(LoadMoreDataPerson(pPerson: p , hasReachedMax: false, page: p ?? [] + 1, isLoadMoreLoading: p));
  //   } catch (e) {
  //     emit(const PersonLoadingError(message: 'Gagal'))
  //   }
  // }
}

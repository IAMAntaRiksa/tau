part of 'person_bloc.dart';

class PersonEvent extends Equatable {
  const PersonEvent();

  @override
  List<Object> get props => [];
}

class GetDataPersonEvent extends PersonEvent {}

class GetLoadMoreData extends PersonEvent {}

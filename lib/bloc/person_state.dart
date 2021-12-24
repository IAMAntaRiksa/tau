part of 'person_bloc.dart';

class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object> get props => [];
}

class PersonInitial extends PersonState {}

class PersonLoading extends PersonState {}

class PersonLoadingSucces extends PersonState {
  final ListModelPerson? person;

  const PersonLoadingSucces({
    required this.person,
  });

  @override
  List<Object> get props => [person ?? []];
}

class PersonEmpatyState extends PersonState {}

class PersonLoadingError extends PersonState {
  final String message;

  const PersonLoadingError({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

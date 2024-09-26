
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Define the DataState class and its subclasses
abstract class DataState extends Equatable {
	const DataState();

	@override
	List<Object> get props => [];
}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
	final List<dynamic> data;

	const DataLoaded({required this.data});

	@override
	List<Object> get props => [data];
}

class DataError extends DataState {
	final String message;

	const DataError(this.message);

	@override
	List<Object> get props => [message];
}

// Define the DataCubit class
class DataCubit extends Cubit<DataState> {
	DataCubit() : super(DataInitial());

	void fetchData() async {
		try {
			emit(DataLoading());
			await Future.delayed(Duration(seconds: 1));
			// Simulate fetching data
			final data = [];
			emit(DataLoaded(data: data));
		} catch (error) {
			emit(DataError('Error fetching data'));
		}
	}
}


import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:honeybird/cubits/data_cubit.dart';

class MockDataCubit extends MockCubit<DataState> implements DataCubit {}

void main() {
	group('DataCubit', () {
		late DataCubit dataCubit;

		setUp(() {
			dataCubit = MockDataCubit();
		});

		tearDown(() {
			dataCubit.close();
		});

		test('initial state is DataInitial', () {
			expect(dataCubit.state, equals(DataInitial()));
		});

		blocTest<DataCubit, DataState>(
			'emits [DataLoading, DataLoaded] when fetchData is called and succeeds',
			build: () {
				when(() => dataCubit.fetchData()).thenAnswer((_) async {
					dataCubit.emit(DataLoading());
					await Future.delayed(Duration(seconds: 1));
					dataCubit.emit(DataLoaded(data: []));
				});
				return dataCubit;
			},
			act: (cubit) => cubit.fetchData(),
			expect: () => [
				DataLoading(),
				DataLoaded(data: []),
			],
		);

		blocTest<DataCubit, DataState>(
			'emits [DataLoading, DataError] when fetchData is called and fails',
			build: () {
				when(() => dataCubit.fetchData()).thenAnswer((_) async {
					dataCubit.emit(DataLoading());
					await Future.delayed(Duration(seconds: 1));
					dataCubit.emit(DataError('Error fetching data'));
				});
				return dataCubit;
			},
			act: (cubit) => cubit.fetchData(),
			expect: () => [
				DataLoading(),
				DataError('Error fetching data'),
			],
		);
	});
}

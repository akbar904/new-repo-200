
import 'package:equatable/equatable.dart';

class DataModel extends Equatable {
	final String id;
	final String value;

	const DataModel({
		required this.id,
		required this.value,
	});

	factory DataModel.fromJson(Map<String, dynamic> json) {
		return DataModel(
			id: json['id'],
			value: json['value'],
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'id': id,
			'value': value,
		};
	}

	@override
	List<Object?> get props => [id, value];
}

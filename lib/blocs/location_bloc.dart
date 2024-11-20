import 'package:flutter_bloc/flutter_bloc.dart';
import 'location_event.dart';
import 'location_state.dart';
import '../repositories/location_repository.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository locationRepository;

  LocationBloc(this.locationRepository) : super(LocationInitial()) {
    on<FetchLocations>((event, emit) async {
      emit(LocationLoading());
      try {
        final locations = await locationRepository.fetchLocations();
        emit(LocationLoaded(locations));
      } catch (e) {
        emit(LocationError('Failed to load locations'));
      }
    });
  }
}

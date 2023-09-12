import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'landing_pageview_event.dart';

class LandingPageViewBloc extends Bloc<LandingPageViewEvent, int> {
  LandingPageViewBloc() : super(0) {
    on<UpdatePageViewIndex>((event, emit) {
      emit(event.page);
    });
  }
}

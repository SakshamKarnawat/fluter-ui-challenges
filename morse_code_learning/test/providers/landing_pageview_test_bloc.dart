// test bloc for landing_pageview_bloc.dart:

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'landing_pageview_test_event.dart';

class LandingPageViewTestBloc extends Bloc<LandingPageViewTestEvent, int> {
  LandingPageViewTestBloc() : super(0) {
    on<UpdatePageViewTestIndex>((event, emit) {
      emit(event.page);
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navbar_event.dart';

class NavbarBloc extends Bloc<NavbarEvent, int> {
  NavbarBloc() : super(0) {
    on<UpdatePage>((event, emit) {
      emit(event.page);
    });
  }
}

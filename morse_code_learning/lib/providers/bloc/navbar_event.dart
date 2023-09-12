part of 'navbar_bloc.dart';

@immutable
sealed class NavbarEvent {}

final class UpdatePage extends NavbarEvent {
  final int page;

  UpdatePage(this.page);
}

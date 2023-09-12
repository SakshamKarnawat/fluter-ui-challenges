part of 'landing_pageview_bloc.dart';

@immutable
sealed class LandingPageViewEvent {}

class UpdatePageViewIndex extends LandingPageViewEvent {
  final int page;

  UpdatePageViewIndex(this.page);
}

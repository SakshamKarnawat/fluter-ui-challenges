part of 'landing_pageview_test_bloc.dart';

@immutable
sealed class LandingPageViewTestEvent {}

class UpdatePageViewTestIndex extends LandingPageViewTestEvent {
  final int page;

  UpdatePageViewTestIndex(this.page);
}

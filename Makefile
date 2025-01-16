gen:
	fvm dart pub run build_runner build --delete-conflicting-outputs

riverpod:
	dart run build_runner watch

clean:
	fvm flutter clean
	fvm flutter pub get

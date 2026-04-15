# Makefile Flutter Boilerplate
PROJECT_NAME = Flutter Boilerplate
VERSION_TAG = $(shell grep '^version:' pubspec.yaml | awk '{print $$2}')

install:
	flutter pub get

clean:
	rm -rf build/ .dart_tool/ .flutter-plugins .flutter-plugins-dependencies 2>/dev/null || true
	flutter clean && flutter pub cache clean

build-web-prod:
	flutter build web --release \
		--dart-define=SENTRY_DSN=$(SENTRY_DSN) \
		--dart-define=SENTRY_ENV=${SENTRY_ENV} \

build-apk-release:
	flutter build apk --release \
	    --dart-define=SENTRY_DSN=$(SENTRY_DSN) \
		--dart-define=SENTRY_ENV=${SENTRY_ENV} \
		--obfuscate --split-debug-info=build/debug-info

build-appbundle-release:
	flutter build appbundle --release \
	    --dart-define=SENTRY_DSN=$(SENTRY_DSN) \
		--dart-define=SENTRY_ENV=${SENTRY_ENV} \
		--obfuscate --split-debug-info=build/debug-info

build-ios-release:
	flutter build ios --release \
	    --dart-define=SENTRY_DSN=$(SENTRY_DSN) \
		--dart-define=SENTRY_ENV=${SENTRY_ENV} \
		--obfuscate --split-debug-info=build/debug-info

help:
	@echo ""
	@echo "$(PROJECT_NAME) v$(VERSION_TAG)"
	@echo "──────────────────────────────────────────────"
	@echo " Development:"
	@echo "   make install                   ➜ Install Flutter dependencies"
	@echo ""
	@echo " Production:"
	@echo "   make build-web-prod            ➜ Build web (prod)"
	@echo ""
	@echo " Mobile:"
	@echo "   make build-apk-release         ➜ Build APK release"
	@echo "   make build-appbundle-release   ➜ Build AppBundle release"
	@echo "   make build-ios-release         ➜ Build iOS release"
	@echo ""
	@echo " Cleanup:"
	@echo "   make clean                     ➜ Clean Flutter cache"
	@echo ""
	@echo " Help:"
	@echo "   make help                      ➜ Show this menu"
	@echo "──────────────────────────────────────────────"

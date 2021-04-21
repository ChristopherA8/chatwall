TARGET := iphone:clang:latest:7.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = chatwallprefs

$(BUNDLE_NAME)_FILES = $(wildcard *.m)
chatwallprefs_FRAMEWORKS = UIKit
chatwallprefs_PRIVATE_FRAMEWORKS = Preferences
$(BUNDLE_NAME)_LIBRARIES = imagepicker
$(BUNDLE_NAME)_EXTRA_FRAMEWORKS += Cephei CepheiPrefs
chatwallprefs_INSTALL_PATH = /Library/PreferenceBundles
chatwallprefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

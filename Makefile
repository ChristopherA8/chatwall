TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard
# INSTALL_TARGET_PROCESSES = MobileSMS Preferences
ARCHS = arm64 arm64e


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ChatWall

ChatWall_FILES = Tweak.xm
$(TWEAK_NAME)_LIBRARIES = imagepicker
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += Cephei
ChatWall_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += chatwallprefs
include $(THEOS_MAKE_PATH)/aggregate.mk

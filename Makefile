ARCHS = armv7 armv7s arm64

TARGET = iphone:clang:latest:7.0

THEOS_BUILD_DIR = Packages

include theos/makefiles/common.mk

BUNDLE_NAME = Firewall_iP7_Flipswitch
Firewall_iP7_Flipswitch_CFLAGS = -fobjc-arc
Firewall_iP7_Flipswitch_FILES = FirewallIP7FlipswitchToggleSwitch.x
Firewall_iP7_Flipswitch_FRAMEWORKS = Foundation UIKit
Firewall_iP7_Flipswitch__PRIVATE_FRAMEWORKS = GraphicsServices
Firewall_iP7_Flipswitch_LDFLAGS = -weak_library libflipswitch.dylib
Firewall_iP7_Flipswitch_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "rm -rf /tmp/FlipswitchCache; killall -9 backboardd"

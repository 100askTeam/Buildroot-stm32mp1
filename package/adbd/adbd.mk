################################################################################
#
# 100ask stm32mp157 board  adbd  weidongshan@qq.com
#
################################################################################
ADBD_VERSION = 3e06ad6d822d0241511e7b454b1df5fabaab6049
ADBD_SITE = https://gitee.com/weidongshan/RootfsPackages.git
ADBD_SITE_METHOD = git
ADBD_LICENSE = GPL-3.0

define ADBD_BUILD_CMDS
    $(INSTALL) -D -m 0755 $(@D)/adbd/61-usb-adbd.rules \
        $(TARGET_DIR)/etc/udev/rules.d/61-usb-adbd.rules
    $(INSTALL) -D -m 0755 $(@D)/adbd/usb_config \
        $(TARGET_DIR)/usr/bin/usb_config
endef
                                                                                                                                                                                                                                   
define ADBD_INSTALL_INIT_SYSV
        $(INSTALL) -D -m 0755 $(@D)/adbd/adbd.sh \
                $(TARGET_DIR)/etc/init.d/adbd.sh
endef

define ADBD_INSTALL_INIT_SYSTEMD
        $(INSTALL) -D -m 0755 $(@D)/adbd/adbd.sh \
                $(TARGET_DIR)/sbin/adbd.sh
        $(INSTALL) -D -m 644 $(@D)/adbd/usbotg-adbd.service \
                $(TARGET_DIR)/lib/systemd/system/usbotg-adbd.service
endef
                                                                                                                                                                                                                                   
$(eval $(generic-package))

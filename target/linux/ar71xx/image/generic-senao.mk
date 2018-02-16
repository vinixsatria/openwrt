define Build/senao-factory-image
	mkdir -p $@.senao

	touch $@.senao/before-upgrade.sh
	touch $@.senao/FWINFO-$(BOARDNAME)-OpenWrt-v9.9.9-$(REVISION).txt
	$(CP) $(IMAGE_KERNEL) $@.senao/openwrt-senao-$(1)-uImage-lzma.bin
	$(CP) $@ $@.senao/openwrt-senao-$(1)-root.squashfs

	$(TAR) -c \
		--numeric-owner --owner=0 --group=0 --sort=name \
		$(if $(SOURCE_DATE_EPOCH),--mtime="@$(SOURCE_DATE_EPOCH)") \
		-C $@.senao . | gzip -9nc > $@

	rm -rf $@.senao
endef


define Device/ens202ext
  DEVICE_TITLE := EnGenius ENS202EXT
  BOARDNAME := ENS202EXT
  DEVICE_PACKAGES := rssileds
  KERNEL_SIZE := 1536k
  IMAGE_SIZE := 13632k
  IMAGES += factory.bin
  MTDPARTS := spi0.0:256k(u-boot)ro,64k(u-boot-env),320k(custom)ro,1536k(kernel),12096k(rootfs),2048k(failsafe)ro,64k(art)ro,13632k@0xa0000(firmware)
  IMAGE/factory.bin := append-rootfs | pad-rootfs | senao-factory-image ens202ext
  IMAGE/sysupgrade.bin := append-kernel | pad-to $$$$(KERNEL_SIZE) | append-rootfs | pad-rootfs | check-size $$$$(IMAGE_SIZE)
endef
TARGET_DEVICES += ens202ext

define Device/ews860ap
  DEVICE_TITLE := Engenius EWS860AP
  DEVICE_PACKAGES := kmod-ath10k ath10k-firmware-qca988x
  BOARDNAME = EWS860AP
  KERNEL_SIZE := 1536k
  IMAGE_SIZE = 13120k
  MTDPARTS = spi0.0:256k(u-boot)ro,64k(u-boot-env),320k(custom)ro,1536k(kernel),11584k(rootfs),2560k(failsafe)ro,64k(ART)ro,13120k@0xa0000(firmware)
  IMAGES += factory.bin
  IMAGE/factory.bin := append-rootfs | pad-rootfs | senao-factory-image ews860ap
  IMAGE/sysupgrade.bin := append-kernel | pad-to $$$$(KERNEL_SIZE) | append-rootfs | pad-rootfs | check-size $$$$(IMAGE_SIZE)
endef
TARGET_DEVICES += ews860ap

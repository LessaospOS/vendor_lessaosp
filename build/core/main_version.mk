# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

ifeq ($(LESSAOSP_GAPPS),true)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.lessaosp.ziptype=Gapps
else
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.lessaosp.ziptype=Vanilla
endif

# LessaospOS Platform Display Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.lessaosp.display.version=$(LESSAOSP_DISPLAY_VERSION) \
    ro.lessaosp.build.version=$(LESSAOSP_BUILD_VERSION) \
    ro.lessaosp.build.date=$(BUILD_DATE) \
    ro.lessaosp.buildtype=$(LESSAOSP_BUILD_TYPE) \
    ro.lessaosp.fingerprint=$(ROM_FINGERPRINT) \
    ro.lessaosp.version=$(LESSAOSP_VERSION) \
    ro.lessaosp.base.codename=$(LESSAOSP_CODENAME) \
    ro.lessaosp.base.version=$(LESSAOSP_NUM_VER) \
    ro.modversion=$(LESSAOSP_VERSION)

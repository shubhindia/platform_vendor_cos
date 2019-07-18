# Set all versions
ifeq ($(COS_RELEASE),true)
COSMIC_BUILD_TYPE := OFFICIAL
else
COSMIC_BUILD_TYPE := UNOFFICIAL
endif

COSMIC_DATE_YEAR := $(shell date -u +%Y)
COSMIC_DATE_MONTH := $(shell date -u +%m)
COSMIC_DATE_DAY := $(shell date -u +%d)
COSMIC_DATE_HOUR := $(shell date -u +%H)
COSMIC_DATE_MINUTE := $(shell date -u +%M)
COSMIC_VERSION_NUMBER := 4.0-Corona
COSMIC_BUILD_DATE_UTC := $(shell date -d '$(COSMIC_DATE_YEAR)-$(COSMIC_DATE_MONTH)-$(COSMIC_DATE_DAY) $(COSMIC_DATE_HOUR):$(COSMIC_DATE_MINUTE) UTC' +%s)
COSMIC_BUILD_DATE := $(COSMIC_DATE_YEAR)$(COSMIC_DATE_MONTH)$(COSMIC_DATE_DAY)-$(COSMIC_DATE_HOUR)$(COSMIC_DATE_MINUTE)

COSMIC_PLATFORM_VERSION := 9.0

TARGET_PRODUCT_SHORT := $(subst cos_,,$(COSMIC_BUILD))

ifeq ($(IS_GO_VERSION), true)
COSMIC_VERSION := Cosmic-OS_go-v$(COSMIC_VERSION_NUMBER)-$(COSMIC_BUILD)-$(COSMIC_BUILD_DATE)-$(COSMIC_BUILD_TYPE)
ROM_FINGERPRINT := Cosmic-OS_go/v$(COSMIC_VERSION_NUMBER)/$(TARGET_PRODUCT_SHORT)/$(COSMIC_BUILD_DATE)
COSMIC_VERSION_PROP := $(COSMIC_VERSION_NUMBER)-$(COSMIC_BUILD_TYPE)-GO
else
COSMIC_VERSION := Cosmic-OS-v$(COSMIC_VERSION_NUMBER)-$(COSMIC_BUILD)-$(COSMIC_BUILD_DATE)-$(COSMIC_BUILD_TYPE)
COSMIC_VERSION_PROP := $(COSMIC_VERSION_NUMBER)-$(COSMIC_BUILD_TYPE)
ROM_FINGERPRINT := Cosmic-OS/v$(COSMIC_VERSION_NUMBER)/$(TARGET_PRODUCT_SHORT)/$(COSMIC_BUILD_DATE)
MODVERSION := Cosmic-OS-v$(COSMIC_VERSION_NUMBER)-$(COSMIC_BUILD)-$(COSMIC_BUILD_DATE)
endif

COSMIC_PROPERTIES := \
    ro.modversion==$(MODVERSION) \
    ro.cos.version=$(COSMIC_VERSION_PROP) \
    ro.cos.build_date=$(COSMIC_BUILD_DATE) \
    ro.cos.build_date_utc=$(COSMIC_BUILD_DATE_UTC) \
    ro.cos.build_type=$(COSMIC_BUILD_TYPE) \
    ro.cos.fingerprint=$(ROM_FINGERPRINT)

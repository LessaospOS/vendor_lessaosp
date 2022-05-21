# Copyright (C) 2016-2017 AOSiP
# Copyright (C) 2020 Fluid
# Copyright (C) 2021 AwakenOS
# Copyright (C) 2021 LessaospOS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Versioning System
LESSAOSP_CODENAME := SnowWhite
LESSAOSP_NUM_VER := 2.0

TARGET_PRODUCT_SHORT := $(subst lessaosp_,,$(LESSAOSP_BUILD_TYPE))

LESSAOSP_BUILD_TYPE ?= UNOFFICIAL

# Only include Updater for official  build
ifeq ($(filter-out OFFICIAL,$(LESSAOSP_BUILD_TYPE)),)
    PRODUCT_PACKAGES += \
        Updater
endif

# Sign builds if building an official build
ifeq ($(filter-out OFFICIAL,$(LESSAOSP_BUILD_TYPE)),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := $(KEYS_LOCATION)
endif

# Set all versions
BUILD_DATE := $(shell date -u +%Y%m%d)
BUILD_TIME := $(shell date -u +%H%M)
LESSAOSP_BUILD_VERSION := $(LESSAOSP_NUM_VER)-$(LESSAOSP_CODENAME)
LESSAOSP_VERSION := $(LESSAOSP_BUILD_VERSION)-$(LESSAOSP_BUILD)-$(LESSAOSP_BUILD_TYPE)-Vanilla-$(BUILD_TIME)-$(BUILD_DATE)
ifeq ($(LESSAOSP_GAPPS), true)
LESSAOSP_VERSION := $(LESSAOSP_BUILD_VERSION)-$(LESSAOSP_BUILD)-$(LESSAOSP_BUILD_TYPE)-Gapps-$(BUILD_TIME)-$(BUILD_DATE)
endif
ROM_FINGERPRINT := Lessaosp/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(BUILD_TIME)
LESSAOSP_DISPLAY_VERSION := $(LESSAOSP_VERSION)
RELEASE_TYPE := $(LESSAOSP_BUILD_TYPE)

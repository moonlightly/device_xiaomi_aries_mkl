#
# Copyright 2012 The Android Open Source Project
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
#

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Get the long list of APNs
PRODUCT_COPY_FILES := device/xiaomi/msm8960-common/configs/apns-conf.xml:system/etc/apns-conf.xml

# include additional build utilities
-include device/xiaomi/msm8960-common/utils.mk

# qcom common
$(call inherit-product, device/xiaomi/msm8960-common/common.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_NAME := mk_aries
PRODUCT_DEVICE := aries
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := MI 2
PRODUCT_MANUFACTURER := Xiaomi
BUILD_NUMBER := eng.$(USER).$(shell date +%Y%m%d.%H%M%S)

PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=aries PRODUCT_NAME=aries
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=Xiaomi/aries/aries:5.0.2/LRX22G/5.2.13:userdebug/test-keys PRIVATE_BUILD_DESC="aries-userdebug 5.0 LRX21M 4.12.8 test-keys"

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/xiaomi/aries/aries.mk)
$(call inherit-product-if-exists, vendor/xiaomi/aries/aries-vendor.mk)
$(call inherit-product, vendor/mk/config/common_full_phone.mk)

#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Bootanimation size
TARGET_BOOTANIMATION_SIZE := 720x407

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from titan device
$(call inherit-product, device/motorola/titan/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := titan
PRODUCT_NAME := omni_titan
PRODUCT_RELEASE_NAME := MOTO G
PRODUCT_BRAND := motorola
PRODUCT_MODEL := titan
PRODUCT_MANUFACTURER := motorola

#
# SPDX-FileCopyrightText: 2021-2024 The LineageOS Project
# SPDX-FileCopyrightText: 2021-2024 The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
BUILD_BROKEN_DUP_RULES := true
DISABLE_ARTIFACT_PATH_REQUIREMENTS := true

# Lineage Health
TARGET_HEALTH_CHARGING_CONTROL_SUPPORTS_DEADLINE := true
TARGET_HEALTH_CHARGING_CONTROL_SUPPORTS_TOGGLE := false

TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_KERNEL_CONFIG := cloudripper_gki_defconfig
TARGET_NO_KERNEL_OVERRIDE := true
TARGET_KERNEL_SOURCE := kernel/google/pantah/cheetah

# Manifests
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/infinity/config/device_framework_matrix.xml
DEVICE_MANIFEST_FILE += device/google/gs201/android.hardware.security.rkp-service.citadel.xml
ifneq ($(BOARD_WITHOUT_RADIO),true)
DEVICE_MANIFEST_FILE += device/google/gs201/manifest_radio_ds.xml
endif

# Partitions
AB_OTA_PARTITIONS += \
    vendor \
    vendor_dlkm

BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# Enable chain partition for vendor.
BOARD_AVB_VBMETA_VENDOR := vendor
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 3

AB_OTA_PARTITIONS += \
    vbmeta_vendor

# Reserve space for gapps install
-include vendor/infinity/config/BoardConfigReservedSize.mk

# Props
DEVICE_PATH := device/google/gs201

# Verified Boot
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

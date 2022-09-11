#
# Copyright (C) 2021-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8150-common
include device/xiaomi/sm8150-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/nabu

NABU_KERNEL := true

BUILD_BROKEN_DUP_RULES := true

# Board
TARGET_BOOTLOADER_BOARD_NAME := nabu

# Assert
TARGET_OTA_ASSERT_DEVICE := nabu

# Display
TARGET_SCREEN_DENSITY := 440

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop

ifeq ($(NABU_KERNEL),true)
BOARD_BOOT_HEADER_VERSION := 3
KERNEL_LD := LD=ld.lld
TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_SOURCE := kernel/xiaomi/nabu
TARGET_KERNEL_CONFIG := nabu_user_defconfig
else
TARGET_KERNEL_SOURCE := kernel/xiaomi/sm8150-legacy
TARGET_KERNEL_CONFIG += vendor/xiaomi/nabu.config
endif

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):init_xiaomi_nabu
TARGET_RECOVERY_DEVICE_MODULES := init_xiaomi_nabu

# Inherit from the proprietary version
include vendor/xiaomi/nabu/BoardConfigVendor.mk
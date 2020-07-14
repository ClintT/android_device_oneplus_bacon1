#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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

# inherit from Oppo msm8974-common
-include device/oppo/msm8974-common/BoardConfigCommon.mk

# Platform
BOARD_VENDOR := oppo

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=bacon user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=msm_sdcc.1
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += loop.max_part=7
TARGET_KERNEL_CONFIG := bacon_defconfig
TARGET_KERNEL_SOURCE := kernel/oneplus/msm8974
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
KERNEL_TOOLCHAIN := $(PWD)/prebuilts/gcc/linux-x86/arm/arm-eabi-linaro-7/bin

# Assert
TARGET_OTA_ASSERT_DEVICE := bacon,A0001

# Audio
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/oneplus/bacon/bluetooth

# Camera
HAS_LEGACY_CAMERA_HAL1 := true

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE     := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE    := 536870912
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 1388314624
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13271448576
BOARD_USERDATAEXTRAIMAGE_PARTITION_SIZE := 59914792960
BOARD_USERDATAEXTRAIMAGE_PARTITION_NAME := 64G

# Init
TARGET_LIBINIT_MSM8974_DEFINES_FILE := device/oneplus/bacon/init/init_bacon.cpp

# Properties
TARGET_SYSTEM_PROP += device/oneplus/bacon/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := device/oneplus/bacon/rootdir/etc/fstab.recovery

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/oneplus/bacon/sepolicy

# Snapdragon LLVM
TARGET_USE_SDCLANG := true

# TWRP
ifeq ($(WITH_TWRP),true)
TARGET_RECOVERY_DEVICE_DIRS += device/oneplus/bacon/twrp
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
endif

# Inherit from the proprietary version
include vendor/oneplus/bacon/BoardConfigVendor.mk

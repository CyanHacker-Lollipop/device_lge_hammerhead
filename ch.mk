################OPTIMIZATIONS###################
#Use Optimizations?
USE_OPTIMIZATIONS := true

ifneq ($(strip $(USE_OPTIMIZATIONS)),false)
include vendor/ch/config/sm_clear_vars.mk
# Find host os
UNAME := $(shell uname -s)

ifeq ($(strip $(UNAME)),Linux)
  HOST_OS := linux
endif

# Only use these compilers on linux host.
ifeq ($(strip $(HOST_OS)),linux)
#HACKIFY CONFIGURATION 

##Define ROM toolchain
TARGET_GCC_AND := 4.9-sm

##Define NDK toolchain
TARGET_NDK_VERSION := 4.9

##Define Kernel toolchain
TARGET_GCC_ARM := 4.9-sm

##Enable Pthread (only on newer devices)
ENABLE_PTHREAD := true

##How many threads does the device have?
PRODUCT_THREADS := 4

GRAPHITE_KERNEL_FLAGS := \
    -floop-parallelize-all \
    -ftree-parallelize-loops=$(PRODUCT_THREADS) \
    -fopenmp

# Extra SaberMod GCC C flags for arch target and Kernel
export EXTRA_SABERMOD_GCC_VECTORIZE_CFLAGS := \
         -ftree-vectorize \
         -mvectorize-with-neon-quad

# General flags for gcc 4.9 to allow compilation to complete.
MAYBE_UNINITIALIZED := \
  hwcomposer.msm8974

else
$(error *  Please compile on a Linux host OS to use this optimizations)
endif
endif
#################################################

##If you´re running an old device, set this to true
USE_LEGACY_GCC := false

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
TARGET_BOOTANIMATION_HALF_RES := true

# Inherit some common CM stuff.
$(call inherit-product, vendor/ch/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/ch/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/lge/hammerhead/full_hammerhead.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := hammerhead
PRODUCT_NAME := ch_hammerhead
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 5
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=hammerhead \
    BUILD_FINGERPRINT=google/hammerhead/hammerhead:5.1/LMY47I/1767468:user/release-keys \
    PRIVATE_BUILD_DESC="hammerhead-user 5.1 LMY47I 1767468 release-keys"

# Enable Torch
PRODUCT_PACKAGES += Torch

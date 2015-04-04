################OPTIMIZATIONS###################
#Use Optimizations?
USE_OPTIMIZATIONS := true

ifneq ($(strip $(USE_OPTIMIZATIONS)),false)
#HACKIFY CONFIGURATION 

##Define ROM toolchain and LIB Verison(should be the same version number as the toolchain)
TARGET_GCC_AND := 4.8-sm
TARGET_LIB_VERSION := 4.8

##Define Kernel toolchain
TARGET_GCC_ARM := 4.9-sm

##Enable Pthread (only on newer devices)
ENABLE_PTHREAD := true

##Enable O3 Optimizations
O3_OPTIMIZATIONS:= true

##Enable ArchiDroid Optimizations
ARCHIDROID_OPTIMIZATIONS := true
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

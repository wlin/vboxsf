LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := mount.vboxsf.c vbsfmount.c

LOCAL_SHARED_LIBRARIES := libcutils

LOCAL_C_INCLUDES := vbsfmount.h
LOCAL_MODULE := mount.vboxsf
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := init.vboxsf.rc vboxsf.sh
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

VBOXSF_ANDROID_MAJOR_VERSION := $(word 1, $(subst ., , $(PLATFORM_VERSION)))

LOCAL_MODULE := init.vboxsf.rc
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_TAGS := optional
ifeq "6" "$(VBOXSF_ANDROID_MAJOR_VERSION)"
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
else
LOCAL_INIT_RC := init.vboxsf.rc
endif

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := vboxsf.sh
LOCAL_MODULE_CLASS := EXECUTABLE
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
include $(BUILD_PREBUILT)


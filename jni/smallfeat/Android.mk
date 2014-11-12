LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := smallfeat-common

LOCAL_SRC_FILES :=\
	main.c \

LOCAL_STATIC_LIBRARIES := \
	cpufeatures \

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

# Enable PIE manually. Will get reset on $(CLEAR_VARS).
LOCAL_CFLAGS += -fPIE
LOCAL_LDFLAGS += -fPIE -pie

LOCAL_MODULE := smallfeat

LOCAL_STATIC_LIBRARIES := \
	smallfeat-common \

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE := smallfeat-nopie

LOCAL_STATIC_LIBRARIES := \
	smallfeat-common \

include $(BUILD_EXECUTABLE)

$(call import-module,android/cpufeatures)

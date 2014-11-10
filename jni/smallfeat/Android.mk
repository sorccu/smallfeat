LOCAL_PATH := $(call my-dir)

MY_SRC_FILES := \
	main.c \

MY_STATIC_LIBRARIES := \
	cpufeatures \

include $(CLEAR_VARS)

# Enable PIE manually. Will get reset on $(CLEAR_VARS).
LOCAL_CFLAGS += -fPIE
LOCAL_LDFLAGS += -fPIE -pie

LOCAL_MODULE := smallfeat

LOCAL_SRC_FILES := $(MY_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(MY_STATIC_LIBRARIES)

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE := smallfeat-nopie

LOCAL_SRC_FILES := $(MY_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(MY_STATIC_LIBRARIES)

include $(BUILD_EXECUTABLE)

$(call import-module,android/cpufeatures)

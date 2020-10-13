APP_DIR		= $(PROJECT_ROOT)/applications
LIB_DIR 	= $(PROJECT_ROOT)/lib

CFLAGS		+= -I$(APP_DIR)

APP_RELEASE ?= 0
ifeq ($(APP_RELEASE), 1)
APP_DISPLAY = 1
APP_INPUT = 1
endif

APP_TEST	?= 0
ifeq ($(APP_TEST), 1)
CFLAGS		+= -DAPP_TEST
C_SOURCES	+= $(APP_DIR)/tests/furiac_test.c
C_SOURCES	+= $(APP_DIR)/tests/furi_record_test.c
C_SOURCES	+= $(APP_DIR)/tests/test_index.c
C_SOURCES	+= $(APP_DIR)/tests/minunit_test.c
C_SOURCES	+= $(APP_DIR)/tests/furi_valuemutex_test.c
endif

APP_EXAMPLE_BLINK ?= 0
ifeq ($(APP_EXAMPLE_BLINK), 1)
CFLAGS		+= -DAPP_EXAMPLE_BLINK
C_SOURCES	+= $(APP_DIR)/examples/blink.c
endif

APP_EXAMPLE_UART_WRITE ?= 0
ifeq ($(APP_EXAMPLE_UART_WRITE), 1)
CFLAGS		+= -DAPP_EXAMPLE_UART_WRITE
C_SOURCES	+= $(APP_DIR)/examples/uart_write.c
endif

APP_EXAMPLE_IPC ?= 0
ifeq ($(APP_EXAMPLE_IPC), 1)
CFLAGS		+= -DAPP_EXAMPLE_IPC
C_SOURCES	+= $(APP_DIR)/examples/ipc.c
endif

APP_EXAMPLE_INPUT_DUMP ?= 0
ifeq ($(APP_EXAMPLE_INPUT_DUMP), 1)
CFLAGS		+= -DAPP_EXAMPLE_INPUT_DUMP
C_SOURCES	+= $(APP_DIR)/examples/input_dump.c
APP_INPUT = 1
endif

APP_EXAMPLE_QRCODE ?= 0
ifeq ($(APP_EXAMPLE_QRCODE), 1)
CFLAGS		+= -DAPP_EXAMPLE_QRCODE
C_SOURCES	+= $(APP_DIR)/examples/u8g2_qrcode.c
C_SOURCES	+= $(LIB_DIR)/qrcode/qrcode.c
APP_DISPLAY = 1
endif

APP_EXAMPLE_DISPLAY ?= 0
ifeq ($(APP_EXAMPLE_DISPLAY), 1)
CFLAGS		+= -DAPP_EXAMPLE_DISPLAY
C_SOURCES	+= $(APP_DIR)/examples/u8g2_example.c
APP_DISPLAY = 1
endif

APP_EXAMPLE_FATFS ?= 0
ifeq ($(APP_EXAMPLE_FATFS), 1)
CFLAGS		+= -DAPP_EXAMPLE_FATFS
C_SOURCES	+= $(APP_DIR)/examples/fatfs_list.c
APP_INPUT = 1
APP_DISPLAY = 1
endif

# device drivers

ifeq ($(APP_DISPLAY), 1)
CFLAGS		+= -DAPP_DISPLAY
C_SOURCES	+= $(APP_DIR)/display-u8g2/display-u8g2.c
endif

APP_INPUT	?= 0
ifeq ($(APP_INPUT), 1)
CFLAGS		+= -DAPP_INPUT
C_SOURCES	+= $(APP_DIR)/input/input.c
endif
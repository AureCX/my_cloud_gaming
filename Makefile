NAME    	=       my_cloud_gaming

BUILD_DIR	=	build

SRC_DIR		=	src

SRC		=	$(shell find $(SRC_DIR) -name "*.c")

OBJ 		=	$(SRC:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)

ifeq ($(OS),Windows_NT)
    CC := x86_64-w64-mingw32-gcc
    EXE := .exe
else
    CC := gcc
    EXE :=
endif

CFLAGS		= 	-I./include

all: $(BUILD_DIR)/$(NAME)$(EXE)

$(BUILD_DIR)/$(NAME)$(EXE): $(OBJ)
	@mkdir -p $(BUILD_DIR)
	$(CC) $(OBJ) -o $@ $(LDFLAGS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJ)

clean_tmp:
	$(RM) *~ && $(RM) $(BUILD_DIR)/*~ && $(RM) $(SRC_DIR)/*~

fclean: clean clean_tmp
	$(RM) $(BUILD_DIR)/$(NAME)
	$(RM) -rd $(BUILD_DIR)

re:	fclean all

multi:	fclean
	$(MAKE) -j16

.PHONY: all $(NAME) clean clean_tmp fclean re multi

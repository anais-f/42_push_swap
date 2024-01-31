# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/16 18:25:46 by anfichet          #+#    #+#              #
#    Updated: 2024/01/31 14:49:28 by anfichet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = push_swap

CHECKER = checker

LIBS = libft.a

# *********************************VARIABLES**************************************** #

SRCS_DIR = ./SRCS

SRCS =\
		dlst_utils.c \
		push_swap.c \
		parsing.c \
		rules_swap.c \
		rules_rotate.c \
		rules_reverse.c \
		rules_push.c \
		stack_utils.c \
		algorithm.c \
		algorithm_utils.c \

SRCS := $(SRCS:%=$(SRCS_DIR)/%)

SRCS_BONUS =\
		checker_bonus.c \
		checker_parsing_bonus.c \
		checker_rules_swap_bonus.c \
        checker_rules_rotate_bonus.c \
        checker_rules_reverse_bonus.c \
        checker_rules_push_bonus.c \
        checker_stack_utils_bonus.c \
        checker_dlst_utils_bonus.c \
		
SRCS_BONUS := $(SRCS_BONUS:%=$(SRCS_DIR)/%)

OBJS_DIR = ./OBJS

OBJS = $(SRCS:$(SRCS_DIR)/%.c=$(OBJS_DIR)/%.o)

OBJS_BONUS = $(SRCS_BONUS:$(SRCS_DIR)/%.c=$(OBJS_DIR)/%.o)

INCS = ./INCS

INCS_LIBS = ./libft/INCS

DEPS = $(OBJS:.o=.d)

DEPS_BONUS = $(OBJS_BONUS:.o=.d)

LIBS_TARGET = ./libft/libft.a

# **********************************COMMANDS**************************************** #

CC = cc

CFLAGS = -Werror -Wextra -Wall -g3 -MMD -MP

CPPFLAGS = -I$(INCS) -I$(INCS_LIBS)

CFSIGSEV = -fsanitize=address

VALGRIND = valgrind -q --leak-check=full --show-reachable=yes

RM = rm -rf

DIR_DUP= mkdir -p $(@D)

AR = ar rcs

MAKEFLAGS += --no-print-directory

# **********************************RULES**************************************** #

all:	bonus $(NAME)

bonus: $(CHECKER)

-include $(DEPS)
-include $(DEPS_BONUS)

$(NAME): $(LIBS_TARGET) $(OBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(OBJS) -L$(dir $(LIBS_TARGET)) -lft -o $(NAME)

#-L ou se trouve la librairie
# -l + nom de la lib qu'on veut lui donner, soit ft ici

$(CHECKER): $(LIBS_TARGET) $(OBJS_BONUS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(OBJS_BONUS) -L$(dir $(LIBS_TARGET)) -lft -o $(CHECKER)

$(LIBS_TARGET): FORCE
	@echo " "
	@echo "\033[1m\033[32m#-------------------------[COMPILATION LIBFT]-------------------------#\033[0m"
	$(MAKE) -C $(@D)
	@echo "\033[1m\033[32m#---------------------------[LIBFT COMPILED]--------------------------#\033[0m"
	@echo " "

$(OBJS_DIR)/%.o: $(SRCS_DIR)/%.c
	@$(DIR_DUP)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

#-c prend les .c et les creer en .o
# -o : sert a donner les noms

fsanitize : fclean $(LIBS_TARGET) $(OBJS) $(INCS)
	$(CC) $(CFLAGS) $(CFSIGSEV) $(CPPFLAGS) $(OBJS) -L$(dir $(LIBS_TARGET)) -lft -o $(NAME)

fsanitize_bonus : fclean $(LIBS_TARGET) $(OBJS_BONUS) $(INCS)
	$(CC) $(CFLAGS) $(CFSIGSEV) $(CPPFLAGS) $(OBJS_BONUS) -L$(dir $(LIBS_TARGET)) -lft -o $(CHECKER)

valgrind :
	$(MAKE) $(VALGRIND)

clean :
	$(RM) $(OBJS_DIR)
	$(MAKE) $@ -C ./libft
# -C pour lui donner le directory pour qu'il aille faire la regle dans le dossier libft

fclean : clean
	$(RM) $(NAME)
	$(MAKE) $@ -C ./libft

re : fclean all

print% :
	@echo $(patsubst print%,%,$@)=
	@echo $($(patsubst print%,%,$@))

.PHONY: all clean fclean re FORCE doggy saiko valgrind bonus fsanitize kitty print%
FORCE:
# FORCE permet de forcer la regle a s'executer, donc verifier si la lib est a jour ou si elle doit etre refaite


# Colors
BLACK=\033[30m
RED=\033[31m
GREEN=\033[32m
YELLOW=\033[33m
BLUE=\033[34m
PURPLE=\033[35m
CYAN=\033[36m
WHITE=\033[37m

# Text
ERASE=\033[2K\r
RESET=\033[0m
BOLD=\033[1m
FAINT=\033[2m
ITALIC=\033[3m
UNDERLINE=\033[4m


doggy:
		@echo "⠀⠀⢀⣶⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
		@echo "⠀⢀⣾⣿⣿⣿⣶⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
		@echo "⠀⣼⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
		@echo "⢰⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣄⣀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
		@echo "⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
		@echo "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣄⣠⣾⣴⣶⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
		@echo "⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀"
		@echo "⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠻⠟⠀⠈⠁⠀⠀⠰⠶⣤⣄⣀⣀⣠⣤⣴⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⠀⠀⠀⠀"
		@echo "⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⡿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀"
		@echo "⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣆⠀⠀"
		@echo "⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣞⣿⣿⣿⣿⣿⡆⠀"
		@echo "⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡜⣿⣿⣿⣿⣿⡀"
		@echo "⢀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠹⣿⣿⣿⣿⡇"
		@echo "⠈⠉⠉⣻⣿⣿⣿⣿⣿⣿⠃⡀⠀⠀⣠⣴⣾⣿⣷⡄⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠹⣿⣿⣿⣿"
		@echo "⠀⠀⠀⢸⡿⣻⣿⣿⣿⣿⡾⠁⠀⠀⠉⢿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠙⠻⠿⠇"
		@echo "⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿⣿⣿⣿⡃⠀⠀⠀⠀⠀"
		@echo "⠀⠀⣧⣀⠘⠛⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣧⢸⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀"
		@echo "⠀⠀⠘⢿⣿⣶⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀"
		@echo "⠀⠀⠀⠀⠙⠻⠿⢿⠿⠿⠻⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠯⠁⠀⠀⠀⠀"
		@echo "⠀⠀⠀⠀⠀⢀⣴⣯⠀⠀⠀⠈⠳⡀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠆⠀⠀⠀⠀⠀"
		@echo "⠀⠀⠀⠀⠀⢛⣿⡟⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠸⣿⡟⣻⣿⣿⡟⣿⡿⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀"
		@echo "⠀⠀⠀⠀⠰⠿⣿⣟⣧⡀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠘⢿⣿⣿⠇⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀"
		@echo "⠀⠀⠀⠀⠀⠀⣿⣿⣿⡇⣆⠀⠀⠀⠀⠀⠀⠘⢿⣆⣀⣀⣀⣀⣀⣠⣤⣤⣄⣀⡀⠀⣀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀"
		@echo "⠀⠀⠀⠀⠀⠀⠉⠀⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠈⠛⠿⠟⣛⣻⣿⣯⣷⣾⣿⣿⣿⣛⡛⠛⠉⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀"
		@echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠟⣷⠠⣇⠀⠀⠀⠀⠀⠀⠀⠛⠻⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠁⠉⠀⠀⠀⠀⠀⠀"
		@echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣆⠀⣶⡀⢀⣄⠀⠀⠀⠀⠉⠙⠛⠋⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
		@echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣷⣼⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
		@echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
		@echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠀⠙⢿⣿⡈⠻⢿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
		@echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠻⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
		@echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
		@echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"⠀

saiko:
		@echo " ..    .,**,         ....          ............ .    ..... ...   .,,,,...............,,,....,*/////(((/**////*,,,,,,,,... .......,,****//((((((((########%%%%%%%%%%%%%#(*,,/(###((///////**,,,,,......    "
		@echo " ,.....,///*...,,.,,,,,..        .....  .....   ...,,,,,,,****,,,,*///////********////****//(((##(#(#((((##((///*,,,,,...,,,,,,,..,,,,,,,,,,,.,,,**///////(((###%%%%%##/*../(#%%%%##(((((/////(//**,,,,.. "
		@echo " ,,,,.,******.,******,,,..........,,,. ........,,,****/*//((((////((##((///*////(((((///((((###########%%##((((((/////************,,,,,..........,,,************//((((/*. .*/(###((/****///**///(/**//**, "
		@echo " ///////////((///**********,,******/**,,,,,,,,,,,,,,,,,,,,////**,*//(//////////(((####(((((((((((########((//(((//(((((((////////***,,,,.......,,,****////***,,,,,,,,,,..   ..,,,**,,,,......,**////****, "
		@echo " ##((((#(((((#(((/////(((((((#######((////////(((//*,..,,.**/////((((///(((/**//((((((((((((////(((/(/(((//*//((((((((((((/*/////***,,,,,,,,,,*******////***,,,,.........   ........,...........,,,,,,... "
		@echo " #%#####################%%%%%%%%######%%%%##%%%%%###((///**/////(((////((((/**/(####((((##(//**/(((////(((/**///((////((//*****/********//////(((((((((((/*,,,,,.........  .............       .......... "
		@echo " %%%####%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&&&&%%%%%%%####%%%%%########((/((####(/((#%%%###%%############(####((/((((((((####(((((((((//////(((///((########(/**,,,,,,,,,,... .,,******/***,...,,... ..    .  "
		@echo " ((((##%%#########((/((((((((((((######%###########((##%%%%####(((((//((#%#(//(((((((###########%%%%###%##(((#####((######((((((((////(((((//(((((((((((////////////**,.  .,*///((((((((///(((//*,,...    "
		@echo " //(((##(((((((((((((/(((((###(((((/////((((((((####(((#####((((((///**/(((/*////////((#(((##############(//((###((//(((((#####(((#####%%#####%%%%%#####((##########(/,.  ,/(####%%%###########(//*,,,... "
		@echo " ((####(((((###%%#######%####((((////(((((######%####%%%####((((((////////****,,,...,**//((((((((((((/((((/*/(((((//*//((((((#((((###%%%%%%%%%%%%####%%#########((((/*.   .,///((((##########((((/////*** "
		@echo " ((######(((((###(((((#####((((//((((((((((#((#(#(((#####((((((((((((((#((///((((////(((((((((((###((((///**********,,***,***///***////((((//((((((((((((/////**,,....       ....  ..,,,,,,,,,,,,,,,,,,,, "
		@echo " #######((((((((//**,,*/####(/*,**//((///////((///((####((///(((((((////**/(((((((((#((/////**//(///////*,,...,,,*,,,...........    ..............,*,,,..............                                   . "
		@echo " ((###((///(((////*,,.,*/((((//**/////**,**//***,**/////*****//****,*//////((/***,**,,,........................,,,,,,,..............        ...  ......      ..                      ...                  "
		@echo " (((((((//**///(//**,.,,*******/**//**,,,**////*******//**,****,,...............................       ...,,,..     ............ ....      ..      ...... ......                           ......  ....., "
		@echo " ****////**,,**/////****//((((/((((/*,.,,,,**////*,,,.......,,,.........      ..       ....,,....         ....           ............   .....,,.. .....    ..                    .......    ...... ..,,,* "
		@echo " ..,,,**/((///((/////////////****,,.,,***,,,**///**,.......................  ........,,..,*/#*#/*((/..                      ....        .........  ...                          ..,*****,,............... "
		@echo " .,****/////////*******,,,,.......,,,*****,,,,,,.........  ..,,,,,.. ...........,**//((#((((/,*(/.(*(,,......               ....        ...........                             ...,,****,,,,,,,****,,,.. "
		@echo " (((#######(///////////*,. ..     ..,,,****,,,,..........,,**//**,,,,,,,,***//(#####(//*,/,*###,(,.*((,,.........             ..................              .                 ...............,,,,,,,... "
		@echo " &&&&&&&&&&&&&&%%##((//,. .,/(((//********,,,,,,.......,,**////****////((##%%%%%%#(/**,&./(*((*,,..,****/,.....,...  .....   ....           ....                          .....      .....,,**,,,,,,,.,,* "
		@echo " @@&&&&&&&&&&&%%%#((/(//**(###(///////**********,**,,,,,**//(//(((#######%%%%%####**.**##(/ (*,#,...,/*#/*,...,,,...................         ..                     ...    ... ..,,,,,..,**///*,..,,*/((( "
		@echo " %%%%%%########(/((#%%&&&&%%##(((///////(((((((((##(#(////((#######((/////((((////*...*,/,#////*,.,**(((,,.  .,,**,,....,,,,,,,,,,,,...     ....                            ....,**////////**,,,..,*/(### "
		@echo " ((((###(((((////(##%%&&&&&&%&&&%%%%################((///((###((//*,***////////*///////(((/*/,*,/((/**(,,,..   */*,,..,,,,,.,,,.........                                    ....,*///(///***/////////(((# "
		@echo " %#((((((((###############(((#########(((//****//(((((//((((/****/////((//////*////***(#(##(#/*(*/*(*///%&#*#&%/*,. .,****..,.             ...         .........        .....,***//****/(((((///(((((((## "
		@echo " (/*****//**,,,****//(((/,........................,,**////////////******//////////**/((((#(//(*(/(#&@@@@@@&#////**,.,.,.. ,,               ..................................,,,,,,****//(((((////((((### "
		@echo " ///(((//////**/*****,,,,,,,..     .................,*/////(/((((((/*,,,..,,,,,,,,,**///**/*#%%&@@@@@@@&%##((((,**.**,/*,*,.                   .......,,,........,....,,,,,,,,,,,*****///(((((((////((((( "
		@echo " /////**//////////////****////**,,,,,,,,********,,,,,,,,,,*****//////*****,,,,,,,,,,,*****#&&@@@@@@@@&(((*(//*/*((/,,*(*..                         ..,,,,,...,,,**,,,.,,,*************///(((((((((######( "
		@echo " */////***///////////////////////////////(((((((((((/(((###%%%%%%%%%%%###((////*****/(/*(/&@@@@@@@&%(#(**#*/(/(**.***..*,..                            ...,*****//////***///////////(((((####%%#%%%%%%%%% "
		@echo " /////////******//////////(((((((((#(###%#####%%%%%%%%%%%%%############(((((//////(#%%%(%@@@@@@@%((///*,,,,*/**..,,* ..,.,,..                 .        .  .,*//(((((((((##%%%%%%#%%%%%%&&&&&&&&&&&&&&&&&& "
		@echo " //(((((((///((((((((((((#############%%%%%%###(###%%%%%%%%#####(((((((((((((((((((/(#%%@@@@@@%(//, .   ./*/*,, .**,.,. .. ..                               ..*/(((##############%%%&&&&@@@@@@@@@@&&&&&&& "
		@echo " ##########################(((#####%#######%%%%%%##############((((((((//((/(((//.,/##%@@@@@&#(,.        ,,,,*.,,.*. ....  . .                         ..     ,**//(######((#####%%%&&&&@@@@@@&&&&&&&&&%% "
		@echo " (########(((((/(((((((((###%%%%%%&&&&&%%%##(((###((((((((((//(((((//////////((((*,#%@@@@@&#((/,              ...,..... .  .                      . .          ,,***////****//(((((((((##%%%%%&&&&&&&&&&& "
		@echo " ######((#####%%%%%%%%%%%%%%%%%%%%%###((#((((((((////******,,,,*//(((((//////((///(&@@@@%%(/((,.. ..** //...      .. . .     .                 .. .         . ,*/*//////*/((######((((((((############### "
		@echo " &&&&&&%%%%%%%%%%%%%%%%%%%############((((((((((//////////***////(((((((((((((//(&@@@&&##//*(.,*/,.  **#,,. .... . . .   .                   ..,           ...*//(#########%%######(((((############((((( "
		@echo " #%%%%#########((((((((((((((((((((((((((((((((((((((((((/////////((((((((((((%&@@@&%#(/,**,....,, .&,/,/, %..  .  .  .                   . ..             . ./((((/(((####(((#############%%%%%%%%#%#### "
		@echo " (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((#&@&&%#*(/*//,***..   .,.. ...,   . ..                  ,       .           .**../&***/(((((///((((((((#(((###%%%%%%%%%%%%%&&&% "
		@echo " ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((%&&%%(//*..,.....,*,.      .       . .                      ..                .,*.,  ./(///(((#(((((((((((((###%%%%%%%%%%%%%%%&&&& "
		@echo " (((((((((((((((((((((((/((((((((((((((((((((((((((((((((((((((((#&&%%#%%##/,.. , ...,,,...      . .  ..  .           .            ,,.   .         */,..    .*,**/(((((######(((################%%%&&&&&& "
		@echo " (((((///((((((((((((((((((((((((((((((((((((((((((((((((((#&&%%&%#(//(/*,,,. ..       .                     .                      **. .....##             .(*//((((((((####(((((((####%%%%%%%%&&&&&@@@@ "
		@echo " ((/(((((((((((//(((((((((((((((((((((((((((////(((/((((,,...,....,,///((*,,., ..                        .                           *,....*.     /    . .*...,,,/(##%%%&&&&%%%%%%###((#####%%%%%&&&&&%%% "
		@echo " ((((((((((((((((((##(((((((((((((((((((((((((((((((/...         ..,*(/,*...,  .                                .                  .,,,*( ,***/*     , ,*..,..*,#%%&&&&&&&&&&%%%####((((((((((((######### "
		@echo " //((((//(((((((((((((((((((((((((((((((((((((((((((,....*,.       .,,*,., ,                                                   .,/,**/,//*//*(//(( */,. .,.,*. *#(%&&&%%%%%####((((((((((//(((((((((((((( "
		@echo " (((((((((/////((((((((((((((((((((((((((((((((((((((#..    ,      .*,**,,                                                    ,,*,*/,..,,***...,  , ,,,*./..*,..**(######(((((((((((((((((((((((((((((((( "
		@echo " (((////////(((((((((((((((((((((((((((((((((((//((((#.,,       ...*,*,*. ..                                                 ,...   ....,*#,(*/,,(,  ..  .  .,**,,((((((((((((((((((((((((((((((((((((((( "
		@echo " (((((((((((((((((((((((((((((((((((((((((///////((((((/..*...,**//(//*.... ..          .                                   ,.   .     ..,,*//.*,** ,. ..* ...../*//(((((((((((((((((((((((########(((((( "
		@echo " ((((((((((((((((###(((###(((((((((((((((((((((((////(((#(*//(///(((##(***...                                       .      .  ,.    ...,.*,*...,.,( .... ,**..,,,*,////(((((((((((((((((((#########(((//( "
		@echo " (((((((((##((#############%%%%#%%%%%######(((((((((((((####(*,*,/(/((#(*. .  .                          .                           ...*,*,/   .,,,/  ,, ..(..,.,**/((///////((((((((((((((((((((((((((( "
		@echo " ((((((((#######%%%%%%%%%%%%%%%%%%%%%########((#######%%%%%%&&&&&&(//#(*/.,/ .               ,/*,       .. .        ..                 ,...,,    ., ., .,...,,,*,,*.**,*//////((((((((((((((((((((((((((( "
		@echo " ((((((#(((((####%%%%%%%%%%%#################(((((####%%%%%&&&@@@@&@@@(*///*, .     .,* .,**             .                            ...,.  /    ,/ ,,, .,*.,.,,**,  .,*///((######(###((((((((((((((((( "
		@echo " ((((((((((((((((((((((((((((((#####%%#####%%%%######%%%&&&&%&&&@@%#(/**/**(/*/,////*.  .       ., . . .  .     .                   .., * ..    . **/.,,.. ,.*.*,*.,    .,/((######(((((((((#(((((((((((# "
		@echo " //((((//(((((((((((((##########%%%%%####%%%%%%%&&&&%%%%%&&&&&&@@&&(//**/((&%(,.    ... ....... ..,    .....,,/(/#(((,,.          ....,....      .*//**.*.* ,,*, , .      *(((((((//////(((#(#####((((((( "
		@echo " ((((((((((//((//((((###########%%%%%%%%%%%%%%%%%%%%&&&&&@@@@@@@@/.*(/(/%*/,.*         * ....,     .*#########%%&&&&&%//,       .... .  .         (//,/,.*,,..*,,         ,//(((((((((((((((((((((((((((( "
		@echo " (////((//////////(((###%%%%%%%%######%%%%%%%%%%%&&&&&&&&&&@@@@@&&*...*,...   .     .,/(//((/*##############%%%&&&&&&&%(...   . ...            . ./////.., ,.,. .          ,*/((((((((((((((((((((((((((( "
		@echo " //((//*,******,..,,,,*(################%%%%%%%%%%%%%%%&&%%%%%%%%%%%(*,,,,***/((#####%#%%%%#%%###%%%%#####%%%%&&&&&&&&#//*...... ..           .  ,/**,***.,*.,..           *((########(##(((((((((((((((( "
		@echo " ##(/*..     ..,,..,..,*(#######((((((######%%%#####################%%%#%%%%%%%%#%%%%%%%%%%%%%########%%%%%%&&&&&&&&&%%#/***...                  ,,**,,.*.,.,,, .          */((((#########((((((((((((((( "
		@echo " ((####(///*//******,,**/((###((((((###((##((##(((((((########%%%%%%%%&&&&&&%#(*(#/#####%%%%%########%%%%%%&&&&&&&&&&&%%%##(#/*,../*,,.,/.,* .,,,../,*,,*/,.,..           .,/(((((((((((((((((((((((((((( "
		@echo " /(((((((######((((//*/(((((((((//((((((((((((((((((((####%%%%&&&&&&&&&&&&&&%#/,/((##(##%%%%%%#########%##%%&&&&&&&&&&&&&&&%%%%%(///(/(*#**,,.(((/*,*,,,,,*.              .*////(((((((((((((((((((((((// "
		@echo " //////((((////(////////****//(((((((((/(((((((//((((###%%%%%&&&&&&&&&&&%%#((/,,..,*(#/%%#%#%%%%###########%#%&&&&&%&%&%%&%%%%%%#%##((#####(/##(#(/***,*,**.              .,,,**///(((((((((((((((((((((( "
		@echo " *,.,*/*,,,*//////***,,*****//////////(//((((((##########%%%%%%%%%%%%%%%%##(((/*,,..**%#%#%#%%%%%%%%%%%#%##%#%%%%%##%%%%%&%%&%%%%%%&%##%%%%%#%#####(/**....                    ..,*/(((((((((((((((((//(( "
		@echo " ..,,,*,***//////////////////////**,*//((###################################((*,,,.,*,.%#/###%%%%%%%%%%%##%%%/*/(*(##%&&&%&&&&&&&&&%&&&&&&&%&&%#%%%(,*  ,,                       ..,,*///(////////////((( "
		@echo " ...,,**//*///////////(((((//*,***/(########%%%%%%%###((((((((((((((((((((((***,,,,*.*,#(,#(%%###%%%%%%%%%#%#////(#%&%%&&&&&&&&&&&&&&@&&%@&&&&&%%%##((.  ..    ..                  .,,*//((((///////////( "
		@echo "       .,*/(((#####%%####%%%%%%%%%%########((##(((((/////((///////////((((/*,,,,,,,,,.//.*,(#/.*####%%%%%%%%#////(#%&&&&&&&&&&&&&&&&&@@@&&&&@&&%&%(#%./* .                          .,,*//((((((////////( "
		@echo " ,......,,*/((((##%%%%%%###(((((((((((((((((((((((/////////**/////**////**,,.,,..,,,.,,(,,/, ,*/,*(%##%%%%%%#*///(##%&&&&&&&&&@&&@&&@&@@@@@@@&&&%##%/*#.     .                        ..,**//(((/////(((( "
		@echo " /(//((/((#####((########((((((((////////////////////(((/////((((((((((((/*,,....  ...,/*,,. . ,**(####%%###%%%%(%%%%&&&&&&&&&&@&@@@@@@&@@@@&@&&%%%(*,.           .                     .,**///////(((((( "
		@echo " **///((((####((((((((((((((/(((/////////*////////////*///*////((((((####(/*,,.        ,.. . .  */*(/(##*/#%%%%%%%%%%%&&&&&&&&&&@@@@@@@@&&&&&&&&&%##(,/,.  **,                           ..,***//////(((( "
		@echo "    ..**,****///////////(#%%%##(((##%%#(/,*(##(/*,,,*,,,*,,,,********////(/*,,..         .,,.. , ,**//.. (/####%%%%%%%%%%&&&&@&&&&&&&@@@&&&&&&&&##%  .,  .     . ...                    .....,********/// "
		@echo " /((/((#####((((//(((##%%&&&&&%#%&&&%%%%#%#((##%#(//*,,,*,,*****////,,,,***,... ........ .,, .   , *  . *(/(/(###%%%%%%%%&&&&&&&&&&&&&@@@@@&&%&#//*% ..   .... .  .                      ...,,,********// "
		@echo " ########((####((///(#%&&&&&&%(*/(#%%%%%%%%%#(##%#((/////*,,,...,**,,,..     ...............*.             //,*(###%(#%%%%%%%%&&&&&&&&@@@@&&&&&%&%%**.  *#.,..  .  ,                       .,,**//*,**/// "
		@echo " %#((#%&&%%%%#((*.../%%&&&&%&%#((((##%%%%#(((((((((//*//(///////(/////**,,,**,,,.,,.,,,,,,,,*..          ,,(((*#########%%%%%%%&%&%&&&&&&&&%&%&&#*(#(,... ,,*. . . .                         ..,**/****// "
		@echo " #///(#%%&&&&&%%%%(((###(######(###(((((((//////////(//////////((((((////****/////**///((((((,..       ./((###(########%###((#(##&%#&&%#%%#&#%%#&#*(,  *.....,  ...                            .,,*////// "
		@echo " #/**(**(#%%%%%#(((##(((((((///((((((((/(((((///////////////////(((((((((#####%#(((#%&%%%%%%%(...   , ,/(#%%#%%#%##%%%####(*// /.(/,**#/(.,.,*/#,.//#(#. ,..,,  ,,,.....,*,                 .  ..,*****// "
		@echo " *////*//((/***///***,**//////////////(((((######################%%%%####%%%%%%&&&&&&&&&&&@@&#,..,,.,*(##%%%%%%#%%%%%%%###(,..  ,.*(/(((,(/ ...,../#&%##(*,,..,,/###%#(****, ..    .........,,,******//// "
		@echo " (((/**((*,,,,********,*//////*/(/*//(((#(*(##########%%%%%%%%&&&&&&&&&&&&&&&&&%&&@@&@&@@@@@&#,..,*(((#%%%%%%%%%%%%%%%%%###*     ..   (//// . ,.. ,%&&@@&@&%%%((####%%%%//*,,,,,,****//**,..,,******////* "
		@echo " (/(((((((///(/////(((///((((/////(((#((((((((#####%%%%%%%%%%%%&&&&&%%&&&&&&&&&@@@@@@@@@@@@@&%*,,,.**(##%%%%%%%&%%%&%%%%%#((      . ////*  .., ...,%&&@@@@@@&&&&%####%##%(/***********************/**/*** "
		@echo " ((////,////****((///*/(####(###((((%%%%(##%#%#(####(((((####%##%%&&&%##%%#%@&%&@@@@@@@@@@@@@@#,.,,/,*(##%%%%%%%&&&&&&&%%###(        #(/(%((*     ,%&&&&&@@&&@&&&#####%%#//////*********************//*/* "
		@echo " //(///**//((/#%#((((#%%%%####%%%##%#%%%&%%###%%%%%%#((**/(((((//(#%%%%&&%%%%%%%%&&&&%#%&&&@&%#(...*/*,/#%#%&%%&&&&&&&%%%%#((/      ### %,%,     .,%%%&&&&&&&&&&%%%######/***//*//***,,******,***,,,,**** "
		@echo " ((##(###%%%%&&&&&&&&&&&%%%#(#%&&&&&&&%%#%%%%&%&%%%######%%#(/#(/##%&%%##%###(#%%%%&&&&&%%####(** ..,/,/###%%&&&%&&%%%&%%%%%#((.     (( %#%.      (#%%%%&&&&&&&&%&#######((*,************************,,** "
		@echo " %%%&%&&&&&%%%%%%%&&%&&&&&&%%%&&&&&&&&&&&&&%#%%%%%%#%%%##%%%%%%%%%%%###((((###%%####%%%%%%#####/...,,*/(/(#%%%%&%%%%%%%%%%%%####*,.  // (/(.    .,#%%%%%%%&&&&%&%%%%#####((*******///**,,,***,,********** "
		@echo " (##%%%&&%%#####%%##%&&&&&&&&&&&&&&&&&&%#%%#%%%%%####(#%###%#%%%##%%%&&&&&&&@&%%%%%%%%%%&%%%###/,,....*/((###%%%%%%%%%%%%%%%%%%##(.     (/(.   .,/##%%%%&%%&%%&%%%%%%%%###///(*******///*****,,,********* "
		@echo " %%%%&&&&&#(//(/(#%#%&#%#%&&&&&&%&&%%#(/(##%%####(######((%%&#%&&&&&%%%%%%%%%&&%&&&&@&%%%&&&@&%#*.,.,*.,/(/#(###%%#%%%%%%%%%%%%%%#/*            .*(##%%%%%%%&%%%%%%%%%%%%%#(/*****************/*//******* "
		@echo " #%%&&&&&&(//***##,(*/*#**#(%%&&&##*.*###%%%%%#%%%%%%#%%&&&##&&%%%#(%&&&&&%%&&&%&&&&@&&&&&&&&&&%#,.,*,.,*,(///(#/####%#%#%%#%####%#/,,,,,,...  .,*(##%%%%%%%%%%%%%%%%%%%%%%%###(***,,************///****/ "
		@echo " &&&&&&&%&%%&#****#((#//#((#//#%%%%#######%%%%&&%%#%&&&@%&&&@&@&&@@@@&&&%%%%%%%&&%&&&&&@&&%%%%%&&,..,,,.. ,*,*.(/*(*/%##/#(#((//((((,.,,,,,..   .,((##%%%%%%%%%%%%%%%%%%%%%%#(/*,,,,*********,,,,**//**** "
		@echo " %#%%&&&&&%((%&%(/*,,(#%%%#%%%###%#%%%%#((%&&&&%##%%#%%##%&@@@@@@@@@&&&&&&&&&%%%#%&&%#%%%&&%%#/#%,..,.   .. .  *.   /,//* .//,(.(/(((.,.,,. .. . .,*##%%%%&%&&%&%%&&&&%&&&%%%##((/..*****,,,,,,,,,,****,, "
		@echo " %&&&%&&%&%%(%&%#&%&&%%%(/(/####%%(#%#&&&@@@@@@&%&@@@@@&&@@&&@&@@@&&&&&&&&&%%%&&%%%&%#(%#%&%%%%#(,. ..        .    ,  ,   *, ,,/.,.,*/,.           ,/(##%%%&&%&%&&&&&&&&&&&&%%%%%%##(******************** "
		@echo " %##%%##%%#####%&(#%%%%&%%%&&%%%%%&%%&%&%&&&&&&&&&@&&&&&@&&&&&&&&%%%%%%%%%%%%%%%%%%#%%%%##(#((((/,  . ...      .               . ......,....      .,,(((###%%%%&&&&&&&&&&&&&&&%%&%&%%#(***,************** "
		@echo " ##%#%%%#%&%&&&&&&&@&&&&@&&@@&&@@@&&&@@@@&&@@@@&&@@&&%&&&&&%%#%%%%%%%%%%%%######(((##(#(((#(((/(/*.   ,,          .            .........*......  ...,///*/##(##%%&&&&&&&&&&&&&&&&&&&&%%%#*****,,,,******* "
		@echo " %&&%%%%%%&&&&@&%#@@@@&&@@%%&@@&@@@@@@@&@@@@&&&@@@&%%&&%#%%%%%%##%%########(((//(/**/*///(//(((/,.. . .. ..                    .,.,,,,,,,,,,,,..,.....*,*/**,//##%&&&&&&&&&&&&&&&&&&@@&&%#/***,,*,,***,** "
		@echo " #&&@@&&&%#&@@@&&@@@&@@@@@@@&&@&&&&%&&&&&&&&&&&&#%%%%%%%(##/(((((((((((/(((/((((////((((#(((((//*.    ...,.,.                   ..,,,.,,,,.,,,,,..   .*,**,*(*,(/(&&&&&&&&&&&&&&&&&&&@@&&%##*,,,,,,,,,,,* "
		@echo " %%&@@@@@@&&@@@&&&@@@@&&&&&&@@@@@@@&&&&&&&&%%%%%%#%%#(####(/##/((/#((#(####((#((((*(/((((((,/((//*.     ..*,..                    .,..,,*,,,,,,,..,.,,*,*//(#/(/((/%&&@@@@@&&&&&&&&&@&@@@&&%#*,,******,.. "
		@echo " &%@(&%&&&@@@#%&&@@@@@@&@@@@&&%%&##&#%###%%%#%###%###(/(///(/#///((####(#(*((#%%###(//#////***((**(,.  ...,,.,...                 .......,,*,,*,**,***///*/(#%####(##&@@@&@@@&&%&&&&&&@&@@&%%%(/**,,,,,,, "
		@echo " &@@@@&@%&@@@&@@@@&&@&%&%##&%%%%%&%%%%%%##%###((/***/((((#(((*/*/#/*((#%###((#/(##%(((((.*,*/(/(,,.#/.*(,...,... .           . .  .....,,,,,///((//////*(#%%%%%%%%%&&%(##&@@@@&#(((((#%&@@&&&&%#/***,,**, "
		@echo " @%%&&&&%%&&%%&&%%&%%%&&%%%#((/,%#%%####(((##((*//.((#(((((((#,######((*/((##(((#((##(((((##(#(/##(*.(/(*,.. ...,. .       .(,/##*.**,**,,*,*////(///#%%%%%%&&%%%&&%%%%%&(%#%(////////(((#&&@&&%##*,,,.,* "
		@echo " %#%(%%&&&&%%%%((%%%%%%(#((##%%#,(##((*(/(((**((//#(///((#((#((%*,(/(/(#((///((((,/(*(#*((##//#(*,(*(//*//*/   . . ....    (%&%&&&%#(/..,*//*//*%%%%%%%&&&%%%&%&%%%%%%&&%%%%%%%(/////////((&&@&&&#%(*,*** "
		@echo " %%%%%&%%%%#%%##(/(#((((#(#/###(/**///*/((*/#(#%(((##((#(######((/(///(*/((/(((((((/((*/**,,**/(((/(//(*,*////*         ...%&&&&&&&&%%(*,//,//%%&&&&&%&&&&&&&&%%%%%%%%%%%%%&%#%#%/***/////((&@@&&&%#((/*, "
		@echo " %%%&%%%%((###%(//#(#%####/(#%/(####(##/##((#%%#(#((############((#(#(((((/((#(((/(#/((((/(///*/(.,**(#(**////,*,,        ,%&&&&&&&&&&%%#/////*%&%%%&&&&&&&&&&&%&%%####%%%%%%%%#%#%/**//////(&@@@&&&&#(// "
		@echo " #%%/(##%#/,##%%#%(.#(/##%#%#%%%#%#,(#%#%#%(/%(/##((%##(/####((((((((/########(#/###((#((#%####%.../(####((((**,***.      ,(&&&&&&&&&&&&&&&&%*/%&&&&&&&&&&&&&&&&&&&%%%####%%#%%%%##&#**/*/////&&&&&@&%%#( "
		@echo " %#%(######%#/#%%%%%%##%#*#%%(%%%%(###(#/##,#####(((((((##((###############(#/((/#(((#((#(#(######(#%/#(((((###*(//*/*.   .(&&&&&&&&&&&&%&&%&&&&#&&&&&&&&&&&&&&&&&&&&&%%%###%%%%####%******/*//#&&&&&&&%# "
		@echo " #.*(#%####%/,/((#/##%%%%&#%%%(##%#####((##/###((((//######/,(%#####*((%#(##(#(((((/#/##(/((/(/(/(((/((((%/(,///*//(#(*,./#%&&&&&&&&&&&&&&&&%%%&&%&&&&&&&&&&&&&&&&&&&#&&%@%%&&&&%%%%%##(/,***////#%&%%%%% "
		@echo " ##*(,//##*%%##&%%%%%#%%%%%%%%&%%%###(((((((##((#((####/((##(#(#(/#(##((((###(#/((((################%((/(/(#(/,*((((*(#%#(#%&&&&&&&@&&&&&%%%%%%%#%%%%&&&&&&&&&&&&&&&%&&&%%%&&%%%%%%##%####.,,**///(%%%%%% "
		@echo " /((###/(#%(#%%%%%%%%%%%/%%%%%%%%##/##(((*((###(/((###/(#%######((#(#######/%##((#((%%%#%(##*(##%###(#(%#//#%#/*/#/(#(#%#%#%%&&&&&&@@&&&&&&%&%%%#%%%%#%&&&&%&/%&%&%&%%&&%%%%&%&&&&%#%#%###.,,,,**/(%%%%%% "
		@echo " ###/#%##%%%&(/##%%%%#(#%%%%%#%#(.(#*##((((#,(((/((/(((#####/####*#######.##%%%%##########/(##%########(/(#*(((/*,/(#%######(%#&&&&&&&&&&&&&%&%%%%%%%#%#%%&&&&%&&&&&&&&%%&%%%%%%%#%%%#####(***,,,*(%%%%%# "
		@echo " (.*/*%%*#(%&%%*%%(((*%###(((#,##((#######(##,(*((####(####((/#(((####%%%#%##%%#(**//###%%###%######(/###(#####(/(/#%%%#%/####%#(&&&@@&&&&&&&&&&&&%%%%%##(%%%&&%%%&%%&&%%%%%(&%%%##%#####(((/**,,,//%%### "
		@echo " %%*%%%&%%%%#%##%#%##%,(#//(((#*((/((####(( ((###((####/#((/,*/(##*#/#(##.(%%#(#,##*##/(,,**,,/(*/#(####,###%##(/(##%(#%%#%##%%%%#%&&@&&&@&&&&&&&&&&&%&&%%(###%%%%%%%%%%%%%%%%%%%%######(##((****,*//##(( "
		@echo " %%&#(#%#%%%#*####%%/#(((*((#(/(#######(#####/,**/*(/((/(/(##/(#(/*,#*/(*.((,.,*(((((//,(/*/#((#########(#(#(#(#####%%%%%%%%%%#%#%%%&&&@@@@&&&&&&&&&&&&%&%%%%(##(##%%&%%%%%%%%%%%%%%%##########(*****/((( "
		@echo " &&&%&*%%&#%%%%%%#((#, ./####((((((#((###//((/(,//,..*..**,/(((.((#(/#((((,*/,*/*((/(((#######((#(((,/(###(///*#%##%%%%#%%#%%%%%%%##%&&&@@@@@&&&&&&&&&&&&%%%%%%#(/((((((##%%%%%%#%%%%%#%########///////## "
		@echo " /##%%((,(///(###(((/((#####((//*//((/((#((./(*/.,,,,,,,.//,/*/.####%#(((/#/((((####%#####(/((#(##(##(((##(###((##(/###%%%##%%#%((#%%%%%@@@@@@@@&&&@&&&&&%%%%%%%#%##***/(((####%%%%%%%%%%%%%#///,**/////# "
		@echo " #*/.#(####((##(#(#/(,/((/((//*,,**./((###((/((/(**,*..,,,,(////(#%#(##*(#(,/*(#####%####(#,(((((((##%##//(###%%%####%%#%%%%%###%#%%%%%#%&@@@@@@@&@&&&&&&&%%%%%%%#&%%#***///((####%%#%%%%%%%%%**,  *** *( "
		@echo " ///(//(,(###.*(((((((.(####(((/,***,./*./(*/#(#(/#(((/((##((#****####((#((/*/(///(######//(/(((##((###%##%#((##(/%##%%#%%%%&&%%%%%&%&%%&&&@@@@@@@@@&&&&%%%&%%&%%%%#&%%# .,**///*/####%%%%%%#%//(**,(*(// "

kitty:
		@echo "  "
		@echo "                       /^--^\     /^--^\     /^--^\ "
		@echo "                       \____/     \____/     \____/ "
		@echo "                      /      \   /      \   /      \ "
		@echo "                     |        | |        | |        | "
		@echo "                      \__  __/   \__  __/   \__  __/ "
		@echo " |^|^|^|^|^|^|^|^|^|^|^|^\ \^|^|^|^/ /^|^|^|^|^\ \^|^|^|^|^|^|^|^|^|^|^|^| "
		@echo " | | | | | | | | | | | | |\ \| | |/ /| | | | | | \ \ | | | | | | | | | | | "
		@echo " ########################/ /######\ \###########/ /####################### "
		@echo " | | | | | | | | | | | | \/| | | | \/| | | | | |\/ | | | | | | | | | | | | "
		@echo " |_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_| "
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/16 18:25:46 by anfichet          #+#    #+#              #
#    Updated: 2024/01/27 16:46:29 by anfichet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME= push_swap

LIBS= libft.a

# *********************************VARIABLES**************************************** #

SRCS_DIR= ./SRCS

SRCS=\
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
		test.c \


SRCS:= $(SRCS:%=$(SRCS_DIR)/%)

OBJS_DIR= ./OBJS

OBJS=$(SRCS:$(SRCS_DIR)/%.c=$(OBJS_DIR)/%.o)

INCS= ./INCS

INCS_LIBS = ./libft/INCS

DEPS= $(OBJS:.o=.d)

LIBS_TARGET= ./libft/libft.a

# **********************************COMMANDS**************************************** #

CC= cc

CFLAGS= -Werror -Wextra -Wall -g3 -MMD -MP

CPPFLAGS = -I$(INCS) -I$(INCS_LIBS)

CFSIGSEV = -fsanitize=address

RM= rm -rf

DIR_DUP= mkdir -p $(@D)

AR = ar rcs

MAKEFLAGS += --no-print-directory

# **********************************RULES**************************************** #

all:$(NAME)

-include $(DEPS)

$(NAME): $(LIBS_TARGET) $(OBJS) $(INCS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(OBJS) -L$(dir $(LIBS_TARGET)) -lft -o $(NAME)

#-L ou se trouve la librairie
# -l + nom de la lib qu'on veut lui donner, soit ft ici

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

fsanitize:fclean $(LIBS_TARGET) $(OBJS) $(INCS)
	$(CC) $(CFLAGS) $(CFSIGSEV) $(CPPFLAGS) $(OBJS) -L$(dir $(LIBS_TARGET)) -lft -o $(NAME)

clean:
	$(RM) $(OBJS_DIR)
	$(MAKE) $@ -C ./libft
# -C pour lui donner le directory pour qu'il aille faire la regle dans le dossier libft

fclean:clean
	$(RM) $(NAME)
	$(MAKE) $@ -C ./libft


re:fclean all

.PHONY: all clean fclean re FORCE doggy saiko valgrind fsanitize kitty
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
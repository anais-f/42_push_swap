/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   checker_push_swap_bonus.h                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/30 19:04:47 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/30 22:05:46 by anfichet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef CHECKER_PUSH_SWAP_BONUS_H
# define CHECKER_PUSH_SWAP_BONUS_H

# include "libft.h"
# include <limits.h>
# include <stdlib.h>
# include <unistd.h>
# include <stdbool.h>

typedef struct s_node
{
	int				value;
	int				index;
	struct s_node	*next;
	struct s_node	*prev;
}	t_node;

typedef struct s_stack
{
	char			id;
	int				size;
	struct s_node	*head;
}	t_stack;

int		check_args_checker(char **argv);
int		get_value_checker(const char *str, int *numb);
void	push_checker(t_stack *from, t_stack *to);
void	reverse_rotate_checker(t_stack *stack);
void	reverse_rotate_ab_checker(t_stack *stack_a, t_stack *stack_b);
void	rotate_checker(t_stack *stack);
void	rotate_ab_checker(t_stack *stack_a, t_stack *stack_b);
void	swap_checker(t_stack *stack);
void	swap_ab_checker(t_stack *a, t_stack *b);
void	init_stack_checker(t_stack *a, t_stack *b);
void	fill_stack_checker(char **argv, t_stack *stack_a);
void	check_double_checker(t_stack *stack_a, t_node *current);
void	free_exit_checker(t_node *a, t_node *b, bool error);
t_node	*ft_dlstnew_checker(int value);
void	ft_dlstadd_back_checker(t_node **head, t_node *new_node);
void	ft_dlstadd_front_checker(t_node **head, t_node *new_node);
void	make_rules(char *line, t_stack *stack_a, t_stack *stack_b);
int		check_list_sorted_checker(t_stack *a);
void	index_value_checker(t_stack *a);

#endif
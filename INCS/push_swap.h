/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   push_swap.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/09 17:53:03 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/09 17:53:03 by anfichet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef PUSH_SWAP_H
# define PUSH_SWAP_H

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

int		check_args(char **argv);
int		get_value(const char *str, int *numb);
void	fill_stack(char **argv, t_stack *stack_a);
t_node	*ft_dlstnew(int value);
void	ft_dlstadd_back(t_node **head, t_node *new_node);
void	ft_dlstadd_front(t_node **head, t_node *new_node);
void	rotate(t_stack *stack);
void	rotate_ab(t_stack *stack_a, t_stack *stack_b);
void	reverse_rotate(t_stack *stack);
void	reverse_rotate_ab(t_stack *stack_a, t_stack *stack_b);
void	swap(t_stack *stack);
void	swap_ab(t_stack *a, t_stack *b);
void	push(t_stack *from, t_stack *to);
void	init_stack(t_stack *a, t_stack *b);
void	free_exit(t_node *a, t_node *b, bool error);
void	index_value(t_stack *a);
double	get_chunk(t_stack *a);
void	pre_sorting_stack_a_to_b(t_stack *a, t_stack *b);
int		find_half(t_stack *b, int index_to_push, int nb_index_stack);
void	final_sorting_b_to_a(t_stack *a, t_stack *b);
int		check_list_sorted(t_stack *a);
void	sorting_little_stack(t_stack *a, t_stack *b);
int		find_max_index(t_stack *stack);
void	check_double(t_stack *stack_a, t_node *current);
void	if_b_can_be_pushed(t_stack *a, t_stack *b);

#endif
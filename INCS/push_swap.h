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

#ifndef PUSH_SWAP_PUSH_SWAP_H
#define PUSH_SWAP_PUSH_SWAP_H

# include "libft.h"
# include <limits.h>
# include <stdlib.h>
# include <unistd.h>
# include <stdbool.h>

typedef struct s_node
{
	int				value;
	int 			index; // correspondra a l'index de sa position finale ! et non sa place d'entree dans les maillons
	struct	s_node	*next;
	struct	s_node	*prev; //renvoi sur une autre structure maillon
}	t_node;

typedef struct	s_stack
{
	char			 id;
	int				size;
	struct s_node	*head; //pointeur sur une structure -> me permet de pointer sur ma head de ma stack
}	t_stack;
//structure qyu contient mes deux head de stack pour conserver leur nom + taille et les promener partout a la place des pointeurs

int		check_args(char **argv);
int		get_value(const char *str, int *numb);
void	fill_stack(char **argv, t_stack *stack_a);
void	ft_tri(t_node **stack_a, int argc);
t_node	*ft_dlstnew(int value);
void	ft_dlstadd_back(t_node **head, t_node *new_node);
void	ft_dlstadd_front(t_node **head, t_node *new_node);
size_t	len_dlst(t_node *stack);
void	rotate(t_stack *stack);
void	rotate_ab(t_stack *stack_a, t_stack *stack_b);
void	reverse_rotate(t_stack *stack);
void	reverse_rotate_ab(t_stack *stack_a, t_stack *stack_b);
void	swap(t_stack *stack);
void	swap_ab(t_stack *a, t_stack *b);
void	ft_push(t_stack *from, t_stack *to);
void	print_stack(t_stack *stack);
void	init_stack(t_stack *a, t_stack *b);
void	free_exit(t_node *a, t_node *b, bool error);
void	index_value(t_stack *a);

#endif //PUSH_SWAP_PUSH_SWAP_H

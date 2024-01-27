/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   algorithm.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/20 15:20:34 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/27 17:49:08 by anfichet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

void final_sorting(t_stack *a, t_stack *b, int *n)
{
	int		nb_index_stack;
	int		index_to_push;
	int 	i;
	t_node	*temp;

	(void) a;
	nb_index_stack = b->size - 1;
	index_to_push = b->size - 1;
	i = *n;
	temp = b->head;

	while (temp && index_to_push >= 0)
	{
		if (find_half(b, index_to_push, nb_index_stack, &i) == 1)
		{
			while (i > 0)
			{
				rotate(b);
				i--;
			}
			ft_push(b, a);
		}
		else if (find_half(b, index_to_push, nb_index_stack, &i) == 2)
		{
			while (i <= nb_index_stack) {
				reverse_rotate(b);
				i++;
			}
			ft_push(b, a);
		}
		nb_index_stack--;
		index_to_push--;
		temp = temp->next;
	}
}

int	find_half(t_stack *b, int index_to_push, int nb_index_stack, int *n)
{
	t_node	*temp;
	int		count;
	int		j;

	count = 0;
	j = 0;
	temp = b->head;
	while (temp->index != index_to_push)
	{
		count++;
		temp = temp->next;
	}
	if (count >= 0 && count < nb_index_stack / 2)
		j = 1;
	else if (count >= nb_index_stack / 2 && count <= nb_index_stack)
		j = 2;
	*n = count;
	return (j);
}

void	pre_sorting_stack(t_stack *a, t_stack *b)
{
	int chunk;
	int num;
	int index_max;

	index_max = a->size - 4;
	num = 0;
	chunk = get_chunk(a);
	while (a->head != NULL && a->size > 3)
	{
		if ((a->head->index >= 0 && a->head->index <= chunk + num) && a->head->index <= index_max)
		{
			if (a->head->index <= num) // je push en haut
				ft_push(a, b);
			else if (a->head->index > num) // je push en bas avec rotate
			{
				ft_push(a, b);
				if (a->head->index >= 0 && a->head->index <= chunk + num)
					rotate(b);
				else
					rotate_ab(a, b);
			}
			num += 1;
		}
		else
			rotate(a);
	}
}

void	sorting_little_stack(t_stack *a, t_stack *b)
{
	int 	index_max;

	index_max = a->size + b->size - 1;
	if (check_list_sorted(a) == 0)
		return ;
	if (a->head->index == index_max)
		rotate(a);
	if (a->head->next->index == index_max)
		reverse_rotate(a);
	if (a->head->index > a->head->next->index)
		swap(a);
}

double	get_chunk(t_stack *a)
{
	int 	nb_nodes;
	double	chunk;

	nb_nodes = a->size;
	chunk = 0.000000053 * (nb_nodes * nb_nodes) + 0.03 * nb_nodes + 14.5;
	return (chunk);
}

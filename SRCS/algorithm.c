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

void	final_sorting_b_to_a(t_stack *a, t_stack *b)
{
	int	biggest_index_a;
	int	biggest_index_b;

	while (b->head != NULL)
	{
		biggest_index_a = find_max_index(a);
		biggest_index_b = find_max_index(b);
		if (b->head->index == a->head->index - 1)
			push(b, a);
		else if (a->head->prev->index == biggest_index_a)
			if_b_can_be_pushed(a, b);
		else if (b->head->index > a->head->prev->index)
			if_b_can_be_pushed(a, b);
		else
		{
			if (find_half(b, biggest_index_b, b->size) == 1)
				rotate(b);
			else
				reverse_rotate(b);
		}
		while (a->head->index - 1 == a->head->prev->index)
			reverse_rotate(a);
	}
}

int	find_half(t_stack *b, int index_to_push, int nb_index_stack)
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
	return (j);
}

void	pre_sorting_stack_a_to_b(t_stack *a, t_stack *b)
{
	const int	chunk = get_chunk(a);
	const int	index_max = a->size - 4;
	int			num;

	num = 0;
	while (a->head != NULL && a->size > 3)
	{
		if ((a->head->index >= 0 && a->head->index <= chunk + num) \
			&& a->head->index <= index_max)
		{
			if (a->head->index <= num)
				push(a, b);
			else if (a->head->index > num)
			{
				push(a, b);
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
	int	index_max;

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
	int		nb_nodes;
	double	chunk;

	nb_nodes = a->size;
	chunk = 0.000000053 * (nb_nodes * nb_nodes) + 0.03 * nb_nodes + 14.5;
	return (chunk);
}

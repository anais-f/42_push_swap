/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   algorithm.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/20 15:20:34 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/20 15:20:34 by anfichet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

void	index_value(t_stack *a)
{
	int	count_value;
	t_node	*to_compare;
	t_node	*node_index;
	int		size_lst;

	size_lst = a->size;
	node_index = a->head; // demarre a 0 = i
	while (size_lst > 0)
	{
		count_value = 0;
		to_compare = node_index->next; // demarre a l'equivalent de 1 = i+1
		while (to_compare != node_index)
		{
			if (node_index->value > to_compare->value)
				count_value++;
			to_compare = to_compare->next;
		}
		node_index->index = count_value;
		node_index = node_index->next;
		size_lst--;
	}
}

void	sort(t_stack *a, t_stack *b)
{
	int nb_nodes;
	(void) a;
	nb_nodes = b->size;
//	printf("nb nodes de B = %d\n", nb_nodes);
	while (b->head != NULL)
	{
		if (b->head->index == nb_nodes)
		{
			ft_push(b,a);
			nb_nodes--;
		}
		else
			rotate(b);
	}
}

void	presort_stack(t_stack *a, t_stack *b)
{
	int chunk;
	int num;

	(void) b;
	num = 0;
	chunk = get_chunk(a);
	while (a->head != NULL)
	{
		if (a->head->index >= 0 && a->head->index <= chunk + num)
		{
			if (a->head->index <= num) // je push en haut
				ft_push(a, b);
			else if (a->head->index > num) // je push en bas
			{
				ft_push(a,b);
				rotate(b);
			}
			num += 1;
		}
		else
		{
			rotate(a);
		}
	}
}

float	get_chunk(t_stack *a)
{
	int 	nb_nodes;
	float	chunk;

	nb_nodes = a->size;
	chunk = 0.000000053 * (nb_nodes * nb_nodes) + 0.03 * nb_nodes + 14.5;
	return (chunk);
 // on va chercher sur l'intervalle de chunk
}


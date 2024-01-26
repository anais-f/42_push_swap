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

void final_sorting(t_stack *a, t_stack *b, int *n)
{
	int nb_index_stack;
	int index_to_push;
	int i;
	t_node	*temp;

	(void) a;
	nb_index_stack = b->size - 1;
	index_to_push = b->size - 1;
	i = *n;
	temp = b->head;

	//printf("b size = %d\n", b->size);
	while (temp && index_to_push >= 0)
	{
		//printf("index to push = %d\n", index_to_push);
		if (find_half(b, index_to_push, nb_index_stack, &i) == 1)
		{
			//printf("final sorting n = %d\n", i);
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
	int count;
	int j;

	count = 0;
	j = 0;
	temp = b->head;
//	printf("nb index b = %d\n", nb_index_stack);
//	printf("next index to push = %d\n", index_to_push);

	while (temp->index != index_to_push)
	{
		count++;
		temp = temp->next;
	}
//	printf("find half count = %d\n", count);
	if (count >= 0 && count < nb_index_stack / 2)
	{
	//	printf("find half 1ere moitie\n");
		j = 1;
	}
	else if (count >= nb_index_stack / 2 && count <= nb_index_stack)
	{
	//	printf("find half 2eme moitie\n");
		j = 2;
	}
	*n = count;
	return (j);
}


void	pre_sorting_stack(t_stack *a, t_stack *b)
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
				rotate_ab(a,b);
			}
			num += 1;
		}
		else
			rotate(a);
	}
}

double	get_chunk(t_stack *a)
{
	int 	nb_nodes;
	double	chunk;

	nb_nodes = a->size;
	chunk = 0.000000053 * (nb_nodes * nb_nodes) + 0.03 * nb_nodes + 14.5;
	return (chunk);
 // on va chercher sur l'intervalle de chunk
}


/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   algorithm_utils.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/27 18:53:58 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/27 18:53:58 by anfichet         ###   ########.fr       */
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

int check_list_sorted(t_stack *a)
{
	t_node	*head;

	head = a->head;
	while (head->next != a->head)
	{
		if (head->index > head->next->index)
			return (-1);
		head = head->next;
	}
	return (0);
}



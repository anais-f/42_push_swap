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
	int		count_value;
	t_node	*to_compare;
	t_node	*node_index;
	int		size_lst;

	size_lst = a->size;
	node_index = a->head;
	while (size_lst > 0)
	{
		count_value = 0;
		to_compare = node_index->next;
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

int	check_list_sorted(t_stack *a)
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

int	find_max_index(t_stack *stack)
{
	t_node	*temp;
	int		index_max;
	int		i;

	i = 0;
	temp = stack->head;
	index_max = temp->index;
	while (i < stack->size)
	{
		if (temp->index > index_max)
			index_max = temp->index;
		temp = temp->next;
		i++;
	}
	return (index_max);
}

void	if_b_can_be_pushed(t_stack *a, t_stack *b)
{
	push(b, a);
	rotate(a);
}

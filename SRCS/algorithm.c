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
// liste chainee fixe

void	ft_tri(t_node **stack_a, int argc)
{
	size_t i;
	size_t k;
	int	tmp;
	t_node	*current;
	k = argc - 2;

	while (k > 0)
	{
		i = 0;
		current = *stack_a;
		while (i < k)
		{
			if (current->value > current->next->value)
			{
				tmp = current->next->value;
				current->next->value = current->value;
				current->value = tmp;
			}
			i++;
			current = current->next;
		}
		k--;
	}
}
// tri a bulles, on compare avec le +1 uniquement

//void	ft_tri(t_node **stack_a, int argc)
//{
//	size_t i;
//	size_t k;
//	int	tmp;
//	t_node	*current;
//	k = argc - 2;
//
//	while (k > 0)
//	{
//		i = 0;
//		current = *stack_a;
//		while (i < k)
//		{
//			if (current->value > current->next->value)
//			{
//				tmp = current->next->value;
//				current->next->value = current->value;
//				current->value = tmp;
//			}
//			i++;
//			current = current->next;
//		}
//		k--;
//	}
//}
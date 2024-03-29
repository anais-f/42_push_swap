/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   swap.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/18 19:41:54 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/18 19:41:54 by anfichet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

void	swap(t_stack *stack)
{
	int	temp_value;
	int	temp_index;

	if (!stack->head)
		return ;
	temp_value = stack->head->value;
	stack->head->value = stack->head->next->value;
	stack->head->next->value = temp_value;
	temp_index = stack->head->index;
	stack->head->index = stack->head->next->index;
	stack->head->next->index = temp_index;
	if (stack->id == 'a')
	{
		if (write(1, "sa\n", 3) != 3)
			free_exit(stack->head, stack->head, true);
	}
	if (stack->id == 'b')
	{
		if (write(1, "sb\n", 3) != 3)
			free_exit(stack->head, stack->head, true);
	}
}

void	swap_ab(t_stack *a, t_stack *b)
{
	int	temp_value_index;

	if (!a->head || !b->head)
		return ;
	if (a->head)
	{
		temp_value_index = a->head->value;
		a->head->value = a->head->next->value;
		a->head->next->value = temp_value_index;
		temp_value_index = a->head->index;
		a->head->index = a->head->next->index;
		a->head->next->index = temp_value_index;
	}
	if (b->head)
	{
		temp_value_index = b->head->value;
		b->head->value = b->head->next->value;
		b->head->next->value = temp_value_index;
		temp_value_index = b->head->index;
		b->head->index = b->head->next->index;
		b->head->next->index = temp_value_index;
	}
	if (write (1, "ss\n", 3) != 3)
		free_exit(a->head, b->head, true);
}

/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   checker_rules_swap.c                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/30 18:46:15 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/30 18:46:15 by anfichet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "checker_push_swap_bonus.h"

void	swap_checker(t_stack *stack)
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
}

void	swap_ab_checker(t_stack *a, t_stack *b)
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
}

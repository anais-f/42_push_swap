/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   checker_rules_reverse.c                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/30 18:46:11 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/30 18:46:11 by anfichet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "checker_push_swap_bonus.h"

void	reverse_rotate_checker(t_stack *stack)
{
	if (!stack->head)
		return ;
	stack->head = stack->head->prev;
}

void	reverse_rotate_ab_checker(t_stack *stack_a, t_stack *stack_b)
{
	if (!stack_a->head || !stack_b->head)
		return ;
	stack_a->head = (stack_a->head)->prev;
	stack_b->head = (stack_b->head)->prev;
}

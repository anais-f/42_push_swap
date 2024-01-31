/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   checker_rules_rotate.c                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/30 18:46:06 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/30 18:46:06 by anfichet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "checker_push_swap_bonus.h"

void	rotate_checker(t_stack *stack)
{
	if (!stack->head)
		return ;
	stack->head = stack->head->next;
}

void	rotate_ab_checker(t_stack *stack_a, t_stack *stack_b)
{
	if (!stack_a->head || !stack_b->head)
		return ;
	stack_a->head = stack_a->head->next;
	stack_b->head = stack_b->head->next;
}

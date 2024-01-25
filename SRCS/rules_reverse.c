/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   reverse.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/18 19:41:38 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/23 21:30:30 by anfichet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

void	reverse_rotate(t_stack *stack)
{
	if (!stack->head)
		return ;
	stack->head = stack->head->prev;
	if (stack->id == 'a')
		if (write (1, "rra\n", 4) != 4)
			exit (1);
	if (stack->id == 'b')
		if (write (1, "rrb\n", 4) != 4)
			exit (1);
}

void	reverse_rotate_ab(t_stack *stack_a, t_stack *stack_b)
{
	if (!stack_a->head || !stack_b->head)
		return ;
	stack_a->head = (stack_a->head)->prev;
	stack_b->head = (stack_b->head)->prev;
	if (write (1, "rrr\n", 4) != 4)
		exit (1);
}

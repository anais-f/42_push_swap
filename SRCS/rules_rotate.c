/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   rotate.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/18 19:41:26 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/18 19:41:26 by anfichet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

void	rotate(t_stack *stack)
{
	if (!stack->head)
		return ;
	stack->head = stack->head->next;
	if (stack->id == 'a')
	{
		if (write (1, "ra\n", 3) != 3)
			exit (1);
	}
	else if (stack->id == 'b')
	{
		if (write (1, "rb\n", 3) != 3)
			exit (1);
	}
}

void	rotate_ab(t_stack *stack_a, t_stack *stack_b)
{
	if (!stack_a->head || !stack_b->head)
		return ;
	stack_a->head = stack_a->head->next;
	stack_b->head = stack_b->head->next;
	if (write (1, "rr\n", 3) != 3)
		exit (1);
}

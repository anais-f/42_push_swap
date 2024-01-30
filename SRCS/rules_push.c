/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   push.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/18 19:41:48 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/18 19:41:48 by anfichet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

void	push(t_stack *from, t_stack *to)
{
	t_node	*temp;

	temp = from->head;
	from->head->next->prev = from->head->prev;
	from->head->prev->next = from->head->next;
	from->head = from->head->next;
	from->size--;
	if (from->size == 0)
		from->head = NULL;
	ft_dlstadd_front(&to->head, temp);
	to->size++;
	if (to->id == 'a' && from->id == 'b')
	{
		if (write(1, "pa\n", 3) != 3)
			exit(1);
	}
	if (to->id == 'b' && from->id == 'a')
	{
		if (write(1, "pb\n", 3) != 3)
		{
			free_exit(from->head, to->head, true);
			exit(1);
		}
	}
}

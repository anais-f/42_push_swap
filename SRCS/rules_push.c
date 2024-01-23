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

void	ft_push(t_stack *from, t_stack *to)
{
	t_node *temp;

	temp = from->head;
	from->head->next->prev = from->head->prev;
	from->head->prev->next = from->head->next;
	from->head = from->head->next;
	from->size--;
	ft_dlstadd_front(&to->head, temp);
	to->size++;
	if (to->id == 'a' && from->id == 'b')
		if (write(1, "pa\n", 3) != 3)
			exit(1);
	if (to->id == 'b' && from->id == 'a')
		if (write(1, "pb\n", 3) != 3)
			exit(1);
}

//	(*b)->next->prev = (*b)->prev; //maillon2/newhead->prev = tail
//	(*b)->prev->next = (*b)->next; //maillon tail->next = 2/newhead;
//	*b = (*b)->next;
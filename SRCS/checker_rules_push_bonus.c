/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   checker_rules_push.c                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/30 18:46:26 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/30 18:46:26 by anfichet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "checker_push_swap_bonus.h"

void	push_checker(t_stack *from, t_stack *to)
{
	t_node	*temp;

	if (!from->head)
		return ;
	temp = from->head;
	from->head->next->prev = from->head->prev;
	from->head->prev->next = from->head->next;
	from->head = from->head->next;
	from->size--;
	if (from->size == 0)
		from->head = NULL;
	ft_dlstadd_front_checker(&to->head, temp);
	to->size++;
}

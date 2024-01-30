/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   dlst.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/18 11:05:17 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/18 16:31:33 by anfichet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

t_node	*ft_dlstnew(int value)
{
	t_node	*new_node;

	new_node = malloc(1 * sizeof(t_node));
	if (!new_node)
		return (NULL);
	new_node->value = value;
	new_node->index = 0;
	new_node->next = NULL;
	new_node->prev = NULL;
	return (new_node);
}

void	ft_dlstadd_back(t_node **head, t_node *new_node)
{
	t_node	*temp;

	if (!new_node)
		return ;
	if (*head == NULL)
	{
		new_node->next = new_node;
		new_node->prev = new_node;
		*head = new_node;
	}
	else
	{
		temp = (*head)->prev;
		(*head)->prev->next = new_node;
		(*head)->prev = new_node;
		new_node->next = *head;
		new_node->prev = temp;
	}
}

void	ft_dlstadd_front(t_node **head, t_node *new_node)
{
	t_node	*temp;

	if (!new_node)
		return ;
	if (*head == NULL)
	{
		new_node->next = new_node;
		new_node->prev = new_node;
		*head = new_node;
	}
	else
	{
		temp = (*head)->prev;
		(*head)->prev->next = new_node;
		(*head)->prev = new_node;
		new_node->next = *head;
		new_node->prev = temp;
		*head = new_node;
	}
}

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
	if(!new_node)
		return (NULL);
	new_node->value = value;
	//new_node->index = index;
	new_node->next = NULL;
	new_node->prev = NULL;
	return (new_node);
}

// on insere avant la head mais comme la liste est circulaire -> c'est bien le dernier !
void	ft_dlstadd_back(t_node **head, t_node *new_node)
{
	t_node	*temp;

	if(!new_node)
		return ;
	if (*head == NULL)
	{
		new_node->next = new_node;
		new_node->prev = new_node;
		*head = new_node;
	}
	else
	{
		// on modifie les pointeurs de la head actuelle, l'element actuel
		temp = (*head)->prev; //stocke temp pour swap le 4eme pointeur
		(*head)->prev->next = new_node; // on a change le next du (head -1 avant insertion de new) pour aller pointer sur new_node
		(*head)->prev = new_node; // on a change le prev de head
		// on definit les pointeurs du nouvel element
		new_node->next = *head;
		new_node->prev = temp;
	}
}


//on insere au debut de la liste donc le new devient la nouvelle head !
void	ft_dlstadd_front(t_node **head, t_node *new_node)
{
	t_node	*temp;
	//t_node	**head_temp;

	if(!new_node)
		return ;
	if (*head == NULL)
	{
		new_node->next = new_node;
		new_node->prev = new_node;
		*head = new_node;
	}
	else
	{
		// on modifie les pointeurs de la head actuelle, l'element actuel
		//*head_temp = *head;
		temp = (*head)->prev;
		(*head)->prev->next = new_node; //head->prev->next correspond au tail precedent
		(*head)->prev = new_node;
		new_node->next = *head;
		new_node->prev = temp;
		*head = new_node;
	}
}

size_t	len_dlst(t_node *stack)
{
	size_t	i;
	t_node	*head;

	i = 0;
	if (!stack)
		return (0);
	head = stack;
	while (stack->next != head)
	{
		stack = stack->next;
		i++;
	}
	return (i + 1);
}
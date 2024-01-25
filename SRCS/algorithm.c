/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   algorithm.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/20 15:20:34 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/20 15:20:34 by anfichet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

void	index_value(t_stack *a)
{
	int	count_value;
	t_node	*to_compare;
	t_node	*node_index;
	int		size_lst;

	size_lst = a->size;
	node_index = a->head; // demarre a 0 = i
	while (size_lst > 0)
	{
		count_value = 1;
		to_compare = node_index->next; // demarre a l'equivalent de 1 = i+1
		while (to_compare != node_index)
		{
			if (node_index->value > to_compare->value)
				count_value++;
			to_compare = to_compare->next;
		}
		node_index->index = count_value;
		node_index = node_index->next;
		size_lst--;
	}
}

void	sort(t_stack *a, t_stack *b)
{
	int nb_nodes;
	(void) a;
	nb_nodes = b->size;
//	printf("nb nodes de B = %d\n", nb_nodes);
	while (b->head != NULL)
	{
		if (b->head->index == nb_nodes)
		{
			ft_push(b,a);
			nb_nodes--;
		}
		else
			rotate(b);
	}
}

void	presort_stack(t_stack *a, t_stack *b)
{
	int chunk;
	int begin_interval;
	int end_interval;
	//t_node	*head;

	(void) b;
	begin_interval = 1;
	chunk = get_chunk(a);
	end_interval = chunk;
//	head = a->head;
	printf("taille chunk %d\n", chunk);
	while (a->head != NULL)
	{
		if (a->head->index >= begin_interval && a->head->index <= end_interval)
		{
			ft_push(a, b);
			end_interval += 1;
			if (b->head->index % 2 != 0)
				rotate(b);
		}
		else
			rotate(a);
	}
//
//	je rotate toute la stack A jusqu'a trouver un index dans mon tas
//	index = push sur b
//	une fois la liste parcourue, je passe au chunk suivant et je re rotate sur A
//

}


double	get_chunk(t_stack *a)
{
	int 	nb_nodes;
	float	nb_chunk;

	nb_nodes = a->size;
	nb_chunk = 0.000000053 * (nb_nodes * nb_nodes) + 0.03 * nb_nodes + 14.5;
	return (nb_chunk);
 // on va chercher sur l'intervalle de chunk
}







//void    tiny_sort(t_stack *a, t_stack *b)
//{
//	int nb_nodes;
//	int i;
//
//	i = 1;
//	nb_nodes = a->size;
//	while (i <= nb_nodes)
//	{
//		while (a->head->index != i)
//		{
//			rotate(a);
//		}
//		ft_push(a, b);
//		i++;
//	}
//	while (i > 0)
//	{
//		ft_push(b, a);
//		i--;
//	}
//}
// espece de tri a bulles, on compare avec le +1 uniquement
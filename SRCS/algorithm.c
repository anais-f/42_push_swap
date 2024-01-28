/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   algorithm.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/20 15:20:34 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/27 17:49:08 by anfichet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

void final_sorting(t_stack *a, t_stack *b)
{
	t_node	*temp;
	int 	biggest_index_a;
	int 	biggest_index_b;
	int 	nb_index_stack;
	int 	smallest_index_a;

	temp = b->head;
	nb_index_stack = b->size - 1;

// je cherche le plus grand dans b pour donner ma direction, je vais rotate ou reverse rotate
// je push le suivant qui est au sommet de b
// s'il est un plus petit, je le laisse en haut -> sinon je rotate pour le passer en bas
// apres je regarde sur b si le suivant est compris entre le plus petit et le plus grand de A, si oui je le push
// si non, je rrb ou rb en fonction de ma direction donnee au dessus puis je reverifie
// si je l'ai push, je verifie sa place dans a pour voir si je dois swap ou rotate pour le ranger

// fonction qui cherche le + grand et le plus + petit dans une pile
// le min de a est cense etre celui qui est en bas, soit head->prev

	biggest_index_b = find_max_index(b);

	//while
	biggest_index_a = find_max_index(a);
	smallest_index_a = find_min_index(a);
	if (a->head->prev->index == biggest_index_a)
	{
		push(b, a);
	}
	if (a->head->index != a->head->next->index - 1)
		rotate(a);
	if (b->head->index < biggest_index_a && b->head->index > smallest_index_a) {
		push(b, a);
	}
	else
	{
		if (find_half(b, biggest_index_b, nb_index_stack) == 1) {
			rotate(b);
		}
		else {
			reverse_rotate(b);
		}
	}


		------
	push(b, a);
//	while (temp && index_to_push >= 0)
//	{

		if (temp->index < a->head->index && temp->index > a->head->prev->index)
		{
			push(b, a);
			if (a->head->index - 1 == )
		}
		else
			rotate(b);
		//temp = temp->next;
	}


}


int	find_half(t_stack *b, int index_to_push, int nb_index_stack)
{
	t_node	*temp;
	int		count;
	int		j;

	count = 0;
	j = 0;
	temp = b->head;
	while (temp->index != index_to_push)
	{
		count++;
		temp = temp->next;
	}
	if (count >= 0 && count < nb_index_stack / 2)
		j = 1;
	else if (count >= nb_index_stack / 2 && count <= nb_index_stack)
		j = 2;
	return (j);
}

void	pre_sorting_stack(t_stack *a, t_stack *b)
{
	int chunk;
	int num;
	int index_max;

	index_max = a->size - 4;
	num = 0;
	chunk = get_chunk(a);
	while (a->head != NULL && a->size > 3)
	{
		if ((a->head->index >= 0 && a->head->index <= chunk + num) && a->head->index <= index_max)
		{
			if (a->head->index <= num) // je push en haut
				push(a, b);
			else if (a->head->index > num) // je push en bas avec rotate
			{
				push(a, b);
				if (a->head->index >= 0 && a->head->index <= chunk + num)
					rotate(b);
				else
					rotate_ab(a, b);
			}
			num += 1;
		}
		else
			rotate(a);
	}
}

void	sorting_little_stack(t_stack *a, t_stack *b)
{
	int 	index_max;

	index_max = a->size + b->size - 1;
	if (check_list_sorted(a) == 0)
		return ;
	if (a->head->index == index_max)
		rotate(a);
	if (a->head->next->index == index_max)
		reverse_rotate(a);
	if (a->head->index > a->head->next->index)
		swap(a);
}

double	get_chunk(t_stack *a)
{
	int 	nb_nodes;
	double	chunk;

	nb_nodes = a->size;
	chunk = 0.000000053 * (nb_nodes * nb_nodes) + 0.03 * nb_nodes + 14.5;
	return (chunk);
}

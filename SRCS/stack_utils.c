/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   stack_utils.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/20 14:10:46 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/20 14:10:46 by anfichet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

void	init_stack(t_stack *a, t_stack *b)
{
	a->id = 'a';
	a->size = 0;
	a->head = NULL;
	b->id = 'b';
	b->size = 0;
	b->head = NULL;
}

void	print_stack(t_stack *stack)
{
	size_t	len_stack;
	t_node	*temp;

	temp = stack->head;
	len_stack = stack->size;
	ft_printf("\nstack %c\n", stack->id);
	while (len_stack > 0)
	{
		ft_printf("value = %d et index = %d\n", temp->value, temp->index);
		temp = temp->next;
		len_stack--;
	}
}

void	fill_stack(char **argv, t_stack *stack_a)
{
	size_t	i;
	t_node	*current;
	int	nb_temp;
	t_node *temp_node;

	i = 1;
	nb_temp = 0;
	if (check_args(argv) == - 1)
		free_exit(NULL, NULL, true);
	while (argv[i])
	{
		if (get_value(argv[i], &nb_temp) == -1) //verifie si atoi est ok + rempli le tableau
			free_exit(stack_a->head, NULL, true);
		else
		{
			temp_node = ft_dlstnew(nb_temp);
			ft_dlstadd_back(&stack_a->head, temp_node);
			stack_a->size++;
		}
		// check les doublons, on veut la meme condition d'entree et de sortie pour arreter la boucle
		current = stack_a->head;
		while (current->next != stack_a->head)
		{
			if (current->value == stack_a->head->prev->value)
				free_exit(stack_a->head, NULL, true);
			current = current->next;
		}
		//on compare toujours avec stac->head->prev->value et c'est current->value qui change a chaque fois et parcourt la chaine
		// stack->head->prev->value contient donc toujours le dernier maillon cree et le compare a l'ensemble de la chaine deja stocke
		i++;
	}
}

void	free_exit(t_node *a, t_node *b, bool error)
{
	t_node	*temp;

//remettre le pointeur de head a NULL
	if (a) {
		a->prev->next = NULL;
	}
	while (a)
	{
		temp = a;
		a = a->next;
		free (temp);
	}
	if (b) {
		b->prev->next = NULL;
	}
	while (b)
	{
		temp = b;
		b = b->next;
		free (temp);
	}
	if (error) {
		write (STDERR_FILENO, "Error\n", 6);
	}
	exit (error);
}
// error : define a 1 par defaut
// true = erreur

//int sort_stack(t_stack *a)
//{
//
//	if (a->head->value > a->head->next->value)
//		return (-1);
//	return (0);
//}
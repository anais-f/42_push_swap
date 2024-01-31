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

void	fill_stack(char **argv, t_stack *stack_a)
{
	int		nb_temp;
	size_t	i;
	t_node	*current;
	t_node	*temp_node;

	i = 1;
	nb_temp = 0;
	if (check_args(argv) == -1)
		free_exit(NULL, NULL, true);
	while (argv[i])
	{
		if (get_value(argv[i], &nb_temp) == -1)
			free_exit(stack_a->head, NULL, true);
		else
		{
			temp_node = ft_dlstnew(nb_temp);
			if (!temp_node)
				free_exit(stack_a->head, NULL, true);
			ft_dlstadd_back(&stack_a->head, temp_node);
			stack_a->size++;
		}
		current = stack_a->head;
		check_double(stack_a, current);
		i++;
	}
}

void	check_double(t_stack *stack_a, t_node *current)
{
	while (current->next != stack_a->head)
	{
		if (current->value == stack_a->head->prev->value)
			free_exit(stack_a->head, NULL, true);
		current = current->next;
	}
}

void	free_exit(t_node *a, t_node *b, bool error)
{
	t_node	*temp;

	if (a)
		a->prev->next = NULL;
	while (a)
	{
		temp = a;
		a = a->next;
		free (temp);
	}
	if (b)
		b->prev->next = NULL;
	while (b)
	{
		temp = b;
		b = b->next;
		free (temp);
	}
	if (error)
		write (STDERR_FILENO, "Error\n", 6);
	exit (error);
}

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

#include "checker_push_swap_bonus.h"

void	init_stack_checker(t_stack *a, t_stack *b)
{
	a->id = 'a';
	a->size = 0;
	a->head = NULL;
	b->id = 'b';
	b->size = 0;
	b->head = NULL;
}

void	fill_stack_checker(char **argv, t_stack *stack_a)
{
	int		nb_temp;
	size_t	i;
	t_node	*current;
	t_node	*temp_node;

	i = 1;
	nb_temp = 0;
	if (check_args_checker(argv) == -1)
		free_exit_checker(NULL, NULL, true);
	while (argv[i])
	{
		if (get_value_checker(argv[i], &nb_temp) == -1)
			free_exit_checker(stack_a->head, NULL, true);
		else
		{
			temp_node = ft_dlstnew_checker(nb_temp);
			ft_dlstadd_back_checker(&stack_a->head, temp_node);
			stack_a->size++;
		}
		current = stack_a->head;
		check_double_checker(stack_a, current);
		i++;
	}
}

void	check_double_checker(t_stack *stack_a, t_node *current)
{
	while (current->next != stack_a->head)
	{
		if (current->value == stack_a->head->prev->value)
			free_exit_checker(stack_a->head, NULL, true);
		current = current->next;
	}
}

void	free_exit_checker(t_node *a, t_node *b, bool error)
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

int	check_list_sorted_checker(t_stack *a)
{
	t_node	*head;

	head = a->head;
	while (head->next != a->head)
	{
		if (head->index > head->next->index)
			return (-1);
		head = head->next;
	}
	return (0);
}

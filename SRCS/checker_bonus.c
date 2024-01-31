/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   checker.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/30 18:39:18 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/30 18:39:18 by anfichet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "checker_push_swap_bonus.h"

int	main(int argc, char **argv)
{
	t_stack	a;
	t_stack	b;
	char	*line;

	if (argc <= 1)
		exit(1);
	init_stack_checker(&a, &b);
	fill_stack_checker(argv, &a);
	if (a.head == NULL)
		free_exit_checker(a.head, NULL, true, NULL);
	index_value_checker(&a);
	line = get_next_line(0);
	while (line)
	{
		make_rules(line, &a, &b);
		free(line);
		line = get_next_line(0);
	}
	if ((check_list_sorted_checker(&a)) == 0 && b.head == 0)
		ft_printf("OK\n");
	else
		ft_printf("KO\n");
	free_exit_checker(a.head, b.head, false, NULL);
	return (0);
}

void	make_rules(char *line, t_stack *stack_a, t_stack *stack_b)
{
	if (ft_strcmp(line, "ra\n") == 0)
		rotate_checker(stack_a);
	else if (ft_strcmp(line, "rb\n") == 0)
		rotate_checker(stack_b);
	else if (ft_strcmp(line, "rr\n") == 0)
		rotate_ab_checker(stack_a, stack_b);
	else if (ft_strcmp(line, "rra\n") == 0)
		reverse_rotate_checker(stack_a);
	else if (ft_strcmp(line, "rrb\n") == 0)
		reverse_rotate_checker(stack_b);
	else if (ft_strcmp(line, "rrr\n") == 0)
		reverse_rotate_ab_checker(stack_a, stack_b);
	else if (ft_strcmp(line, "pa\n") == 0)
		push_checker(stack_b, stack_a);
	else if (ft_strcmp(line, "pb\n") == 0)
		push_checker(stack_a, stack_b);
	else if (ft_strcmp(line, "sa\n") == 0)
		swap_checker(stack_a);
	else if (ft_strcmp(line, "sb\n") == 0)
		swap_checker(stack_b);
	else if (ft_strcmp(line, "ss\n") == 0)
		swap_ab_checker(stack_a, stack_b);
	else
		free_exit_checker(stack_a->head, stack_b->head, true, line);
}

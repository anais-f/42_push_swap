/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   push_swap.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/09 17:54:25 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/09 17:54:25 by anfichet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

int	main(int argc, char **argv)
{
	t_stack	a;
	t_stack	b;

	if (argc <= 1)
		exit(1);
	init_stack(&a, &b);
//	if (argc == 2)
//	{
//		fill_stack(argv, &a);
//		if (a.head == NULL)
//			free_exit(a.head, NULL, true);
//		index_value(&a);
//	}
	if (argc >= 2)
	{
		fill_stack(argv, &a);
		if (a.head == NULL)
			free_exit(a.head, NULL, true);
		index_value(&a);
		if (check_list_sorted(&a) == -1)
		{
			pre_sorting_stack_a_to_b(&a, &b);
			sorting_little_stack(&a, &b);
			final_sorting_b_to_a(&a, &b);
		}
	}
	free_exit(a.head, b.head, false);
	return (0);
}
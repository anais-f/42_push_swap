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

int main(int argc, char **argv)
{
	t_stack	a;
	t_stack	b;

	if (argc == 1)
		free_exit(NULL, NULL, true);

	init_stack(&a, &b);

//	if (argc == 2)
//		return (-1);
//a revoir, doit renvoyer l'element

	if (argc > 1)
	{
//		if (sort_stack(&a) == 0)
//			print_stack(&a);
//		else
//		{
		fill_stack(argv, &a);
		if (a.head == NULL)
			free_exit(a.head, NULL, true);

		//faire une verif avant de trier la liste
		//ft_tri(&a.head, argc);
		index_value(&a);
//		ft_printf("stack before :\n");
//		print_stack(&a);
//		print_stack(&b);
//		tiny_sort(&a, &b);
		presort_stack(&a, &b);
		//sort(&a, &b);
//		ft_printf("\nstack after :\n");
//		print_stack(&a);
//		print_stack(&b);
////		}
	}
	free_exit(a.head, NULL, false);
	return (0);
}
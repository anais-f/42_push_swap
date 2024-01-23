/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parsing.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/17 11:33:57 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/17 11:33:57 by anfichet         ###   ########.fr       */
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
			ft_printf("stack before :\n");
			print_stack(&a);
			print_stack(&b);
			ft_printf("\nInstructions :\n");
			swap(&a);
			ft_push(&a, &b);
			reverse_rotate_ab(&a, &b);
			ft_push(&b, &a);
			ft_printf("\nstack after :\n");
			print_stack(&a);
			print_stack(&b);
//		}
	}
	free_exit(a.head, NULL, false);
	return (0);
}

int check_args(char **argv)
{
	int i;
	int j;

	i = 1;
	while (argv[i])
	{
		j = 0;
		if (argv[i][j] == '\0')
			return (-1);
		while (argv[i][j])
		{
			if ((argv[i][j] == '+' || argv[i][j] == '-') && ft_isdigit(argv[i][j - 1]))
				return (-1);
			while ((argv[i][j] == '+' || argv[i][j] == '-') && ft_isdigit(argv[i][j + 1]))
				j++;
			if (!ft_isdigit(argv[i][j]))
				return (-1);
			j++;
		}
		i++;
	}
	return (0);
}

int	get_value(const char *str, int *numb)
{
	size_t		i;
	long int	nb;
	int			sign;

	i = 0;
	nb = 0;
	sign = 1;
	if (str[i] == '-')
		sign = -sign;
	if (str[i] == '+' || str[i] == '-')
		i++;
	while (str[i] >= '0' && str[i] <= '9')
	{
		if (sign == 1 && (nb > INT_MAX / 10 || nb * 10 > INT_MAX - (str[i] - 48)))
			return (-1);
		if (sign == -1 && (-nb < INT_MIN / 10 || -nb * 10 < INT_MIN + (str[i] - 48)))
			return(-1);
		nb = nb * 10 + str[i] - '0';
		i++;
	}
	*numb = nb * sign;
	return (0);
}
//overflow de atoi gere par le renvoi de -1 et son return
// passe atoi et stocke le resultat directement dans le tab de int

/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   checker_parsing.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/30 18:46:33 by anfichet          #+#    #+#             */
/*   Updated: 2024/01/30 18:46:33 by anfichet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "checker_push_swap_bonus.h"

int	check_args_checker(char **argv)
{
	int	i;
	int	j;

	i = 1;
	while (argv[i])
	{
		j = 0;
		if (argv[i][j] == '\0')
			return (-1);
		while (argv[i][j])
		{
			if ((argv[i][j] == '+' || argv[i][j] == '-') \
				&& ft_isdigit(argv[i][j - 1]))
				return (-1);
			while ((argv[i][j] == '+' || argv[i][j] == '-') \
				&& ft_isdigit(argv[i][j + 1]))
				j++;
			if (!ft_isdigit(argv[i][j]))
				return (-1);
			j++;
		}
		i++;
	}
	return (0);
}

int	get_value_checker(const char *str, int *numb)
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
		if (sign == 1 && (nb > INT_MAX / 10 || nb * 10 > INT_MAX \
			- (str[i] - 48)))
			return (-1);
		if (sign == -1 && (-nb < INT_MIN / 10 || - nb * 10 < INT_MIN \
			+ (str[i] - 48)))
			return (-1);
		nb = nb * 10 + str[i] - '0';
		i++;
	}
	*numb = nb * sign;
	return (0);
}

void	index_value_checker(t_stack *a)
{
	int		count_value;
	t_node	*to_compare;
	t_node	*node_index;
	int		size_lst;

	size_lst = a->size;
	node_index = a->head;
	while (size_lst > 0)
	{
		count_value = 0;
		to_compare = node_index->next;
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

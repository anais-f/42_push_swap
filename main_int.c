///* ************************************************************************** */
///*                                                                            */
///*                                                        :::      ::::::::   */
///*   main.c                                             :+:      :+:    :+:   */
///*                                                    +:+ +:+         +:+     */
///*   By: anfichet <anfichet@student.42lyon.fr>      +#+  +:+       +#+        */
///*                                                +#+#+#+#+#+   +#+           */
///*   Created: 2024/01/10 10:58:55 by anfichet          #+#    #+#             */
///*   Updated: 2024/01/16 16:02:11 by anfichet         ###   ########lyon.fr   */
///*                                                                            */
///* ************************************************************************** */
//
//#include "push_swap.h"
//
//
//int main(int argc, char **argv)
//{
//	int j = 0;
//	int *tab = 0;
//
//
//	if (argc < 2)
//	{
//		write (STDERR_FILENO, "Error main\n", 11);
//		return (-1);
//	}
//
//	if (argc == 2)
//		return (0);
//
//	if (argc > 2)
//	{
//		tab = ft_fill_tab(argv, argc);
//		if  (tab == NULL)
//		{
//			write (STDERR_FILENO, "Error main/fill\n", 16);
//			return (-1);
//		}
//		ft_tri(tab, argc);
//		while (j < argc - 1)
//		{
//			printf("int = %d\n", tab[j]);
//			j++;
//
//		}
//		free(tab);
//	}
//
//	return (0);
//}
//
//int *ft_fill_tab(char **argv, int argc)
//{
//	size_t	i;
//	size_t	j;
//	size_t	k;
//	int *tab;
//
//	i = 1;
//	j = 0;
//	tab = malloc((argc - 1) * sizeof(int));
//	if (!tab)
//		return (0);
//	if (ft_check_args(argv) == - 1)
//	{
//		write (STDERR_FILENO, "Error fill tab ->check arg\n", 27);
//		return (NULL);
//	}
//	else
//		printf("check arg OK\n");
//	while (argv[i])
//	{
//		if (ft_atoi_ps(argv[i], tab + j) == -1) //verifie si atoi est ok + rempli le tableau
//		{
//			write (STDERR_FILENO, "Error overflow atoi\n", 19);
//			return (NULL);
//		}
//		k = 0;
//		while (k < j)
//		{
//			if (tab[j] == tab[k])
//			{
//				write (STDERR_FILENO, "Error doublon\n", 14);
//				return (NULL);
//			}
//			k++;
//		}
//		i++;
//		j++;
//	}
//	return (tab);
//}
//
//int ft_check_args(char **argv)
//{
//	int i;
//	int j;
//
//	i = 1;
//	while (argv[i])
//	{
//		j = 0;
//		if (argv[i][j] == '\0')
//			return (-1);
//		while (argv[i][j])
//		{
//			if ((argv[i][j] == '+' || argv[i][j] == '-') && ft_isdigit(argv[i][j - 1]))
//				return (-1);
//			while ((argv[i][j] == '+' || argv[i][j] == '-') && ft_isdigit(argv[i][j + 1]))
//				j++;
//			if (!ft_isdigit(argv[i][j]))
//				return (-1);
//			j++;
//		}
//		i++;
//	}
//	return (0);
//}
//
//void	ft_tri(int *tab, int argc)
//{
//	int i;
//	int k = (argc - 2);
//	int tmp = 0;
//
//	while (k > 0)
//	{
//		i = 0;
//		while (i < k)
//		{
//			if (tab[i] > tab[i + 1])
//			{
//				tmp = tab[i + 1];
//				tab[i + 1] = tab[i];
//				tab[i] = tmp;
//			}
//			i++;
//		}
//		k--;
//	}
//}

//
//int	ft_atoi_ps(const char *str, int *numb)
//{
//	size_t		i;
//	long int	nb;
//	int			sign;
//
//	i = 0;
//	nb = 0;
//	sign = 1;
//	if (str[i] == '-')
//		sign = -sign;
//	if (str[i] == '+' || str[i] == '-')
//		i++;
//	while (str[i] >= '0' && str[i] <= '9')
//	{
//		if (sign == 1 && (nb > INT_MAX / 10 || nb * 10 > INT_MAX - (str[i] - 48)))
//			return (-1);
//		if (sign == -1 && (-nb < INT_MIN / 10 || -nb * 10 < INT_MIN + (str[i] - 48)))
//			return(-1);
//		nb = nb * 10 + str[i] - '0';
//		i++;
//	}
//	*numb = nb * sign;
//	return (0);
//}
////overflow de atoi gere par le renvoi de -1 et son return

//// passe atoi et stocke le resultat directement dans le tab de int

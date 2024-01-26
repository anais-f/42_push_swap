//void    tiny_sort(t_stack *a, t_stack *b)
//{
//	int nb_nodes;
//	int i;
//
//	i = 0;
//	nb_nodes = a->size;
//	while (i <= nb_nodes - 1)
//	{
//		while (a->head->index != i)
//		{
//			rotate(a);
//		}
//		ft_push(a, b);
//		i++;
//	}
//	while (i > 0)
//	{
//		ft_push(b, a);
//		i--;
//	}
//}
// espece de tri a bulles, on compare avec le +1 uniquement
#include "push_swap.h"

void	sort(t_stack *a, t_stack *b)
{
	int nb_nodes;
	(void) a;
	nb_nodes = b->size - 1;
	printf("nb nodes de B = %d\n", nb_nodes);
	while (b->head != NULL)
	{
		if (b->head->index == nb_nodes)
		{
			ft_push(b,a);
			nb_nodes--;
		}
		else
			rotate(b);
	}
}

t_node	*biggest;

biggest = get_biggest_node(a);
if (a->head->index == biggest->index)
rotate(a, NULL);
else if (a->head->next->index == biggest->index)
reverse_rotate(a, NULL);
if (a->head->index > a->head->next->index)
swap(a, NULL);


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
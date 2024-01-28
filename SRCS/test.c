#include "push_swap.h"

//void final_sorting(t_stack *a, t_stack *b, int *n)
//{
//	int		nb_index_stack;
//	int		index_to_push;
//	int 	i;
//	t_node	*temp;
//
//	(void) a;
//	nb_index_stack = b->size - 1;
//	index_to_push = b->size - 1;
//	i = *n;
//	temp = b->head;
//
//	while (temp && index_to_push >= 0)
//	{
//		if (find_half(b, index_to_push, nb_index_stack, &i) == 1)
//		{
//			while (i > 0)
//			{
//				rotate(b);
//				i--;
//			}
//			ft_push(b, a);
//		}
//		else if (find_half(b, index_to_push, nb_index_stack, &i) == 2)
//		{
//			while (i <= nb_index_stack) {
//				reverse_rotate(b);
//				i++;
//			}
//			ft_push(b, a);
//		}
//		nb_index_stack--;
//		index_to_push--;
//		temp = temp->next;
//	}
//}

////je cherche le plus grand en premier, je le push
//je push le suivant
//s'il est un plus petit, je le laisse en haut -> sinon je rotate pour le passer en bas
//apres je push entre l'index pushe et le plus grand deja push
//je verifie a chaque fois si c'est le bon ou non pour reverse rotate ou swap et les remettre dans l'ordre


//void	sort(t_stack *a, t_stack *b)
//{
//	int nb_nodes;
//	(void) a;
//	nb_nodes = b->size - 1;
//	printf("nb nodes de B = %d\n", nb_nodes);
//	while (b->head != NULL)
//	{
//		if (b->head->index == nb_nodes)
//		{
//			ft_push(b,a);
//			nb_nodes--;
//		}
//		else
//			rotate(b);
//	}
//}



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


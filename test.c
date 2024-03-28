#include "push_swap.h"

//
//if (a->head->prev->index == biggest_index_a)
//{
//push(b, a);
//if (a->head->index != a->head->next->index - 1)
//rotate(a);
//}
//else
//{
//if (find_half(b, biggest_index_b, nb_index_stack) == 1)
//{
//if (b->head->index < biggest_index_a && b->head->index > smallest_index_a)
//push(b, a);
//else
//rotate(b);
//}
//else
//reverse_rotate(b);
//}
////	if (b->head->index < biggest_index_a && b->head->index > smallest_index_a) {
////		push(b, a);
////	}
//if (a->head->index == a->head->next->index - 1) {
//push(b, a);
//if ()
//}
//else {
//rotate(a);
//}


//int find_min_index(t_stack *a)
//{
//	t_node	*temp;
//	int 	index_min;
//
//	temp = a->head;
//	index_min = temp->index;
//	while (temp->next != a->head)
//	{
//		if (temp->index < index_min)
//			index_min = temp->index;
//		else
//			temp = temp->next;
//	}
//	dprintf(2,"index min de b = %d\n", index_min);
//	return (index_min);
//}

//void final_sorting_b_to_a(t_stack *a, t_stack *b, int *n)
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


size_t	len_dlst(t_node *stack)
{
	size_t	i;
	t_node	*head;

	i = 0;
	if (!stack)
		return (0);
	head = stack;
	while (stack->next != head)
	{
		stack = stack->next;
		i++;
	}
	return (i + 1);
}


void	print_stack(t_stack *stack)
{
	size_t	len_stack;
	t_node	*temp;

	temp = stack->head;
	len_stack = stack->size;
	ft_printf("\nstack %c\n", stack->id);
	while (len_stack > 0)
	{
		dprintf(2, "value = %d et index = %d\n", temp->value, temp->index);
		temp = temp->next;
		len_stack--;
	}
}

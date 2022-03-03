/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: mark <marvin@codam.nl>                       +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/05/14 14:57:31 by mark          #+#    #+#                 */
/*   Updated: 2020/06/22 09:48:44 by mpeerdem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include "libasm.h"

void	test_strlen(void)
{

	int		i;
	int		a;
	int		b;
	char	**words;

	words = malloc(sizeof(char*) * 4);
	words[0] = strdup("Word");
	words[1] = strdup("");
	words[2] = strdup("fiuhfiehsfiuheiufhueihfuiehfiuheufuhhef");
	words[3] = strdup("a\nb\nc\nd\0e\nf\n");
	printf("\n=== STRLEN ===\n");
	i = 0;
	while (i < 4)
	{
		a = strlen(words[i]);
		b = ft_strlen(words[i]);
		printf("Orig: [%i], Mine: [%i]\n", a, b);
		i++;
	}
}

void	test_strcpy(void)
{
	char	*word1;
	char	*word2;
	char	*word3;

	printf("\n=== STRCPY ===\n");
	word2 = NULL;
	word3 = NULL;
	printf("Pointers before strdup:\n");
	printf("Orig: [%p], Mine: [%p]\n", word2, word3);
	word2 = strdup("Original string");
	word3 = strdup("Original string");
	word1 = strdup("Replacement");
	printf("Pointers after strdup:\n");
	printf("Orig: [%p], Mine: [%p]\n", word2, word3);
	word2 = strcpy(word2, word1);
	word3 = ft_strcpy(word3, word1);
	printf("Pointers after strcpy:\n");
	printf("Orig: [%p], Mine: [%p]\n", word2, word3);
	printf("Orig: [%s], Mine: [%s]\n", word2, word3);
}

void	test_strcmp(void)
{
	char	**list1;
	char	**list2;
	int		i;
	int		a;
	int		b;

	list1 = malloc(sizeof(char*) * 5);
	list2 = malloc(sizeof(char*) * 5);
	list1[0] = strdup("The same");
	list2[0] = strdup("The same");
	list1[1] = strdup("abcd");
	list2[1] = strdup("acbd");
	list1[2] = strdup("");
	list2[2] = strdup("");
	list1[3] = strdup("abc");
	list2[3] = strdup("abcdef");
	list1[4] = strdup("test");
	list2[4] = strdup("Test");
	printf("\n=== STRCMP ===\n");
	i = 0;
	while (i < 5)
	{
		a = strcmp(list1[i], list2[i]);
		b = ft_strcmp(list1[i], list2[i]);
		printf("Orig: [%i], Mine: [%i]\n", a, b);
		i++;
	}
}

void	test_write(void)
{
	int		a;
	int		b;
	int		fd;

	printf("\n=== WRITE ===\n");
	a = write(1, "Test\n", 5);
	b = ft_write(1, "Test\n", 5);
	printf("Orig = [%i], Mine = [%i]\n", a, b);
	errno = 0;
	a = write(300, "Test\n", 5);
	printf("Orig = [%i], errno = [%i]\n", a, errno);
	errno = 0;
	b = ft_write(300, "Test\n", 5);
	printf("Mine = [%i], errno = [%i]\n", b, errno);
	errno = 0;
	fd = open("output.txt", O_WRONLY | O_TRUNC | O_CREAT, 0644);
	a = write(fd, "TestTestTest\n", 13);
	b = ft_write(fd, "TestTestTest\n", 13);
	printf("Orig = [%i], Mine = [%i]\n", a, b);
	close(fd);
}

void	test_read(void)
{
	int		a;
	int		b;
	int		fd;
	char	*buffer1;
	char	*buffer2;

	printf("\n=== READ ===\n");
	buffer1 = calloc(100, 1);
	buffer2 = calloc(100, 1);
	errno = 0;
	a = read(300, buffer1, 20);
	printf("Orig = [%i], errno = [%i]\n", a, errno);
	printf("Buffer is [%s]\n", buffer1);
	errno = 0;
	b = ft_read(300, buffer2, 20);
	printf("Mine = [%i], errno = [%i]\n", b, errno);
	printf("Buffer is [%s]\n", buffer2);
	bzero(buffer1, 100);
	bzero(buffer2, 100);
	fd = open("output.txt", O_RDONLY);
	a = read(fd, buffer1, 10);
	close(fd);
	fd = open("output.txt", O_RDONLY);
	b = ft_read(fd, buffer2, 10);
	printf("Orig: [%i], Mine: [%i]\n", a, b);
	printf("Buffer orig: [%s]\n", buffer1);
	printf("Buffer mine: [%s]\n", buffer2);
	close(fd);
}

void	test_strdup(void)
{
	char	*s1;
	char	*s2;
	char	*s3;

	s1 = strdup("Hello");
	s2 = strdup(s1);
	s3 = ft_strdup(s1);
	printf("\n=== STRDUP ===\n");
	printf("s1: [%s], s2: [%s], s3: [%s]\n", s1, s2, s3);
}

/*
void	test_atoi_base(void)
{
	int		a;

	printf("\n=== ATOI_BASE ===\n");
	a = ft_atoi_base("101", "01");
	printf("A = [%i] (101 in normal binary)\n", a);
	a = ft_atoi_base("202", "01");
	printf("A = [%i] (202 in normal binary)\n", a);
	a = ft_atoi_base("   ", "0 ");
	printf("A = [%i] ([   ] (3 spaces) in binary with 1 replaced by a space)\n", a);
	a = ft_atoi_base("EE", "FEDCBA9876543210");
	printf("A = [%i] (EE in reverse binary (17))\n", a);
}

void	print_list(t_list *list)
{
	printf("Current list:\n");
	while (list != NULL)
	{
		printf("\tList item = [%s]\n", (char*)list->data);
		list = list->next;
	}
}

int		fstrcmp(char *s1, char *s2)
{
	int		a;

	a = strcmp(s1, s2);
	printf("Testing [%s] against [%s], result [%i]\n", s1, s2, a);
	return (a);
}

void	test_lists(void)
{
	t_list		*head;
	int			size;
	char		*ref;

	head = NULL;
	printf("\n=== LIST ===\n");
	ft_list_push_front(&head, "Banana");
	print_list(head);
	ft_list_push_front(&head, "Apple");
	print_list(head);
	ft_list_push_front(&head, "Cherry");
	print_list(head);
	ft_list_push_front(&head, "Zucchini");
	print_list(head);
	ft_list_push_front(&head, "Banana");
	print_list(head);
	ft_list_push_front(&head, "Tomato");
	print_list(head);

	size = ft_list_size(head);
	printf("List size: [%i]\n", size);

	printf("Sorting list with strcmp as function.\n");
	ft_list_sort(&head, &fstrcmp);
	
	print_list(head);

	ref = strdup("Banana");
	printf("Removing if item is [%s].\n", ref);
	ft_list_remove_if(&head, ref, &fstrcmp);
	print_list(head);
}*/

int		main(void)
{
	test_strlen();
	test_strcpy();
	test_strcmp();
	test_write();
	test_read();
	test_strdup();

	// BONUS
	//test_atoi_base();
	//test_lists();


}

/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   libasm.h                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: mark <marvin@codam.nl>                       +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/05/14 14:58:25 by mark          #+#    #+#                 */
/*   Updated: 2020/06/22 09:35:48 by mpeerdem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <sys/types.h>

/*
**	Mandatory functions
*/

size_t				ft_strlen(const char *s);
char				*ft_strcpy(char *dst, const char *src);
int					ft_strcmp(const char *s1, const char *s2);
ssize_t				ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t				ft_read(int fildes, void *buf, size_t nbyte);
char				*ft_strdup(const char *s1);

/*
**	List struct for bonus
*/

typedef struct		s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

/*
**	Bonus functions
*/

int					ft_atoi_base(char *str, char *base);
void				ft_list_push_front(t_list **begin_list, void *data);
int					ft_list_size(t_list *begin_list);
void				ft_list_sort(t_list **begin_list, int (*cmp)());
void				ft_list_remove_if(t_list **begin_list, void *data_ref,
						int (*cmp)());

/*
**	Helper functions
*/

int					ft_count(const char *s, int c);
int					ft_index_of(const char *s, int c);

#endif

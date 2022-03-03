# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: mark <marvin@codam.nl>                       +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/04 11:56:23 by mark          #+#    #+#                  #
#    Updated: 2020/06/19 12:18:08 by mpeerdem      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME =		libasm.a
HEADER =	libasm.h
SDIR =		srcs
ODIR =		objs
_OBJS = 	ft_strlen ft_strcpy ft_strcmp ft_write ft_read ft_strdup
OBJS =		$(addsuffix .o, $(addprefix $(ODIR)/, $(_OBJS)))
_HOBJS =	ft_count ft_index_of
HOBJS =		$(addsuffix .o, $(addprefix $(ODIR)/, $(_HOBJS)))
_BOBJS =	ft_atoi_base ft_list_push_front ft_list_size \
			ft_list_sort ft_list_remove_if
BOBJS =		$(addsuffix _bonus.o, $(addprefix $(ODIR)/, $(_BOBJS)))

all: $(NAME)

.PHONY: all bonus clean fclean re

$(NAME): $(OBJS)
	ar -rcs $(NAME) $(OBJS)

$(ODIR)/%.o: $(SDIR)/%.s $(HEADER)
	@mkdir -p $(ODIR)
	nasm -fmacho64 $< -o $@

bonus: $(OBJS) $(HOBJS) $(BOBJS)
	ar -rcs $(NAME) $(OBJS) $(HOBJS) $(BOBJS)

clean:
	rm -f $(OBJS) $(HOBJS) $(BOBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

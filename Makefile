CC = cc
CFLAGS = -Wall -Wextra -Werror
LD = ar
LDFLAGS = -rcs
INC = -Iinclude
NAME =  libftprintf.a
SRCS = src/ft_printf.c \
	   src/ft_printf_utils.c \
	   src/ft_strjoin_free.c \
	   src/ft_conv.c \
	   src/ft_conv_number_utils.c
LIBFT = lib/libft.a
OBJS = $(SRCS:.c=.o)

.PHONY: all clean fclean re

all: $(NAME)

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME) 

re: fclean
	$(MAKE) all

$(NAME): $(OBJS) $(LIBFT)
	$(LD) $(LDFLAGS) $@ $^

%.o: %.c
	$(CC) $(CFLAGS) $(INC) -c -o $@ $^

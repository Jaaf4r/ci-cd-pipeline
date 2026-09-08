CXX			= c++
CXXFLAGS	= -Wall -Wextra -Werror

SRC			= src/main.cpp
OBJ			= $(SRC:.cpp=.o)
NAME		= pp

%.o: %.cpp
		$(CXX) $(CXXFLAGS) -c $< -o $@

$(NAME): $(OBJ)
		$(CXX) $(CXXFLAGS) $^ -o $@

all: $(NAME)

clean:
		rm -f $(OBJ)

fclean: clean
		rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re

class TicTacToe 

        def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @count = 0    
        @board = [
            ['0-0', '|', '0-1', '|', '0-2'],
            ['1-0', '|', '1-1', '|', '1-2'],
            ['2-0', '|', '2-1', '|', '2-2']
        ]     
    end

    def greeting_and_start
        puts "Então vamos iniciar o Jogo da Velha! #{@player1} vs. #{@player2}!"
        game_board(9, 00, 0)
    end

    def change_turn(num)
        @count += 1
       
        if @count.odd? && @count < 10 
            puts "#{@player1}, digite os números referentes à sua jogada:"
            num_x = gets.chomp
            game_board(num_x, ' X ', @count)

        elsif @count.even? && @count < 10
            puts "#{@player2}, digite os números referentes à sua jogada:"
            num_o = gets.chomp
            game_board(num_o, ' O ', @count)

        elsif @count >= 10 
            p "GAME OVER"
        end
    end

    def game_board(number, symbol, round)

        @board.each_with_index do |array, line|
            array.each_with_index do |element, position|
                if element == number
                    @board[line][position] = symbol
                end
            end
        end 
        
        puts @board[0].join(' ')
        puts @board[1].join(' ')
        puts @board[2].join(' ')

        horizontal_win(symbol)
        vertical_win(symbol)
        diagonal_win(symbol)
        change_turn(round)
    end

    def horizontal_win(symbol)

       
        @board.each_with_index do |array, i|
            array.each_with_index do |element, j|
                if @board[i][0] == @board[i][2] && @board[i][0] == @board[i][4] && @board[i][0] == symbol 
                    end_game(symbol)
                    break
                end                      
            end
        end
    end 

    def vertical_win(symbol)

        @board.each_with_index do |array, i|
            array.each_with_index do |element, j|
                if @board[0][j] == @board[1][j] && @board[0][j] == @board[2][j] && @board[0][j] == symbol 
                    end_game(symbol)
                    break
                end                      
            end
        end 
    end 

    def diagonal_win(symbol)

        if @board[1][2] == @board[0][0] && @board[1][2] == @board[2][4] && @board[1][2] == symbol
          end_game(symbol)

        elsif @board[1][2] == @board[0][4] && @board[1][2] == @board[2][0] && @board[1][2] == symbol
          end_game(symbol)
        end

    end

    def end_game(string)
        if string == ' X '
            p "#{@player1.capitalize} WINS!"
            @count = 10
        elsif string == ' O '
            p "#{@player2.capitalize} WINS!"
            @count = 10
        end
    end   
end




puts 'Sejam bem vindos ao Jogo da Velha!'
puts 'A seguir vou pedir o nome de cada jogador e, em seguida começamos o jogo. '
puts 'O Jogador 1 será quem jogará com o símbolo "X"'
puts 'Jogador 1, escreva seu nome:'
name1 = gets.chomp
puts "Agora é a vez de sabermos o nome do jogador 2:"
name2 = gets.chomp
jogo = TicTacToe.new(name1, name2)
jogo.greeting_and_start
play = gets.chomp
jogo.change_turn(play)





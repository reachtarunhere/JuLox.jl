module Scanner

include("tokens.jl")

report_error(line_no, message) = println("[line $line_no] Error: $message")

# TODO: Since we will have errors in other elements beyond the scanner too this has to be moved to the right place

function scan_tokens(src_code)
    tokens = Token[]
    has_error = false
    line_num = 1

    # TODO: care about valid indices for non-ascii characters later
    # using nextind and friends

    match_next_char(expected, i) = i + 1 <= length(src_code) && src_code[i + 1] == expected

    i = 1

    while i <= length(src_code)
        c = src_code[i]
        if c == '('
            push!(tokens, LeftParen(line_num))
        elseif c == ')'
            push!(tokens, RightParen(line_num))
        elseif c == '{'
            push!(tokens, LeftBrace(line_num))
        elseif c == '}'
            push!(tokens, RightBrace(line_num))
        elseif c == ','
            push!(tokens, Comma(line_num))
        elseif c == '.'
            push!(tokens, Dot(line_num))
        elseif c == '-'
            push!(tokens, Minus(line_num))
        elseif c == '+'
            push!(tokens, Plus(line_num))
        elseif c == ';'
            push!(tokens, Semicolon(line_num))
        elseif c == '*'
            push!(tokens, Star(line_num))
        elseif c == '\n'
            line_num += 1

            # Two Charcter Tokens
            # Kinda ugly honestly witht the nested ifs

        elseif c == '!'
            if match_next_char('=', i)
                push!(tokens, BangEqual(line_num))
                i += 1 # extra increment so as to skip next character
            else
                push!(tokens, Bang(line_num))
            end
        elseif c == '='
            if match_next_char('=', i)
                push!(tokens, EqualEqual(line_num))
                i += 1
            else
                push!(tokens, Equal(line_num))
            end
        elseif c == '<'
            if match_next_char('=', i)
                push!(tokens, LessEqual(line_num))
                i += 1
            else
                push!(tokens, Less(line_num))
            end
        elseif c == '>'
            if match_next_char('=', i)
                push!(tokens, GreaterEqual(line_num))
                i += 1
            else
                push!(tokens, Greater(line_num))
            end

        elseif c == '/'
            if match_next_char('/', i)
                while i <= length(src_code) && src_code[i] != '\n'
                    i += 1 # skip everythin for this line
                end
            else
                push!(tokens, Slash(line_num))
            end

        elseif c == ' ' || c == '\r' || c == '\t'

        else
            has_error = true
            report_error(line_num, "Unexpected character $c")
            # continue scanning
        end

        i += 1
        # This is our poor man's version of advance! by PL people
        # We also don't implement peek which might be useful if we want to limit how far the scanner looks into
        # another advantage of peek and advance will be that handling non ascii charcters in Julia will result in nicer code
        # TODO: consider peek and advance implementation

    end

    # println(tokens)             

    return tokens, has_error
end

end

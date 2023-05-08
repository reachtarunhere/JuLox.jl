module Scanner

include("tokens.jl")

report_error(line_no, message) = println("[line $line_no] Error: $message")

function scan_tokens(src_code)
    tokens = []
    has_error = false
    line_num = 1
    
    for (i, c) in enumerate(src_code)
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
        else
            has_error = true
            report_error(line_num, "Unexpected character $c")
            # continue scanning
        end
    end
    
    return tokens, has_error
end


end

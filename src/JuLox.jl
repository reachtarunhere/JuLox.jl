module JuLox

function main(args)
    if length(args) > 1
        println("Usage: JuLox [script]")
        exit(64)
    elseif length(args) == 1
        run_file(args[1])
    else
        run_prompt()
    end
end

end

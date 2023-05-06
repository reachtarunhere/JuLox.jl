module JuLox

run_file(path) = run(read(path))

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

function run_prompt()
    while true
        print("JuLox> ")
        flush(stdout)
        line = readline()
        isempty(line) && eof(stdin) && break
        println(line)
    end
end

# eof is blocking so it is not possible to use it in a while loop
# condition. TODO: sill buggy behaviour with empty line and then typing

end

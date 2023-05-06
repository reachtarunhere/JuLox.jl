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
        line = readline(keep=true)
        isempty(line) && break
        run(rstrip(line))
    end
end

end

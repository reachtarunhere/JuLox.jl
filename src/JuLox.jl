module JuLox

include("scanner.jl")

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
    print(julox_logo)
    while true
        print("JuLox> ")
        flush(stdout)
        line = readline(keep=true)
        isempty(line) && break
        run(rstrip(line)) # TODO: handle gracefully when run finds syntax error
    end
end

# TODO: Generate a nice ascii art splash screen using ChatGPT

julox_logo = raw"""
                                  ,--,                         
         ,---._                ,---.'|                         
       .-- -.' \               |   | :                         
       |    |   :              :   : |                         
       :    ;   |         ,--, |   ' :      ,---.              
       :        |       ,'_ /| ;   ; '     '   ,'\ ,--,  ,--,  
       |    :   :  .--. |  | : '   | |__  /   /   ||'. \/ .`|  
       :         ,'_ /| :  . | |   | :.'|.   ; ,. :'  \/  / ;  
       |    ;   ||  ' | |  . . '   :    ;'   | |: : \  \.' /   
   ___ l         |  | ' |  | | |   |  ./ '   | .; :  \  ;  ;   
 /    /\    J   ::  | : ;  ; | ;   : ;   |   :    | / \  \  \  
/  ../  `..-    ,'  :  `--'   \|   ,/     \   \  /./__;   ;  \ 
\    \         ; :  ,      .-./'---'       `----' |   :/\  \ ; 
 \    \      ,'   `--`----'                       `---'  `--`  
  "---....--'

"""

# logo credits: https://patorjk.com/software/taag/#p=display&f=3D%20Diagonal&t=JuLox


function run(code)
    has_error = false # TODO: replace this with some real checking
    has_error && exit(65)
end

report_error(line_no, message) = println("[line $line_no] Error: $message")

    
end

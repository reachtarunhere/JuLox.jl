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
    print(julox_logo)
    while true
        print("JuLox> ")
        flush(stdout)
        line = readline(keep=true)
        isempty(line) && break
        run(rstrip(line))
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


end

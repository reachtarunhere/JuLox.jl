abstract type Token end

abstract type Literal <: Token end

# identifiers, strings, numbers

abstract type Operator <: Token end
# + - * / == !=  <= >= ...

abstract type Keyword <: Token end

# IF ELSE CLASS FALSE VAR WHILE...

abstract type Punctuation <: Token end

# Used copilot for this but honestly this could be a macro instead.
# TODO: Do it later with a macro for loop.

struct LeftParen <: Punctuation
    line::Int
end

struct RightParen <: Punctuation
    line::Int
end
    
struct LeftBrace <: Punctuation
    line::Int
end
    
struct RightBrace <: Punctuation
    line::Int
end
    
struct Comma <: Punctuation
    line::Int
end
    
struct Dot <: Punctuation
    line::Int
end
    
struct Minus <: Punctuation
    line::Int
end
    
struct Plus <: Punctuation
    line::Int
end
    
struct Semicolon <: Punctuation
    line::Int
end
    
struct Slash <: Punctuation
    line::Int
end
    
struct Star <: Punctuation
    line::Int
end
    
struct Bang <: Punctuation
    line::Int
end
    
struct BangEqual <: Punctuation
    line::Int
end
    
struct Equal <: Punctuation
    line::Int
end
    
struct EqualEqual <: Punctuation
    line::Int
end
    
struct Greater <: Punctuation
    line::Int
end
    
struct GreaterEqual <: Punctuation
    line::Int
end
    
struct Less <: Punctuation
    line::Int
end
    
struct LessEqual <: Punctuation
    line::Int
end
    
struct Identifier <: Literal
    line::Int
    name::String
end

struct StringLiteral <: Literal
    line::Int
    value::String
end

struct NumberLiteral <: Literal
    line::Int
    value::Float64
end

struct And <: Operator
    line::Int
end

struct Class <: Keyword
    line::Int
end

struct Else <: Keyword
    line::Int
end

struct False <: Keyword
    line::Int
end

struct Fun <: Keyword
    line::Int
end

struct For <: Keyword
    line::Int
end

struct If <: Keyword
    line::Int
end

struct Nil <: Keyword
    line::Int
end

struct Or <: Keyword
    line::Int
end

struct Print <: Keyword
    line::Int
end

struct Return <: Keyword
    line::Int
end

struct Super <: Keyword
    line::Int
end

struct This <: Keyword
    line::Int
end

struct True <: Keyword
    line::Int
end

struct Var <: Keyword
    line::Int
end

struct While <: Keyword
    line::Int
end

struct EOF <: Token
    line::Int
end

# Once again I am sorry for doing this with copilot but I am lazy.
# I also don't like the idea of storing this redundantly in every instance
# So methods is what we will do

lexeme(::LeftParen) = "("
lexeme(::RightParen) = ")"
lexeme(::LeftBrace) = "{"
lexeme(::RightBrace) = "}"
lexeme(::Comma) = ","
lexeme(::Dot) = "."
lexeme(::Minus) = "-"
lexeme(::Plus) = "+"
lexeme(::Semicolon) = ";"
lexeme(::Slash) = "/"
lexeme(::Star) = "*"
lexeme(::Bang) = "!"
lexeme(::BangEqual) = "!="
lexeme(::Equal) = "="
lexeme(::EqualEqual) = "=="
lexeme(::Greater) = ">"
lexeme(::GreaterEqual) = ">="
lexeme(::Less) = "<"
lexeme(::LessEqual) = "<="
lexeme(x::Identifier) = x.name
lexeme(x::StringLiteral) = x.value
lexeme(x::NumberLiteral) = x.value
lexeme(::And) = "and"
lexeme(::Class) = "class"
lexeme(::Else) = "else"
lexeme(::False) = "false"
lexeme(::Fun) = "fun"
lexeme(::For) = "for"
lexeme(::If) = "if"
lexeme(::Nil) = "nil"
lexeme(::Or) = "or"
lexeme(::Print) = "print"
lexeme(::Return) = "return"
lexeme(::Super) = "super"
lexeme(::This) = "this"
lexeme(::True) = "true"
lexeme(::Var) = "var"
lexeme(::While) = "while"
lexeme(::EOF) = "EOF"



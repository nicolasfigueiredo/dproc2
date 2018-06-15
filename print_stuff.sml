(*fun makeTest(input: string): MumlTokens.token list = Helpers.string_to_tokens(input);*)

fun makeTest(input: string): Ast.Exp = Helpers.string_to_ast(input);

val a = makeTest("int a; column b; 2+3; max(2, 5, 2, 5+2, \"sergio\");");
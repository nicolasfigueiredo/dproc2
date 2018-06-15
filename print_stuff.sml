(*fun makeTest(input: string): MumlTokens.token list = Helpers.string_to_tokens(input);*)

fun makeTest(input: string): Ast.Exp = Helpers.string_to_ast(input);

val a = makeTest("5;");
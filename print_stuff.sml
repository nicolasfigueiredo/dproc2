(*fun makeTest(input: string): MumlTokens.token list = Helpers.string_to_tokens(input);*)

fun makeTest(input: string): Ast.Exp = Helpers.string_to_ast(input);

val a = makeTest("int a; column b; int c; float d; a = 6; c = 12; b = [12, 3, 5]; a = max(b, 12);");
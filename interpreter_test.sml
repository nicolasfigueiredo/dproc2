(*fun makeTest(input: string): MumlTokens.token list = Helpers.string_to_tokens(input);*)



fun makeTest(input: string): Ast.Exp = Helpers.string_to_ast(input);

(*val a = makeTest("int a; column b; int c; float d; a = 6; c = 12; b = [12, 3, 5]; a = max(b);");*)
(*val a = makeTest("if true and false then a=5 else a=6;");*)

(*val a = makeTest(
	"table tab; column comp; column renda_mensal; column renda_mensal_pcpt; float renda_media; tab = load(\"data.csv\", \"Dados demográficos\"); renda_media = media(renda_mensal);");*)


val a = makeTest("int a;");


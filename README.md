#  Uso de Yacc y Lex
![](https://2.bp.blogspot.com/-tzQyWIBjg1E/Vva72o0VT1I/AAAAAAAABfs/-l8476gfcxk4Licz7Z_Pbm0UozxcY6M6Q/s1600/Compiladores%2Bde%2Bcodigo%2Bonline.png)

------------

# Integrantes:
## Sanchez Palafox Manuel
## Caballero Perdomo Axel Lennyn
## 

------------


## Introduccion
El mandato lex ayuda a escribir un programa de lenguaje C que puede recibir y convertir la entrada de corriente de caracteres en acciones de programa.

Para utilizar el mandato lex , debe proporcionar o escribir un archivo de especificación que contenga:

Expresiones regulares ampliadas
Patrones de caracteres que reconoce el analizador léxico generado.
Sentencias de acción
Fragmentos de programa de lenguaje C que definen cómo reacciona el analizador léxico generado a las expresiones regulares ampliadas que reconoce.
El mandato lex genera un programa de lenguaje C que puede analizar una corriente de entrada utilizando información en el archivo de especificación. A continuación, el mandato lex almacena el programa de salida en un archivo lex.yy.c . Si el programa de salida reconoce una estructura de entrada simple de una palabra, puede compilar el archivo de salida lex.yy.c con el mandato siguiente para generar un analizador léxico ejecutable:
```c
cc lex.yy.c -ll
```
Sin embargo, si el analizador léxico debe reconocer una sintaxis más compleja, puede crear un programa analizador para utilizarlo con el archivo de salida para garantizar un manejo adecuado de cualquier entrada.

Puede mover un archivo de salida lex.yy.c a otro sistema si tiene un compilador C que soporta las funciones de biblioteca lex .

El analizador léxico compilado realiza las funciones siguientes:
Lee una corriente de entrada de caracteres.
Copia la corriente de entrada en una corriente de salida.
Divide la corriente de entrada en series más pequeñas que coinciden con las expresiones regulares ampliadas en el archivo de especificación lex .
Ejecuta una acción para cada expresión regular ampliada que reconoce. Estas acciones son fragmentos de programa de lenguaje C en el archivo de especificación lex . Cada fragmento de acción puede llamar a acciones o subrutinas fuera de sí mismo.
El analizador léxico generado por el mandato lex utiliza un método de análisis denominado autómata de estado finito determinista. Este método proporciona un número limitado de condiciones en las que puede existir el analizador léxico, junto con las reglas que determinan el estado del analizador léxico.

El autómata permite al analizador léxico generado mirar hacia delante más de uno o dos caracteres en una corriente de entrada. Por ejemplo, supongamos que define dos reglas en el archivo de especificación lex : una busca la serieaby el otro busca la serieabcdefg. Si el analizador léxico recibe una serie de entrada deabcdefh, lee caracteres al final de la serie de entrada antes de determinar que no coincide con la serieabcdefg. A continuación, el analizador léxico vuelve a la regla que busca la serieab, decide que coincide con parte de la entrada y empieza a intentar encontrar otra coincidencia utilizando la entrada restante.

Yacc provee una herramienta general para analizar estructuralmente una entrada. El
usuario de Yacc prepara una especificación que incluye:
- Un conjunto de reglas que describen los elementos de la entrada
- Un código a ser invocado cuando una regla es reconocida
- Una o más rutinas para examinar la entrada

Luego Yacc convierte la especificación en una función en C que examina la entrada. Esta
función, un parser, trabaja mediante la invocación de un analizador léxico que extrae tokens de la
entrada. Los tokens son comparados con las reglas de construcción de la entrada, llamadas
reglas gramaticales. Cuando una de las reglas es reconocida, el código provisto por el usuario
para esa regla (una acción) es invocado. Las acciones son fragmentos de código C, que pueden
retornar valores y usar los valores retornados por otras acciones.
Tanto el analizador léxico como el sintáctico pueden ser escritos en cualquier lenguaje de
programación. A pesar de la habilidad de tales lenguajes de propósito general como C, Lex y
Yacc son más flexibles y mucho menos complejos de usar.
Lex genera el código C para un analizador léxico, y Yacc genera el código para un parser.
Tanto Lex como Yacc toman como entrada un archivo de especificaciones que es típicamente
más corto que un programa hecho a medida y más fácil de leer y entender. Por convención, la
extensión del archivo de las especificaciones para Lex es .l y para Yacc es .y. La salida de Lex
y Yacc es código fuente C. Lex crea una rutina llamada yylex en un archivo llamado lexyy.c.
Yacc crea una rutina llamada yyparse en un archivo llamado y_tab.c.
Estas rutinas son combinadas con código fuente C provisto por el usuario, que se ubica
típicamente en un archivo separado pero puede ser ubicado en el archivo de especificaciones de
Yacc. El código provisto por el usuario consiste de una rutina main que llama a yyparse, que en
su momento, llama a yylex. Todas estas rutinas deben ser compiladas, y en la mayoría de los
casos, las librerías Lex y Yacc deben ser cargadas en tiempo de compilación. Estas librerías
contienen un número de rutinas de soporte que son requeridas, si no son provistas por el usuario. 

El siguiente diagrama permite observar los pasos en el desarrollo de un compilador usando Lex y
Yacc:
![](https://github.com/ManuPalafox/LexYacc/blob/main/YaccLecImg.jpeg
)
## Desarrollo
#### Explicacion del codigo


## Conclusion

**Sanchez Palafox Manuel:** 

**Caballero Perdomo Axel Lennyn**


## Bibliografias
[Uso de Lex](https://www.ibm.com/docs/es/aix/7.3?topic=information-generating-lexical-analyzer-lex-command)
[Uso de Yacc](https://users.exa.unicen.edu.ar/catedras/compila1/index_archivos/Herramientas/Yacc.pdf)

/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     SELECT = 258,
     FROM = 259,
     WHERE = 260,
     SET = 261,
     UPDATE = 262,
     DELETE = 263,
     INSERT = 264,
     VALUES = 265,
     INTO = 266,
     COMMA = 267,
     SEMICOLON = 268,
     ATRIBUTE = 269,
     STRING = 270,
     NUMBER = 271,
     EQUAL = 272,
     OR = 273,
     AND = 274,
     LIKE = 275,
     GREATER_THEN = 276,
     LESS_THEN = 277,
     GREATER_THEN_EQUAL = 278,
     LESS_THEN_EQUAL = 279,
     NOTEQUAL = 280,
     P_LEFT = 281,
     P_RIGHT = 282
   };
#endif
/* Tokens.  */
#define SELECT 258
#define FROM 259
#define WHERE 260
#define SET 261
#define UPDATE 262
#define DELETE 263
#define INSERT 264
#define VALUES 265
#define INTO 266
#define COMMA 267
#define SEMICOLON 268
#define ATRIBUTE 269
#define STRING 270
#define NUMBER 271
#define EQUAL 272
#define OR 273
#define AND 274
#define LIKE 275
#define GREATER_THEN 276
#define LESS_THEN 277
#define GREATER_THEN_EQUAL 278
#define LESS_THEN_EQUAL 279
#define NOTEQUAL 280
#define P_LEFT 281
#define P_RIGHT 282




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;


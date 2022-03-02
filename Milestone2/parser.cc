// A Bison parser, made by GNU Bison 3.7.4.

// Skeleton implementation for Bison LALR(1) parsers in C++

// Copyright (C) 2002-2015, 2018-2020 Free Software Foundation, Inc.

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

// As a special exception, you may create a larger work that contains
// part or all of the Bison parser skeleton and distribute that work
// under terms of your choice, so long as that work isn't itself a
// parser generator using the skeleton or a modified version thereof
// as a parser skeleton.  Alternatively, if you modify or redistribute
// the parser skeleton itself, you may (at your option) remove this
// special exception, which will cause the skeleton and the resulting
// Bison output files to be licensed under the GNU General Public
// License without this special exception.

// This special exception was added by the Free Software Foundation in
// version 2.2 of Bison.

// DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
// especially those whose name start with YY_ or yy_.  They are
// private implementation details that can be changed or removed.





#include "parser.hh"


// Unqualified %code blocks.
#line 32 "parser.yy"

    #include <iostream>
    #include <fstream>
    #include "driver.hpp"

    /* Switch yylex from default version to the JMMC version, that is defined in JMMC::Lexer */
    #undef yylex
    #define yylex driver.getToken

#line 56 "parser.cc"


#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> // FIXME: INFRINGES ON USER NAME SPACE.
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif


// Whether we are compiled with exception support.
#ifndef YY_EXCEPTIONS
# if defined __GNUC__ && !defined __EXCEPTIONS
#  define YY_EXCEPTIONS 0
# else
#  define YY_EXCEPTIONS 1
# endif
#endif

#define YYRHSLOC(Rhs, K) ((Rhs)[K].location)
/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

# ifndef YYLLOC_DEFAULT
#  define YYLLOC_DEFAULT(Current, Rhs, N)                               \
    do                                                                  \
      if (N)                                                            \
        {                                                               \
          (Current).begin  = YYRHSLOC (Rhs, 1).begin;                   \
          (Current).end    = YYRHSLOC (Rhs, N).end;                     \
        }                                                               \
      else                                                              \
        {                                                               \
          (Current).begin = (Current).end = YYRHSLOC (Rhs, 0).end;      \
        }                                                               \
    while (false)
# endif


// Enable debugging if requested.
#if YYDEBUG

// A pseudo ostream that takes yydebug_ into account.
# define YYCDEBUG if (yydebug_) (*yycdebug_)

# define YY_SYMBOL_PRINT(Title, Symbol)         \
  do {                                          \
    if (yydebug_)                               \
    {                                           \
      *yycdebug_ << Title << ' ';               \
      yy_print_ (*yycdebug_, Symbol);           \
      *yycdebug_ << '\n';                       \
    }                                           \
  } while (false)

# define YY_REDUCE_PRINT(Rule)          \
  do {                                  \
    if (yydebug_)                       \
      yy_reduce_print_ (Rule);          \
  } while (false)

# define YY_STACK_PRINT()               \
  do {                                  \
    if (yydebug_)                       \
      yy_stack_print_ ();                \
  } while (false)

#else // !YYDEBUG

# define YYCDEBUG if (false) std::cerr
# define YY_SYMBOL_PRINT(Title, Symbol)  YYUSE (Symbol)
# define YY_REDUCE_PRINT(Rule)           static_cast<void> (0)
# define YY_STACK_PRINT()                static_cast<void> (0)

#endif // !YYDEBUG

#define yyerrok         (yyerrstatus_ = 0)
#define yyclearin       (yyla.clear ())

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYRECOVERING()  (!!yyerrstatus_)

#line 15 "parser.yy"
namespace JMMC {
#line 149 "parser.cc"

  /// Build a parser object.
  JMMParser::JMMParser (Driver &driver_yyarg)
#if YYDEBUG
    : yydebug_ (false),
      yycdebug_ (&std::cerr),
#else
    :
#endif
      driver (driver_yyarg)
  {}

  JMMParser::~JMMParser ()
  {}

  JMMParser::syntax_error::~syntax_error () YY_NOEXCEPT YY_NOTHROW
  {}

  /*---------------.
  | symbol kinds.  |
  `---------------*/

  // basic_symbol.
  template <typename Base>
  JMMParser::basic_symbol<Base>::basic_symbol (const basic_symbol& that)
    : Base (that)
    , value (that.value)
    , location (that.location)
  {}


  /// Constructor for valueless symbols.
  template <typename Base>
  JMMParser::basic_symbol<Base>::basic_symbol (typename Base::kind_type t, YY_MOVE_REF (location_type) l)
    : Base (t)
    , value ()
    , location (l)
  {}

  template <typename Base>
  JMMParser::basic_symbol<Base>::basic_symbol (typename Base::kind_type t, YY_RVREF (semantic_type) v, YY_RVREF (location_type) l)
    : Base (t)
    , value (YY_MOVE (v))
    , location (YY_MOVE (l))
  {}

  template <typename Base>
  JMMParser::symbol_kind_type
  JMMParser::basic_symbol<Base>::type_get () const YY_NOEXCEPT
  {
    return this->kind ();
  }

  template <typename Base>
  bool
  JMMParser::basic_symbol<Base>::empty () const YY_NOEXCEPT
  {
    return this->kind () == symbol_kind::S_YYEMPTY;
  }

  template <typename Base>
  void
  JMMParser::basic_symbol<Base>::move (basic_symbol& s)
  {
    super_type::move (s);
    value = YY_MOVE (s.value);
    location = YY_MOVE (s.location);
  }

  // by_kind.
  JMMParser::by_kind::by_kind ()
    : kind_ (symbol_kind::S_YYEMPTY)
  {}

#if 201103L <= YY_CPLUSPLUS
  JMMParser::by_kind::by_kind (by_kind&& that)
    : kind_ (that.kind_)
  {
    that.clear ();
  }
#endif

  JMMParser::by_kind::by_kind (const by_kind& that)
    : kind_ (that.kind_)
  {}

  JMMParser::by_kind::by_kind (token_kind_type t)
    : kind_ (yytranslate_ (t))
  {}

  void
  JMMParser::by_kind::clear ()
  {
    kind_ = symbol_kind::S_YYEMPTY;
  }

  void
  JMMParser::by_kind::move (by_kind& that)
  {
    kind_ = that.kind_;
    that.clear ();
  }

  JMMParser::symbol_kind_type
  JMMParser::by_kind::kind () const YY_NOEXCEPT
  {
    return kind_;
  }

  JMMParser::symbol_kind_type
  JMMParser::by_kind::type_get () const YY_NOEXCEPT
  {
    return this->kind ();
  }


  // by_state.
  JMMParser::by_state::by_state () YY_NOEXCEPT
    : state (empty_state)
  {}

  JMMParser::by_state::by_state (const by_state& that) YY_NOEXCEPT
    : state (that.state)
  {}

  void
  JMMParser::by_state::clear () YY_NOEXCEPT
  {
    state = empty_state;
  }

  void
  JMMParser::by_state::move (by_state& that)
  {
    state = that.state;
    that.clear ();
  }

  JMMParser::by_state::by_state (state_type s) YY_NOEXCEPT
    : state (s)
  {}

  JMMParser::symbol_kind_type
  JMMParser::by_state::kind () const YY_NOEXCEPT
  {
    if (state == empty_state)
      return symbol_kind::S_YYEMPTY;
    else
      return YY_CAST (symbol_kind_type, yystos_[+state]);
  }

  JMMParser::stack_symbol_type::stack_symbol_type ()
  {}

  JMMParser::stack_symbol_type::stack_symbol_type (YY_RVREF (stack_symbol_type) that)
    : super_type (YY_MOVE (that.state), YY_MOVE (that.value), YY_MOVE (that.location))
  {
#if 201103L <= YY_CPLUSPLUS
    // that is emptied.
    that.state = empty_state;
#endif
  }

  JMMParser::stack_symbol_type::stack_symbol_type (state_type s, YY_MOVE_REF (symbol_type) that)
    : super_type (s, YY_MOVE (that.value), YY_MOVE (that.location))
  {
    // that is emptied.
    that.kind_ = symbol_kind::S_YYEMPTY;
  }

#if YY_CPLUSPLUS < 201103L
  JMMParser::stack_symbol_type&
  JMMParser::stack_symbol_type::operator= (const stack_symbol_type& that)
  {
    state = that.state;
    value = that.value;
    location = that.location;
    return *this;
  }

  JMMParser::stack_symbol_type&
  JMMParser::stack_symbol_type::operator= (stack_symbol_type& that)
  {
    state = that.state;
    value = that.value;
    location = that.location;
    // that is emptied.
    that.state = empty_state;
    return *this;
  }
#endif

  template <typename Base>
  void
  JMMParser::yy_destroy_ (const char* yymsg, basic_symbol<Base>& yysym) const
  {
    if (yymsg)
      YY_SYMBOL_PRINT (yymsg, yysym);

    // User destructor.
    YYUSE (yysym.kind ());
  }

#if YYDEBUG
  template <typename Base>
  void
  JMMParser::yy_print_ (std::ostream& yyo, const basic_symbol<Base>& yysym) const
  {
    std::ostream& yyoutput = yyo;
    YYUSE (yyoutput);
    if (yysym.empty ())
      yyo << "empty symbol";
    else
      {
        symbol_kind_type yykind = yysym.kind ();
        yyo << (yykind < YYNTOKENS ? "token" : "nterm")
            << ' ' << yysym.name () << " ("
            << yysym.location << ": ";
        YYUSE (yykind);
        yyo << ')';
      }
  }
#endif

  void
  JMMParser::yypush_ (const char* m, YY_MOVE_REF (stack_symbol_type) sym)
  {
    if (m)
      YY_SYMBOL_PRINT (m, sym);
    yystack_.push (YY_MOVE (sym));
  }

  void
  JMMParser::yypush_ (const char* m, state_type s, YY_MOVE_REF (symbol_type) sym)
  {
#if 201103L <= YY_CPLUSPLUS
    yypush_ (m, stack_symbol_type (s, std::move (sym)));
#else
    stack_symbol_type ss (s, sym);
    yypush_ (m, ss);
#endif
  }

  void
  JMMParser::yypop_ (int n)
  {
    yystack_.pop (n);
  }

#if YYDEBUG
  std::ostream&
  JMMParser::debug_stream () const
  {
    return *yycdebug_;
  }

  void
  JMMParser::set_debug_stream (std::ostream& o)
  {
    yycdebug_ = &o;
  }


  JMMParser::debug_level_type
  JMMParser::debug_level () const
  {
    return yydebug_;
  }

  void
  JMMParser::set_debug_level (debug_level_type l)
  {
    yydebug_ = l;
  }
#endif // YYDEBUG

  JMMParser::state_type
  JMMParser::yy_lr_goto_state_ (state_type yystate, int yysym)
  {
    int yyr = yypgoto_[yysym - YYNTOKENS] + yystate;
    if (0 <= yyr && yyr <= yylast_ && yycheck_[yyr] == yystate)
      return yytable_[yyr];
    else
      return yydefgoto_[yysym - YYNTOKENS];
  }

  bool
  JMMParser::yy_pact_value_is_default_ (int yyvalue)
  {
    return yyvalue == yypact_ninf_;
  }

  bool
  JMMParser::yy_table_value_is_error_ (int yyvalue)
  {
    return yyvalue == yytable_ninf_;
  }

  int
  JMMParser::operator() ()
  {
    return parse ();
  }

  int
  JMMParser::parse ()
  {
    int yyn;
    /// Length of the RHS of the rule being reduced.
    int yylen = 0;

    // Error handling.
    int yynerrs_ = 0;
    int yyerrstatus_ = 0;

    /// The lookahead symbol.
    symbol_type yyla;

    /// The locations where the error started and ended.
    stack_symbol_type yyerror_range[3];

    /// The return value of parse ().
    int yyresult;

#if YY_EXCEPTIONS
    try
#endif // YY_EXCEPTIONS
      {
    YYCDEBUG << "Starting parse\n";


    /* Initialize the stack.  The initial state will be set in
       yynewstate, since the latter expects the semantical and the
       location values to have been already stored, initialize these
       stacks with a primary value.  */
    yystack_.clear ();
    yypush_ (YY_NULLPTR, 0, YY_MOVE (yyla));

  /*-----------------------------------------------.
  | yynewstate -- push a new symbol on the stack.  |
  `-----------------------------------------------*/
  yynewstate:
    YYCDEBUG << "Entering state " << int (yystack_[0].state) << '\n';
    YY_STACK_PRINT ();

    // Accept?
    if (yystack_[0].state == yyfinal_)
      YYACCEPT;

    goto yybackup;


  /*-----------.
  | yybackup.  |
  `-----------*/
  yybackup:
    // Try to take a decision without lookahead.
    yyn = yypact_[+yystack_[0].state];
    if (yy_pact_value_is_default_ (yyn))
      goto yydefault;

    // Read a lookahead token.
    if (yyla.empty ())
      {
        YYCDEBUG << "Reading a token\n";
#if YY_EXCEPTIONS
        try
#endif // YY_EXCEPTIONS
          {
            yyla.kind_ = yytranslate_ (yylex (&yyla.value, &yyla.location));
          }
#if YY_EXCEPTIONS
        catch (const syntax_error& yyexc)
          {
            YYCDEBUG << "Caught exception: " << yyexc.what() << '\n';
            error (yyexc);
            goto yyerrlab1;
          }
#endif // YY_EXCEPTIONS
      }
    YY_SYMBOL_PRINT ("Next token is", yyla);

    if (yyla.kind () == symbol_kind::S_YYerror)
    {
      // The scanner already issued an error message, process directly
      // to error recovery.  But do not keep the error token as
      // lookahead, it is too special and may lead us to an endless
      // loop in error recovery. */
      yyla.kind_ = symbol_kind::S_YYUNDEF;
      goto yyerrlab1;
    }

    /* If the proper action on seeing token YYLA.TYPE is to reduce or
       to detect an error, take that action.  */
    yyn += yyla.kind ();
    if (yyn < 0 || yylast_ < yyn || yycheck_[yyn] != yyla.kind ())
      {
        goto yydefault;
      }

    // Reduce or error.
    yyn = yytable_[yyn];
    if (yyn <= 0)
      {
        if (yy_table_value_is_error_ (yyn))
          goto yyerrlab;
        yyn = -yyn;
        goto yyreduce;
      }

    // Count tokens shifted since error; after three, turn off error status.
    if (yyerrstatus_)
      --yyerrstatus_;

    // Shift the lookahead token.
    yypush_ ("Shifting", state_type (yyn), YY_MOVE (yyla));
    goto yynewstate;


  /*-----------------------------------------------------------.
  | yydefault -- do the default action for the current state.  |
  `-----------------------------------------------------------*/
  yydefault:
    yyn = yydefact_[+yystack_[0].state];
    if (yyn == 0)
      goto yyerrlab;
    goto yyreduce;


  /*-----------------------------.
  | yyreduce -- do a reduction.  |
  `-----------------------------*/
  yyreduce:
    yylen = yyr2_[yyn];
    {
      stack_symbol_type yylhs;
      yylhs.state = yy_lr_goto_state_ (yystack_[yylen].state, yyr1_[yyn]);
      /* If YYLEN is nonzero, implement the default value of the
         action: '$$ = $1'.  Otherwise, use the top of the stack.

         Otherwise, the following line sets YYLHS.VALUE to garbage.
         This behavior is undocumented and Bison users should not rely
         upon it.  */
      if (yylen)
        yylhs.value = yystack_[yylen - 1].value;
      else
        yylhs.value = yystack_[0].value;

      // Default location.
      {
        stack_type::slice range (yystack_, yylen);
        YYLLOC_DEFAULT (yylhs.location, range, yylen);
        yyerror_range[1].location = yylhs.location;
      }

      // Perform the reduction.
      YY_REDUCE_PRINT (yyn);
#if YY_EXCEPTIONS
      try
#endif // YY_EXCEPTIONS
        {
          switch (yyn)
            {
  case 2: // start: %empty
#line 91 "parser.yy"
                                                    {   
                                                        string str = "program"; 
                                                        driver.tree = new ASTNode(str); 
                                                    }
#line 619 "parser.cc"
    break;

  case 3: // start: globaldeclarations
#line 95 "parser.yy"
                                                    {   
                                                        string str = "program"; 
                                                        driver.tree = new ASTNode(str);
                                                        for (auto node : (yystack_[0].value.nodes)->nodes)
                                                            driver.tree->children.push_back(node);
                                                    }
#line 630 "parser.cc"
    break;

  case 4: // literal: NUMBER
#line 103 "parser.yy"
                                                    { string type = "number"; (yylhs.value.node) = new ASTNode(type, *(yystack_[0].value.sval)); }
#line 636 "parser.cc"
    break;

  case 5: // literal: STRING
#line 104 "parser.yy"
                                                    { string type = "string"; (yylhs.value.node) = new ASTNode(type, *(yystack_[0].value.sval)); }
#line 642 "parser.cc"
    break;

  case 6: // literal: TRUE
#line 105 "parser.yy"
                                                    { string type = "true"; (yylhs.value.node) = new ASTNode(type, *(yystack_[0].value.sval)); }
#line 648 "parser.cc"
    break;

  case 7: // literal: FALSE
#line 106 "parser.yy"
                                                    { string type = "false"; (yylhs.value.node) = new ASTNode(type, *(yystack_[0].value.sval)); }
#line 654 "parser.cc"
    break;

  case 8: // type: BOOLEAN
#line 109 "parser.yy"
                                                    { string type = "boolean"; (yylhs.value.node) = new ASTNode(type, *(yystack_[0].value.sval)); }
#line 660 "parser.cc"
    break;

  case 9: // type: INT
#line 110 "parser.yy"
                                                    { string type = "int"; (yylhs.value.node) = new ASTNode(type, *(yystack_[0].value.sval)); }
#line 666 "parser.cc"
    break;

  case 10: // globaldeclarations: globaldeclaration
#line 113 "parser.yy"
                                                                        { 
                                                                            (yylhs.value.nodes) = new ASTNodeCollection();
                                                                            (yylhs.value.nodes)->AddNode(*(yystack_[0].value.node)); 
                                                                        }
#line 675 "parser.cc"
    break;

  case 11: // globaldeclarations: globaldeclarations globaldeclaration
#line 117 "parser.yy"
                                                                        { 
                                                                            (yystack_[1].value.nodes)->AddNode(*(yystack_[0].value.node));
                                                                            (yylhs.value.nodes) = (yystack_[1].value.nodes);
                                                                        }
#line 684 "parser.cc"
    break;

  case 12: // globaldeclaration: variabledeclaration
#line 123 "parser.yy"
                                                            {
                                                                if ((yystack_[0].value.node)->GetType() == "varDecl")
                                                                {
                                                                    (yystack_[0].value.node)->SetType("globVarDecl");
                                                                    (yylhs.value.node) = (yystack_[0].value.node);
                                                                }                    
                                                            }
#line 696 "parser.cc"
    break;

  case 13: // globaldeclaration: functiondeclaration
#line 130 "parser.yy"
                                                            { 
                                                                if ((yystack_[0].value.node)->GetType() == "funcDecl")
                                                                {
                                                                    (yylhs.value.node) = (yystack_[0].value.node);
                                                                }
                                                            }
#line 707 "parser.cc"
    break;

  case 14: // globaldeclaration: mainfunctiondeclaration
#line 136 "parser.yy"
                                                            { 
                                                                if ((yystack_[0].value.node)->GetType() == "mainDecl")
                                                                {
                                                                    (yylhs.value.node) = (yystack_[0].value.node);
                                                                }
                                                            }
#line 718 "parser.cc"
    break;

  case 15: // variabledeclaration: type identifier ";"
#line 144 "parser.yy"
                                                        {
                                                            string type = "varDecl";
                                                            (yylhs.value.node) = new ASTNode(type);
                                                            (yylhs.value.node)->children.push_back(*(yystack_[2].value.node));
                                                            (yylhs.value.node)->children.push_back(*(yystack_[1].value.node));
                                                        }
#line 729 "parser.cc"
    break;

  case 16: // identifier: ID
#line 152 "parser.yy"
                                                        {
                                                            std::string type = "id";
                                                            (yylhs.value.node) = new ASTNode(type, *(yystack_[0].value.sval));
                                                        }
#line 738 "parser.cc"
    break;

  case 17: // functiondeclaration: functionheader block
#line 158 "parser.yy"
                                                                        { 
                                                                            (yylhs.value.node) = new ASTNode("funcDecl");
                                                                    
                                                                            for (auto node : (yystack_[1].value.nodes)->nodes)
                                                                                (yylhs.value.node)->children.push_back(node);

                                                                            (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                        }
#line 751 "parser.cc"
    break;

  case 18: // functionheader: type functiondeclarator
#line 167 "parser.yy"
                                                                        {
                                                                            (yylhs.value.nodes) = new ASTNodeCollection();
                                                                            (yylhs.value.nodes)->AddNode(*(yystack_[1].value.node));
                                                                            for (auto node : (yystack_[0].value.nodes)->nodes)
                                                                                (yylhs.value.nodes)->AddNode(node);
                                                                        }
#line 762 "parser.cc"
    break;

  case 19: // functionheader: VOID functiondeclarator
#line 173 "parser.yy"
                                                                        {   
                                                                            (yylhs.value.nodes) = new ASTNodeCollection();
                                                                            auto x = new ASTNode("void", *(yystack_[1].value.sval));
                                                                            (yylhs.value.nodes)->AddNode(*x);
                                                                            for (auto node : (yystack_[0].value.nodes)->nodes)
                                                                                (yylhs.value.nodes)->AddNode(node);
                                                                        }
#line 774 "parser.cc"
    break;

  case 20: // functiondeclarator: identifier "(" formalparameterlist ")"
#line 182 "parser.yy"
                                                                        {
                                                                            (yylhs.value.nodes) = new ASTNodeCollection();
                                                                            (yylhs.value.nodes)->AddNode(*(yystack_[3].value.node));

                                                                            auto x = new ASTNode("formals");
                                                                            for (auto node : (yystack_[1].value.nodes)->nodes)
                                                                                x->children.push_back(node);

                                                                            (yylhs.value.nodes)->AddNode(*x);
                                                                        }
#line 789 "parser.cc"
    break;

  case 21: // functiondeclarator: identifier "(" ")"
#line 192 "parser.yy"
                                                                        { 
                                                                            (yylhs.value.nodes) = new ASTNodeCollection();
                                                                            (yylhs.value.nodes)->AddNode(*(yystack_[2].value.node));
                                                                            auto x = new ASTNode("formals");
                                                                            (yylhs.value.nodes)->AddNode(*x);

                                                                            
                                                                        }
#line 802 "parser.cc"
    break;

  case 22: // formalparameterlist: formalparameter
#line 203 "parser.yy"
                                                                        {
                                                                            (yylhs.value.nodes) = new ASTNodeCollection();
                                                                            (yylhs.value.nodes)->AddNode(*(yystack_[0].value.node));
                                                                        }
#line 811 "parser.cc"
    break;

  case 23: // formalparameterlist: formalparameterlist "," formalparameter
#line 207 "parser.yy"
                                                                        { 
                                                                            (yylhs.value.nodes) = (yystack_[2].value.nodes);
                                                                            (yylhs.value.nodes)->AddNode(*(yystack_[0].value.node));
                                                                        }
#line 820 "parser.cc"
    break;

  case 24: // formalparameter: type identifier
#line 213 "parser.yy"
                                                                        {
                                                                            (yylhs.value.node) = new ASTNode("formal");
                                                                            (yylhs.value.node)->children.push_back(*(yystack_[1].value.node));
                                                                            (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                        }
#line 830 "parser.cc"
    break;

  case 25: // mainfunctiondeclaration: mainfunctiondeclarator block
#line 220 "parser.yy"
                                                                {   
                                                                    (yylhs.value.node) = new ASTNode("mainDecl");

                                                                    string str1 = "void"; auto x = new ASTNode(str1);
                                                                    (yylhs.value.node)->children.push_back(*x);

                                                                    for (auto node : (yystack_[1].value.nodes)->nodes)
                                                                        (yylhs.value.node)->children.push_back(node);

                                                                    string str2 = "formals"; auto y = new ASTNode(str2);
                                                                    (yylhs.value.node)->children.push_back(*y);

                                                                    (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                }
#line 849 "parser.cc"
    break;

  case 26: // mainfunctiondeclarator: identifier "(" ")"
#line 236 "parser.yy"
                                                                                {
                                                                                    (yylhs.value.nodes) = new ASTNodeCollection();
                                                                                    (yylhs.value.nodes)->AddNode(*(yystack_[2].value.node));
                                                                                }
#line 858 "parser.cc"
    break;

  case 27: // block: "{" blockstatements "}"
#line 242 "parser.yy"
                                                                                {
                                                                                    string type = "block";
                                                                                    (yylhs.value.node) = new ASTNode(type);

                                                                                    for (auto node : (yystack_[1].value.nodes)->nodes)
                                                                                        (yylhs.value.node)->children.push_back(node);
                                                                                }
#line 870 "parser.cc"
    break;

  case 28: // block: "{" "}"
#line 249 "parser.yy"
                                                                                { string type = "block"; (yylhs.value.node) = new ASTNode(type);}
#line 876 "parser.cc"
    break;

  case 29: // blockstatements: blockstatement
#line 252 "parser.yy"
                                                                                {
                                                                                    (yylhs.value.nodes) = (yystack_[0].value.nodes);
                                                                                }
#line 884 "parser.cc"
    break;

  case 30: // blockstatements: blockstatements blockstatement
#line 255 "parser.yy"
                                                                                {
                                                                                    (yylhs.value.nodes) = (yystack_[1].value.nodes);
                                                                                    for (auto node : (yystack_[0].value.nodes)->nodes)
                                                                                        (yylhs.value.nodes)->AddNode(node);
                                                                                }
#line 894 "parser.cc"
    break;

  case 31: // blockstatement: variabledeclaration
#line 262 "parser.yy"
                                                                                {
                                                                                    (yylhs.value.nodes) = new ASTNodeCollection();
                                                                                    (yylhs.value.nodes)->AddNode(*(yystack_[0].value.node));
                                                                                }
#line 903 "parser.cc"
    break;

  case 32: // blockstatement: statement
#line 266 "parser.yy"
                                                                                {
                                                                                    (yylhs.value.nodes) = new ASTNodeCollection();
                                                                                    (yylhs.value.nodes)->AddNode(*(yystack_[0].value.node));
                                                                                }
#line 912 "parser.cc"
    break;

  case 33: // statement: block
#line 272 "parser.yy"
                                                                                {
                                                                                    (yylhs.value.node) = (yystack_[0].value.node);
                                                                                }
#line 920 "parser.cc"
    break;

  case 34: // statement: ";"
#line 275 "parser.yy"
                                                                                {
                                                                                    string type =  "nullStmt"; (yylhs.value.node) = new ASTNode(type);
                                                                                }
#line 928 "parser.cc"
    break;

  case 35: // statement: statementexpression ";"
#line 278 "parser.yy"
                                                                                {
                                                                                    (yylhs.value.node) = (yystack_[1].value.node);
                                                                                }
#line 936 "parser.cc"
    break;

  case 36: // statement: BREAK ";"
#line 281 "parser.yy"
                                                                                {
                                                                                    string type =  "break"; (yylhs.value.node) = new ASTNode(type);
                                                                                }
#line 944 "parser.cc"
    break;

  case 37: // statement: RETURN expression ";"
#line 284 "parser.yy"
                                                                                {
                                                                                    string type =  "return"; (yylhs.value.node) = new ASTNode(type);
                                                                                    (yylhs.value.node)->children.push_back(*(yystack_[1].value.node));
                                                                                }
#line 953 "parser.cc"
    break;

  case 38: // statement: RETURN ";"
#line 288 "parser.yy"
                                                                                {
                                                                                    string type =  "return"; (yylhs.value.node) = new ASTNode(type);
                                                                                }
#line 961 "parser.cc"
    break;

  case 39: // statement: IF "(" expression ")" statement
#line 291 "parser.yy"
                                                                                { 
                                                                                    string type = "if"; (yylhs.value.node) = new ASTNode(type);
                                                                                    (yylhs.value.node)->children.push_back(*(yystack_[2].value.node));
                                                                                    (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                }
#line 971 "parser.cc"
    break;

  case 40: // statement: IF "(" expression ")" statement ELSE statement
#line 296 "parser.yy"
                                                                                { 
                                                                                    string type = "ifElse"; (yylhs.value.node) = new ASTNode(type); 
                                                                                    (yylhs.value.node)->children.push_back(*(yystack_[4].value.node));
                                                                                    (yylhs.value.node)->children.push_back(*(yystack_[2].value.node));
                                                                                    (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                }
#line 982 "parser.cc"
    break;

  case 41: // statement: WHILE "(" expression ")" statement
#line 302 "parser.yy"
                                                                                {
                                                                                    string type="while"; (yylhs.value.node) = new ASTNode(type);
                                                                                    (yylhs.value.node)->children.push_back(*(yystack_[2].value.node));
                                                                                    (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                }
#line 992 "parser.cc"
    break;

  case 42: // statementexpression: assignment
#line 309 "parser.yy"
                                                                                {
                                                                                    string type = "stmtExpr"; (yylhs.value.node) = new ASTNode(type);
                                                                                    (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                }
#line 1001 "parser.cc"
    break;

  case 43: // statementexpression: functioninvocation
#line 313 "parser.yy"
                                                                                {   
                                                                                    string type = "stmtExpr"; (yylhs.value.node) = new ASTNode(type);
                                                                                    (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                }
#line 1010 "parser.cc"
    break;

  case 44: // primary: literal
#line 319 "parser.yy"
                                                                                    { (yylhs.value.node) = (yystack_[0].value.node); }
#line 1016 "parser.cc"
    break;

  case 45: // primary: "(" expression ")"
#line 320 "parser.yy"
                                                                                    { (yylhs.value.node) = (yystack_[1].value.node); }
#line 1022 "parser.cc"
    break;

  case 46: // primary: functioninvocation
#line 321 "parser.yy"
                                                                                    { (yylhs.value.node) = (yystack_[0].value.node); }
#line 1028 "parser.cc"
    break;

  case 47: // argumentlist: expression
#line 324 "parser.yy"
                                                                                    { 
                                                                                        (yylhs.value.nodes) = new ASTNodeCollection();
                                                                                        (yylhs.value.nodes)->AddNode(*(yystack_[0].value.node)); 
                                                                                    }
#line 1037 "parser.cc"
    break;

  case 48: // argumentlist: argumentlist "," expression
#line 328 "parser.yy"
                                                                                    {
                                                                                        (yylhs.value.nodes) = (yystack_[2].value.nodes);
                                                                                        (yylhs.value.nodes)->AddNode(*(yystack_[0].value.node));
                                                                                    }
#line 1046 "parser.cc"
    break;

  case 49: // functioninvocation: identifier "(" argumentlist ")"
#line 334 "parser.yy"
                                                                                    { 
                                                                                        string type = "funcCall"; (yylhs.value.node) = new ASTNode(type);
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[3].value.node));

                                                                                        string str1 = "actuals"; auto x = new ASTNode(str1);
                                                                                        for (auto node : (yystack_[1].value.nodes)->nodes)
                                                                                            x->children.push_back(node);
                                                                                        (yylhs.value.node)->children.push_back(*x);

                                                                                    }
#line 1061 "parser.cc"
    break;

  case 50: // functioninvocation: identifier "(" ")"
#line 344 "parser.yy"
                                                                                    {
                                                                                        string type = "funcCall"; (yylhs.value.node) = new ASTNode(type);
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[2].value.node));

                                                                                        string str1 = "actuals"; auto x = new ASTNode(str1);
                                                                                        (yylhs.value.node)->children.push_back(*x);

                                                                                    }
#line 1074 "parser.cc"
    break;

  case 51: // postfixexpression: primary
#line 354 "parser.yy"
                                                                                    { (yylhs.value.node) = (yystack_[0].value.node); }
#line 1080 "parser.cc"
    break;

  case 52: // postfixexpression: identifier
#line 355 "parser.yy"
                                                                                    { (yylhs.value.node) = (yystack_[0].value.node); }
#line 1086 "parser.cc"
    break;

  case 53: // unaryexpression: "-" unaryexpression
#line 358 "parser.yy"
                                                                                    { 
                                                                                        string str = "-";
                                                                                        if ((yystack_[0].value.node)->type == "number") {
                                                                                            str.append((yystack_[0].value.node)->attr);
                                                                                            (yylhs.value.node) = new ASTNode((yystack_[0].value.node)->type, str);
                                                                                        } else {
                                                                                            (yylhs.value.node) = new ASTNode(str);
                                                                                            (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                        }
                                                                                        
                                                                                    }
#line 1102 "parser.cc"
    break;

  case 54: // unaryexpression: "!" unaryexpression
#line 369 "parser.yy"
                                                                                    { 
                                                                                        string type = "!"; (yylhs.value.node) = new ASTNode(type);
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                    }
#line 1111 "parser.cc"
    break;

  case 55: // unaryexpression: postfixexpression
#line 373 "parser.yy"
                                                                                    { (yylhs.value.node) = (yystack_[0].value.node); }
#line 1117 "parser.cc"
    break;

  case 56: // multiplicativeexpression: unaryexpression
#line 376 "parser.yy"
                                                                                    { (yylhs.value.node) = (yystack_[0].value.node); }
#line 1123 "parser.cc"
    break;

  case 57: // multiplicativeexpression: multiplicativeexpression "*" unaryexpression
#line 377 "parser.yy"
                                                                                    { 
                                                                                        string type = "*"; (yylhs.value.node) = new ASTNode(type);
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[2].value.node));
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                    }
#line 1133 "parser.cc"
    break;

  case 58: // multiplicativeexpression: multiplicativeexpression "/" unaryexpression
#line 382 "parser.yy"
                                                                                    { 
                                                                                        string type = "/"; (yylhs.value.node) = new ASTNode(type);
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[2].value.node));
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                    }
#line 1143 "parser.cc"
    break;

  case 59: // multiplicativeexpression: multiplicativeexpression "%" unaryexpression
#line 387 "parser.yy"
                                                                                    { 
                                                                                        string type = "%"; (yylhs.value.node) = new ASTNode(type);
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[2].value.node));
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                    }
#line 1153 "parser.cc"
    break;

  case 60: // additiveexpression: multiplicativeexpression
#line 394 "parser.yy"
                                                                                    { (yylhs.value.node) = (yystack_[0].value.node); }
#line 1159 "parser.cc"
    break;

  case 61: // additiveexpression: additiveexpression "+" multiplicativeexpression
#line 395 "parser.yy"
                                                                                    { 
                                                                                        string type = "+"; (yylhs.value.node) = new ASTNode(type);
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[2].value.node));
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                    }
#line 1169 "parser.cc"
    break;

  case 62: // additiveexpression: additiveexpression "-" multiplicativeexpression
#line 400 "parser.yy"
                                                                                    { 
                                                                                        string type = "-"; (yylhs.value.node) = new ASTNode(type);
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[2].value.node));
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                    }
#line 1179 "parser.cc"
    break;

  case 63: // relationalexpression: additiveexpression
#line 407 "parser.yy"
                                                                                    { (yylhs.value.node) = (yystack_[0].value.node); }
#line 1185 "parser.cc"
    break;

  case 64: // relationalexpression: relationalexpression "<" additiveexpression
#line 408 "parser.yy"
                                                                                    {   
                                                                                        string type = "<"; (yylhs.value.node) = new ASTNode(type);
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[2].value.node));
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                    }
#line 1195 "parser.cc"
    break;

  case 65: // relationalexpression: relationalexpression ">" additiveexpression
#line 413 "parser.yy"
                                                                                    { 
                                                                                        string type = ">"; (yylhs.value.node) = new ASTNode(type);
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[2].value.node));
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                    }
#line 1205 "parser.cc"
    break;

  case 66: // relationalexpression: relationalexpression "<=" additiveexpression
#line 418 "parser.yy"
                                                                                    { 
                                                                                        string type = "<="; (yylhs.value.node) = new ASTNode(type);
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[2].value.node));
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                    }
#line 1215 "parser.cc"
    break;

  case 67: // relationalexpression: relationalexpression ">=" additiveexpression
#line 423 "parser.yy"
                                                                                    { 
                                                                                        string type = ">="; (yylhs.value.node) = new ASTNode(type);
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[2].value.node));
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                    }
#line 1225 "parser.cc"
    break;

  case 68: // equalityexpression: relationalexpression
#line 430 "parser.yy"
                                                                                    { (yylhs.value.node) = (yystack_[0].value.node); }
#line 1231 "parser.cc"
    break;

  case 69: // equalityexpression: equalityexpression "==" relationalexpression
#line 431 "parser.yy"
                                                                                    { 
                                                                                        string type = "=="; (yylhs.value.node) = new ASTNode(type);
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[2].value.node));
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                    }
#line 1241 "parser.cc"
    break;

  case 70: // equalityexpression: equalityexpression "!=" relationalexpression
#line 436 "parser.yy"
                                                                                    { 
                                                                                        string type = "!="; (yylhs.value.node) = new ASTNode(type);
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[2].value.node));
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                    }
#line 1251 "parser.cc"
    break;

  case 71: // conditionalandexpression: equalityexpression
#line 443 "parser.yy"
                                                                                    { (yylhs.value.node) = (yystack_[0].value.node); }
#line 1257 "parser.cc"
    break;

  case 72: // conditionalandexpression: conditionalandexpression "&&" equalityexpression
#line 444 "parser.yy"
                                                                                    { 
                                                                                        string type = "&&"; (yylhs.value.node) = new ASTNode(type);
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[2].value.node));
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                    }
#line 1267 "parser.cc"
    break;

  case 73: // conditionalorexpression: conditionalandexpression
#line 451 "parser.yy"
                                                                                    { (yylhs.value.node) = (yystack_[0].value.node); }
#line 1273 "parser.cc"
    break;

  case 74: // conditionalorexpression: conditionalorexpression "||" conditionalorexpression
#line 452 "parser.yy"
                                                                                    { 
                                                                                        string type = "||"; (yylhs.value.node) = new ASTNode(type);
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[2].value.node));
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                    }
#line 1283 "parser.cc"
    break;

  case 75: // assignmentexpression: conditionalorexpression
#line 459 "parser.yy"
                                                                                    { (yylhs.value.node) = (yystack_[0].value.node); }
#line 1289 "parser.cc"
    break;

  case 76: // assignmentexpression: assignment
#line 460 "parser.yy"
                                                                                    { (yylhs.value.node) = (yystack_[0].value.node); }
#line 1295 "parser.cc"
    break;

  case 77: // assignment: identifier "=" assignmentexpression
#line 463 "parser.yy"
                                                                                    {
                                                                                        string type = "="; (yylhs.value.node) = new ASTNode(type);
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[2].value.node));
                                                                                        (yylhs.value.node)->children.push_back(*(yystack_[0].value.node));
                                                                                    }
#line 1305 "parser.cc"
    break;

  case 78: // expression: assignmentexpression
#line 470 "parser.yy"
                                                                                    { (yylhs.value.node) = (yystack_[0].value.node); }
#line 1311 "parser.cc"
    break;


#line 1315 "parser.cc"

            default:
              break;
            }
        }
#if YY_EXCEPTIONS
      catch (const syntax_error& yyexc)
        {
          YYCDEBUG << "Caught exception: " << yyexc.what() << '\n';
          error (yyexc);
          YYERROR;
        }
#endif // YY_EXCEPTIONS
      YY_SYMBOL_PRINT ("-> $$ =", yylhs);
      yypop_ (yylen);
      yylen = 0;

      // Shift the result of the reduction.
      yypush_ (YY_NULLPTR, YY_MOVE (yylhs));
    }
    goto yynewstate;


  /*--------------------------------------.
  | yyerrlab -- here on detecting error.  |
  `--------------------------------------*/
  yyerrlab:
    // If not already recovering from an error, report this error.
    if (!yyerrstatus_)
      {
        ++yynerrs_;
        std::string msg = YY_("syntax error");
        error (yyla.location, YY_MOVE (msg));
      }


    yyerror_range[1].location = yyla.location;
    if (yyerrstatus_ == 3)
      {
        /* If just tried and failed to reuse lookahead token after an
           error, discard it.  */

        // Return failure if at end of input.
        if (yyla.kind () == symbol_kind::S_YYEOF)
          YYABORT;
        else if (!yyla.empty ())
          {
            yy_destroy_ ("Error: discarding", yyla);
            yyla.clear ();
          }
      }

    // Else will try to reuse lookahead token after shifting the error token.
    goto yyerrlab1;


  /*---------------------------------------------------.
  | yyerrorlab -- error raised explicitly by YYERROR.  |
  `---------------------------------------------------*/
  yyerrorlab:
    /* Pacify compilers when the user code never invokes YYERROR and
       the label yyerrorlab therefore never appears in user code.  */
    if (false)
      YYERROR;

    /* Do not reclaim the symbols of the rule whose action triggered
       this YYERROR.  */
    yypop_ (yylen);
    yylen = 0;
    YY_STACK_PRINT ();
    goto yyerrlab1;


  /*-------------------------------------------------------------.
  | yyerrlab1 -- common code for both syntax error and YYERROR.  |
  `-------------------------------------------------------------*/
  yyerrlab1:
    yyerrstatus_ = 3;   // Each real token shifted decrements this.
    // Pop stack until we find a state that shifts the error token.
    for (;;)
      {
        yyn = yypact_[+yystack_[0].state];
        if (!yy_pact_value_is_default_ (yyn))
          {
            yyn += symbol_kind::S_YYerror;
            if (0 <= yyn && yyn <= yylast_
                && yycheck_[yyn] == symbol_kind::S_YYerror)
              {
                yyn = yytable_[yyn];
                if (0 < yyn)
                  break;
              }
          }

        // Pop the current state because it cannot handle the error token.
        if (yystack_.size () == 1)
          YYABORT;

        yyerror_range[1].location = yystack_[0].location;
        yy_destroy_ ("Error: popping", yystack_[0]);
        yypop_ ();
        YY_STACK_PRINT ();
      }
    {
      stack_symbol_type error_token;

      yyerror_range[2].location = yyla.location;
      YYLLOC_DEFAULT (error_token.location, yyerror_range, 2);

      // Shift the error token.
      error_token.state = state_type (yyn);
      yypush_ ("Shifting", YY_MOVE (error_token));
    }
    goto yynewstate;


  /*-------------------------------------.
  | yyacceptlab -- YYACCEPT comes here.  |
  `-------------------------------------*/
  yyacceptlab:
    yyresult = 0;
    goto yyreturn;


  /*-----------------------------------.
  | yyabortlab -- YYABORT comes here.  |
  `-----------------------------------*/
  yyabortlab:
    yyresult = 1;
    goto yyreturn;


  /*-----------------------------------------------------.
  | yyreturn -- parsing is finished, return the result.  |
  `-----------------------------------------------------*/
  yyreturn:
    if (!yyla.empty ())
      yy_destroy_ ("Cleanup: discarding lookahead", yyla);

    /* Do not reclaim the symbols of the rule whose action triggered
       this YYABORT or YYACCEPT.  */
    yypop_ (yylen);
    YY_STACK_PRINT ();
    while (1 < yystack_.size ())
      {
        yy_destroy_ ("Cleanup: popping", yystack_[0]);
        yypop_ ();
      }

    return yyresult;
  }
#if YY_EXCEPTIONS
    catch (...)
      {
        YYCDEBUG << "Exception caught: cleaning lookahead and stack\n";
        // Do not try to display the values of the reclaimed symbols,
        // as their printers might throw an exception.
        if (!yyla.empty ())
          yy_destroy_ (YY_NULLPTR, yyla);

        while (1 < yystack_.size ())
          {
            yy_destroy_ (YY_NULLPTR, yystack_[0]);
            yypop_ ();
          }
        throw;
      }
#endif // YY_EXCEPTIONS
  }

  void
  JMMParser::error (const syntax_error& yyexc)
  {
    error (yyexc.location, yyexc.what ());
  }

#if YYDEBUG || 0
  const char *
  JMMParser::symbol_name (symbol_kind_type yysymbol)
  {
    return yytname_[yysymbol];
  }
#endif // #if YYDEBUG || 0





  const signed char JMMParser::yypact_ninf_ = -91;

  const signed char JMMParser::yytable_ninf_ = -1;

  const short
  JMMParser::yypact_[] =
  {
      66,   -91,   -91,    22,   -91,    28,    22,    66,   -91,   -91,
       2,   -91,    23,   -91,    23,    27,   -91,   -91,    -8,   -91,
     -91,    21,    99,   -91,   -91,     9,   -91,   -91,    46,    58,
      30,    51,   -91,   -91,    22,   -91,     1,   -91,   113,   -91,
     -91,    61,   -91,   -91,   -91,    22,    31,   -91,    89,    89,
     -91,   -91,   -91,   -91,   -91,    89,    89,    89,   -91,   -91,
       1,   -91,   -91,   -91,   -91,    65,    19,    79,    20,    87,
     112,   -91,   -91,   108,   110,    89,   127,   -91,   -91,   -91,
     -91,   -91,    75,   117,   118,   120,   -91,   -91,   121,    89,
      89,    89,    89,    89,    89,    89,    89,    89,    89,    89,
      89,    89,   -91,   -91,   -91,    34,   -91,   -91,    29,    29,
     -91,   -91,   -91,   -91,    65,    65,    19,    19,    19,    19,
      79,    79,    20,   112,   -91,    89,   140,   -91,   -91,    29,
     -91
  };

  const signed char
  JMMParser::yydefact_[] =
  {
       2,     8,     9,     0,    16,     0,     0,     3,    10,    12,
       0,    13,     0,    14,     0,     0,    19,     1,     0,    18,
      11,     0,     0,    17,    25,     0,    15,    26,     0,     0,
       0,     0,    28,    34,     0,    31,     0,    33,     0,    29,
      32,     0,    43,    42,    21,     0,     0,    22,     0,     0,
      36,     6,     7,     4,     5,     0,     0,     0,    38,    44,
      52,    51,    46,    55,    56,    60,    63,    68,    71,    73,
      75,    78,    76,     0,     0,     0,     0,    27,    30,    35,
      24,    20,     0,     0,     0,    52,    53,    54,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    37,    77,    50,     0,    47,    23,     0,     0,
      45,    57,    58,    59,    61,    62,    64,    65,    66,    67,
      69,    70,    72,    74,    49,     0,    39,    41,    48,     0,
      40
  };

  const short
  JMMParser::yypgoto_[] =
  {
     -91,   -91,   -91,   -13,   -91,   147,   -17,     0,   -91,   -91,
     150,   -91,    78,   -91,   -91,    -1,   -91,   119,   -90,   -91,
     -91,   -91,   -18,   -91,   -39,    -5,    44,    24,    62,   -91,
      60,    88,   -14,   -47
  };

  const signed char
  JMMParser::yydefgoto_[] =
  {
      -1,     5,    59,     6,     7,     8,     9,    85,    11,    12,
      16,    46,    47,    13,    14,    37,    38,    39,    40,    41,
      61,   105,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73
  };

  const unsigned char
  JMMParser::yytable_[] =
  {
      10,    83,    84,    15,    42,    35,    18,    10,    43,    34,
      88,    23,    45,    24,     1,     2,    86,    87,   126,   127,
      42,    35,    36,    25,    43,    34,    75,    26,    17,   106,
       4,    60,    76,    21,    74,    92,    93,     4,    36,   130,
      28,    44,    29,    30,    31,    80,    98,    99,    60,    60,
     111,   112,   113,    27,    51,    52,    22,    60,    25,     4,
      53,    54,    22,    81,    33,    50,   124,    82,    55,    45,
     125,     1,     2,     3,     4,    60,    60,    48,   128,    56,
       1,     2,    57,    89,    90,    91,    58,   114,   115,    49,
      42,    42,    51,    52,    43,    43,    79,     4,    53,    54,
      94,    95,    96,    97,     1,     2,    55,     4,    36,    36,
      28,    42,    29,    30,    31,    43,   100,    56,     1,     2,
      57,     4,   120,   121,    28,    60,    29,    30,    31,    36,
      51,    52,    22,    32,    33,     4,    53,    54,   116,   117,
     118,   119,   101,   102,    55,    26,    22,    77,    33,   108,
     109,    76,   129,   110,    20,    56,    19,    78,    57,   104,
     107,   123,   122,   103
  };

  const unsigned char
  JMMParser::yycheck_[] =
  {
       0,    48,    49,     3,    22,    22,     6,     7,    22,    22,
      57,    12,    25,    14,     5,     6,    55,    56,   108,   109,
      38,    38,    22,    31,    38,    38,    25,    35,     0,    76,
       8,    31,    31,    31,    34,    16,    17,     8,    38,   129,
      11,    32,    13,    14,    15,    45,    26,    27,    48,    49,
      89,    90,    91,    32,     3,     4,    33,    57,    31,     8,
       9,    10,    33,    32,    35,    35,    32,    36,    17,    82,
      36,     5,     6,     7,     8,    75,    76,    31,   125,    28,
       5,     6,    31,    18,    19,    20,    35,    92,    93,    31,
     108,   109,     3,     4,   108,   109,    35,     8,     9,    10,
      21,    22,    23,    24,     5,     6,    17,     8,   108,   109,
      11,   129,    13,    14,    15,   129,    29,    28,     5,     6,
      31,     8,    98,    99,    11,   125,    13,    14,    15,   129,
       3,     4,    33,    34,    35,     8,     9,    10,    94,    95,
      96,    97,    30,    35,    17,    35,    33,    34,    35,    32,
      32,    31,    12,    32,     7,    28,     6,    38,    31,    32,
      82,   101,   100,    75
  };

  const signed char
  JMMParser::yystos_[] =
  {
       0,     5,     6,     7,     8,    38,    40,    41,    42,    43,
      44,    45,    46,    50,    51,    44,    47,     0,    44,    47,
      42,    31,    33,    52,    52,    31,    35,    32,    11,    13,
      14,    15,    34,    35,    40,    43,    44,    52,    53,    54,
      55,    56,    59,    69,    32,    40,    48,    49,    31,    31,
      35,     3,     4,     9,    10,    17,    28,    31,    35,    39,
      44,    57,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    44,    25,    31,    34,    54,    35,
      44,    32,    36,    70,    70,    44,    61,    61,    70,    18,
      19,    20,    16,    17,    21,    22,    23,    24,    26,    27,
      29,    30,    35,    68,    32,    58,    70,    49,    32,    32,
      32,    61,    61,    61,    62,    62,    63,    63,    63,    63,
      64,    64,    65,    67,    32,    36,    55,    55,    70,    12,
      55
  };

  const signed char
  JMMParser::yyr1_[] =
  {
       0,    37,    38,    38,    39,    39,    39,    39,    40,    40,
      41,    41,    42,    42,    42,    43,    44,    45,    46,    46,
      47,    47,    48,    48,    49,    50,    51,    52,    52,    53,
      53,    54,    54,    55,    55,    55,    55,    55,    55,    55,
      55,    55,    56,    56,    57,    57,    57,    58,    58,    59,
      59,    60,    60,    61,    61,    61,    62,    62,    62,    62,
      63,    63,    63,    64,    64,    64,    64,    64,    65,    65,
      65,    66,    66,    67,    67,    68,    68,    69,    70
  };

  const signed char
  JMMParser::yyr2_[] =
  {
       0,     2,     0,     1,     1,     1,     1,     1,     1,     1,
       1,     2,     1,     1,     1,     3,     1,     2,     2,     2,
       4,     3,     1,     3,     2,     2,     3,     3,     2,     1,
       2,     1,     1,     1,     1,     2,     2,     3,     2,     5,
       7,     5,     1,     1,     1,     3,     1,     1,     3,     4,
       3,     1,     1,     2,     2,     1,     1,     3,     3,     3,
       1,     3,     3,     1,     3,     3,     3,     3,     1,     3,
       3,     1,     3,     1,     3,     1,     1,     3,     1
  };


#if YYDEBUG
  // YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
  // First, the terminals, then, starting at \a YYNTOKENS, nonterminals.
  const char*
  const JMMParser::yytname_[] =
  {
  "\"end of file\"", "error", "\"invalid token\"", "TRUE", "FALSE",
  "BOOLEAN", "INT", "VOID", "ID", "NUMBER", "STRING", "IF", "ELSE",
  "WHILE", "BREAK", "RETURN", "\"+\"", "\"-\"", "\"*\"", "\"/\"", "\"%\"",
  "\"<\"", "\">\"", "\"<=\"", "\">=\"", "\"=\"", "\"==\"", "\"!=\"",
  "\"!\"", "\"&&\"", "\"||\"", "\"(\"", "\")\"", "\"{\"", "\"}\"", "\";\"",
  "\",\"", "$accept", "start", "literal", "type", "globaldeclarations",
  "globaldeclaration", "variabledeclaration", "identifier",
  "functiondeclaration", "functionheader", "functiondeclarator",
  "formalparameterlist", "formalparameter", "mainfunctiondeclaration",
  "mainfunctiondeclarator", "block", "blockstatements", "blockstatement",
  "statement", "statementexpression", "primary", "argumentlist",
  "functioninvocation", "postfixexpression", "unaryexpression",
  "multiplicativeexpression", "additiveexpression", "relationalexpression",
  "equalityexpression", "conditionalandexpression",
  "conditionalorexpression", "assignmentexpression", "assignment",
  "expression", YY_NULLPTR
  };
#endif


#if YYDEBUG
  const short
  JMMParser::yyrline_[] =
  {
       0,    91,    91,    95,   103,   104,   105,   106,   109,   110,
     113,   117,   123,   130,   136,   144,   152,   158,   167,   173,
     182,   192,   203,   207,   213,   220,   236,   242,   249,   252,
     255,   262,   266,   272,   275,   278,   281,   284,   288,   291,
     296,   302,   309,   313,   319,   320,   321,   324,   328,   334,
     344,   354,   355,   358,   369,   373,   376,   377,   382,   387,
     394,   395,   400,   407,   408,   413,   418,   423,   430,   431,
     436,   443,   444,   451,   452,   459,   460,   463,   470
  };

  void
  JMMParser::yy_stack_print_ () const
  {
    *yycdebug_ << "Stack now";
    for (stack_type::const_iterator
           i = yystack_.begin (),
           i_end = yystack_.end ();
         i != i_end; ++i)
      *yycdebug_ << ' ' << int (i->state);
    *yycdebug_ << '\n';
  }

  void
  JMMParser::yy_reduce_print_ (int yyrule) const
  {
    int yylno = yyrline_[yyrule];
    int yynrhs = yyr2_[yyrule];
    // Print the symbols being reduced, and their result.
    *yycdebug_ << "Reducing stack by rule " << yyrule - 1
               << " (line " << yylno << "):\n";
    // The symbols being reduced.
    for (int yyi = 0; yyi < yynrhs; yyi++)
      YY_SYMBOL_PRINT ("   $" << yyi + 1 << " =",
                       yystack_[(yynrhs) - (yyi + 1)]);
  }
#endif // YYDEBUG

  JMMParser::symbol_kind_type
  JMMParser::yytranslate_ (int t)
  {
    // YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to
    // TOKEN-NUM as returned by yylex.
    static
    const signed char
    translate_table[] =
    {
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36
    };
    // Last valid token kind.
    const int code_max = 291;

    if (t <= 0)
      return symbol_kind::S_YYEOF;
    else if (t <= code_max)
      return YY_CAST (symbol_kind_type, translate_table[t]);
    else
      return symbol_kind::S_YYUNDEF;
  }

#line 15 "parser.yy"
} // JMMC
#line 1774 "parser.cc"

#line 472 "parser.yy"


// JMMParser calls this function when there is an error.
// It is currently the same as the TA"s in simple-cpp.
void JMMC::JMMParser::error(const location_type &location, const std::string &errmsg) 
{
    std::cerr << "Error: " << errmsg << " at " << location << "\n";
}

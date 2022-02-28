// A Bison parser, made by GNU Bison 3.5.1.

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

// Undocumented macros, especially those whose name start with YY_,
// are private implementation details.  Do not rely on them.





#include "parser.hh"


// Unqualified %code blocks.
#line 21 "parser.yy"

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
      yystack_print_ ();                \
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

#line 4 "parser.yy"
namespace JMMC {
#line 148 "parser.cc"


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
  | Symbol types.  |
  `---------------*/

  // basic_symbol.
#if 201103L <= YY_CPLUSPLUS
  template <typename Base>
  JMMParser::basic_symbol<Base>::basic_symbol (basic_symbol&& that)
    : Base (std::move (that))
    , value (std::move (that.value))
    , location (std::move (that.location))
  {}
#endif

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
  bool
  JMMParser::basic_symbol<Base>::empty () const YY_NOEXCEPT
  {
    return Base::type_get () == empty_symbol;
  }

  template <typename Base>
  void
  JMMParser::basic_symbol<Base>::move (basic_symbol& s)
  {
    super_type::move (s);
    value = YY_MOVE (s.value);
    location = YY_MOVE (s.location);
  }

  // by_type.
  JMMParser::by_type::by_type ()
    : type (empty_symbol)
  {}

#if 201103L <= YY_CPLUSPLUS
  JMMParser::by_type::by_type (by_type&& that)
    : type (that.type)
  {
    that.clear ();
  }
#endif

  JMMParser::by_type::by_type (const by_type& that)
    : type (that.type)
  {}

  JMMParser::by_type::by_type (token_type t)
    : type (yytranslate_ (t))
  {}

  void
  JMMParser::by_type::clear ()
  {
    type = empty_symbol;
  }

  void
  JMMParser::by_type::move (by_type& that)
  {
    type = that.type;
    that.clear ();
  }

  int
  JMMParser::by_type::type_get () const YY_NOEXCEPT
  {
    return type;
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

  JMMParser::symbol_number_type
  JMMParser::by_state::type_get () const YY_NOEXCEPT
  {
    if (state == empty_state)
      return empty_symbol;
    else
      return yystos_[+state];
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
    that.type = empty_symbol;
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
    YYUSE (yysym.type_get ());
  }

#if YYDEBUG
  template <typename Base>
  void
  JMMParser::yy_print_ (std::ostream& yyo,
                                     const basic_symbol<Base>& yysym) const
  {
    std::ostream& yyoutput = yyo;
    YYUSE (yyoutput);
    symbol_number_type yytype = yysym.type_get ();
#if defined __GNUC__ && ! defined __clang__ && ! defined __ICC && __GNUC__ * 100 + __GNUC_MINOR__ <= 408
    // Avoid a (spurious) G++ 4.8 warning about "array subscript is
    // below array bounds".
    if (yysym.empty ())
      std::abort ();
#endif
    yyo << (yytype < yyntokens_ ? "token" : "nterm")
        << ' ' << yytname_[yytype] << " ("
        << yysym.location << ": ";
    YYUSE (yytype);
    yyo << ')';
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
    int yyr = yypgoto_[yysym - yyntokens_] + yystate;
    if (0 <= yyr && yyr <= yylast_ && yycheck_[yyr] == yystate)
      return yytable_[yyr];
    else
      return yydefgoto_[yysym - yyntokens_];
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
        YYCDEBUG << "Reading a token: ";
#if YY_EXCEPTIONS
        try
#endif // YY_EXCEPTIONS
          {
            yyla.type = yytranslate_ (yylex (&yyla.value, &yyla.location));
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

    /* If the proper action on seeing token YYLA.TYPE is to reduce or
       to detect an error, take that action.  */
    yyn += yyla.type_get ();
    if (yyn < 0 || yylast_ < yyn || yycheck_[yyn] != yyla.type_get ())
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
  case 2:
#line 105 "parser.yy"
                                                    {   driver.tree = new RootNode(); }
#line 603 "parser.cc"
    break;

  case 3:
#line 106 "parser.yy"
                                                    {  /* If this was matched when the program begins,
                                                        then assign the driver"s tree as the root node.  (ADD A CHILD?)*/
                                                        driver.tree = new RootNode();
                                                        //driver.tree->children->insert(driver.tree->children->end(), $1->begin(), $1->end());
                                                        // debug:
                                                        // for (auto element : driver.tree->children) {
                                                        //     cout << element.type << endl;
                                                        // }
                                                    }
#line 617 "parser.cc"
    break;

  case 10:
#line 127 "parser.yy"
                                                                            {
                                                                                (yylhs.value.vect) = new vector<ASTNode>;
                                                                                cout << "globaldeclarations: hello" << endl;
                                                                                //$$->insert($$->end(), $1->begin(), $1->end());
                                                                            }
#line 627 "parser.cc"
    break;

  case 11:
#line 132 "parser.yy"
                              { (yylhs.value.vect) = (yystack_[1].value.vect); }
#line 633 "parser.cc"
    break;

  case 14:
#line 137 "parser.yy"
                                                                            {
                                                                                (yylhs.value.vect) = new vector<ASTNode>;
                                                                                cout << "globaldeclaration: hello" << endl;
                                                                                //$$->insert($$.end(), $1.begin(), $1.end()); 
                                                                            }
#line 643 "parser.cc"
    break;

  case 16:
#line 147 "parser.yy"
                                                                            {
                                                                                std::string str = "id";
                                                                                (yylhs.value.leaf) = new LeafNode(str, *(yystack_[0].value.sval));
                                                                                (yylhs.value.leaf)->print();
                                                                            }
#line 653 "parser.cc"
    break;

  case 25:
#line 173 "parser.yy"
                                                                                {   
                                                                                    cout << "mainfunctiondeclaration: hello" << endl;
                                                                                    (yylhs.value.decl) = new DeclarationNode("mainDecl"); 
                                                                                    (yylhs.value.decl)->children.insert((yylhs.value.decl)->children.end(), (yystack_[1].value.vect)->begin(), (yystack_[1].value.vect)->end());
                                                                                    (yylhs.value.decl)->children.push_back(*(yystack_[0].value.stmt));
                                                                                    (yylhs.value.decl)->print();
                                                                                }
#line 665 "parser.cc"
    break;

  case 26:
#line 182 "parser.yy"
                                                                                {
                                                                                    cout << "mainfunctiondeclarator: hello" << endl;
                                                                                    (yylhs.value.vect) = new vector<ASTNode>;
                                                                                    // // push node with void type
                                                                                    (yylhs.value.vect)->push_back(*(yystack_[2].value.leaf));
                                                                                    // // push node with formals type
                                                                                }
#line 677 "parser.cc"
    break;

  case 28:
#line 192 "parser.yy"
                                                                                {}
#line 683 "parser.cc"
    break;


#line 687 "parser.cc"

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
      YY_STACK_PRINT ();

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
        error (yyla.location, yysyntax_error_ (yystack_[0].state, yyla));
      }


    yyerror_range[1].location = yyla.location;
    if (yyerrstatus_ == 3)
      {
        /* If just tried and failed to reuse lookahead token after an
           error, discard it.  */

        // Return failure if at end of input.
        if (yyla.type_get () == yyeof_)
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
    goto yyerrlab1;


  /*-------------------------------------------------------------.
  | yyerrlab1 -- common code for both syntax error and YYERROR.  |
  `-------------------------------------------------------------*/
  yyerrlab1:
    yyerrstatus_ = 3;   // Each real token shifted decrements this.
    {
      stack_symbol_type error_token;
      for (;;)
        {
          yyn = yypact_[+yystack_[0].state];
          if (!yy_pact_value_is_default_ (yyn))
            {
              yyn += yy_error_token_;
              if (0 <= yyn && yyn <= yylast_ && yycheck_[yyn] == yy_error_token_)
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

  // Generate an error message.
  std::string
  JMMParser::yysyntax_error_ (state_type, const symbol_type&) const
  {
    return YY_("syntax error");
  }


  const signed char JMMParser::yypact_ninf_ = -95;

  const signed char JMMParser::yytable_ninf_ = -1;

  const short
  JMMParser::yypact_[] =
  {
       6,   -95,   -95,   -13,   -95,    32,   -13,     6,   -95,   -95,
      16,   -95,    39,   -95,    39,    49,   -95,   -95,    -9,   -95,
     -95,    75,   108,   -95,   -95,    24,   -95,   -95,    54,    78,
      85,    22,   -95,   -95,   -13,   -95,    11,   -95,   138,   -95,
     -95,    92,   -95,   -95,   -95,   -13,    13,   -95,    98,    98,
     -95,   -95,   -95,    98,    98,    98,   -95,   -95,   -95,   -95,
      11,   -95,   -95,   -95,   -95,    44,    38,    53,    56,    84,
     100,   -95,   -95,    96,    99,    98,    64,   -95,   -95,   -95,
     -95,   -95,    82,   101,   106,   109,   -95,   -95,   107,    98,
      98,    98,    98,    98,    98,    98,    98,    98,    98,    98,
      98,    98,   -95,   -95,   -95,    37,   -95,   -95,    73,    73,
     -95,   -95,   -95,   -95,    44,    44,    38,    38,    38,    38,
      53,    53,    56,   100,   -95,    98,   132,   -95,   -95,    73,
     -95
  };

  const signed char
  JMMParser::yydefact_[] =
  {
       2,     8,     9,     0,    16,     0,     0,     3,    10,    12,
       0,    13,     0,    14,     0,     0,    19,     1,     0,    18,
      11,     0,     0,    17,    25,     0,    15,    26,     0,     0,
       0,     0,    28,    34,     0,    31,     0,    33,     0,    29,
      32,     0,    43,    42,    21,     0,     0,    22,     0,     0,
      36,     6,     7,     0,     0,     0,    38,     4,     5,    44,
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
     -95,   -95,   -95,   -20,   -95,   140,   -21,     0,   -95,   -95,
     139,   -95,    74,   -95,   -95,    29,   -95,   117,   -94,   -95,
     -95,   -95,   -18,   -95,   -26,     4,    57,    23,    58,   -95,
      59,    86,   -14,   -39
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
      10,    35,    34,    15,    42,    45,    18,    10,    43,    83,
      84,     1,     2,     3,   126,   127,    88,    35,    34,    25,
      42,     4,    36,    26,    43,    51,    52,    86,    87,     1,
       2,    60,    17,    75,    74,   130,    53,   106,    36,    76,
       4,    23,    81,    24,    21,    80,    82,    54,    60,    60,
      55,    92,    93,    44,    56,    60,     4,    57,    58,    89,
      90,    91,    45,   111,   112,   113,   124,    51,    52,    22,
     125,    94,    95,    96,    97,    60,    60,    25,    53,    98,
      99,    28,    48,    29,    30,    31,   128,     1,     2,    54,
      42,    42,    55,   104,    43,    43,   114,   115,     4,    57,
      58,    51,    52,    22,    27,    33,    49,     4,    36,    36,
     100,    42,    53,     1,     2,    43,    28,    50,    29,    30,
      31,   120,   121,    54,    79,    60,    55,   101,   102,    36,
     108,    26,     4,    57,    58,   109,   110,    76,    22,    32,
      33,   129,     4,     1,     2,    19,    28,    20,    29,    30,
      31,   116,   117,   118,   119,    78,   107,     0,   122,     0,
     123,   103,     0,     0,     0,     0,     0,     0,    22,    77,
      33,     0,     4
  };

  const short
  JMMParser::yycheck_[] =
  {
       0,    22,    22,     3,    22,    25,     6,     7,    22,    48,
      49,     5,     6,     7,   108,   109,    55,    38,    38,    28,
      38,    34,    22,    32,    38,     3,     4,    53,    54,     5,
       6,    31,     0,    22,    34,   129,    14,    76,    38,    28,
      34,    12,    29,    14,    28,    45,    33,    25,    48,    49,
      28,    13,    14,    29,    32,    55,    34,    35,    36,    15,
      16,    17,    82,    89,    90,    91,    29,     3,     4,    30,
      33,    18,    19,    20,    21,    75,    76,    28,    14,    23,
      24,     8,    28,    10,    11,    12,   125,     5,     6,    25,
     108,   109,    28,    29,   108,   109,    92,    93,    34,    35,
      36,     3,     4,    30,    29,    32,    28,    34,   108,   109,
      26,   129,    14,     5,     6,   129,     8,    32,    10,    11,
      12,    98,    99,    25,    32,   125,    28,    27,    32,   129,
      29,    32,    34,    35,    36,    29,    29,    28,    30,    31,
      32,     9,    34,     5,     6,     6,     8,     7,    10,    11,
      12,    94,    95,    96,    97,    38,    82,    -1,   100,    -1,
     101,    75,    -1,    -1,    -1,    -1,    -1,    -1,    30,    31,
      32,    -1,    34
  };

  const signed char
  JMMParser::yystos_[] =
  {
       0,     5,     6,     7,    34,    38,    40,    41,    42,    43,
      44,    45,    46,    50,    51,    44,    47,     0,    44,    47,
      42,    28,    30,    52,    52,    28,    32,    29,     8,    10,
      11,    12,    31,    32,    40,    43,    44,    52,    53,    54,
      55,    56,    59,    69,    29,    40,    48,    49,    28,    28,
      32,     3,     4,    14,    25,    28,    32,    35,    36,    39,
      44,    57,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    44,    22,    28,    31,    54,    32,
      44,    29,    33,    70,    70,    44,    61,    61,    70,    15,
      16,    17,    13,    14,    18,    19,    20,    21,    23,    24,
      26,    27,    32,    68,    29,    58,    70,    49,    29,    29,
      29,    61,    61,    61,    62,    62,    63,    63,    63,    63,
      64,    64,    65,    67,    29,    33,    55,    55,    70,     9,
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
  // First, the terminals, then, starting at \a yyntokens_, nonterminals.
  const char*
  const JMMParser::yytname_[] =
  {
  "$end", "error", "$undefined", "TRUE", "FALSE", "BOOLEAN", "INT",
  "VOID", "IF", "ELSE", "WHILE", "BREAK", "RETURN", "\"+\"", "\"-\"",
  "\"*\"", "\"/\"", "\"%\"", "\"<\"", "\">\"", "LE", "GE", "\"=\"", "EQ",
  "NE", "\"!\"", "AND", "OR", "\"(\"", "\")\"", "\"{\"", "\"}\"", "\";\"",
  "\",\"", "ID", "NUMBER", "STRING", "$accept", "start", "literal", "type",
  "globaldeclarations", "globaldeclaration", "variabledeclaration",
  "identifier", "functiondeclaration", "functionheader",
  "functiondeclarator", "formalparameterlist", "formalparameter",
  "mainfunctiondeclaration", "mainfunctiondeclarator", "block",
  "blockstatements", "blockstatement", "statement", "statementexpression",
  "primary", "argumentlist", "functioninvocation", "postfixexpression",
  "unaryexpression", "multiplicativeexpression", "additiveexpression",
  "relationalexpression", "equalityexpression", "conditionalandexpression",
  "conditionalorexpression", "assignmentexpression", "assignment",
  "expression", YY_NULLPTR
  };


  const short
  JMMParser::yyrline_[] =
  {
       0,   105,   105,   106,   117,   118,   119,   120,   123,   124,
     127,   132,   135,   136,   137,   144,   147,   154,   157,   158,
     161,   162,   166,   167,   170,   173,   182,   191,   192,   195,
     196,   199,   200,   203,   204,   205,   206,   207,   208,   209,
     210,   211,   214,   215,   218,   219,   220,   223,   224,   227,
     228,   231,   232,   235,   236,   237,   240,   241,   242,   243,
     246,   247,   248,   251,   252,   253,   254,   255,   258,   259,
     260,   263,   264,   267,   268,   271,   272,   275,   278
  };

  // Print the state stack on the debug stream.
  void
  JMMParser::yystack_print_ ()
  {
    *yycdebug_ << "Stack now";
    for (stack_type::const_iterator
           i = yystack_.begin (),
           i_end = yystack_.end ();
         i != i_end; ++i)
      *yycdebug_ << ' ' << int (i->state);
    *yycdebug_ << '\n';
  }

  // Report on the debug stream that the rule \a yyrule is going to be reduced.
  void
  JMMParser::yy_reduce_print_ (int yyrule)
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

  JMMParser::token_number_type
  JMMParser::yytranslate_ (int t)
  {
    // YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to
    // TOKEN-NUM as returned by yylex.
    static
    const token_number_type
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
    const int user_token_number_max_ = 291;

    if (t <= 0)
      return yyeof_;
    else if (t <= user_token_number_max_)
      return translate_table[t];
    else
      return yy_undef_token_;
  }

#line 4 "parser.yy"
} // JMMC
#line 1138 "parser.cc"

#line 280 "parser.yy"


// JMMParser calls this function when there is an error.
// It is currently the same as the TA"s in simple-cpp.
void JMMC::JMMParser::error(const location_type &location, const std::string &errmsg) 
{
    std::cerr << "Error: " << errmsg << " at " << location << "\n";
}

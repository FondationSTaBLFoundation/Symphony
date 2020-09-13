-- This Happy file was machine-generated by the BNF converter
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParHashedLang where
import AbsHashedLang
import LexHashedLang
import ErrM

}

%name pProblem Problem
%name pBlock Block
%name pListBlock ListBlock
%name pTInt TInt
%name pTDouble TDouble
%name pNumber Number
%name pVal Val
%name pDim Dim
%name pShape Shape
%name pVariableDecl VariableDecl
%name pListVariableDecl ListVariableDecl
%name pListListVariableDecl ListListVariableDecl
%name pConstantDecl ConstantDecl
%name pListConstantDecl ListConstantDecl
%name pListListConstantDecl ListListConstantDecl
%name pLetDecl LetDecl
%name pListLetDecl ListLetDecl
%name pListListLetDecl ListListLetDecl
%name pBound Bound
%name pConstraintDecl ConstraintDecl
%name pListConstraintDecl ListConstraintDecl
%name pListListConstraintDecl ListListConstraintDecl
%name pRotateAmount RotateAmount
%name pPiecewiseCase PiecewiseCase
%name pListPiecewiseCase ListPiecewiseCase
%name pExp Exp
%name pExp1 Exp1
%name pExp2 Exp2
%name pExp3 Exp3
%name pExp4 Exp4
%name pExp5 Exp5
-- no lexer declaration
%monad { Err } { thenM } { returnM }
%tokentype {Token}
%token
  '(' { PT _ (TS _ 1) }
  ')' { PT _ (TS _ 2) }
  ',' { PT _ (TS _ 3) }
  '->' { PT _ (TS _ 4) }
  ':' { PT _ (TS _ 5) }
  ';' { PT _ (TS _ 6) }
  '<=' { PT _ (TS _ 7) }
  '=' { PT _ (TS _ 8) }
  '==' { PT _ (TS _ 9) }
  '>=' { PT _ (TS _ 10) }
  'Dataset' { PT _ (TS _ 11) }
  'File' { PT _ (TS _ 12) }
  'Image' { PT _ (TS _ 13) }
  'Pattern' { PT _ (TS _ 14) }
  'Random' { PT _ (TS _ 15) }
  '[' { PT _ (TS _ 16) }
  ']' { PT _ (TS _ 17) }
  'constant' { PT _ (TS _ 18) }
  'constants' { PT _ (TS _ 19) }
  'constraint' { PT _ (TS _ 20) }
  'constraints' { PT _ (TS _ 21) }
  'it' { PT _ (TS _ 22) }
  'let' { PT _ (TS _ 23) }
  'minimize' { PT _ (TS _ 24) }
  'otherwise' { PT _ (TS _ 25) }
  'solver' { PT _ (TS _ 26) }
  'variable' { PT _ (TS _ 27) }
  'variables' { PT _ (TS _ 28) }
  '{' { PT _ (TS _ 29) }
  '}' { PT _ (TS _ 30) }
  L_quoted { PT _ (TL $$) }
  L_SolverName { PT _ (T_SolverName $$) }
  L_KWDataPattern { PT _ (T_KWDataPattern $$) }
  L_PDoubleFun { PT _ (T_PDoubleFun _) }
  L_PUnaryFun { PT _ (T_PUnaryFun _) }
  L_TokenSub { PT _ (T_TokenSub _) }
  L_TokenPlus { PT _ (T_TokenPlus _) }
  L_TokenReIm { PT _ (T_TokenReIm _) }
  L_TokenMul { PT _ (T_TokenMul _) }
  L_TokenDiv { PT _ (T_TokenDiv _) }
  L_TokenScale { PT _ (T_TokenScale _) }
  L_TokenDot { PT _ (T_TokenDot _) }
  L_TokenPower { PT _ (T_TokenPower _) }
  L_TokenRotate { PT _ (T_TokenRotate _) }
  L_TokenCase { PT _ (T_TokenCase _) }
  L_PInteger { PT _ (T_PInteger _) }
  L_PDouble { PT _ (T_PDouble _) }
  L_PIdent { PT _ (T_PIdent _) }

%%

String  :: { String }
String   : L_quoted {  $1 }

SolverName :: { SolverName}
SolverName  : L_SolverName { SolverName ($1)}

KWDataPattern :: { KWDataPattern}
KWDataPattern  : L_KWDataPattern { KWDataPattern ($1)}

PDoubleFun :: { PDoubleFun}
PDoubleFun  : L_PDoubleFun { PDoubleFun (mkPosToken $1)}

PUnaryFun :: { PUnaryFun}
PUnaryFun  : L_PUnaryFun { PUnaryFun (mkPosToken $1)}

TokenSub :: { TokenSub}
TokenSub  : L_TokenSub { TokenSub (mkPosToken $1)}

TokenPlus :: { TokenPlus}
TokenPlus  : L_TokenPlus { TokenPlus (mkPosToken $1)}

TokenReIm :: { TokenReIm}
TokenReIm  : L_TokenReIm { TokenReIm (mkPosToken $1)}

TokenMul :: { TokenMul}
TokenMul  : L_TokenMul { TokenMul (mkPosToken $1)}

TokenDiv :: { TokenDiv}
TokenDiv  : L_TokenDiv { TokenDiv (mkPosToken $1)}

TokenScale :: { TokenScale}
TokenScale  : L_TokenScale { TokenScale (mkPosToken $1)}

TokenDot :: { TokenDot}
TokenDot  : L_TokenDot { TokenDot (mkPosToken $1)}

TokenPower :: { TokenPower}
TokenPower  : L_TokenPower { TokenPower (mkPosToken $1)}

TokenRotate :: { TokenRotate}
TokenRotate  : L_TokenRotate { TokenRotate (mkPosToken $1)}

TokenCase :: { TokenCase}
TokenCase  : L_TokenCase { TokenCase (mkPosToken $1)}

PInteger :: { PInteger}
PInteger  : L_PInteger { PInteger (mkPosToken $1)}

PDouble :: { PDouble}
PDouble  : L_PDouble { PDouble (mkPosToken $1)}

PIdent :: { PIdent}
PIdent  : L_PIdent { PIdent (mkPosToken $1)}

Problem :: { Problem }
Problem : ListBlock { AbsHashedLang.Problem $1 }
Block :: { Block }
Block : 'variables' ':' '{' ListListVariableDecl '}' { AbsHashedLang.BlockVariable $4 }
      | 'variable' ':' '{' ListListVariableDecl '}' { AbsHashedLang.BlockVariable $4 }
      | 'constants' ':' '{' ListListConstantDecl '}' { AbsHashedLang.BlockConstant $4 }
      | 'constant' ':' '{' ListListConstantDecl '}' { AbsHashedLang.BlockConstant $4 }
      | 'constraints' ':' '{' ListListConstraintDecl '}' { AbsHashedLang.BlockConstraint $4 }
      | 'constraint' ':' '{' ListListConstraintDecl '}' { AbsHashedLang.BlockConstraint $4 }
      | 'let' ':' '{' ListListLetDecl '}' { AbsHashedLang.BlockLet $4 }
      | 'minimize' ':' '{' Exp '}' { AbsHashedLang.BlockMinimize $4 }
      | 'solver' ':' '{' SolverName '}' { AbsHashedLang.BlockSolver $4 }
ListBlock :: { [Block] }
ListBlock : Block { (:[]) $1 } | Block ListBlock { (:) $1 $2 }
TInt :: { TInt }
TInt : PInteger { AbsHashedLang.IntPos $1 }
     | TokenSub PInteger { AbsHashedLang.IntNeg $1 $2 }
TDouble :: { TDouble }
TDouble : PDouble { AbsHashedLang.DoublePos $1 }
        | TokenSub PDouble { AbsHashedLang.DoubleNeg $1 $2 }
Number :: { Number }
Number : TInt { AbsHashedLang.NumInt $1 }
       | TDouble { AbsHashedLang.NumDouble $1 }
Val :: { Val }
Val : 'File' '(' String ')' { AbsHashedLang.ValFile $3 }
    | 'Dataset' '(' String ',' String ')' { AbsHashedLang.ValDataset $3 $5 }
    | 'Pattern' '(' KWDataPattern ')' { AbsHashedLang.ValPattern $3 }
    | 'Random' { AbsHashedLang.ValRandom }
    | 'Image' '(' String ')' { AbsHashedLang.ValImage $3 }
    | Number { AbsHashedLang.ValLiteral $1 }
Dim :: { Dim }
Dim : '[' PInteger ']' { AbsHashedLang.Dim $2 }
Shape :: { Shape }
Shape : {- empty -} { AbsHashedLang.ShapeScalar }
      | Dim { AbsHashedLang.Shape1D $1 }
      | Dim Dim { AbsHashedLang.Shape2D $1 $2 }
      | Dim Dim Dim { AbsHashedLang.Shape3D $1 $2 $3 }
VariableDecl :: { VariableDecl }
VariableDecl : PIdent Shape { AbsHashedLang.VariableNoInit $1 $2 }
             | PIdent Shape '=' Val { AbsHashedLang.VariableWithInit $1 $2 $4 }
ListVariableDecl :: { [VariableDecl] }
ListVariableDecl : VariableDecl { (:[]) $1 }
                 | VariableDecl ',' ListVariableDecl { (:) $1 $3 }
ListListVariableDecl :: { [[VariableDecl]] }
ListListVariableDecl : ListVariableDecl { (:[]) $1 }
                     | ListVariableDecl ';' ListListVariableDecl { (:) $1 $3 }
ConstantDecl :: { ConstantDecl }
ConstantDecl : PIdent Shape '=' Val { AbsHashedLang.ConstantDecl $1 $2 $4 }
ListConstantDecl :: { [ConstantDecl] }
ListConstantDecl : ConstantDecl { (:[]) $1 }
                 | ConstantDecl ',' ListConstantDecl { (:) $1 $3 }
ListListConstantDecl :: { [[ConstantDecl]] }
ListListConstantDecl : ListConstantDecl { (:[]) $1 }
                     | ListConstantDecl ';' ListListConstantDecl { (:) $1 $3 }
LetDecl :: { LetDecl }
LetDecl : PIdent '=' Exp { AbsHashedLang.LetDecl $1 $3 }
ListLetDecl :: { [LetDecl] }
ListLetDecl : LetDecl { (:[]) $1 }
            | LetDecl ',' ListLetDecl { (:) $1 $3 }
ListListLetDecl :: { [[LetDecl]] }
ListListLetDecl : ListLetDecl { (:[]) $1 }
                | ListLetDecl ';' ListListLetDecl { (:) $1 $3 }
Bound :: { Bound }
Bound : PIdent { AbsHashedLang.ConstantBound $1 }
      | Number { AbsHashedLang.NumberBound $1 }
ConstraintDecl :: { ConstraintDecl }
ConstraintDecl : Exp '>=' Bound { AbsHashedLang.ConstraintLower $1 $3 }
               | Exp '<=' Bound { AbsHashedLang.ConstraintUpper $1 $3 }
               | Exp '==' Bound { AbsHashedLang.ConstraintEqual $1 $3 }
ListConstraintDecl :: { [ConstraintDecl] }
ListConstraintDecl : ConstraintDecl { (:[]) $1 }
                   | ConstraintDecl ',' ListConstraintDecl { (:) $1 $3 }
ListListConstraintDecl :: { [[ConstraintDecl]] }
ListListConstraintDecl : ListConstraintDecl { (:[]) $1 }
                       | ListConstraintDecl ';' ListListConstraintDecl { (:) $1 $3 }
RotateAmount :: { RotateAmount }
RotateAmount : '(' TInt ')' { AbsHashedLang.RA1D $2 }
             | '(' TInt ',' TInt ')' { AbsHashedLang.RA2D $2 $4 }
             | '(' TInt ',' TInt ',' TInt ')' { AbsHashedLang.RA3D $2 $4 $6 }
PiecewiseCase :: { PiecewiseCase }
PiecewiseCase : 'it' '<=' Number '->' Exp { AbsHashedLang.PiecewiseCase $3 $5 }
              | 'otherwise' '->' Exp { AbsHashedLang.PiecewiseFinalCase $3 }
ListPiecewiseCase :: { [PiecewiseCase] }
ListPiecewiseCase : PiecewiseCase { (:[]) $1 }
                  | PiecewiseCase ';' ListPiecewiseCase { (:) $1 $3 }
Exp :: { Exp }
Exp : Exp TokenPlus Exp1 { AbsHashedLang.EPlus $1 $2 $3 }
    | Exp TokenReIm Exp1 { AbsHashedLang.ERealImag $1 $2 $3 }
    | Exp TokenSub Exp1 { AbsHashedLang.ESubtract $1 $2 $3 }
    | Exp1 { $1 }
    | TokenCase Exp ':' '{' ListPiecewiseCase '}' { AbsHashedLang.EPiecewise $1 $2 $5 }
Exp1 :: { Exp }
Exp1 : Exp1 TokenMul Exp2 { AbsHashedLang.EMul $1 $2 $3 }
     | Exp1 TokenDiv Exp2 { AbsHashedLang.EDiv $1 $2 $3 }
     | Exp2 { $1 }
Exp2 :: { Exp }
Exp2 : Exp2 TokenScale Exp3 { AbsHashedLang.EScale $1 $2 $3 }
     | Exp2 TokenDot Exp3 { AbsHashedLang.EDot $1 $2 $3 }
     | Exp3 { $1 }
Exp3 :: { Exp }
Exp3 : Exp3 TokenPower TInt { AbsHashedLang.EPower $1 $2 $3 }
     | Exp3 TokenPower '(' TInt ')' { AbsHashedLang.EPower $1 $2 $4 }
     | Exp4 { $1 }
Exp4 :: { Exp }
Exp4 : PDoubleFun Number Exp5 { AbsHashedLang.EDoubleFun $1 $2 $3 }
     | PDoubleFun '(' Number ')' Exp5 { AbsHashedLang.EDoubleFun $1 $3 $5 }
     | PUnaryFun Exp5 { AbsHashedLang.EUnaryFun $1 $2 }
     | TokenRotate RotateAmount Exp5 { AbsHashedLang.ERotate $1 $2 $3 }
     | TokenSub Exp5 { AbsHashedLang.ENegate $1 $2 }
     | Exp5 { $1 }
Exp5 :: { Exp }
Exp5 : '(' Exp ')' { $2 }
     | PDouble { AbsHashedLang.ENumDouble $1 }
     | PInteger { AbsHashedLang.ENumInteger $1 }
     | PIdent { AbsHashedLang.EIdent $1 }
{

returnM :: a -> Err a
returnM = return

thenM :: Err a -> (a -> Err b) -> Err b
thenM = (>>=)

happyError :: [Token] -> Err a
happyError ts =
  Bad $ "syntax error at " ++ tokenPos ts ++
  case ts of
    []      -> []
    [Err _] -> " due to lexer error"
    t:_     -> " before `" ++ id(prToken t) ++ "'"

myLexer = tokens
}

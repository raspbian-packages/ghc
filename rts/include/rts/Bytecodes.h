/* -----------------------------------------------------------------------------
 *
 * (c) The GHC Team, 1998-2009
 *
 * Bytecode definitions.
 *
 * ---------------------------------------------------------------------------*/

/* --------------------------------------------------------------------------
 * Instructions
 *
 * Notes:
 * o CASEFAIL is generated by the compiler whenever it tests an "irrefutable"
 *   pattern which fails.  If we don't see too many of these, we could
 *   optimise out the redundant test.
 * ------------------------------------------------------------------------*/

/* NOTE:

   THIS FILE IS INCLUDED IN HASKELL SOURCES (ghc/compiler/GHC/ByteCode/Asm.hs).
   DO NOT PUT C-SPECIFIC STUFF IN HERE!

   I hope that's clear :-)
*/

#define bci_STKCHECK                    1
#define bci_PUSH_L                      2
#define bci_PUSH_LL                     3
#define bci_PUSH_LLL                    4
#define bci_PUSH8                       5
#define bci_PUSH16                      6
#define bci_PUSH32                      7
#define bci_PUSH8_W                     8
#define bci_PUSH16_W                    9
#define bci_PUSH32_W                    10
#define bci_PUSH_G                      11
#define bci_PUSH_ALTS_P                 13
#define bci_PUSH_ALTS_N                 14
#define bci_PUSH_ALTS_F                 15
#define bci_PUSH_ALTS_D                 16
#define bci_PUSH_ALTS_L                 17
#define bci_PUSH_ALTS_V                 18
#define bci_PUSH_PAD8                   19
#define bci_PUSH_PAD16                  20
#define bci_PUSH_PAD32                  21
#define bci_PUSH_UBX8                   22
#define bci_PUSH_UBX16                  23
#define bci_PUSH_UBX32                  24
#define bci_PUSH_UBX                    25
#define bci_PUSH_APPLY_N                26
#define bci_PUSH_APPLY_F                27
#define bci_PUSH_APPLY_D                28
#define bci_PUSH_APPLY_L                29
#define bci_PUSH_APPLY_V                30
#define bci_PUSH_APPLY_P                31
#define bci_PUSH_APPLY_PP               32
#define bci_PUSH_APPLY_PPP              33
#define bci_PUSH_APPLY_PPPP             34
#define bci_PUSH_APPLY_PPPPP            35
#define bci_PUSH_APPLY_PPPPPP           36
/* #define bci_PUSH_APPLY_PPPPPPP          37 */
#define bci_SLIDE                       38
#define bci_ALLOC_AP                    39
#define bci_ALLOC_AP_NOUPD              40
#define bci_ALLOC_PAP                   41
#define bci_MKAP                        42
#define bci_MKPAP                       43
#define bci_UNPACK                      44
#define bci_PACK                        45
#define bci_TESTLT_I                    46
#define bci_TESTEQ_I                    47
#define bci_TESTLT_F                    48
#define bci_TESTEQ_F                    49
#define bci_TESTLT_D                    50
#define bci_TESTEQ_D                    51
#define bci_TESTLT_P                    52
#define bci_TESTEQ_P                    53
#define bci_CASEFAIL                    54
#define bci_JMP                         55
#define bci_CCALL                       56
#define bci_SWIZZLE                     57
#define bci_ENTER                       58
#define bci_RETURN_P                    60
#define bci_RETURN_N                    61
#define bci_RETURN_F                    62
#define bci_RETURN_D                    63
#define bci_RETURN_L                    64
#define bci_RETURN_V                    65
#define bci_BRK_FUN                     66
#define bci_TESTLT_W                    67
#define bci_TESTEQ_W                    68

#define bci_RETURN_T                    69
#define bci_PUSH_ALTS_T                 70

#define bci_TESTLT_I64                  71
#define bci_TESTEQ_I64                  72
#define bci_TESTLT_I32                  73
#define bci_TESTEQ_I32                  74
#define bci_TESTLT_I16                  75
#define bci_TESTEQ_I16                  76
#define bci_TESTLT_I8                   77
#define bci_TESTEQ_I8                   78
#define bci_TESTLT_W64                  79
#define bci_TESTEQ_W64                  80
#define bci_TESTLT_W32                  81
#define bci_TESTEQ_W32                  82
#define bci_TESTLT_W16                  83
#define bci_TESTEQ_W16                  84
#define bci_TESTLT_W8                   85
#define bci_TESTEQ_W8                   86

#define bci_PRIMCALL                    87

/* If you need to go past 255 then you will run into the flags */

/* If you need to go below 0x0100 then you will run into the instructions */
#define bci_FLAG_LARGE_ARGS 0x8000

/* If a BCO definitely requires less than this many words of stack,
   don't include an explicit STKCHECK insn in it.  The interpreter
   will check for this many words of stack before running each BCO,
   rendering an explicit check unnecessary in the majority of
   cases. */
#define INTERP_STACK_CHECK_THRESH 50

/*-------------------------------------------------------------------------*/

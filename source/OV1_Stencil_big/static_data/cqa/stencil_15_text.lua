_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements.",
          details = " - UCVTF: 2 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 11 FP arithmetical operations:\n - 7: addition or subtraction (3 inside FMA instructions)\n - 4: multiply (3 inside FMA instructions)\nThe binary loop is loading 48 bytes.\nThe binary loop is storing 24 bytes.",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.15 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 57\nloop length        : 228\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "FIT IN UOP CACHE\nfront end: 7.13 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2    | P3    | P4   | P5   | P6   | P7   | P8   | P9   | P10  | P11  | P12  | P13  | P14\n-----------------------------------------------------------------------------------------------------------------\nuops   | 7.00 | 7.00 | 10.50 | 10.50 | 4.00 | 0.00 | 3.00 | 3.00 | 3.00 | 3.00 | 3.17 | 2.83 | 3.00 | 4.50 | 4.50\ncycles | 7.00 | 7.00 | 10.50 | 10.50 | 4.00 | 0.00 | 3.00 | 3.00 | 3.00 | 3.00 | 3.17 | 2.83 | 3.00 | 4.50 | 4.50\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 7.13\nOverall L1: 10.50\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 0%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 0%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 10.50 cycles. At this rate:\n - 4% of peak load performance is reached (4.57 out of 96.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 3% of peak store performance is reached (2.29 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 4043c0\n\nInstruction                       | Nb FU | P0   | P1   | P2   | P3   | P4 | P5 | P6   | P7   | P8   | P9   | P10  | P11  | P12  | P13  | P14  | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\nUCVTF D4, X24                     | 1     | 0    | 0    | 0    | 0    | 1  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 3       | 1\nADRP X28, 4043c4 <_Z4initv+0x13c> | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nMOVZ X19, #0                      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nFADD D0, D4, D12                  | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 2       | 0.25\nBL <104010c0>                     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nFMOV D9, D0                       | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0    | 1    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 2       | 1\nORR X2, XZR, X21                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nMOVZ W1, #0                       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nORR X0, XZR, X25                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nBL <10401150>                     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nMOVZ W1, #0                       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nORR X2, XZR, X21                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nORR X0, XZR, X26                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nBL <10401150>                     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nLDR X0, [X29, #200]               | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 4       | 0.33\nADRP X1, 4043fc <_Z4initv+0x174>  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nFMUL D8, D9, D11                  | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 3       | 0.25\nLDR D0, [X28, #2944]              | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 6       | 0.33\nLDR D9, [X1, #2960]               | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 6       | 0.33\nSUB X3, X0, #1                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nANDS X22, X3, #4160               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.33\nB.EQ 4044ec <_Z4initv+0x264>      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.50\nFMADD D0, D0, D8, D9              | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 4       | 0.25\nMOVZ X19, #1                      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nBL <10401240>                     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nLDR D10, [X27, #2968]             | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 6       | 0.33\nFMOV D5, #1.0000000               | 1     | 0    | 0    | 0    | 0    | 1  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 3       | 1\nSTR D0, [X20]                     | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0    | 2       | 0.50\nFADD D0, D5, D10                  | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 2       | 0.25\nBL <104010c0>                     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nCMP X22, X19                      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.33\nB.EQ 4044ec <_Z4initv+0x264>      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.50\nCMP X22, #2                       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.33\nB.EQ 404464 <_Z4initv+0x1dc>      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.50\nFMADD D0, D0, D8, D9              | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 4       | 0.25\nBL <10401240>                     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nFMOV D6, #2.0000000               | 1     | 0    | 0    | 0    | 0    | 1  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 3       | 1\nSTR D0, [X20, X19,LSL #3]         | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0    | 2       | 0.50\nMOVZ X19, #2                      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nFADD D0, D6, D10                  | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 2       | 0.25\nBL <104010c0>                     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nFMADD D0, D0, D8, D9              | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 4       | 0.25\nBL <10401240>                     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nSTR D0, [X20, X19,LSL #3]         | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0    | 2       | 0.50\nADD X19, X19, #1                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nLDR D7, [X27, #2968]              | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 6       | 0.33\nUCVTF D16, X19                    | 1     | 0    | 0    | 0    | 0    | 1  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 3       | 1\nFADD D0, D16, D7                  | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 2       | 0.25\nBL <104010c0>                     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nB 4044ec <_Z4initv+0x264>         | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.50\nLDR X30, [X29, #192]              | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 4       | 0.33\nADD X24, X24, #1                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nADD X25, X25, X21                 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nADD X26, X26, X21                 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nADD X20, X20, X21                 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nCMP X24, X30                      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.33\nB.NE 4043c0 <_Z4initv+0x138>      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.50\n",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "6% of peak computational performance is used (1.05 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 10.50 to 2.83 cycles (3.71x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All VPU instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n4 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 10.50 to 2.62 cycles (4.00x speedup).",
        },
      },
      potential = {
        {
          title = "Expensive FP math instructions/calls",
          txt = "Detected performance impact from expensive FP math instructions/calls.\nBy removing/reexpressing them, you can lower the cost of an iteration from 10.50 to 4.50 cycles (2.33x speedup).",
        },
        {
          workaround = "Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).",
          title = "FMA",
          txt = "Detected 3 FMA (fused multiply-add) operations.\nPresence of both ADD/SUB and MUL operations.",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements.",
          details = " - UCVTF: 2 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 11 FP arithmetical operations:\n - 7: addition or subtraction (3 inside FMA instructions)\n - 4: multiply (3 inside FMA instructions)\nThe binary loop is loading 48 bytes.\nThe binary loop is storing 24 bytes.",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.15 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 57\nloop length        : 228\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "FIT IN UOP CACHE\nfront end: 7.13 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2    | P3    | P4   | P5   | P6   | P7   | P8   | P9   | P10  | P11  | P12  | P13  | P14\n-----------------------------------------------------------------------------------------------------------------\nuops   | 7.00 | 7.00 | 10.50 | 10.50 | 4.00 | 0.00 | 3.00 | 3.00 | 3.00 | 3.00 | 3.17 | 2.83 | 3.00 | 4.50 | 4.50\ncycles | 7.00 | 7.00 | 10.50 | 10.50 | 4.00 | 0.00 | 3.00 | 3.00 | 3.00 | 3.00 | 3.17 | 2.83 | 3.00 | 4.50 | 4.50\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 7.13\nOverall L1: 10.50\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 0%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 0%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 10.50 cycles. At this rate:\n - 4% of peak load performance is reached (4.57 out of 96.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 3% of peak store performance is reached (2.29 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 4043c0\n\nInstruction                       | Nb FU | P0   | P1   | P2   | P3   | P4 | P5 | P6   | P7   | P8   | P9   | P10  | P11  | P12  | P13  | P14  | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\nUCVTF D4, X24                     | 1     | 0    | 0    | 0    | 0    | 1  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 3       | 1\nADRP X28, 4043c4 <_Z4initv+0x13c> | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nMOVZ X19, #0                      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nFADD D0, D4, D12                  | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 2       | 0.25\nBL <104010c0>                     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nFMOV D9, D0                       | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0    | 1    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 2       | 1\nORR X2, XZR, X21                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nMOVZ W1, #0                       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nORR X0, XZR, X25                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nBL <10401150>                     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nMOVZ W1, #0                       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nORR X2, XZR, X21                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nORR X0, XZR, X26                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nBL <10401150>                     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nLDR X0, [X29, #200]               | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 4       | 0.33\nADRP X1, 4043fc <_Z4initv+0x174>  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nFMUL D8, D9, D11                  | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 3       | 0.25\nLDR D0, [X28, #2944]              | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 6       | 0.33\nLDR D9, [X1, #2960]               | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 6       | 0.33\nSUB X3, X0, #1                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nANDS X22, X3, #4160               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.33\nB.EQ 4044ec <_Z4initv+0x264>      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.50\nFMADD D0, D0, D8, D9              | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 4       | 0.25\nMOVZ X19, #1                      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nBL <10401240>                     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nLDR D10, [X27, #2968]             | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 6       | 0.33\nFMOV D5, #1.0000000               | 1     | 0    | 0    | 0    | 0    | 1  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 3       | 1\nSTR D0, [X20]                     | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0    | 2       | 0.50\nFADD D0, D5, D10                  | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 2       | 0.25\nBL <104010c0>                     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nCMP X22, X19                      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.33\nB.EQ 4044ec <_Z4initv+0x264>      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.50\nCMP X22, #2                       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.33\nB.EQ 404464 <_Z4initv+0x1dc>      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.50\nFMADD D0, D0, D8, D9              | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 4       | 0.25\nBL <10401240>                     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nFMOV D6, #2.0000000               | 1     | 0    | 0    | 0    | 0    | 1  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 3       | 1\nSTR D0, [X20, X19,LSL #3]         | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0    | 2       | 0.50\nMOVZ X19, #2                      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nFADD D0, D6, D10                  | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 2       | 0.25\nBL <104010c0>                     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nFMADD D0, D0, D8, D9              | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 4       | 0.25\nBL <10401240>                     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nSTR D0, [X20, X19,LSL #3]         | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0    | 2       | 0.50\nADD X19, X19, #1                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nLDR D7, [X27, #2968]              | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 6       | 0.33\nUCVTF D16, X19                    | 1     | 0    | 0    | 0    | 0    | 1  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 3       | 1\nFADD D0, D16, D7                  | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 2       | 0.25\nBL <104010c0>                     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nB 4044ec <_Z4initv+0x264>         | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.50\nLDR X30, [X29, #192]              | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 4       | 0.33\nADD X24, X24, #1                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nADD X25, X25, X21                 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nADD X26, X26, X21                 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nADD X20, X20, X21                 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nCMP X24, X30                      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.33\nB.NE 4043c0 <_Z4initv+0x138>      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.50\n",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "6% of peak computational performance is used (1.05 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 10.50 to 2.83 cycles (3.71x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All VPU instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n4 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 10.50 to 2.62 cycles (4.00x speedup).",
        },
      },
      potential = {
        {
          title = "Expensive FP math instructions/calls",
          txt = "Detected performance impact from expensive FP math instructions/calls.\nBy removing/reexpressing them, you can lower the cost of an iteration from 10.50 to 4.50 cycles (2.33x speedup).",
        },
        {
          workaround = "Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).",
          title = "FMA",
          txt = "Detected 3 FMA (fused multiply-add) operations.\nPresence of both ADD/SUB and MUL operations.",
        },
      },
    },
  common = {
    header = {
      "",
      "Warnings:\n - Non-innermost loop: analyzing only self part (ignoring child loops).\n - Ignoring paths for analysis\n - Too many paths. Rerun with max-paths=8\n - RecMII not computed since number of paths is unknown or > max_paths\n",
      "Try to simplify control and/or increase the maximum number of paths per function/loop through the 'max-paths-nb' option.\n",
      "This loop has 8 execution paths.\n",
      "The presence of multiple execution paths is typically the main/first bottleneck.\nTry to simplify control inside loop: ideally, try to remove all conditional expressions, for example by (if applicable):\n - hoisting them (moving them outside the loop)\n - turning them into conditional moves, MIN or MAX\n\n",
    },
    nb_paths = 8,
  },
}

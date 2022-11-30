_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements.",
          details = " - UCVTF: 4 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 12 FP arithmetical operations:\n - 8: addition or subtraction (4 inside FMA instructions)\n - 4: multiply (all inside FMA instructions)\nThe binary loop is loading 16 bytes.\nThe binary loop is storing 32 bytes.",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.25 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 32\nloop length        : 128\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "FIT IN UOP CACHE\nfront end: 4.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7   | P8   | P9   | P10  | P11  | P12  | P13  | P14\n---------------------------------------------------------------------------------------------------------------\nuops   | 4.50 | 4.50 | 2.50 | 2.50 | 4.00 | 0.00 | 3.00 | 3.00 | 3.00 | 3.00 | 2.00 | 2.00 | 2.00 | 4.00 | 4.00\ncycles | 4.50 | 4.50 | 2.50 | 2.50 | 4.00 | 0.00 | 3.00 | 3.00 | 3.00 | 3.00 | 2.00 | 2.00 | 2.00 | 4.00 | 4.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 4.00\nData deps.: 1.00\nOverall L1: 4.50\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 0%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 4.50 cycles. At this rate:\n - 3% of peak load performance is reached (3.56 out of 96.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 11% of peak store performance is reached (7.11 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 4044ec\n\nInstruction                  | Nb FU | P0   | P1   | P2   | P3   | P4 | P5 | P6   | P7   | P8   | P9   | P10  | P11  | P12  | P13  | P14  | Latency | Recip. throughput\n-----------------------------------------------------------------------------------------------------------------------------------------------------------------------\nLDR D10, [X27, #2968]        | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 6       | 0.33\nUCVTF D17, X28               | 1     | 0    | 0    | 0    | 0    | 1  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 3       | 1\nADD X23, X19, #2             | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nADD X22, X19, #3             | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nADD X19, X19, #4             | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nFADD D0, D17, D10            | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 2       | 0.25\nBL <104010c0>                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nFMADD D0, D0, D8, D9         | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 4       | 0.25\nBL <10401240>                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nUCVTF D18, X23               | 1     | 0    | 0    | 0    | 0    | 1  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 3       | 1\nSTR D0, [X20, X28,LSL #3]    | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0    | 2       | 0.50\nFADD D0, D18, D10            | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 2       | 0.25\nBL <104010c0>                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nFMADD D0, D0, D8, D9         | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 4       | 0.25\nBL <10401240>                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nUCVTF D19, X22               | 1     | 0    | 0    | 0    | 0    | 1  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 3       | 1\nSTR D0, [X20, X23,LSL #3]    | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0    | 2       | 0.50\nFADD D0, D19, D10            | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 2       | 0.25\nBL <104010c0>                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nFMADD D0, D0, D8, D9         | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 4       | 0.25\nBL <10401240>                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nUCVTF D20, X19               | 1     | 0    | 0    | 0    | 0    | 1  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 3       | 1\nSTR D0, [X20, X22,LSL #3]    | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0    | 2       | 0.50\nFADD D0, D20, D10            | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 2       | 0.25\nBL <104010c0>                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nFMADD D0, D0, D8, D9         | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 4       | 0.25\nADD X28, X19, #1             | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nBL <10401240>                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nLDR X4, [X29, #200]          | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 4       | 0.33\nSTR D0, [X20, X19,LSL #3]    | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0    | 2       | 0.50\nCMP X28, X4                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.33\nB.NE 404488 <_Z4initv+0x200> | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.50\n",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "16% of peak computational performance is used (2.67 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 4.50 to 2.00 cycles (2.25x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All VPU instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n4 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 4.50 to 1.12 cycles (4.00x speedup).",
        },
      },
      potential = {
        {
          title = "Expensive FP math instructions/calls",
          txt = "Detected performance impact from expensive FP math instructions/calls.\nBy removing/reexpressing them, you can lower the cost of an iteration from 4.50 to 4.00 cycles (1.12x speedup).",
        },
        {
          title = "FMA",
          txt = "Detected 4 FMA (fused multiply-add) operations.",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements.",
          details = " - UCVTF: 4 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 12 FP arithmetical operations:\n - 8: addition or subtraction (4 inside FMA instructions)\n - 4: multiply (all inside FMA instructions)\nThe binary loop is loading 16 bytes.\nThe binary loop is storing 32 bytes.",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.25 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 32\nloop length        : 128\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "FIT IN UOP CACHE\nfront end: 4.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7   | P8   | P9   | P10  | P11  | P12  | P13  | P14\n---------------------------------------------------------------------------------------------------------------\nuops   | 4.50 | 4.50 | 2.50 | 2.50 | 4.00 | 0.00 | 3.00 | 3.00 | 3.00 | 3.00 | 2.00 | 2.00 | 2.00 | 4.00 | 4.00\ncycles | 4.50 | 4.50 | 2.50 | 2.50 | 4.00 | 0.00 | 3.00 | 3.00 | 3.00 | 3.00 | 2.00 | 2.00 | 2.00 | 4.00 | 4.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 4.00\nData deps.: 1.00\nOverall L1: 4.50\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 0%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 4.50 cycles. At this rate:\n - 3% of peak load performance is reached (3.56 out of 96.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 11% of peak store performance is reached (7.11 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 4044ec\n\nInstruction                  | Nb FU | P0   | P1   | P2   | P3   | P4 | P5 | P6   | P7   | P8   | P9   | P10  | P11  | P12  | P13  | P14  | Latency | Recip. throughput\n-----------------------------------------------------------------------------------------------------------------------------------------------------------------------\nLDR D10, [X27, #2968]        | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 6       | 0.33\nUCVTF D17, X28               | 1     | 0    | 0    | 0    | 0    | 1  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 3       | 1\nADD X23, X19, #2             | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nADD X22, X19, #3             | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nADD X19, X19, #4             | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nFADD D0, D17, D10            | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 2       | 0.25\nBL <104010c0>                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nFMADD D0, D0, D8, D9         | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 4       | 0.25\nBL <10401240>                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nUCVTF D18, X23               | 1     | 0    | 0    | 0    | 0    | 1  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 3       | 1\nSTR D0, [X20, X28,LSL #3]    | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0    | 2       | 0.50\nFADD D0, D18, D10            | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 2       | 0.25\nBL <104010c0>                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nFMADD D0, D0, D8, D9         | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 4       | 0.25\nBL <10401240>                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nUCVTF D19, X22               | 1     | 0    | 0    | 0    | 0    | 1  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 3       | 1\nSTR D0, [X20, X23,LSL #3]    | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0    | 2       | 0.50\nFADD D0, D19, D10            | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 2       | 0.25\nBL <104010c0>                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nFMADD D0, D0, D8, D9         | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 4       | 0.25\nBL <10401240>                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nUCVTF D20, X19               | 1     | 0    | 0    | 0    | 0    | 1  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 3       | 1\nSTR D0, [X20, X22,LSL #3]    | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0    | 2       | 0.50\nFADD D0, D20, D10            | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 2       | 0.25\nBL <104010c0>                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nFMADD D0, D0, D8, D9         | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 4       | 0.25\nADD X28, X19, #1             | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nBL <10401240>                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nLDR X4, [X29, #200]          | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 4       | 0.33\nSTR D0, [X20, X19,LSL #3]    | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0    | 2       | 0.50\nCMP X28, X4                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.33\nB.NE 404488 <_Z4initv+0x200> | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.50\n",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "16% of peak computational performance is used (2.67 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 4.50 to 2.00 cycles (2.25x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All VPU instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n4 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 4.50 to 1.12 cycles (4.00x speedup).",
        },
      },
      potential = {
        {
          title = "Expensive FP math instructions/calls",
          txt = "Detected performance impact from expensive FP math instructions/calls.\nBy removing/reexpressing them, you can lower the cost of an iteration from 4.50 to 4.00 cycles (1.12x speedup).",
        },
        {
          title = "FMA",
          txt = "Detected 4 FMA (fused multiply-add) operations.",
        },
      },
    },
  common = {
    header = {
      "",
    },
    nb_paths = 1,
  },
}

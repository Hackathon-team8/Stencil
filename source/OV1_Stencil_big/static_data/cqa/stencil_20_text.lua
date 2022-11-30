_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop does not contain any FP arithmetical operations.\nThe binary loop is storing 128 bytes.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 16\nloop length        : 64\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "FIT IN UOP CACHE\nfront end: 2.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7   | P8   | P9   | P10  | P11  | P12  | P13  | P14\n---------------------------------------------------------------------------------------------------------------\nuops   | 0.50 | 0.50 | 3.50 | 3.50 | 0.00 | 0.00 | 4.00 | 4.00 | 0.00 | 0.00 | 4.00 | 4.00 | 0.00 | 0.00 | 0.00\ncycles | 0.50 | 0.50 | 3.50 | 3.50 | 0.00 | 0.00 | 4.00 | 4.00 | 0.00 | 0.00 | 4.00 | 4.00 | 0.00 | 0.00 | 0.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 2.00\nData deps.: 1.00\nOverall L1: 4.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 88%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : 100%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 0%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 4.00 cycles. At this rate:\n - 50% of peak store performance is reached (32.00 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 4046a4\n\nInstruction                  | Nb FU | P0   | P1   | P2   | P3   | P4 | P5 | P6   | P7   | P8 | P9 | P10  | P11  | P12 | P13 | P14 | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------------------------------------------------------\nADD X24, X0, #1              | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0  | 0  | 0    | 0    | 0   | 0   | 0   | 1       | 0.25\nUBFM X1, X0, #60, #59        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0  | 0  | 0    | 0    | 0   | 0   | 0   | 1       | 0.25\nADD X25, X8, X0,LSL #4       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0  | 0  | 0    | 0    | 0   | 0   | 0   | 1       | 0.25\nUBFM X3, X24, #60, #59       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0  | 0  | 0    | 0    | 0   | 0   | 0   | 1       | 0.25\nADD X2, X8, X24,LSL #4       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0  | 0  | 0    | 0    | 0   | 0   | 0   | 1       | 0.25\nADD X0, X0, #8               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0  | 0  | 0    | 0    | 0   | 0   | 0   | 1       | 0.25\nSTR Q21, [X8, X1]            | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0.50 | 0.50 | 0   | 0   | 0   | 2       | 0.50\nCMP X0, X30                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0  | 0  | 0    | 0    | 0   | 0   | 0   | 1       | 0.33\nSTR Q21, [X8, X3]            | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0.50 | 0.50 | 0   | 0   | 0   | 2       | 0.50\nSTR Q21, [X2, #16]           | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0.50 | 0.50 | 0   | 0   | 0   | 2       | 0.50\nSTR Q21, [X25, #48]          | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0.50 | 0.50 | 0   | 0   | 0   | 2       | 0.50\nSTR Q21, [X25, #64]          | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0.50 | 0.50 | 0   | 0   | 0   | 2       | 0.50\nSTR Q21, [X25, #80]          | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0.50 | 0.50 | 0   | 0   | 0   | 2       | 0.50\nSTR Q21, [X25, #96]          | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0.50 | 0.50 | 0   | 0   | 0   | 2       | 0.50\nSTR Q21, [X25, #112]         | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0.50 | 0.50 | 0   | 0   | 0   | 2       | 0.50\nB.CC 4046a4 <_Z4initv+0x41c> | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0  | 0  | 0    | 0    | 0   | 0   | 0   | 1       | 0.50\n",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "88% of VPU instructions are used in vector version (process two or more data elements in vector registers):\n - 0% of VPU addition or subtraction instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\nOnly 47% of vector register length is used (average across all VPU instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 4.00 to 2.00 cycles (2.00x speedup).",
        },
      },
      potential = {
      },
    },
  },
  AVG = {
      hint = {
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop does not contain any FP arithmetical operations.\nThe binary loop is storing 128 bytes.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 16\nloop length        : 64\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "FIT IN UOP CACHE\nfront end: 2.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7   | P8   | P9   | P10  | P11  | P12  | P13  | P14\n---------------------------------------------------------------------------------------------------------------\nuops   | 0.50 | 0.50 | 3.50 | 3.50 | 0.00 | 0.00 | 4.00 | 4.00 | 0.00 | 0.00 | 4.00 | 4.00 | 0.00 | 0.00 | 0.00\ncycles | 0.50 | 0.50 | 3.50 | 3.50 | 0.00 | 0.00 | 4.00 | 4.00 | 0.00 | 0.00 | 4.00 | 4.00 | 0.00 | 0.00 | 0.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 2.00\nData deps.: 1.00\nOverall L1: 4.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 88%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : 100%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 0%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 4.00 cycles. At this rate:\n - 50% of peak store performance is reached (32.00 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 4046a4\n\nInstruction                  | Nb FU | P0   | P1   | P2   | P3   | P4 | P5 | P6   | P7   | P8 | P9 | P10  | P11  | P12 | P13 | P14 | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------------------------------------------------------\nADD X24, X0, #1              | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0  | 0  | 0    | 0    | 0   | 0   | 0   | 1       | 0.25\nUBFM X1, X0, #60, #59        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0  | 0  | 0    | 0    | 0   | 0   | 0   | 1       | 0.25\nADD X25, X8, X0,LSL #4       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0  | 0  | 0    | 0    | 0   | 0   | 0   | 1       | 0.25\nUBFM X3, X24, #60, #59       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0  | 0  | 0    | 0    | 0   | 0   | 0   | 1       | 0.25\nADD X2, X8, X24,LSL #4       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0  | 0  | 0    | 0    | 0   | 0   | 0   | 1       | 0.25\nADD X0, X0, #8               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0  | 0  | 0    | 0    | 0   | 0   | 0   | 1       | 0.25\nSTR Q21, [X8, X1]            | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0.50 | 0.50 | 0   | 0   | 0   | 2       | 0.50\nCMP X0, X30                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0    | 0    | 0  | 0  | 0    | 0    | 0   | 0   | 0   | 1       | 0.33\nSTR Q21, [X8, X3]            | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0.50 | 0.50 | 0   | 0   | 0   | 2       | 0.50\nSTR Q21, [X2, #16]           | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0.50 | 0.50 | 0   | 0   | 0   | 2       | 0.50\nSTR Q21, [X25, #48]          | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0.50 | 0.50 | 0   | 0   | 0   | 2       | 0.50\nSTR Q21, [X25, #64]          | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0.50 | 0.50 | 0   | 0   | 0   | 2       | 0.50\nSTR Q21, [X25, #80]          | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0.50 | 0.50 | 0   | 0   | 0   | 2       | 0.50\nSTR Q21, [X25, #96]          | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0.50 | 0.50 | 0   | 0   | 0   | 2       | 0.50\nSTR Q21, [X25, #112]         | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0.50 | 0.50 | 0  | 0  | 0.50 | 0.50 | 0   | 0   | 0   | 2       | 0.50\nB.CC 4046a4 <_Z4initv+0x41c> | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0    | 0    | 0  | 0  | 0    | 0    | 0   | 0   | 0   | 1       | 0.50\n",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "88% of VPU instructions are used in vector version (process two or more data elements in vector registers):\n - 0% of VPU addition or subtraction instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\nOnly 47% of vector register length is used (average across all VPU instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 4.00 to 2.00 cycles (2.00x speedup).",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "",
    },
    nb_paths = 1,
  },
}

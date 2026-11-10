# 디지털논리회로설계 VHDL Assignment 3

2023010064 임주언 (로봇공학과)

## 파일 구성

| 파일 | 내용 |
|---|---|
| `p1_rs_latch.vhd` | 1. RS 래치 |
| `p2_d_latch.vhd` | 2. D 래치 (en) |
| `p3_d_ff.vhd` | 3. 상승 에지 D 플립플롭 |
| `p4_jk_ff.vhd` | 4. 상승 에지 JK 플립플롭 |
| `p5_d_ff_sc.vhd` | 5. 비동기 set/clr D 플립플롭 (clr 우선) |
| `tb_*.vhd` | Questa 시뮬레이션용 테스트벤치 |
| `assignment3.circ` | Logisim 회로 (pN_..._gate: 게이트 구현, pN_..._vhdl: VHDL 구현) |
| `quartus/` | 합성용 Quartus Prime Lite 프로젝트 |
| `captures/` | Logisim, Questa 파형, RTL Viewer 캡처 |
| `2023010064_임주언_VHDL_Assignment3.pdf` | 보고서 |

## 사용 프로그램

- Logisim-evolution 5.0.0
- Questa FPGA Starter Edition
- Quartus Prime Lite 25.1 (MAX 10, 10M08SAE144C8G)

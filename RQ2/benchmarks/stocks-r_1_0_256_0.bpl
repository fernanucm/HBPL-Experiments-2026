:- hypothetical(true).
:- weak_unification(a3).
:- indexing(false).

% Proximity relation matrix inducing a fully connected transitive component
middle ~ old = 0.5.
young ~ middle = 0.62.

% Scaled Database Facts (N = 0)
middle(paul).
old(mary).

shareholder(paul, google).
shareholder(paul, greek_bonds).
shareholder(mary, google).

stock_up(google) with 0.9.
stock_up(greek_bonds) with 0.2.

% Core Rules
keep_stock(Name, Stock) :- shareholder(Name, Stock), (stock_up(Stock); young(Name)).
sell_stock(Name, Stock) :- shareholder(Name, Stock), stock_down(Stock), old(Name).

% Entry point for hypothetical rules
invest(Name, Stock) :- invest_1(Name, Stock).

% Chained operational rules (H = 256)
invest_1(Name, Stock) :- 
    shareholder(Name, stock_1) => 
    (stock_up(stock_1) with 0.6) => 
    invest_2(Name, Stock).

invest_2(Name, Stock) :- 
    shareholder(Name, stock_2) => 
    (stock_up(stock_2) with 0.6) => 
    invest_3(Name, Stock).

invest_3(Name, Stock) :- 
    shareholder(Name, stock_3) => 
    (stock_up(stock_3) with 0.7) => 
    invest_4(Name, Stock).

invest_4(Name, Stock) :- 
    shareholder(Name, stock_4) => 
    (stock_up(stock_4) with 0.7) => 
    invest_5(Name, Stock).

invest_5(Name, Stock) :- 
    shareholder(Name, stock_5) => 
    (stock_up(stock_5) with 0.5) => 
    invest_6(Name, Stock).

invest_6(Name, Stock) :- 
    shareholder(Name, stock_6) => 
    (stock_up(stock_6) with 0.6) => 
    invest_7(Name, Stock).

invest_7(Name, Stock) :- 
    shareholder(Name, stock_7) => 
    (stock_up(stock_7) with 0.6) => 
    invest_8(Name, Stock).

invest_8(Name, Stock) :- 
    shareholder(Name, stock_8) => 
    (stock_up(stock_8) with 0.7) => 
    invest_9(Name, Stock).

invest_9(Name, Stock) :- 
    shareholder(Name, stock_9) => 
    (stock_up(stock_9) with 0.7) => 
    invest_10(Name, Stock).

invest_10(Name, Stock) :- 
    shareholder(Name, stock_10) => 
    (stock_up(stock_10) with 0.5) => 
    invest_11(Name, Stock).

invest_11(Name, Stock) :- 
    shareholder(Name, stock_11) => 
    (stock_up(stock_11) with 0.6) => 
    invest_12(Name, Stock).

invest_12(Name, Stock) :- 
    shareholder(Name, stock_12) => 
    (stock_up(stock_12) with 0.6) => 
    invest_13(Name, Stock).

invest_13(Name, Stock) :- 
    shareholder(Name, stock_13) => 
    (stock_up(stock_13) with 0.7) => 
    invest_14(Name, Stock).

invest_14(Name, Stock) :- 
    shareholder(Name, stock_14) => 
    (stock_up(stock_14) with 0.7) => 
    invest_15(Name, Stock).

invest_15(Name, Stock) :- 
    shareholder(Name, stock_15) => 
    (stock_up(stock_15) with 0.5) => 
    invest_16(Name, Stock).

invest_16(Name, Stock) :- 
    shareholder(Name, stock_16) => 
    (stock_up(stock_16) with 0.6) => 
    invest_17(Name, Stock).

invest_17(Name, Stock) :- 
    shareholder(Name, stock_17) => 
    (stock_up(stock_17) with 0.6) => 
    invest_18(Name, Stock).

invest_18(Name, Stock) :- 
    shareholder(Name, stock_18) => 
    (stock_up(stock_18) with 0.7) => 
    invest_19(Name, Stock).

invest_19(Name, Stock) :- 
    shareholder(Name, stock_19) => 
    (stock_up(stock_19) with 0.7) => 
    invest_20(Name, Stock).

invest_20(Name, Stock) :- 
    shareholder(Name, stock_20) => 
    (stock_up(stock_20) with 0.5) => 
    invest_21(Name, Stock).

invest_21(Name, Stock) :- 
    shareholder(Name, stock_21) => 
    (stock_up(stock_21) with 0.6) => 
    invest_22(Name, Stock).

invest_22(Name, Stock) :- 
    shareholder(Name, stock_22) => 
    (stock_up(stock_22) with 0.6) => 
    invest_23(Name, Stock).

invest_23(Name, Stock) :- 
    shareholder(Name, stock_23) => 
    (stock_up(stock_23) with 0.7) => 
    invest_24(Name, Stock).

invest_24(Name, Stock) :- 
    shareholder(Name, stock_24) => 
    (stock_up(stock_24) with 0.7) => 
    invest_25(Name, Stock).

invest_25(Name, Stock) :- 
    shareholder(Name, stock_25) => 
    (stock_up(stock_25) with 0.5) => 
    invest_26(Name, Stock).

invest_26(Name, Stock) :- 
    shareholder(Name, stock_26) => 
    (stock_up(stock_26) with 0.6) => 
    invest_27(Name, Stock).

invest_27(Name, Stock) :- 
    shareholder(Name, stock_27) => 
    (stock_up(stock_27) with 0.6) => 
    invest_28(Name, Stock).

invest_28(Name, Stock) :- 
    shareholder(Name, stock_28) => 
    (stock_up(stock_28) with 0.7) => 
    invest_29(Name, Stock).

invest_29(Name, Stock) :- 
    shareholder(Name, stock_29) => 
    (stock_up(stock_29) with 0.7) => 
    invest_30(Name, Stock).

invest_30(Name, Stock) :- 
    shareholder(Name, stock_30) => 
    (stock_up(stock_30) with 0.5) => 
    invest_31(Name, Stock).

invest_31(Name, Stock) :- 
    shareholder(Name, stock_31) => 
    (stock_up(stock_31) with 0.6) => 
    invest_32(Name, Stock).

invest_32(Name, Stock) :- 
    shareholder(Name, stock_32) => 
    (stock_up(stock_32) with 0.6) => 
    invest_33(Name, Stock).

invest_33(Name, Stock) :- 
    shareholder(Name, stock_33) => 
    (stock_up(stock_33) with 0.7) => 
    invest_34(Name, Stock).

invest_34(Name, Stock) :- 
    shareholder(Name, stock_34) => 
    (stock_up(stock_34) with 0.7) => 
    invest_35(Name, Stock).

invest_35(Name, Stock) :- 
    shareholder(Name, stock_35) => 
    (stock_up(stock_35) with 0.5) => 
    invest_36(Name, Stock).

invest_36(Name, Stock) :- 
    shareholder(Name, stock_36) => 
    (stock_up(stock_36) with 0.6) => 
    invest_37(Name, Stock).

invest_37(Name, Stock) :- 
    shareholder(Name, stock_37) => 
    (stock_up(stock_37) with 0.6) => 
    invest_38(Name, Stock).

invest_38(Name, Stock) :- 
    shareholder(Name, stock_38) => 
    (stock_up(stock_38) with 0.7) => 
    invest_39(Name, Stock).

invest_39(Name, Stock) :- 
    shareholder(Name, stock_39) => 
    (stock_up(stock_39) with 0.7) => 
    invest_40(Name, Stock).

invest_40(Name, Stock) :- 
    shareholder(Name, stock_40) => 
    (stock_up(stock_40) with 0.5) => 
    invest_41(Name, Stock).

invest_41(Name, Stock) :- 
    shareholder(Name, stock_41) => 
    (stock_up(stock_41) with 0.6) => 
    invest_42(Name, Stock).

invest_42(Name, Stock) :- 
    shareholder(Name, stock_42) => 
    (stock_up(stock_42) with 0.6) => 
    invest_43(Name, Stock).

invest_43(Name, Stock) :- 
    shareholder(Name, stock_43) => 
    (stock_up(stock_43) with 0.7) => 
    invest_44(Name, Stock).

invest_44(Name, Stock) :- 
    shareholder(Name, stock_44) => 
    (stock_up(stock_44) with 0.7) => 
    invest_45(Name, Stock).

invest_45(Name, Stock) :- 
    shareholder(Name, stock_45) => 
    (stock_up(stock_45) with 0.5) => 
    invest_46(Name, Stock).

invest_46(Name, Stock) :- 
    shareholder(Name, stock_46) => 
    (stock_up(stock_46) with 0.6) => 
    invest_47(Name, Stock).

invest_47(Name, Stock) :- 
    shareholder(Name, stock_47) => 
    (stock_up(stock_47) with 0.6) => 
    invest_48(Name, Stock).

invest_48(Name, Stock) :- 
    shareholder(Name, stock_48) => 
    (stock_up(stock_48) with 0.7) => 
    invest_49(Name, Stock).

invest_49(Name, Stock) :- 
    shareholder(Name, stock_49) => 
    (stock_up(stock_49) with 0.7) => 
    invest_50(Name, Stock).

invest_50(Name, Stock) :- 
    shareholder(Name, stock_50) => 
    (stock_up(stock_50) with 0.5) => 
    invest_51(Name, Stock).

invest_51(Name, Stock) :- 
    shareholder(Name, stock_51) => 
    (stock_up(stock_51) with 0.6) => 
    invest_52(Name, Stock).

invest_52(Name, Stock) :- 
    shareholder(Name, stock_52) => 
    (stock_up(stock_52) with 0.6) => 
    invest_53(Name, Stock).

invest_53(Name, Stock) :- 
    shareholder(Name, stock_53) => 
    (stock_up(stock_53) with 0.7) => 
    invest_54(Name, Stock).

invest_54(Name, Stock) :- 
    shareholder(Name, stock_54) => 
    (stock_up(stock_54) with 0.7) => 
    invest_55(Name, Stock).

invest_55(Name, Stock) :- 
    shareholder(Name, stock_55) => 
    (stock_up(stock_55) with 0.5) => 
    invest_56(Name, Stock).

invest_56(Name, Stock) :- 
    shareholder(Name, stock_56) => 
    (stock_up(stock_56) with 0.6) => 
    invest_57(Name, Stock).

invest_57(Name, Stock) :- 
    shareholder(Name, stock_57) => 
    (stock_up(stock_57) with 0.6) => 
    invest_58(Name, Stock).

invest_58(Name, Stock) :- 
    shareholder(Name, stock_58) => 
    (stock_up(stock_58) with 0.7) => 
    invest_59(Name, Stock).

invest_59(Name, Stock) :- 
    shareholder(Name, stock_59) => 
    (stock_up(stock_59) with 0.7) => 
    invest_60(Name, Stock).

invest_60(Name, Stock) :- 
    shareholder(Name, stock_60) => 
    (stock_up(stock_60) with 0.5) => 
    invest_61(Name, Stock).

invest_61(Name, Stock) :- 
    shareholder(Name, stock_61) => 
    (stock_up(stock_61) with 0.6) => 
    invest_62(Name, Stock).

invest_62(Name, Stock) :- 
    shareholder(Name, stock_62) => 
    (stock_up(stock_62) with 0.6) => 
    invest_63(Name, Stock).

invest_63(Name, Stock) :- 
    shareholder(Name, stock_63) => 
    (stock_up(stock_63) with 0.7) => 
    invest_64(Name, Stock).

invest_64(Name, Stock) :- 
    shareholder(Name, stock_64) => 
    (stock_up(stock_64) with 0.7) => 
    invest_65(Name, Stock).

invest_65(Name, Stock) :- 
    shareholder(Name, stock_65) => 
    (stock_up(stock_65) with 0.5) => 
    invest_66(Name, Stock).

invest_66(Name, Stock) :- 
    shareholder(Name, stock_66) => 
    (stock_up(stock_66) with 0.6) => 
    invest_67(Name, Stock).

invest_67(Name, Stock) :- 
    shareholder(Name, stock_67) => 
    (stock_up(stock_67) with 0.6) => 
    invest_68(Name, Stock).

invest_68(Name, Stock) :- 
    shareholder(Name, stock_68) => 
    (stock_up(stock_68) with 0.7) => 
    invest_69(Name, Stock).

invest_69(Name, Stock) :- 
    shareholder(Name, stock_69) => 
    (stock_up(stock_69) with 0.7) => 
    invest_70(Name, Stock).

invest_70(Name, Stock) :- 
    shareholder(Name, stock_70) => 
    (stock_up(stock_70) with 0.5) => 
    invest_71(Name, Stock).

invest_71(Name, Stock) :- 
    shareholder(Name, stock_71) => 
    (stock_up(stock_71) with 0.6) => 
    invest_72(Name, Stock).

invest_72(Name, Stock) :- 
    shareholder(Name, stock_72) => 
    (stock_up(stock_72) with 0.6) => 
    invest_73(Name, Stock).

invest_73(Name, Stock) :- 
    shareholder(Name, stock_73) => 
    (stock_up(stock_73) with 0.7) => 
    invest_74(Name, Stock).

invest_74(Name, Stock) :- 
    shareholder(Name, stock_74) => 
    (stock_up(stock_74) with 0.7) => 
    invest_75(Name, Stock).

invest_75(Name, Stock) :- 
    shareholder(Name, stock_75) => 
    (stock_up(stock_75) with 0.5) => 
    invest_76(Name, Stock).

invest_76(Name, Stock) :- 
    shareholder(Name, stock_76) => 
    (stock_up(stock_76) with 0.6) => 
    invest_77(Name, Stock).

invest_77(Name, Stock) :- 
    shareholder(Name, stock_77) => 
    (stock_up(stock_77) with 0.6) => 
    invest_78(Name, Stock).

invest_78(Name, Stock) :- 
    shareholder(Name, stock_78) => 
    (stock_up(stock_78) with 0.7) => 
    invest_79(Name, Stock).

invest_79(Name, Stock) :- 
    shareholder(Name, stock_79) => 
    (stock_up(stock_79) with 0.7) => 
    invest_80(Name, Stock).

invest_80(Name, Stock) :- 
    shareholder(Name, stock_80) => 
    (stock_up(stock_80) with 0.5) => 
    invest_81(Name, Stock).

invest_81(Name, Stock) :- 
    shareholder(Name, stock_81) => 
    (stock_up(stock_81) with 0.6) => 
    invest_82(Name, Stock).

invest_82(Name, Stock) :- 
    shareholder(Name, stock_82) => 
    (stock_up(stock_82) with 0.6) => 
    invest_83(Name, Stock).

invest_83(Name, Stock) :- 
    shareholder(Name, stock_83) => 
    (stock_up(stock_83) with 0.7) => 
    invest_84(Name, Stock).

invest_84(Name, Stock) :- 
    shareholder(Name, stock_84) => 
    (stock_up(stock_84) with 0.7) => 
    invest_85(Name, Stock).

invest_85(Name, Stock) :- 
    shareholder(Name, stock_85) => 
    (stock_up(stock_85) with 0.5) => 
    invest_86(Name, Stock).

invest_86(Name, Stock) :- 
    shareholder(Name, stock_86) => 
    (stock_up(stock_86) with 0.6) => 
    invest_87(Name, Stock).

invest_87(Name, Stock) :- 
    shareholder(Name, stock_87) => 
    (stock_up(stock_87) with 0.6) => 
    invest_88(Name, Stock).

invest_88(Name, Stock) :- 
    shareholder(Name, stock_88) => 
    (stock_up(stock_88) with 0.7) => 
    invest_89(Name, Stock).

invest_89(Name, Stock) :- 
    shareholder(Name, stock_89) => 
    (stock_up(stock_89) with 0.7) => 
    invest_90(Name, Stock).

invest_90(Name, Stock) :- 
    shareholder(Name, stock_90) => 
    (stock_up(stock_90) with 0.5) => 
    invest_91(Name, Stock).

invest_91(Name, Stock) :- 
    shareholder(Name, stock_91) => 
    (stock_up(stock_91) with 0.6) => 
    invest_92(Name, Stock).

invest_92(Name, Stock) :- 
    shareholder(Name, stock_92) => 
    (stock_up(stock_92) with 0.6) => 
    invest_93(Name, Stock).

invest_93(Name, Stock) :- 
    shareholder(Name, stock_93) => 
    (stock_up(stock_93) with 0.7) => 
    invest_94(Name, Stock).

invest_94(Name, Stock) :- 
    shareholder(Name, stock_94) => 
    (stock_up(stock_94) with 0.7) => 
    invest_95(Name, Stock).

invest_95(Name, Stock) :- 
    shareholder(Name, stock_95) => 
    (stock_up(stock_95) with 0.5) => 
    invest_96(Name, Stock).

invest_96(Name, Stock) :- 
    shareholder(Name, stock_96) => 
    (stock_up(stock_96) with 0.6) => 
    invest_97(Name, Stock).

invest_97(Name, Stock) :- 
    shareholder(Name, stock_97) => 
    (stock_up(stock_97) with 0.6) => 
    invest_98(Name, Stock).

invest_98(Name, Stock) :- 
    shareholder(Name, stock_98) => 
    (stock_up(stock_98) with 0.7) => 
    invest_99(Name, Stock).

invest_99(Name, Stock) :- 
    shareholder(Name, stock_99) => 
    (stock_up(stock_99) with 0.7) => 
    invest_100(Name, Stock).

invest_100(Name, Stock) :- 
    shareholder(Name, stock_100) => 
    (stock_up(stock_100) with 0.5) => 
    invest_101(Name, Stock).

invest_101(Name, Stock) :- 
    shareholder(Name, stock_101) => 
    (stock_up(stock_101) with 0.6) => 
    invest_102(Name, Stock).

invest_102(Name, Stock) :- 
    shareholder(Name, stock_102) => 
    (stock_up(stock_102) with 0.6) => 
    invest_103(Name, Stock).

invest_103(Name, Stock) :- 
    shareholder(Name, stock_103) => 
    (stock_up(stock_103) with 0.7) => 
    invest_104(Name, Stock).

invest_104(Name, Stock) :- 
    shareholder(Name, stock_104) => 
    (stock_up(stock_104) with 0.7) => 
    invest_105(Name, Stock).

invest_105(Name, Stock) :- 
    shareholder(Name, stock_105) => 
    (stock_up(stock_105) with 0.5) => 
    invest_106(Name, Stock).

invest_106(Name, Stock) :- 
    shareholder(Name, stock_106) => 
    (stock_up(stock_106) with 0.6) => 
    invest_107(Name, Stock).

invest_107(Name, Stock) :- 
    shareholder(Name, stock_107) => 
    (stock_up(stock_107) with 0.6) => 
    invest_108(Name, Stock).

invest_108(Name, Stock) :- 
    shareholder(Name, stock_108) => 
    (stock_up(stock_108) with 0.7) => 
    invest_109(Name, Stock).

invest_109(Name, Stock) :- 
    shareholder(Name, stock_109) => 
    (stock_up(stock_109) with 0.7) => 
    invest_110(Name, Stock).

invest_110(Name, Stock) :- 
    shareholder(Name, stock_110) => 
    (stock_up(stock_110) with 0.5) => 
    invest_111(Name, Stock).

invest_111(Name, Stock) :- 
    shareholder(Name, stock_111) => 
    (stock_up(stock_111) with 0.6) => 
    invest_112(Name, Stock).

invest_112(Name, Stock) :- 
    shareholder(Name, stock_112) => 
    (stock_up(stock_112) with 0.6) => 
    invest_113(Name, Stock).

invest_113(Name, Stock) :- 
    shareholder(Name, stock_113) => 
    (stock_up(stock_113) with 0.7) => 
    invest_114(Name, Stock).

invest_114(Name, Stock) :- 
    shareholder(Name, stock_114) => 
    (stock_up(stock_114) with 0.7) => 
    invest_115(Name, Stock).

invest_115(Name, Stock) :- 
    shareholder(Name, stock_115) => 
    (stock_up(stock_115) with 0.5) => 
    invest_116(Name, Stock).

invest_116(Name, Stock) :- 
    shareholder(Name, stock_116) => 
    (stock_up(stock_116) with 0.6) => 
    invest_117(Name, Stock).

invest_117(Name, Stock) :- 
    shareholder(Name, stock_117) => 
    (stock_up(stock_117) with 0.6) => 
    invest_118(Name, Stock).

invest_118(Name, Stock) :- 
    shareholder(Name, stock_118) => 
    (stock_up(stock_118) with 0.7) => 
    invest_119(Name, Stock).

invest_119(Name, Stock) :- 
    shareholder(Name, stock_119) => 
    (stock_up(stock_119) with 0.7) => 
    invest_120(Name, Stock).

invest_120(Name, Stock) :- 
    shareholder(Name, stock_120) => 
    (stock_up(stock_120) with 0.5) => 
    invest_121(Name, Stock).

invest_121(Name, Stock) :- 
    shareholder(Name, stock_121) => 
    (stock_up(stock_121) with 0.6) => 
    invest_122(Name, Stock).

invest_122(Name, Stock) :- 
    shareholder(Name, stock_122) => 
    (stock_up(stock_122) with 0.6) => 
    invest_123(Name, Stock).

invest_123(Name, Stock) :- 
    shareholder(Name, stock_123) => 
    (stock_up(stock_123) with 0.7) => 
    invest_124(Name, Stock).

invest_124(Name, Stock) :- 
    shareholder(Name, stock_124) => 
    (stock_up(stock_124) with 0.7) => 
    invest_125(Name, Stock).

invest_125(Name, Stock) :- 
    shareholder(Name, stock_125) => 
    (stock_up(stock_125) with 0.5) => 
    invest_126(Name, Stock).

invest_126(Name, Stock) :- 
    shareholder(Name, stock_126) => 
    (stock_up(stock_126) with 0.6) => 
    invest_127(Name, Stock).

invest_127(Name, Stock) :- 
    shareholder(Name, stock_127) => 
    (stock_up(stock_127) with 0.6) => 
    invest_128(Name, Stock).

invest_128(Name, Stock) :- 
    shareholder(Name, stock_128) => 
    (stock_up(stock_128) with 0.7) => 
    invest_129(Name, Stock).

invest_129(Name, Stock) :- 
    shareholder(Name, stock_129) => 
    (stock_up(stock_129) with 0.7) => 
    invest_130(Name, Stock).

invest_130(Name, Stock) :- 
    shareholder(Name, stock_130) => 
    (stock_up(stock_130) with 0.5) => 
    invest_131(Name, Stock).

invest_131(Name, Stock) :- 
    shareholder(Name, stock_131) => 
    (stock_up(stock_131) with 0.6) => 
    invest_132(Name, Stock).

invest_132(Name, Stock) :- 
    shareholder(Name, stock_132) => 
    (stock_up(stock_132) with 0.6) => 
    invest_133(Name, Stock).

invest_133(Name, Stock) :- 
    shareholder(Name, stock_133) => 
    (stock_up(stock_133) with 0.7) => 
    invest_134(Name, Stock).

invest_134(Name, Stock) :- 
    shareholder(Name, stock_134) => 
    (stock_up(stock_134) with 0.7) => 
    invest_135(Name, Stock).

invest_135(Name, Stock) :- 
    shareholder(Name, stock_135) => 
    (stock_up(stock_135) with 0.5) => 
    invest_136(Name, Stock).

invest_136(Name, Stock) :- 
    shareholder(Name, stock_136) => 
    (stock_up(stock_136) with 0.6) => 
    invest_137(Name, Stock).

invest_137(Name, Stock) :- 
    shareholder(Name, stock_137) => 
    (stock_up(stock_137) with 0.6) => 
    invest_138(Name, Stock).

invest_138(Name, Stock) :- 
    shareholder(Name, stock_138) => 
    (stock_up(stock_138) with 0.7) => 
    invest_139(Name, Stock).

invest_139(Name, Stock) :- 
    shareholder(Name, stock_139) => 
    (stock_up(stock_139) with 0.7) => 
    invest_140(Name, Stock).

invest_140(Name, Stock) :- 
    shareholder(Name, stock_140) => 
    (stock_up(stock_140) with 0.5) => 
    invest_141(Name, Stock).

invest_141(Name, Stock) :- 
    shareholder(Name, stock_141) => 
    (stock_up(stock_141) with 0.6) => 
    invest_142(Name, Stock).

invest_142(Name, Stock) :- 
    shareholder(Name, stock_142) => 
    (stock_up(stock_142) with 0.6) => 
    invest_143(Name, Stock).

invest_143(Name, Stock) :- 
    shareholder(Name, stock_143) => 
    (stock_up(stock_143) with 0.7) => 
    invest_144(Name, Stock).

invest_144(Name, Stock) :- 
    shareholder(Name, stock_144) => 
    (stock_up(stock_144) with 0.7) => 
    invest_145(Name, Stock).

invest_145(Name, Stock) :- 
    shareholder(Name, stock_145) => 
    (stock_up(stock_145) with 0.5) => 
    invest_146(Name, Stock).

invest_146(Name, Stock) :- 
    shareholder(Name, stock_146) => 
    (stock_up(stock_146) with 0.6) => 
    invest_147(Name, Stock).

invest_147(Name, Stock) :- 
    shareholder(Name, stock_147) => 
    (stock_up(stock_147) with 0.6) => 
    invest_148(Name, Stock).

invest_148(Name, Stock) :- 
    shareholder(Name, stock_148) => 
    (stock_up(stock_148) with 0.7) => 
    invest_149(Name, Stock).

invest_149(Name, Stock) :- 
    shareholder(Name, stock_149) => 
    (stock_up(stock_149) with 0.7) => 
    invest_150(Name, Stock).

invest_150(Name, Stock) :- 
    shareholder(Name, stock_150) => 
    (stock_up(stock_150) with 0.5) => 
    invest_151(Name, Stock).

invest_151(Name, Stock) :- 
    shareholder(Name, stock_151) => 
    (stock_up(stock_151) with 0.6) => 
    invest_152(Name, Stock).

invest_152(Name, Stock) :- 
    shareholder(Name, stock_152) => 
    (stock_up(stock_152) with 0.6) => 
    invest_153(Name, Stock).

invest_153(Name, Stock) :- 
    shareholder(Name, stock_153) => 
    (stock_up(stock_153) with 0.7) => 
    invest_154(Name, Stock).

invest_154(Name, Stock) :- 
    shareholder(Name, stock_154) => 
    (stock_up(stock_154) with 0.7) => 
    invest_155(Name, Stock).

invest_155(Name, Stock) :- 
    shareholder(Name, stock_155) => 
    (stock_up(stock_155) with 0.5) => 
    invest_156(Name, Stock).

invest_156(Name, Stock) :- 
    shareholder(Name, stock_156) => 
    (stock_up(stock_156) with 0.6) => 
    invest_157(Name, Stock).

invest_157(Name, Stock) :- 
    shareholder(Name, stock_157) => 
    (stock_up(stock_157) with 0.6) => 
    invest_158(Name, Stock).

invest_158(Name, Stock) :- 
    shareholder(Name, stock_158) => 
    (stock_up(stock_158) with 0.7) => 
    invest_159(Name, Stock).

invest_159(Name, Stock) :- 
    shareholder(Name, stock_159) => 
    (stock_up(stock_159) with 0.7) => 
    invest_160(Name, Stock).

invest_160(Name, Stock) :- 
    shareholder(Name, stock_160) => 
    (stock_up(stock_160) with 0.5) => 
    invest_161(Name, Stock).

invest_161(Name, Stock) :- 
    shareholder(Name, stock_161) => 
    (stock_up(stock_161) with 0.6) => 
    invest_162(Name, Stock).

invest_162(Name, Stock) :- 
    shareholder(Name, stock_162) => 
    (stock_up(stock_162) with 0.6) => 
    invest_163(Name, Stock).

invest_163(Name, Stock) :- 
    shareholder(Name, stock_163) => 
    (stock_up(stock_163) with 0.7) => 
    invest_164(Name, Stock).

invest_164(Name, Stock) :- 
    shareholder(Name, stock_164) => 
    (stock_up(stock_164) with 0.7) => 
    invest_165(Name, Stock).

invest_165(Name, Stock) :- 
    shareholder(Name, stock_165) => 
    (stock_up(stock_165) with 0.5) => 
    invest_166(Name, Stock).

invest_166(Name, Stock) :- 
    shareholder(Name, stock_166) => 
    (stock_up(stock_166) with 0.6) => 
    invest_167(Name, Stock).

invest_167(Name, Stock) :- 
    shareholder(Name, stock_167) => 
    (stock_up(stock_167) with 0.6) => 
    invest_168(Name, Stock).

invest_168(Name, Stock) :- 
    shareholder(Name, stock_168) => 
    (stock_up(stock_168) with 0.7) => 
    invest_169(Name, Stock).

invest_169(Name, Stock) :- 
    shareholder(Name, stock_169) => 
    (stock_up(stock_169) with 0.7) => 
    invest_170(Name, Stock).

invest_170(Name, Stock) :- 
    shareholder(Name, stock_170) => 
    (stock_up(stock_170) with 0.5) => 
    invest_171(Name, Stock).

invest_171(Name, Stock) :- 
    shareholder(Name, stock_171) => 
    (stock_up(stock_171) with 0.6) => 
    invest_172(Name, Stock).

invest_172(Name, Stock) :- 
    shareholder(Name, stock_172) => 
    (stock_up(stock_172) with 0.6) => 
    invest_173(Name, Stock).

invest_173(Name, Stock) :- 
    shareholder(Name, stock_173) => 
    (stock_up(stock_173) with 0.7) => 
    invest_174(Name, Stock).

invest_174(Name, Stock) :- 
    shareholder(Name, stock_174) => 
    (stock_up(stock_174) with 0.7) => 
    invest_175(Name, Stock).

invest_175(Name, Stock) :- 
    shareholder(Name, stock_175) => 
    (stock_up(stock_175) with 0.5) => 
    invest_176(Name, Stock).

invest_176(Name, Stock) :- 
    shareholder(Name, stock_176) => 
    (stock_up(stock_176) with 0.6) => 
    invest_177(Name, Stock).

invest_177(Name, Stock) :- 
    shareholder(Name, stock_177) => 
    (stock_up(stock_177) with 0.6) => 
    invest_178(Name, Stock).

invest_178(Name, Stock) :- 
    shareholder(Name, stock_178) => 
    (stock_up(stock_178) with 0.7) => 
    invest_179(Name, Stock).

invest_179(Name, Stock) :- 
    shareholder(Name, stock_179) => 
    (stock_up(stock_179) with 0.7) => 
    invest_180(Name, Stock).

invest_180(Name, Stock) :- 
    shareholder(Name, stock_180) => 
    (stock_up(stock_180) with 0.5) => 
    invest_181(Name, Stock).

invest_181(Name, Stock) :- 
    shareholder(Name, stock_181) => 
    (stock_up(stock_181) with 0.6) => 
    invest_182(Name, Stock).

invest_182(Name, Stock) :- 
    shareholder(Name, stock_182) => 
    (stock_up(stock_182) with 0.6) => 
    invest_183(Name, Stock).

invest_183(Name, Stock) :- 
    shareholder(Name, stock_183) => 
    (stock_up(stock_183) with 0.7) => 
    invest_184(Name, Stock).

invest_184(Name, Stock) :- 
    shareholder(Name, stock_184) => 
    (stock_up(stock_184) with 0.7) => 
    invest_185(Name, Stock).

invest_185(Name, Stock) :- 
    shareholder(Name, stock_185) => 
    (stock_up(stock_185) with 0.5) => 
    invest_186(Name, Stock).

invest_186(Name, Stock) :- 
    shareholder(Name, stock_186) => 
    (stock_up(stock_186) with 0.6) => 
    invest_187(Name, Stock).

invest_187(Name, Stock) :- 
    shareholder(Name, stock_187) => 
    (stock_up(stock_187) with 0.6) => 
    invest_188(Name, Stock).

invest_188(Name, Stock) :- 
    shareholder(Name, stock_188) => 
    (stock_up(stock_188) with 0.7) => 
    invest_189(Name, Stock).

invest_189(Name, Stock) :- 
    shareholder(Name, stock_189) => 
    (stock_up(stock_189) with 0.7) => 
    invest_190(Name, Stock).

invest_190(Name, Stock) :- 
    shareholder(Name, stock_190) => 
    (stock_up(stock_190) with 0.5) => 
    invest_191(Name, Stock).

invest_191(Name, Stock) :- 
    shareholder(Name, stock_191) => 
    (stock_up(stock_191) with 0.6) => 
    invest_192(Name, Stock).

invest_192(Name, Stock) :- 
    shareholder(Name, stock_192) => 
    (stock_up(stock_192) with 0.6) => 
    invest_193(Name, Stock).

invest_193(Name, Stock) :- 
    shareholder(Name, stock_193) => 
    (stock_up(stock_193) with 0.7) => 
    invest_194(Name, Stock).

invest_194(Name, Stock) :- 
    shareholder(Name, stock_194) => 
    (stock_up(stock_194) with 0.7) => 
    invest_195(Name, Stock).

invest_195(Name, Stock) :- 
    shareholder(Name, stock_195) => 
    (stock_up(stock_195) with 0.5) => 
    invest_196(Name, Stock).

invest_196(Name, Stock) :- 
    shareholder(Name, stock_196) => 
    (stock_up(stock_196) with 0.6) => 
    invest_197(Name, Stock).

invest_197(Name, Stock) :- 
    shareholder(Name, stock_197) => 
    (stock_up(stock_197) with 0.6) => 
    invest_198(Name, Stock).

invest_198(Name, Stock) :- 
    shareholder(Name, stock_198) => 
    (stock_up(stock_198) with 0.7) => 
    invest_199(Name, Stock).

invest_199(Name, Stock) :- 
    shareholder(Name, stock_199) => 
    (stock_up(stock_199) with 0.7) => 
    invest_200(Name, Stock).

invest_200(Name, Stock) :- 
    shareholder(Name, stock_200) => 
    (stock_up(stock_200) with 0.5) => 
    invest_201(Name, Stock).

invest_201(Name, Stock) :- 
    shareholder(Name, stock_201) => 
    (stock_up(stock_201) with 0.6) => 
    invest_202(Name, Stock).

invest_202(Name, Stock) :- 
    shareholder(Name, stock_202) => 
    (stock_up(stock_202) with 0.6) => 
    invest_203(Name, Stock).

invest_203(Name, Stock) :- 
    shareholder(Name, stock_203) => 
    (stock_up(stock_203) with 0.7) => 
    invest_204(Name, Stock).

invest_204(Name, Stock) :- 
    shareholder(Name, stock_204) => 
    (stock_up(stock_204) with 0.7) => 
    invest_205(Name, Stock).

invest_205(Name, Stock) :- 
    shareholder(Name, stock_205) => 
    (stock_up(stock_205) with 0.5) => 
    invest_206(Name, Stock).

invest_206(Name, Stock) :- 
    shareholder(Name, stock_206) => 
    (stock_up(stock_206) with 0.6) => 
    invest_207(Name, Stock).

invest_207(Name, Stock) :- 
    shareholder(Name, stock_207) => 
    (stock_up(stock_207) with 0.6) => 
    invest_208(Name, Stock).

invest_208(Name, Stock) :- 
    shareholder(Name, stock_208) => 
    (stock_up(stock_208) with 0.7) => 
    invest_209(Name, Stock).

invest_209(Name, Stock) :- 
    shareholder(Name, stock_209) => 
    (stock_up(stock_209) with 0.7) => 
    invest_210(Name, Stock).

invest_210(Name, Stock) :- 
    shareholder(Name, stock_210) => 
    (stock_up(stock_210) with 0.5) => 
    invest_211(Name, Stock).

invest_211(Name, Stock) :- 
    shareholder(Name, stock_211) => 
    (stock_up(stock_211) with 0.6) => 
    invest_212(Name, Stock).

invest_212(Name, Stock) :- 
    shareholder(Name, stock_212) => 
    (stock_up(stock_212) with 0.6) => 
    invest_213(Name, Stock).

invest_213(Name, Stock) :- 
    shareholder(Name, stock_213) => 
    (stock_up(stock_213) with 0.7) => 
    invest_214(Name, Stock).

invest_214(Name, Stock) :- 
    shareholder(Name, stock_214) => 
    (stock_up(stock_214) with 0.7) => 
    invest_215(Name, Stock).

invest_215(Name, Stock) :- 
    shareholder(Name, stock_215) => 
    (stock_up(stock_215) with 0.5) => 
    invest_216(Name, Stock).

invest_216(Name, Stock) :- 
    shareholder(Name, stock_216) => 
    (stock_up(stock_216) with 0.6) => 
    invest_217(Name, Stock).

invest_217(Name, Stock) :- 
    shareholder(Name, stock_217) => 
    (stock_up(stock_217) with 0.6) => 
    invest_218(Name, Stock).

invest_218(Name, Stock) :- 
    shareholder(Name, stock_218) => 
    (stock_up(stock_218) with 0.7) => 
    invest_219(Name, Stock).

invest_219(Name, Stock) :- 
    shareholder(Name, stock_219) => 
    (stock_up(stock_219) with 0.7) => 
    invest_220(Name, Stock).

invest_220(Name, Stock) :- 
    shareholder(Name, stock_220) => 
    (stock_up(stock_220) with 0.5) => 
    invest_221(Name, Stock).

invest_221(Name, Stock) :- 
    shareholder(Name, stock_221) => 
    (stock_up(stock_221) with 0.6) => 
    invest_222(Name, Stock).

invest_222(Name, Stock) :- 
    shareholder(Name, stock_222) => 
    (stock_up(stock_222) with 0.6) => 
    invest_223(Name, Stock).

invest_223(Name, Stock) :- 
    shareholder(Name, stock_223) => 
    (stock_up(stock_223) with 0.7) => 
    invest_224(Name, Stock).

invest_224(Name, Stock) :- 
    shareholder(Name, stock_224) => 
    (stock_up(stock_224) with 0.7) => 
    invest_225(Name, Stock).

invest_225(Name, Stock) :- 
    shareholder(Name, stock_225) => 
    (stock_up(stock_225) with 0.5) => 
    invest_226(Name, Stock).

invest_226(Name, Stock) :- 
    shareholder(Name, stock_226) => 
    (stock_up(stock_226) with 0.6) => 
    invest_227(Name, Stock).

invest_227(Name, Stock) :- 
    shareholder(Name, stock_227) => 
    (stock_up(stock_227) with 0.6) => 
    invest_228(Name, Stock).

invest_228(Name, Stock) :- 
    shareholder(Name, stock_228) => 
    (stock_up(stock_228) with 0.7) => 
    invest_229(Name, Stock).

invest_229(Name, Stock) :- 
    shareholder(Name, stock_229) => 
    (stock_up(stock_229) with 0.7) => 
    invest_230(Name, Stock).

invest_230(Name, Stock) :- 
    shareholder(Name, stock_230) => 
    (stock_up(stock_230) with 0.5) => 
    invest_231(Name, Stock).

invest_231(Name, Stock) :- 
    shareholder(Name, stock_231) => 
    (stock_up(stock_231) with 0.6) => 
    invest_232(Name, Stock).

invest_232(Name, Stock) :- 
    shareholder(Name, stock_232) => 
    (stock_up(stock_232) with 0.6) => 
    invest_233(Name, Stock).

invest_233(Name, Stock) :- 
    shareholder(Name, stock_233) => 
    (stock_up(stock_233) with 0.7) => 
    invest_234(Name, Stock).

invest_234(Name, Stock) :- 
    shareholder(Name, stock_234) => 
    (stock_up(stock_234) with 0.7) => 
    invest_235(Name, Stock).

invest_235(Name, Stock) :- 
    shareholder(Name, stock_235) => 
    (stock_up(stock_235) with 0.5) => 
    invest_236(Name, Stock).

invest_236(Name, Stock) :- 
    shareholder(Name, stock_236) => 
    (stock_up(stock_236) with 0.6) => 
    invest_237(Name, Stock).

invest_237(Name, Stock) :- 
    shareholder(Name, stock_237) => 
    (stock_up(stock_237) with 0.6) => 
    invest_238(Name, Stock).

invest_238(Name, Stock) :- 
    shareholder(Name, stock_238) => 
    (stock_up(stock_238) with 0.7) => 
    invest_239(Name, Stock).

invest_239(Name, Stock) :- 
    shareholder(Name, stock_239) => 
    (stock_up(stock_239) with 0.7) => 
    invest_240(Name, Stock).

invest_240(Name, Stock) :- 
    shareholder(Name, stock_240) => 
    (stock_up(stock_240) with 0.5) => 
    invest_241(Name, Stock).

invest_241(Name, Stock) :- 
    shareholder(Name, stock_241) => 
    (stock_up(stock_241) with 0.6) => 
    invest_242(Name, Stock).

invest_242(Name, Stock) :- 
    shareholder(Name, stock_242) => 
    (stock_up(stock_242) with 0.6) => 
    invest_243(Name, Stock).

invest_243(Name, Stock) :- 
    shareholder(Name, stock_243) => 
    (stock_up(stock_243) with 0.7) => 
    invest_244(Name, Stock).

invest_244(Name, Stock) :- 
    shareholder(Name, stock_244) => 
    (stock_up(stock_244) with 0.7) => 
    invest_245(Name, Stock).

invest_245(Name, Stock) :- 
    shareholder(Name, stock_245) => 
    (stock_up(stock_245) with 0.5) => 
    invest_246(Name, Stock).

invest_246(Name, Stock) :- 
    shareholder(Name, stock_246) => 
    (stock_up(stock_246) with 0.6) => 
    invest_247(Name, Stock).

invest_247(Name, Stock) :- 
    shareholder(Name, stock_247) => 
    (stock_up(stock_247) with 0.6) => 
    invest_248(Name, Stock).

invest_248(Name, Stock) :- 
    shareholder(Name, stock_248) => 
    (stock_up(stock_248) with 0.7) => 
    invest_249(Name, Stock).

invest_249(Name, Stock) :- 
    shareholder(Name, stock_249) => 
    (stock_up(stock_249) with 0.7) => 
    invest_250(Name, Stock).

invest_250(Name, Stock) :- 
    shareholder(Name, stock_250) => 
    (stock_up(stock_250) with 0.5) => 
    invest_251(Name, Stock).

invest_251(Name, Stock) :- 
    shareholder(Name, stock_251) => 
    (stock_up(stock_251) with 0.6) => 
    invest_252(Name, Stock).

invest_252(Name, Stock) :- 
    shareholder(Name, stock_252) => 
    (stock_up(stock_252) with 0.6) => 
    invest_253(Name, Stock).

invest_253(Name, Stock) :- 
    shareholder(Name, stock_253) => 
    (stock_up(stock_253) with 0.7) => 
    invest_254(Name, Stock).

invest_254(Name, Stock) :- 
    shareholder(Name, stock_254) => 
    (stock_up(stock_254) with 0.7) => 
    invest_255(Name, Stock).

invest_255(Name, Stock) :- 
    shareholder(Name, stock_255) => 
    (stock_up(stock_255) with 0.5) => 
    invest_256(Name, Stock).

invest_256(Name, Stock) :- 
    shareholder(Name, stock_256) => 
    (stock_up(stock_256) with 0.6) => 
    keep_stock(Name, Stock).

% RQ2 Target Goal
bench :- findall(S,
         invest(paul, S),
         Answers), length(Answers, L), write('Number of answers: '), writeln(L), setenv('Answers', L).
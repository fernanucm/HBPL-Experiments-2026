:- hypothetical(true).
:- weak_unification(a3).
:- indexing(false).

% Proximity relation matrix inducing a fully connected transitive component
middle ~ old = 0.5.
young ~ middle = 0.62.

% Scaled Database Facts (N = 4000)
middle(paul).
old(mary).

shareholder(paul, google).
shareholder(paul, greek_bonds).
shareholder(mary, google).

stock_up(google) with 0.9.
stock_up(greek_bonds) with 0.2.
shareholder(paul, stock_1).
stock_up(stock_1) with 0.2.
shareholder(paul, stock_2).
stock_up(stock_2) with 0.2.
shareholder(paul, stock_3).
stock_up(stock_3) with 0.2.
shareholder(paul, stock_4).
stock_up(stock_4) with 0.2.
shareholder(paul, stock_5).
stock_up(stock_5) with 0.2.
shareholder(paul, stock_6).
stock_up(stock_6) with 0.2.
shareholder(paul, stock_7).
stock_up(stock_7) with 0.2.
shareholder(paul, stock_8).
stock_up(stock_8) with 0.2.
shareholder(paul, stock_9).
stock_up(stock_9) with 0.2.
shareholder(paul, stock_10).
stock_up(stock_10) with 0.2.
shareholder(paul, stock_11).
stock_up(stock_11) with 0.2.
shareholder(paul, stock_12).
stock_up(stock_12) with 0.2.
shareholder(paul, stock_13).
stock_up(stock_13) with 0.2.
shareholder(paul, stock_14).
stock_up(stock_14) with 0.2.
shareholder(paul, stock_15).
stock_up(stock_15) with 0.2.
shareholder(paul, stock_16).
stock_up(stock_16) with 0.2.
shareholder(paul, stock_17).
stock_up(stock_17) with 0.2.
shareholder(paul, stock_18).
stock_up(stock_18) with 0.2.
shareholder(paul, stock_19).
stock_up(stock_19) with 0.2.
shareholder(paul, stock_20).
stock_up(stock_20) with 0.2.
shareholder(paul, stock_21).
stock_up(stock_21) with 0.2.
shareholder(paul, stock_22).
stock_up(stock_22) with 0.2.
shareholder(paul, stock_23).
stock_up(stock_23) with 0.2.
shareholder(paul, stock_24).
stock_up(stock_24) with 0.2.
shareholder(paul, stock_25).
stock_up(stock_25) with 0.2.
shareholder(paul, stock_26).
stock_up(stock_26) with 0.2.
shareholder(paul, stock_27).
stock_up(stock_27) with 0.2.
shareholder(paul, stock_28).
stock_up(stock_28) with 0.2.
shareholder(paul, stock_29).
stock_up(stock_29) with 0.2.
shareholder(paul, stock_30).
stock_up(stock_30) with 0.2.
shareholder(paul, stock_31).
stock_up(stock_31) with 0.2.
shareholder(paul, stock_32).
stock_up(stock_32) with 0.2.
shareholder(paul, stock_33).
stock_up(stock_33) with 0.2.
shareholder(paul, stock_34).
stock_up(stock_34) with 0.2.
shareholder(paul, stock_35).
stock_up(stock_35) with 0.2.
shareholder(paul, stock_36).
stock_up(stock_36) with 0.2.
shareholder(paul, stock_37).
stock_up(stock_37) with 0.2.
shareholder(paul, stock_38).
stock_up(stock_38) with 0.2.
shareholder(paul, stock_39).
stock_up(stock_39) with 0.2.
shareholder(paul, stock_40).
stock_up(stock_40) with 0.2.
shareholder(paul, stock_41).
stock_up(stock_41) with 0.2.
shareholder(paul, stock_42).
stock_up(stock_42) with 0.2.
shareholder(paul, stock_43).
stock_up(stock_43) with 0.2.
shareholder(paul, stock_44).
stock_up(stock_44) with 0.2.
shareholder(paul, stock_45).
stock_up(stock_45) with 0.2.
shareholder(paul, stock_46).
stock_up(stock_46) with 0.2.
shareholder(paul, stock_47).
stock_up(stock_47) with 0.2.
shareholder(paul, stock_48).
stock_up(stock_48) with 0.2.
shareholder(paul, stock_49).
stock_up(stock_49) with 0.2.
shareholder(paul, stock_50).
stock_up(stock_50) with 0.2.
shareholder(paul, stock_51).
stock_up(stock_51) with 0.2.
shareholder(paul, stock_52).
stock_up(stock_52) with 0.2.
shareholder(paul, stock_53).
stock_up(stock_53) with 0.2.
shareholder(paul, stock_54).
stock_up(stock_54) with 0.2.
shareholder(paul, stock_55).
stock_up(stock_55) with 0.2.
shareholder(paul, stock_56).
stock_up(stock_56) with 0.2.
shareholder(paul, stock_57).
stock_up(stock_57) with 0.2.
shareholder(paul, stock_58).
stock_up(stock_58) with 0.2.
shareholder(paul, stock_59).
stock_up(stock_59) with 0.2.
shareholder(paul, stock_60).
stock_up(stock_60) with 0.2.
shareholder(paul, stock_61).
stock_up(stock_61) with 0.2.
shareholder(paul, stock_62).
stock_up(stock_62) with 0.2.
shareholder(paul, stock_63).
stock_up(stock_63) with 0.2.
shareholder(paul, stock_64).
stock_up(stock_64) with 0.2.
shareholder(paul, stock_65).
stock_up(stock_65) with 0.2.
shareholder(paul, stock_66).
stock_up(stock_66) with 0.2.
shareholder(paul, stock_67).
stock_up(stock_67) with 0.2.
shareholder(paul, stock_68).
stock_up(stock_68) with 0.2.
shareholder(paul, stock_69).
stock_up(stock_69) with 0.2.
shareholder(paul, stock_70).
stock_up(stock_70) with 0.2.
shareholder(paul, stock_71).
stock_up(stock_71) with 0.2.
shareholder(paul, stock_72).
stock_up(stock_72) with 0.2.
shareholder(paul, stock_73).
stock_up(stock_73) with 0.2.
shareholder(paul, stock_74).
stock_up(stock_74) with 0.2.
shareholder(paul, stock_75).
stock_up(stock_75) with 0.2.
shareholder(paul, stock_76).
stock_up(stock_76) with 0.2.
shareholder(paul, stock_77).
stock_up(stock_77) with 0.2.
shareholder(paul, stock_78).
stock_up(stock_78) with 0.2.
shareholder(paul, stock_79).
stock_up(stock_79) with 0.2.
shareholder(paul, stock_80).
stock_up(stock_80) with 0.2.
shareholder(paul, stock_81).
stock_up(stock_81) with 0.2.
shareholder(paul, stock_82).
stock_up(stock_82) with 0.2.
shareholder(paul, stock_83).
stock_up(stock_83) with 0.2.
shareholder(paul, stock_84).
stock_up(stock_84) with 0.2.
shareholder(paul, stock_85).
stock_up(stock_85) with 0.2.
shareholder(paul, stock_86).
stock_up(stock_86) with 0.2.
shareholder(paul, stock_87).
stock_up(stock_87) with 0.2.
shareholder(paul, stock_88).
stock_up(stock_88) with 0.2.
shareholder(paul, stock_89).
stock_up(stock_89) with 0.2.
shareholder(paul, stock_90).
stock_up(stock_90) with 0.2.
shareholder(paul, stock_91).
stock_up(stock_91) with 0.2.
shareholder(paul, stock_92).
stock_up(stock_92) with 0.2.
shareholder(paul, stock_93).
stock_up(stock_93) with 0.2.
shareholder(paul, stock_94).
stock_up(stock_94) with 0.2.
shareholder(paul, stock_95).
stock_up(stock_95) with 0.2.
shareholder(paul, stock_96).
stock_up(stock_96) with 0.2.
shareholder(paul, stock_97).
stock_up(stock_97) with 0.2.
shareholder(paul, stock_98).
stock_up(stock_98) with 0.2.
shareholder(paul, stock_99).
stock_up(stock_99) with 0.2.
shareholder(paul, stock_100).
stock_up(stock_100) with 0.2.
shareholder(paul, stock_101).
stock_up(stock_101) with 0.2.
shareholder(paul, stock_102).
stock_up(stock_102) with 0.2.
shareholder(paul, stock_103).
stock_up(stock_103) with 0.2.
shareholder(paul, stock_104).
stock_up(stock_104) with 0.2.
shareholder(paul, stock_105).
stock_up(stock_105) with 0.2.
shareholder(paul, stock_106).
stock_up(stock_106) with 0.2.
shareholder(paul, stock_107).
stock_up(stock_107) with 0.2.
shareholder(paul, stock_108).
stock_up(stock_108) with 0.2.
shareholder(paul, stock_109).
stock_up(stock_109) with 0.2.
shareholder(paul, stock_110).
stock_up(stock_110) with 0.2.
shareholder(paul, stock_111).
stock_up(stock_111) with 0.2.
shareholder(paul, stock_112).
stock_up(stock_112) with 0.2.
shareholder(paul, stock_113).
stock_up(stock_113) with 0.2.
shareholder(paul, stock_114).
stock_up(stock_114) with 0.2.
shareholder(paul, stock_115).
stock_up(stock_115) with 0.2.
shareholder(paul, stock_116).
stock_up(stock_116) with 0.2.
shareholder(paul, stock_117).
stock_up(stock_117) with 0.2.
shareholder(paul, stock_118).
stock_up(stock_118) with 0.2.
shareholder(paul, stock_119).
stock_up(stock_119) with 0.2.
shareholder(paul, stock_120).
stock_up(stock_120) with 0.2.
shareholder(paul, stock_121).
stock_up(stock_121) with 0.2.
shareholder(paul, stock_122).
stock_up(stock_122) with 0.2.
shareholder(paul, stock_123).
stock_up(stock_123) with 0.2.
shareholder(paul, stock_124).
stock_up(stock_124) with 0.2.
shareholder(paul, stock_125).
stock_up(stock_125) with 0.2.
shareholder(paul, stock_126).
stock_up(stock_126) with 0.2.
shareholder(paul, stock_127).
stock_up(stock_127) with 0.2.
shareholder(paul, stock_128).
stock_up(stock_128) with 0.2.
shareholder(paul, stock_129).
stock_up(stock_129) with 0.2.
shareholder(paul, stock_130).
stock_up(stock_130) with 0.2.
shareholder(paul, stock_131).
stock_up(stock_131) with 0.2.
shareholder(paul, stock_132).
stock_up(stock_132) with 0.2.
shareholder(paul, stock_133).
stock_up(stock_133) with 0.2.
shareholder(paul, stock_134).
stock_up(stock_134) with 0.2.
shareholder(paul, stock_135).
stock_up(stock_135) with 0.2.
shareholder(paul, stock_136).
stock_up(stock_136) with 0.2.
shareholder(paul, stock_137).
stock_up(stock_137) with 0.2.
shareholder(paul, stock_138).
stock_up(stock_138) with 0.2.
shareholder(paul, stock_139).
stock_up(stock_139) with 0.2.
shareholder(paul, stock_140).
stock_up(stock_140) with 0.2.
shareholder(paul, stock_141).
stock_up(stock_141) with 0.2.
shareholder(paul, stock_142).
stock_up(stock_142) with 0.2.
shareholder(paul, stock_143).
stock_up(stock_143) with 0.2.
shareholder(paul, stock_144).
stock_up(stock_144) with 0.2.
shareholder(paul, stock_145).
stock_up(stock_145) with 0.2.
shareholder(paul, stock_146).
stock_up(stock_146) with 0.2.
shareholder(paul, stock_147).
stock_up(stock_147) with 0.2.
shareholder(paul, stock_148).
stock_up(stock_148) with 0.2.
shareholder(paul, stock_149).
stock_up(stock_149) with 0.2.
shareholder(paul, stock_150).
stock_up(stock_150) with 0.2.
shareholder(paul, stock_151).
stock_up(stock_151) with 0.2.
shareholder(paul, stock_152).
stock_up(stock_152) with 0.2.
shareholder(paul, stock_153).
stock_up(stock_153) with 0.2.
shareholder(paul, stock_154).
stock_up(stock_154) with 0.2.
shareholder(paul, stock_155).
stock_up(stock_155) with 0.2.
shareholder(paul, stock_156).
stock_up(stock_156) with 0.2.
shareholder(paul, stock_157).
stock_up(stock_157) with 0.2.
shareholder(paul, stock_158).
stock_up(stock_158) with 0.2.
shareholder(paul, stock_159).
stock_up(stock_159) with 0.2.
shareholder(paul, stock_160).
stock_up(stock_160) with 0.2.
shareholder(paul, stock_161).
stock_up(stock_161) with 0.2.
shareholder(paul, stock_162).
stock_up(stock_162) with 0.2.
shareholder(paul, stock_163).
stock_up(stock_163) with 0.2.
shareholder(paul, stock_164).
stock_up(stock_164) with 0.2.
shareholder(paul, stock_165).
stock_up(stock_165) with 0.2.
shareholder(paul, stock_166).
stock_up(stock_166) with 0.2.
shareholder(paul, stock_167).
stock_up(stock_167) with 0.2.
shareholder(paul, stock_168).
stock_up(stock_168) with 0.2.
shareholder(paul, stock_169).
stock_up(stock_169) with 0.2.
shareholder(paul, stock_170).
stock_up(stock_170) with 0.2.
shareholder(paul, stock_171).
stock_up(stock_171) with 0.2.
shareholder(paul, stock_172).
stock_up(stock_172) with 0.2.
shareholder(paul, stock_173).
stock_up(stock_173) with 0.2.
shareholder(paul, stock_174).
stock_up(stock_174) with 0.2.
shareholder(paul, stock_175).
stock_up(stock_175) with 0.2.
shareholder(paul, stock_176).
stock_up(stock_176) with 0.2.
shareholder(paul, stock_177).
stock_up(stock_177) with 0.2.
shareholder(paul, stock_178).
stock_up(stock_178) with 0.2.
shareholder(paul, stock_179).
stock_up(stock_179) with 0.2.
shareholder(paul, stock_180).
stock_up(stock_180) with 0.2.
shareholder(paul, stock_181).
stock_up(stock_181) with 0.2.
shareholder(paul, stock_182).
stock_up(stock_182) with 0.2.
shareholder(paul, stock_183).
stock_up(stock_183) with 0.2.
shareholder(paul, stock_184).
stock_up(stock_184) with 0.2.
shareholder(paul, stock_185).
stock_up(stock_185) with 0.2.
shareholder(paul, stock_186).
stock_up(stock_186) with 0.2.
shareholder(paul, stock_187).
stock_up(stock_187) with 0.2.
shareholder(paul, stock_188).
stock_up(stock_188) with 0.2.
shareholder(paul, stock_189).
stock_up(stock_189) with 0.2.
shareholder(paul, stock_190).
stock_up(stock_190) with 0.2.
shareholder(paul, stock_191).
stock_up(stock_191) with 0.2.
shareholder(paul, stock_192).
stock_up(stock_192) with 0.2.
shareholder(paul, stock_193).
stock_up(stock_193) with 0.2.
shareholder(paul, stock_194).
stock_up(stock_194) with 0.2.
shareholder(paul, stock_195).
stock_up(stock_195) with 0.2.
shareholder(paul, stock_196).
stock_up(stock_196) with 0.2.
shareholder(paul, stock_197).
stock_up(stock_197) with 0.2.
shareholder(paul, stock_198).
stock_up(stock_198) with 0.2.
shareholder(paul, stock_199).
stock_up(stock_199) with 0.2.
shareholder(paul, stock_200).
stock_up(stock_200) with 0.2.
shareholder(paul, stock_201).
stock_up(stock_201) with 0.2.
shareholder(paul, stock_202).
stock_up(stock_202) with 0.2.
shareholder(paul, stock_203).
stock_up(stock_203) with 0.2.
shareholder(paul, stock_204).
stock_up(stock_204) with 0.2.
shareholder(paul, stock_205).
stock_up(stock_205) with 0.2.
shareholder(paul, stock_206).
stock_up(stock_206) with 0.2.
shareholder(paul, stock_207).
stock_up(stock_207) with 0.2.
shareholder(paul, stock_208).
stock_up(stock_208) with 0.2.
shareholder(paul, stock_209).
stock_up(stock_209) with 0.2.
shareholder(paul, stock_210).
stock_up(stock_210) with 0.2.
shareholder(paul, stock_211).
stock_up(stock_211) with 0.2.
shareholder(paul, stock_212).
stock_up(stock_212) with 0.2.
shareholder(paul, stock_213).
stock_up(stock_213) with 0.2.
shareholder(paul, stock_214).
stock_up(stock_214) with 0.2.
shareholder(paul, stock_215).
stock_up(stock_215) with 0.2.
shareholder(paul, stock_216).
stock_up(stock_216) with 0.2.
shareholder(paul, stock_217).
stock_up(stock_217) with 0.2.
shareholder(paul, stock_218).
stock_up(stock_218) with 0.2.
shareholder(paul, stock_219).
stock_up(stock_219) with 0.2.
shareholder(paul, stock_220).
stock_up(stock_220) with 0.2.
shareholder(paul, stock_221).
stock_up(stock_221) with 0.2.
shareholder(paul, stock_222).
stock_up(stock_222) with 0.2.
shareholder(paul, stock_223).
stock_up(stock_223) with 0.2.
shareholder(paul, stock_224).
stock_up(stock_224) with 0.2.
shareholder(paul, stock_225).
stock_up(stock_225) with 0.2.
shareholder(paul, stock_226).
stock_up(stock_226) with 0.2.
shareholder(paul, stock_227).
stock_up(stock_227) with 0.2.
shareholder(paul, stock_228).
stock_up(stock_228) with 0.2.
shareholder(paul, stock_229).
stock_up(stock_229) with 0.2.
shareholder(paul, stock_230).
stock_up(stock_230) with 0.2.
shareholder(paul, stock_231).
stock_up(stock_231) with 0.2.
shareholder(paul, stock_232).
stock_up(stock_232) with 0.2.
shareholder(paul, stock_233).
stock_up(stock_233) with 0.2.
shareholder(paul, stock_234).
stock_up(stock_234) with 0.2.
shareholder(paul, stock_235).
stock_up(stock_235) with 0.2.
shareholder(paul, stock_236).
stock_up(stock_236) with 0.2.
shareholder(paul, stock_237).
stock_up(stock_237) with 0.2.
shareholder(paul, stock_238).
stock_up(stock_238) with 0.2.
shareholder(paul, stock_239).
stock_up(stock_239) with 0.2.
shareholder(paul, stock_240).
stock_up(stock_240) with 0.2.
shareholder(paul, stock_241).
stock_up(stock_241) with 0.2.
shareholder(paul, stock_242).
stock_up(stock_242) with 0.2.
shareholder(paul, stock_243).
stock_up(stock_243) with 0.2.
shareholder(paul, stock_244).
stock_up(stock_244) with 0.2.
shareholder(paul, stock_245).
stock_up(stock_245) with 0.2.
shareholder(paul, stock_246).
stock_up(stock_246) with 0.2.
shareholder(paul, stock_247).
stock_up(stock_247) with 0.2.
shareholder(paul, stock_248).
stock_up(stock_248) with 0.2.
shareholder(paul, stock_249).
stock_up(stock_249) with 0.2.
shareholder(paul, stock_250).
stock_up(stock_250) with 0.2.
shareholder(paul, stock_251).
stock_up(stock_251) with 0.2.
shareholder(paul, stock_252).
stock_up(stock_252) with 0.2.
shareholder(paul, stock_253).
stock_up(stock_253) with 0.2.
shareholder(paul, stock_254).
stock_up(stock_254) with 0.2.
shareholder(paul, stock_255).
stock_up(stock_255) with 0.2.
shareholder(paul, stock_256).
stock_up(stock_256) with 0.2.
shareholder(paul, stock_257).
stock_up(stock_257) with 0.2.
shareholder(paul, stock_258).
stock_up(stock_258) with 0.2.
shareholder(paul, stock_259).
stock_up(stock_259) with 0.2.
shareholder(paul, stock_260).
stock_up(stock_260) with 0.2.
shareholder(paul, stock_261).
stock_up(stock_261) with 0.2.
shareholder(paul, stock_262).
stock_up(stock_262) with 0.2.
shareholder(paul, stock_263).
stock_up(stock_263) with 0.2.
shareholder(paul, stock_264).
stock_up(stock_264) with 0.2.
shareholder(paul, stock_265).
stock_up(stock_265) with 0.2.
shareholder(paul, stock_266).
stock_up(stock_266) with 0.2.
shareholder(paul, stock_267).
stock_up(stock_267) with 0.2.
shareholder(paul, stock_268).
stock_up(stock_268) with 0.2.
shareholder(paul, stock_269).
stock_up(stock_269) with 0.2.
shareholder(paul, stock_270).
stock_up(stock_270) with 0.2.
shareholder(paul, stock_271).
stock_up(stock_271) with 0.2.
shareholder(paul, stock_272).
stock_up(stock_272) with 0.2.
shareholder(paul, stock_273).
stock_up(stock_273) with 0.2.
shareholder(paul, stock_274).
stock_up(stock_274) with 0.2.
shareholder(paul, stock_275).
stock_up(stock_275) with 0.2.
shareholder(paul, stock_276).
stock_up(stock_276) with 0.2.
shareholder(paul, stock_277).
stock_up(stock_277) with 0.2.
shareholder(paul, stock_278).
stock_up(stock_278) with 0.2.
shareholder(paul, stock_279).
stock_up(stock_279) with 0.2.
shareholder(paul, stock_280).
stock_up(stock_280) with 0.2.
shareholder(paul, stock_281).
stock_up(stock_281) with 0.2.
shareholder(paul, stock_282).
stock_up(stock_282) with 0.2.
shareholder(paul, stock_283).
stock_up(stock_283) with 0.2.
shareholder(paul, stock_284).
stock_up(stock_284) with 0.2.
shareholder(paul, stock_285).
stock_up(stock_285) with 0.2.
shareholder(paul, stock_286).
stock_up(stock_286) with 0.2.
shareholder(paul, stock_287).
stock_up(stock_287) with 0.2.
shareholder(paul, stock_288).
stock_up(stock_288) with 0.2.
shareholder(paul, stock_289).
stock_up(stock_289) with 0.2.
shareholder(paul, stock_290).
stock_up(stock_290) with 0.2.
shareholder(paul, stock_291).
stock_up(stock_291) with 0.2.
shareholder(paul, stock_292).
stock_up(stock_292) with 0.2.
shareholder(paul, stock_293).
stock_up(stock_293) with 0.2.
shareholder(paul, stock_294).
stock_up(stock_294) with 0.2.
shareholder(paul, stock_295).
stock_up(stock_295) with 0.2.
shareholder(paul, stock_296).
stock_up(stock_296) with 0.2.
shareholder(paul, stock_297).
stock_up(stock_297) with 0.2.
shareholder(paul, stock_298).
stock_up(stock_298) with 0.2.
shareholder(paul, stock_299).
stock_up(stock_299) with 0.2.
shareholder(paul, stock_300).
stock_up(stock_300) with 0.2.
shareholder(paul, stock_301).
stock_up(stock_301) with 0.2.
shareholder(paul, stock_302).
stock_up(stock_302) with 0.2.
shareholder(paul, stock_303).
stock_up(stock_303) with 0.2.
shareholder(paul, stock_304).
stock_up(stock_304) with 0.2.
shareholder(paul, stock_305).
stock_up(stock_305) with 0.2.
shareholder(paul, stock_306).
stock_up(stock_306) with 0.2.
shareholder(paul, stock_307).
stock_up(stock_307) with 0.2.
shareholder(paul, stock_308).
stock_up(stock_308) with 0.2.
shareholder(paul, stock_309).
stock_up(stock_309) with 0.2.
shareholder(paul, stock_310).
stock_up(stock_310) with 0.2.
shareholder(paul, stock_311).
stock_up(stock_311) with 0.2.
shareholder(paul, stock_312).
stock_up(stock_312) with 0.2.
shareholder(paul, stock_313).
stock_up(stock_313) with 0.2.
shareholder(paul, stock_314).
stock_up(stock_314) with 0.2.
shareholder(paul, stock_315).
stock_up(stock_315) with 0.2.
shareholder(paul, stock_316).
stock_up(stock_316) with 0.2.
shareholder(paul, stock_317).
stock_up(stock_317) with 0.2.
shareholder(paul, stock_318).
stock_up(stock_318) with 0.2.
shareholder(paul, stock_319).
stock_up(stock_319) with 0.2.
shareholder(paul, stock_320).
stock_up(stock_320) with 0.2.
shareholder(paul, stock_321).
stock_up(stock_321) with 0.2.
shareholder(paul, stock_322).
stock_up(stock_322) with 0.2.
shareholder(paul, stock_323).
stock_up(stock_323) with 0.2.
shareholder(paul, stock_324).
stock_up(stock_324) with 0.2.
shareholder(paul, stock_325).
stock_up(stock_325) with 0.2.
shareholder(paul, stock_326).
stock_up(stock_326) with 0.2.
shareholder(paul, stock_327).
stock_up(stock_327) with 0.2.
shareholder(paul, stock_328).
stock_up(stock_328) with 0.2.
shareholder(paul, stock_329).
stock_up(stock_329) with 0.2.
shareholder(paul, stock_330).
stock_up(stock_330) with 0.2.
shareholder(paul, stock_331).
stock_up(stock_331) with 0.2.
shareholder(paul, stock_332).
stock_up(stock_332) with 0.2.
shareholder(paul, stock_333).
stock_up(stock_333) with 0.2.
shareholder(paul, stock_334).
stock_up(stock_334) with 0.2.
shareholder(paul, stock_335).
stock_up(stock_335) with 0.2.
shareholder(paul, stock_336).
stock_up(stock_336) with 0.2.
shareholder(paul, stock_337).
stock_up(stock_337) with 0.2.
shareholder(paul, stock_338).
stock_up(stock_338) with 0.2.
shareholder(paul, stock_339).
stock_up(stock_339) with 0.2.
shareholder(paul, stock_340).
stock_up(stock_340) with 0.2.
shareholder(paul, stock_341).
stock_up(stock_341) with 0.2.
shareholder(paul, stock_342).
stock_up(stock_342) with 0.2.
shareholder(paul, stock_343).
stock_up(stock_343) with 0.2.
shareholder(paul, stock_344).
stock_up(stock_344) with 0.2.
shareholder(paul, stock_345).
stock_up(stock_345) with 0.2.
shareholder(paul, stock_346).
stock_up(stock_346) with 0.2.
shareholder(paul, stock_347).
stock_up(stock_347) with 0.2.
shareholder(paul, stock_348).
stock_up(stock_348) with 0.2.
shareholder(paul, stock_349).
stock_up(stock_349) with 0.2.
shareholder(paul, stock_350).
stock_up(stock_350) with 0.2.
shareholder(paul, stock_351).
stock_up(stock_351) with 0.2.
shareholder(paul, stock_352).
stock_up(stock_352) with 0.2.
shareholder(paul, stock_353).
stock_up(stock_353) with 0.2.
shareholder(paul, stock_354).
stock_up(stock_354) with 0.2.
shareholder(paul, stock_355).
stock_up(stock_355) with 0.2.
shareholder(paul, stock_356).
stock_up(stock_356) with 0.2.
shareholder(paul, stock_357).
stock_up(stock_357) with 0.2.
shareholder(paul, stock_358).
stock_up(stock_358) with 0.2.
shareholder(paul, stock_359).
stock_up(stock_359) with 0.2.
shareholder(paul, stock_360).
stock_up(stock_360) with 0.2.
shareholder(paul, stock_361).
stock_up(stock_361) with 0.2.
shareholder(paul, stock_362).
stock_up(stock_362) with 0.2.
shareholder(paul, stock_363).
stock_up(stock_363) with 0.2.
shareholder(paul, stock_364).
stock_up(stock_364) with 0.2.
shareholder(paul, stock_365).
stock_up(stock_365) with 0.2.
shareholder(paul, stock_366).
stock_up(stock_366) with 0.2.
shareholder(paul, stock_367).
stock_up(stock_367) with 0.2.
shareholder(paul, stock_368).
stock_up(stock_368) with 0.2.
shareholder(paul, stock_369).
stock_up(stock_369) with 0.2.
shareholder(paul, stock_370).
stock_up(stock_370) with 0.2.
shareholder(paul, stock_371).
stock_up(stock_371) with 0.2.
shareholder(paul, stock_372).
stock_up(stock_372) with 0.2.
shareholder(paul, stock_373).
stock_up(stock_373) with 0.2.
shareholder(paul, stock_374).
stock_up(stock_374) with 0.2.
shareholder(paul, stock_375).
stock_up(stock_375) with 0.2.
shareholder(paul, stock_376).
stock_up(stock_376) with 0.2.
shareholder(paul, stock_377).
stock_up(stock_377) with 0.2.
shareholder(paul, stock_378).
stock_up(stock_378) with 0.2.
shareholder(paul, stock_379).
stock_up(stock_379) with 0.2.
shareholder(paul, stock_380).
stock_up(stock_380) with 0.2.
shareholder(paul, stock_381).
stock_up(stock_381) with 0.2.
shareholder(paul, stock_382).
stock_up(stock_382) with 0.2.
shareholder(paul, stock_383).
stock_up(stock_383) with 0.2.
shareholder(paul, stock_384).
stock_up(stock_384) with 0.2.
shareholder(paul, stock_385).
stock_up(stock_385) with 0.2.
shareholder(paul, stock_386).
stock_up(stock_386) with 0.2.
shareholder(paul, stock_387).
stock_up(stock_387) with 0.2.
shareholder(paul, stock_388).
stock_up(stock_388) with 0.2.
shareholder(paul, stock_389).
stock_up(stock_389) with 0.2.
shareholder(paul, stock_390).
stock_up(stock_390) with 0.2.
shareholder(paul, stock_391).
stock_up(stock_391) with 0.2.
shareholder(paul, stock_392).
stock_up(stock_392) with 0.2.
shareholder(paul, stock_393).
stock_up(stock_393) with 0.2.
shareholder(paul, stock_394).
stock_up(stock_394) with 0.2.
shareholder(paul, stock_395).
stock_up(stock_395) with 0.2.
shareholder(paul, stock_396).
stock_up(stock_396) with 0.2.
shareholder(paul, stock_397).
stock_up(stock_397) with 0.2.
shareholder(paul, stock_398).
stock_up(stock_398) with 0.2.
shareholder(paul, stock_399).
stock_up(stock_399) with 0.2.
shareholder(paul, stock_400).
stock_up(stock_400) with 0.2.
shareholder(paul, stock_401).
stock_up(stock_401) with 0.2.
shareholder(paul, stock_402).
stock_up(stock_402) with 0.2.
shareholder(paul, stock_403).
stock_up(stock_403) with 0.2.
shareholder(paul, stock_404).
stock_up(stock_404) with 0.2.
shareholder(paul, stock_405).
stock_up(stock_405) with 0.2.
shareholder(paul, stock_406).
stock_up(stock_406) with 0.2.
shareholder(paul, stock_407).
stock_up(stock_407) with 0.2.
shareholder(paul, stock_408).
stock_up(stock_408) with 0.2.
shareholder(paul, stock_409).
stock_up(stock_409) with 0.2.
shareholder(paul, stock_410).
stock_up(stock_410) with 0.2.
shareholder(paul, stock_411).
stock_up(stock_411) with 0.2.
shareholder(paul, stock_412).
stock_up(stock_412) with 0.2.
shareholder(paul, stock_413).
stock_up(stock_413) with 0.2.
shareholder(paul, stock_414).
stock_up(stock_414) with 0.2.
shareholder(paul, stock_415).
stock_up(stock_415) with 0.2.
shareholder(paul, stock_416).
stock_up(stock_416) with 0.2.
shareholder(paul, stock_417).
stock_up(stock_417) with 0.2.
shareholder(paul, stock_418).
stock_up(stock_418) with 0.2.
shareholder(paul, stock_419).
stock_up(stock_419) with 0.2.
shareholder(paul, stock_420).
stock_up(stock_420) with 0.2.
shareholder(paul, stock_421).
stock_up(stock_421) with 0.2.
shareholder(paul, stock_422).
stock_up(stock_422) with 0.2.
shareholder(paul, stock_423).
stock_up(stock_423) with 0.2.
shareholder(paul, stock_424).
stock_up(stock_424) with 0.2.
shareholder(paul, stock_425).
stock_up(stock_425) with 0.2.
shareholder(paul, stock_426).
stock_up(stock_426) with 0.2.
shareholder(paul, stock_427).
stock_up(stock_427) with 0.2.
shareholder(paul, stock_428).
stock_up(stock_428) with 0.2.
shareholder(paul, stock_429).
stock_up(stock_429) with 0.2.
shareholder(paul, stock_430).
stock_up(stock_430) with 0.2.
shareholder(paul, stock_431).
stock_up(stock_431) with 0.2.
shareholder(paul, stock_432).
stock_up(stock_432) with 0.2.
shareholder(paul, stock_433).
stock_up(stock_433) with 0.2.
shareholder(paul, stock_434).
stock_up(stock_434) with 0.2.
shareholder(paul, stock_435).
stock_up(stock_435) with 0.2.
shareholder(paul, stock_436).
stock_up(stock_436) with 0.2.
shareholder(paul, stock_437).
stock_up(stock_437) with 0.2.
shareholder(paul, stock_438).
stock_up(stock_438) with 0.2.
shareholder(paul, stock_439).
stock_up(stock_439) with 0.2.
shareholder(paul, stock_440).
stock_up(stock_440) with 0.2.
shareholder(paul, stock_441).
stock_up(stock_441) with 0.2.
shareholder(paul, stock_442).
stock_up(stock_442) with 0.2.
shareholder(paul, stock_443).
stock_up(stock_443) with 0.2.
shareholder(paul, stock_444).
stock_up(stock_444) with 0.2.
shareholder(paul, stock_445).
stock_up(stock_445) with 0.2.
shareholder(paul, stock_446).
stock_up(stock_446) with 0.2.
shareholder(paul, stock_447).
stock_up(stock_447) with 0.2.
shareholder(paul, stock_448).
stock_up(stock_448) with 0.2.
shareholder(paul, stock_449).
stock_up(stock_449) with 0.2.
shareholder(paul, stock_450).
stock_up(stock_450) with 0.2.
shareholder(paul, stock_451).
stock_up(stock_451) with 0.2.
shareholder(paul, stock_452).
stock_up(stock_452) with 0.2.
shareholder(paul, stock_453).
stock_up(stock_453) with 0.2.
shareholder(paul, stock_454).
stock_up(stock_454) with 0.2.
shareholder(paul, stock_455).
stock_up(stock_455) with 0.2.
shareholder(paul, stock_456).
stock_up(stock_456) with 0.2.
shareholder(paul, stock_457).
stock_up(stock_457) with 0.2.
shareholder(paul, stock_458).
stock_up(stock_458) with 0.2.
shareholder(paul, stock_459).
stock_up(stock_459) with 0.2.
shareholder(paul, stock_460).
stock_up(stock_460) with 0.2.
shareholder(paul, stock_461).
stock_up(stock_461) with 0.2.
shareholder(paul, stock_462).
stock_up(stock_462) with 0.2.
shareholder(paul, stock_463).
stock_up(stock_463) with 0.2.
shareholder(paul, stock_464).
stock_up(stock_464) with 0.2.
shareholder(paul, stock_465).
stock_up(stock_465) with 0.2.
shareholder(paul, stock_466).
stock_up(stock_466) with 0.2.
shareholder(paul, stock_467).
stock_up(stock_467) with 0.2.
shareholder(paul, stock_468).
stock_up(stock_468) with 0.2.
shareholder(paul, stock_469).
stock_up(stock_469) with 0.2.
shareholder(paul, stock_470).
stock_up(stock_470) with 0.2.
shareholder(paul, stock_471).
stock_up(stock_471) with 0.2.
shareholder(paul, stock_472).
stock_up(stock_472) with 0.2.
shareholder(paul, stock_473).
stock_up(stock_473) with 0.2.
shareholder(paul, stock_474).
stock_up(stock_474) with 0.2.
shareholder(paul, stock_475).
stock_up(stock_475) with 0.2.
shareholder(paul, stock_476).
stock_up(stock_476) with 0.2.
shareholder(paul, stock_477).
stock_up(stock_477) with 0.2.
shareholder(paul, stock_478).
stock_up(stock_478) with 0.2.
shareholder(paul, stock_479).
stock_up(stock_479) with 0.2.
shareholder(paul, stock_480).
stock_up(stock_480) with 0.2.
shareholder(paul, stock_481).
stock_up(stock_481) with 0.2.
shareholder(paul, stock_482).
stock_up(stock_482) with 0.2.
shareholder(paul, stock_483).
stock_up(stock_483) with 0.2.
shareholder(paul, stock_484).
stock_up(stock_484) with 0.2.
shareholder(paul, stock_485).
stock_up(stock_485) with 0.2.
shareholder(paul, stock_486).
stock_up(stock_486) with 0.2.
shareholder(paul, stock_487).
stock_up(stock_487) with 0.2.
shareholder(paul, stock_488).
stock_up(stock_488) with 0.2.
shareholder(paul, stock_489).
stock_up(stock_489) with 0.2.
shareholder(paul, stock_490).
stock_up(stock_490) with 0.2.
shareholder(paul, stock_491).
stock_up(stock_491) with 0.2.
shareholder(paul, stock_492).
stock_up(stock_492) with 0.2.
shareholder(paul, stock_493).
stock_up(stock_493) with 0.2.
shareholder(paul, stock_494).
stock_up(stock_494) with 0.2.
shareholder(paul, stock_495).
stock_up(stock_495) with 0.2.
shareholder(paul, stock_496).
stock_up(stock_496) with 0.2.
shareholder(paul, stock_497).
stock_up(stock_497) with 0.2.
shareholder(paul, stock_498).
stock_up(stock_498) with 0.2.
shareholder(paul, stock_499).
stock_up(stock_499) with 0.2.
shareholder(paul, stock_500).
stock_up(stock_500) with 0.2.
shareholder(paul, stock_501).
stock_up(stock_501) with 0.2.
shareholder(paul, stock_502).
stock_up(stock_502) with 0.2.
shareholder(paul, stock_503).
stock_up(stock_503) with 0.2.
shareholder(paul, stock_504).
stock_up(stock_504) with 0.2.
shareholder(paul, stock_505).
stock_up(stock_505) with 0.2.
shareholder(paul, stock_506).
stock_up(stock_506) with 0.2.
shareholder(paul, stock_507).
stock_up(stock_507) with 0.2.
shareholder(paul, stock_508).
stock_up(stock_508) with 0.2.
shareholder(paul, stock_509).
stock_up(stock_509) with 0.2.
shareholder(paul, stock_510).
stock_up(stock_510) with 0.2.
shareholder(paul, stock_511).
stock_up(stock_511) with 0.2.
shareholder(paul, stock_512).
stock_up(stock_512) with 0.2.
shareholder(paul, stock_513).
stock_up(stock_513) with 0.2.
shareholder(paul, stock_514).
stock_up(stock_514) with 0.2.
shareholder(paul, stock_515).
stock_up(stock_515) with 0.2.
shareholder(paul, stock_516).
stock_up(stock_516) with 0.2.
shareholder(paul, stock_517).
stock_up(stock_517) with 0.2.
shareholder(paul, stock_518).
stock_up(stock_518) with 0.2.
shareholder(paul, stock_519).
stock_up(stock_519) with 0.2.
shareholder(paul, stock_520).
stock_up(stock_520) with 0.2.
shareholder(paul, stock_521).
stock_up(stock_521) with 0.2.
shareholder(paul, stock_522).
stock_up(stock_522) with 0.2.
shareholder(paul, stock_523).
stock_up(stock_523) with 0.2.
shareholder(paul, stock_524).
stock_up(stock_524) with 0.2.
shareholder(paul, stock_525).
stock_up(stock_525) with 0.2.
shareholder(paul, stock_526).
stock_up(stock_526) with 0.2.
shareholder(paul, stock_527).
stock_up(stock_527) with 0.2.
shareholder(paul, stock_528).
stock_up(stock_528) with 0.2.
shareholder(paul, stock_529).
stock_up(stock_529) with 0.2.
shareholder(paul, stock_530).
stock_up(stock_530) with 0.2.
shareholder(paul, stock_531).
stock_up(stock_531) with 0.2.
shareholder(paul, stock_532).
stock_up(stock_532) with 0.2.
shareholder(paul, stock_533).
stock_up(stock_533) with 0.2.
shareholder(paul, stock_534).
stock_up(stock_534) with 0.2.
shareholder(paul, stock_535).
stock_up(stock_535) with 0.2.
shareholder(paul, stock_536).
stock_up(stock_536) with 0.2.
shareholder(paul, stock_537).
stock_up(stock_537) with 0.2.
shareholder(paul, stock_538).
stock_up(stock_538) with 0.2.
shareholder(paul, stock_539).
stock_up(stock_539) with 0.2.
shareholder(paul, stock_540).
stock_up(stock_540) with 0.2.
shareholder(paul, stock_541).
stock_up(stock_541) with 0.2.
shareholder(paul, stock_542).
stock_up(stock_542) with 0.2.
shareholder(paul, stock_543).
stock_up(stock_543) with 0.2.
shareholder(paul, stock_544).
stock_up(stock_544) with 0.2.
shareholder(paul, stock_545).
stock_up(stock_545) with 0.2.
shareholder(paul, stock_546).
stock_up(stock_546) with 0.2.
shareholder(paul, stock_547).
stock_up(stock_547) with 0.2.
shareholder(paul, stock_548).
stock_up(stock_548) with 0.2.
shareholder(paul, stock_549).
stock_up(stock_549) with 0.2.
shareholder(paul, stock_550).
stock_up(stock_550) with 0.2.
shareholder(paul, stock_551).
stock_up(stock_551) with 0.2.
shareholder(paul, stock_552).
stock_up(stock_552) with 0.2.
shareholder(paul, stock_553).
stock_up(stock_553) with 0.2.
shareholder(paul, stock_554).
stock_up(stock_554) with 0.2.
shareholder(paul, stock_555).
stock_up(stock_555) with 0.2.
shareholder(paul, stock_556).
stock_up(stock_556) with 0.2.
shareholder(paul, stock_557).
stock_up(stock_557) with 0.2.
shareholder(paul, stock_558).
stock_up(stock_558) with 0.2.
shareholder(paul, stock_559).
stock_up(stock_559) with 0.2.
shareholder(paul, stock_560).
stock_up(stock_560) with 0.2.
shareholder(paul, stock_561).
stock_up(stock_561) with 0.2.
shareholder(paul, stock_562).
stock_up(stock_562) with 0.2.
shareholder(paul, stock_563).
stock_up(stock_563) with 0.2.
shareholder(paul, stock_564).
stock_up(stock_564) with 0.2.
shareholder(paul, stock_565).
stock_up(stock_565) with 0.2.
shareholder(paul, stock_566).
stock_up(stock_566) with 0.2.
shareholder(paul, stock_567).
stock_up(stock_567) with 0.2.
shareholder(paul, stock_568).
stock_up(stock_568) with 0.2.
shareholder(paul, stock_569).
stock_up(stock_569) with 0.2.
shareholder(paul, stock_570).
stock_up(stock_570) with 0.2.
shareholder(paul, stock_571).
stock_up(stock_571) with 0.2.
shareholder(paul, stock_572).
stock_up(stock_572) with 0.2.
shareholder(paul, stock_573).
stock_up(stock_573) with 0.2.
shareholder(paul, stock_574).
stock_up(stock_574) with 0.2.
shareholder(paul, stock_575).
stock_up(stock_575) with 0.2.
shareholder(paul, stock_576).
stock_up(stock_576) with 0.2.
shareholder(paul, stock_577).
stock_up(stock_577) with 0.2.
shareholder(paul, stock_578).
stock_up(stock_578) with 0.2.
shareholder(paul, stock_579).
stock_up(stock_579) with 0.2.
shareholder(paul, stock_580).
stock_up(stock_580) with 0.2.
shareholder(paul, stock_581).
stock_up(stock_581) with 0.2.
shareholder(paul, stock_582).
stock_up(stock_582) with 0.2.
shareholder(paul, stock_583).
stock_up(stock_583) with 0.2.
shareholder(paul, stock_584).
stock_up(stock_584) with 0.2.
shareholder(paul, stock_585).
stock_up(stock_585) with 0.2.
shareholder(paul, stock_586).
stock_up(stock_586) with 0.2.
shareholder(paul, stock_587).
stock_up(stock_587) with 0.2.
shareholder(paul, stock_588).
stock_up(stock_588) with 0.2.
shareholder(paul, stock_589).
stock_up(stock_589) with 0.2.
shareholder(paul, stock_590).
stock_up(stock_590) with 0.2.
shareholder(paul, stock_591).
stock_up(stock_591) with 0.2.
shareholder(paul, stock_592).
stock_up(stock_592) with 0.2.
shareholder(paul, stock_593).
stock_up(stock_593) with 0.2.
shareholder(paul, stock_594).
stock_up(stock_594) with 0.2.
shareholder(paul, stock_595).
stock_up(stock_595) with 0.2.
shareholder(paul, stock_596).
stock_up(stock_596) with 0.2.
shareholder(paul, stock_597).
stock_up(stock_597) with 0.2.
shareholder(paul, stock_598).
stock_up(stock_598) with 0.2.
shareholder(paul, stock_599).
stock_up(stock_599) with 0.2.
shareholder(paul, stock_600).
stock_up(stock_600) with 0.2.
shareholder(paul, stock_601).
stock_up(stock_601) with 0.2.
shareholder(paul, stock_602).
stock_up(stock_602) with 0.2.
shareholder(paul, stock_603).
stock_up(stock_603) with 0.2.
shareholder(paul, stock_604).
stock_up(stock_604) with 0.2.
shareholder(paul, stock_605).
stock_up(stock_605) with 0.2.
shareholder(paul, stock_606).
stock_up(stock_606) with 0.2.
shareholder(paul, stock_607).
stock_up(stock_607) with 0.2.
shareholder(paul, stock_608).
stock_up(stock_608) with 0.2.
shareholder(paul, stock_609).
stock_up(stock_609) with 0.2.
shareholder(paul, stock_610).
stock_up(stock_610) with 0.2.
shareholder(paul, stock_611).
stock_up(stock_611) with 0.2.
shareholder(paul, stock_612).
stock_up(stock_612) with 0.2.
shareholder(paul, stock_613).
stock_up(stock_613) with 0.2.
shareholder(paul, stock_614).
stock_up(stock_614) with 0.2.
shareholder(paul, stock_615).
stock_up(stock_615) with 0.2.
shareholder(paul, stock_616).
stock_up(stock_616) with 0.2.
shareholder(paul, stock_617).
stock_up(stock_617) with 0.2.
shareholder(paul, stock_618).
stock_up(stock_618) with 0.2.
shareholder(paul, stock_619).
stock_up(stock_619) with 0.2.
shareholder(paul, stock_620).
stock_up(stock_620) with 0.2.
shareholder(paul, stock_621).
stock_up(stock_621) with 0.2.
shareholder(paul, stock_622).
stock_up(stock_622) with 0.2.
shareholder(paul, stock_623).
stock_up(stock_623) with 0.2.
shareholder(paul, stock_624).
stock_up(stock_624) with 0.2.
shareholder(paul, stock_625).
stock_up(stock_625) with 0.2.
shareholder(paul, stock_626).
stock_up(stock_626) with 0.2.
shareholder(paul, stock_627).
stock_up(stock_627) with 0.2.
shareholder(paul, stock_628).
stock_up(stock_628) with 0.2.
shareholder(paul, stock_629).
stock_up(stock_629) with 0.2.
shareholder(paul, stock_630).
stock_up(stock_630) with 0.2.
shareholder(paul, stock_631).
stock_up(stock_631) with 0.2.
shareholder(paul, stock_632).
stock_up(stock_632) with 0.2.
shareholder(paul, stock_633).
stock_up(stock_633) with 0.2.
shareholder(paul, stock_634).
stock_up(stock_634) with 0.2.
shareholder(paul, stock_635).
stock_up(stock_635) with 0.2.
shareholder(paul, stock_636).
stock_up(stock_636) with 0.2.
shareholder(paul, stock_637).
stock_up(stock_637) with 0.2.
shareholder(paul, stock_638).
stock_up(stock_638) with 0.2.
shareholder(paul, stock_639).
stock_up(stock_639) with 0.2.
shareholder(paul, stock_640).
stock_up(stock_640) with 0.2.
shareholder(paul, stock_641).
stock_up(stock_641) with 0.2.
shareholder(paul, stock_642).
stock_up(stock_642) with 0.2.
shareholder(paul, stock_643).
stock_up(stock_643) with 0.2.
shareholder(paul, stock_644).
stock_up(stock_644) with 0.2.
shareholder(paul, stock_645).
stock_up(stock_645) with 0.2.
shareholder(paul, stock_646).
stock_up(stock_646) with 0.2.
shareholder(paul, stock_647).
stock_up(stock_647) with 0.2.
shareholder(paul, stock_648).
stock_up(stock_648) with 0.2.
shareholder(paul, stock_649).
stock_up(stock_649) with 0.2.
shareholder(paul, stock_650).
stock_up(stock_650) with 0.2.
shareholder(paul, stock_651).
stock_up(stock_651) with 0.2.
shareholder(paul, stock_652).
stock_up(stock_652) with 0.2.
shareholder(paul, stock_653).
stock_up(stock_653) with 0.2.
shareholder(paul, stock_654).
stock_up(stock_654) with 0.2.
shareholder(paul, stock_655).
stock_up(stock_655) with 0.2.
shareholder(paul, stock_656).
stock_up(stock_656) with 0.2.
shareholder(paul, stock_657).
stock_up(stock_657) with 0.2.
shareholder(paul, stock_658).
stock_up(stock_658) with 0.2.
shareholder(paul, stock_659).
stock_up(stock_659) with 0.2.
shareholder(paul, stock_660).
stock_up(stock_660) with 0.2.
shareholder(paul, stock_661).
stock_up(stock_661) with 0.2.
shareholder(paul, stock_662).
stock_up(stock_662) with 0.2.
shareholder(paul, stock_663).
stock_up(stock_663) with 0.2.
shareholder(paul, stock_664).
stock_up(stock_664) with 0.2.
shareholder(paul, stock_665).
stock_up(stock_665) with 0.2.
shareholder(paul, stock_666).
stock_up(stock_666) with 0.2.
shareholder(paul, stock_667).
stock_up(stock_667) with 0.2.
shareholder(paul, stock_668).
stock_up(stock_668) with 0.2.
shareholder(paul, stock_669).
stock_up(stock_669) with 0.2.
shareholder(paul, stock_670).
stock_up(stock_670) with 0.2.
shareholder(paul, stock_671).
stock_up(stock_671) with 0.2.
shareholder(paul, stock_672).
stock_up(stock_672) with 0.2.
shareholder(paul, stock_673).
stock_up(stock_673) with 0.2.
shareholder(paul, stock_674).
stock_up(stock_674) with 0.2.
shareholder(paul, stock_675).
stock_up(stock_675) with 0.2.
shareholder(paul, stock_676).
stock_up(stock_676) with 0.2.
shareholder(paul, stock_677).
stock_up(stock_677) with 0.2.
shareholder(paul, stock_678).
stock_up(stock_678) with 0.2.
shareholder(paul, stock_679).
stock_up(stock_679) with 0.2.
shareholder(paul, stock_680).
stock_up(stock_680) with 0.2.
shareholder(paul, stock_681).
stock_up(stock_681) with 0.2.
shareholder(paul, stock_682).
stock_up(stock_682) with 0.2.
shareholder(paul, stock_683).
stock_up(stock_683) with 0.2.
shareholder(paul, stock_684).
stock_up(stock_684) with 0.2.
shareholder(paul, stock_685).
stock_up(stock_685) with 0.2.
shareholder(paul, stock_686).
stock_up(stock_686) with 0.2.
shareholder(paul, stock_687).
stock_up(stock_687) with 0.2.
shareholder(paul, stock_688).
stock_up(stock_688) with 0.2.
shareholder(paul, stock_689).
stock_up(stock_689) with 0.2.
shareholder(paul, stock_690).
stock_up(stock_690) with 0.2.
shareholder(paul, stock_691).
stock_up(stock_691) with 0.2.
shareholder(paul, stock_692).
stock_up(stock_692) with 0.2.
shareholder(paul, stock_693).
stock_up(stock_693) with 0.2.
shareholder(paul, stock_694).
stock_up(stock_694) with 0.2.
shareholder(paul, stock_695).
stock_up(stock_695) with 0.2.
shareholder(paul, stock_696).
stock_up(stock_696) with 0.2.
shareholder(paul, stock_697).
stock_up(stock_697) with 0.2.
shareholder(paul, stock_698).
stock_up(stock_698) with 0.2.
shareholder(paul, stock_699).
stock_up(stock_699) with 0.2.
shareholder(paul, stock_700).
stock_up(stock_700) with 0.2.
shareholder(paul, stock_701).
stock_up(stock_701) with 0.2.
shareholder(paul, stock_702).
stock_up(stock_702) with 0.2.
shareholder(paul, stock_703).
stock_up(stock_703) with 0.2.
shareholder(paul, stock_704).
stock_up(stock_704) with 0.2.
shareholder(paul, stock_705).
stock_up(stock_705) with 0.2.
shareholder(paul, stock_706).
stock_up(stock_706) with 0.2.
shareholder(paul, stock_707).
stock_up(stock_707) with 0.2.
shareholder(paul, stock_708).
stock_up(stock_708) with 0.2.
shareholder(paul, stock_709).
stock_up(stock_709) with 0.2.
shareholder(paul, stock_710).
stock_up(stock_710) with 0.2.
shareholder(paul, stock_711).
stock_up(stock_711) with 0.2.
shareholder(paul, stock_712).
stock_up(stock_712) with 0.2.
shareholder(paul, stock_713).
stock_up(stock_713) with 0.2.
shareholder(paul, stock_714).
stock_up(stock_714) with 0.2.
shareholder(paul, stock_715).
stock_up(stock_715) with 0.2.
shareholder(paul, stock_716).
stock_up(stock_716) with 0.2.
shareholder(paul, stock_717).
stock_up(stock_717) with 0.2.
shareholder(paul, stock_718).
stock_up(stock_718) with 0.2.
shareholder(paul, stock_719).
stock_up(stock_719) with 0.2.
shareholder(paul, stock_720).
stock_up(stock_720) with 0.2.
shareholder(paul, stock_721).
stock_up(stock_721) with 0.2.
shareholder(paul, stock_722).
stock_up(stock_722) with 0.2.
shareholder(paul, stock_723).
stock_up(stock_723) with 0.2.
shareholder(paul, stock_724).
stock_up(stock_724) with 0.2.
shareholder(paul, stock_725).
stock_up(stock_725) with 0.2.
shareholder(paul, stock_726).
stock_up(stock_726) with 0.2.
shareholder(paul, stock_727).
stock_up(stock_727) with 0.2.
shareholder(paul, stock_728).
stock_up(stock_728) with 0.2.
shareholder(paul, stock_729).
stock_up(stock_729) with 0.2.
shareholder(paul, stock_730).
stock_up(stock_730) with 0.2.
shareholder(paul, stock_731).
stock_up(stock_731) with 0.2.
shareholder(paul, stock_732).
stock_up(stock_732) with 0.2.
shareholder(paul, stock_733).
stock_up(stock_733) with 0.2.
shareholder(paul, stock_734).
stock_up(stock_734) with 0.2.
shareholder(paul, stock_735).
stock_up(stock_735) with 0.2.
shareholder(paul, stock_736).
stock_up(stock_736) with 0.2.
shareholder(paul, stock_737).
stock_up(stock_737) with 0.2.
shareholder(paul, stock_738).
stock_up(stock_738) with 0.2.
shareholder(paul, stock_739).
stock_up(stock_739) with 0.2.
shareholder(paul, stock_740).
stock_up(stock_740) with 0.2.
shareholder(paul, stock_741).
stock_up(stock_741) with 0.2.
shareholder(paul, stock_742).
stock_up(stock_742) with 0.2.
shareholder(paul, stock_743).
stock_up(stock_743) with 0.2.
shareholder(paul, stock_744).
stock_up(stock_744) with 0.2.
shareholder(paul, stock_745).
stock_up(stock_745) with 0.2.
shareholder(paul, stock_746).
stock_up(stock_746) with 0.2.
shareholder(paul, stock_747).
stock_up(stock_747) with 0.2.
shareholder(paul, stock_748).
stock_up(stock_748) with 0.2.
shareholder(paul, stock_749).
stock_up(stock_749) with 0.2.
shareholder(paul, stock_750).
stock_up(stock_750) with 0.2.
shareholder(paul, stock_751).
stock_up(stock_751) with 0.2.
shareholder(paul, stock_752).
stock_up(stock_752) with 0.2.
shareholder(paul, stock_753).
stock_up(stock_753) with 0.2.
shareholder(paul, stock_754).
stock_up(stock_754) with 0.2.
shareholder(paul, stock_755).
stock_up(stock_755) with 0.2.
shareholder(paul, stock_756).
stock_up(stock_756) with 0.2.
shareholder(paul, stock_757).
stock_up(stock_757) with 0.2.
shareholder(paul, stock_758).
stock_up(stock_758) with 0.2.
shareholder(paul, stock_759).
stock_up(stock_759) with 0.2.
shareholder(paul, stock_760).
stock_up(stock_760) with 0.2.
shareholder(paul, stock_761).
stock_up(stock_761) with 0.2.
shareholder(paul, stock_762).
stock_up(stock_762) with 0.2.
shareholder(paul, stock_763).
stock_up(stock_763) with 0.2.
shareholder(paul, stock_764).
stock_up(stock_764) with 0.2.
shareholder(paul, stock_765).
stock_up(stock_765) with 0.2.
shareholder(paul, stock_766).
stock_up(stock_766) with 0.2.
shareholder(paul, stock_767).
stock_up(stock_767) with 0.2.
shareholder(paul, stock_768).
stock_up(stock_768) with 0.2.
shareholder(paul, stock_769).
stock_up(stock_769) with 0.2.
shareholder(paul, stock_770).
stock_up(stock_770) with 0.2.
shareholder(paul, stock_771).
stock_up(stock_771) with 0.2.
shareholder(paul, stock_772).
stock_up(stock_772) with 0.2.
shareholder(paul, stock_773).
stock_up(stock_773) with 0.2.
shareholder(paul, stock_774).
stock_up(stock_774) with 0.2.
shareholder(paul, stock_775).
stock_up(stock_775) with 0.2.
shareholder(paul, stock_776).
stock_up(stock_776) with 0.2.
shareholder(paul, stock_777).
stock_up(stock_777) with 0.2.
shareholder(paul, stock_778).
stock_up(stock_778) with 0.2.
shareholder(paul, stock_779).
stock_up(stock_779) with 0.2.
shareholder(paul, stock_780).
stock_up(stock_780) with 0.2.
shareholder(paul, stock_781).
stock_up(stock_781) with 0.2.
shareholder(paul, stock_782).
stock_up(stock_782) with 0.2.
shareholder(paul, stock_783).
stock_up(stock_783) with 0.2.
shareholder(paul, stock_784).
stock_up(stock_784) with 0.2.
shareholder(paul, stock_785).
stock_up(stock_785) with 0.2.
shareholder(paul, stock_786).
stock_up(stock_786) with 0.2.
shareholder(paul, stock_787).
stock_up(stock_787) with 0.2.
shareholder(paul, stock_788).
stock_up(stock_788) with 0.2.
shareholder(paul, stock_789).
stock_up(stock_789) with 0.2.
shareholder(paul, stock_790).
stock_up(stock_790) with 0.2.
shareholder(paul, stock_791).
stock_up(stock_791) with 0.2.
shareholder(paul, stock_792).
stock_up(stock_792) with 0.2.
shareholder(paul, stock_793).
stock_up(stock_793) with 0.2.
shareholder(paul, stock_794).
stock_up(stock_794) with 0.2.
shareholder(paul, stock_795).
stock_up(stock_795) with 0.2.
shareholder(paul, stock_796).
stock_up(stock_796) with 0.2.
shareholder(paul, stock_797).
stock_up(stock_797) with 0.2.
shareholder(paul, stock_798).
stock_up(stock_798) with 0.2.
shareholder(paul, stock_799).
stock_up(stock_799) with 0.2.
shareholder(paul, stock_800).
stock_up(stock_800) with 0.2.
shareholder(paul, stock_801).
stock_up(stock_801) with 0.2.
shareholder(paul, stock_802).
stock_up(stock_802) with 0.2.
shareholder(paul, stock_803).
stock_up(stock_803) with 0.2.
shareholder(paul, stock_804).
stock_up(stock_804) with 0.2.
shareholder(paul, stock_805).
stock_up(stock_805) with 0.2.
shareholder(paul, stock_806).
stock_up(stock_806) with 0.2.
shareholder(paul, stock_807).
stock_up(stock_807) with 0.2.
shareholder(paul, stock_808).
stock_up(stock_808) with 0.2.
shareholder(paul, stock_809).
stock_up(stock_809) with 0.2.
shareholder(paul, stock_810).
stock_up(stock_810) with 0.2.
shareholder(paul, stock_811).
stock_up(stock_811) with 0.2.
shareholder(paul, stock_812).
stock_up(stock_812) with 0.2.
shareholder(paul, stock_813).
stock_up(stock_813) with 0.2.
shareholder(paul, stock_814).
stock_up(stock_814) with 0.2.
shareholder(paul, stock_815).
stock_up(stock_815) with 0.2.
shareholder(paul, stock_816).
stock_up(stock_816) with 0.2.
shareholder(paul, stock_817).
stock_up(stock_817) with 0.2.
shareholder(paul, stock_818).
stock_up(stock_818) with 0.2.
shareholder(paul, stock_819).
stock_up(stock_819) with 0.2.
shareholder(paul, stock_820).
stock_up(stock_820) with 0.2.
shareholder(paul, stock_821).
stock_up(stock_821) with 0.2.
shareholder(paul, stock_822).
stock_up(stock_822) with 0.2.
shareholder(paul, stock_823).
stock_up(stock_823) with 0.2.
shareholder(paul, stock_824).
stock_up(stock_824) with 0.2.
shareholder(paul, stock_825).
stock_up(stock_825) with 0.2.
shareholder(paul, stock_826).
stock_up(stock_826) with 0.2.
shareholder(paul, stock_827).
stock_up(stock_827) with 0.2.
shareholder(paul, stock_828).
stock_up(stock_828) with 0.2.
shareholder(paul, stock_829).
stock_up(stock_829) with 0.2.
shareholder(paul, stock_830).
stock_up(stock_830) with 0.2.
shareholder(paul, stock_831).
stock_up(stock_831) with 0.2.
shareholder(paul, stock_832).
stock_up(stock_832) with 0.2.
shareholder(paul, stock_833).
stock_up(stock_833) with 0.2.
shareholder(paul, stock_834).
stock_up(stock_834) with 0.2.
shareholder(paul, stock_835).
stock_up(stock_835) with 0.2.
shareholder(paul, stock_836).
stock_up(stock_836) with 0.2.
shareholder(paul, stock_837).
stock_up(stock_837) with 0.2.
shareholder(paul, stock_838).
stock_up(stock_838) with 0.2.
shareholder(paul, stock_839).
stock_up(stock_839) with 0.2.
shareholder(paul, stock_840).
stock_up(stock_840) with 0.2.
shareholder(paul, stock_841).
stock_up(stock_841) with 0.2.
shareholder(paul, stock_842).
stock_up(stock_842) with 0.2.
shareholder(paul, stock_843).
stock_up(stock_843) with 0.2.
shareholder(paul, stock_844).
stock_up(stock_844) with 0.2.
shareholder(paul, stock_845).
stock_up(stock_845) with 0.2.
shareholder(paul, stock_846).
stock_up(stock_846) with 0.2.
shareholder(paul, stock_847).
stock_up(stock_847) with 0.2.
shareholder(paul, stock_848).
stock_up(stock_848) with 0.2.
shareholder(paul, stock_849).
stock_up(stock_849) with 0.2.
shareholder(paul, stock_850).
stock_up(stock_850) with 0.2.
shareholder(paul, stock_851).
stock_up(stock_851) with 0.2.
shareholder(paul, stock_852).
stock_up(stock_852) with 0.2.
shareholder(paul, stock_853).
stock_up(stock_853) with 0.2.
shareholder(paul, stock_854).
stock_up(stock_854) with 0.2.
shareholder(paul, stock_855).
stock_up(stock_855) with 0.2.
shareholder(paul, stock_856).
stock_up(stock_856) with 0.2.
shareholder(paul, stock_857).
stock_up(stock_857) with 0.2.
shareholder(paul, stock_858).
stock_up(stock_858) with 0.2.
shareholder(paul, stock_859).
stock_up(stock_859) with 0.2.
shareholder(paul, stock_860).
stock_up(stock_860) with 0.2.
shareholder(paul, stock_861).
stock_up(stock_861) with 0.2.
shareholder(paul, stock_862).
stock_up(stock_862) with 0.2.
shareholder(paul, stock_863).
stock_up(stock_863) with 0.2.
shareholder(paul, stock_864).
stock_up(stock_864) with 0.2.
shareholder(paul, stock_865).
stock_up(stock_865) with 0.2.
shareholder(paul, stock_866).
stock_up(stock_866) with 0.2.
shareholder(paul, stock_867).
stock_up(stock_867) with 0.2.
shareholder(paul, stock_868).
stock_up(stock_868) with 0.2.
shareholder(paul, stock_869).
stock_up(stock_869) with 0.2.
shareholder(paul, stock_870).
stock_up(stock_870) with 0.2.
shareholder(paul, stock_871).
stock_up(stock_871) with 0.2.
shareholder(paul, stock_872).
stock_up(stock_872) with 0.2.
shareholder(paul, stock_873).
stock_up(stock_873) with 0.2.
shareholder(paul, stock_874).
stock_up(stock_874) with 0.2.
shareholder(paul, stock_875).
stock_up(stock_875) with 0.2.
shareholder(paul, stock_876).
stock_up(stock_876) with 0.2.
shareholder(paul, stock_877).
stock_up(stock_877) with 0.2.
shareholder(paul, stock_878).
stock_up(stock_878) with 0.2.
shareholder(paul, stock_879).
stock_up(stock_879) with 0.2.
shareholder(paul, stock_880).
stock_up(stock_880) with 0.2.
shareholder(paul, stock_881).
stock_up(stock_881) with 0.2.
shareholder(paul, stock_882).
stock_up(stock_882) with 0.2.
shareholder(paul, stock_883).
stock_up(stock_883) with 0.2.
shareholder(paul, stock_884).
stock_up(stock_884) with 0.2.
shareholder(paul, stock_885).
stock_up(stock_885) with 0.2.
shareholder(paul, stock_886).
stock_up(stock_886) with 0.2.
shareholder(paul, stock_887).
stock_up(stock_887) with 0.2.
shareholder(paul, stock_888).
stock_up(stock_888) with 0.2.
shareholder(paul, stock_889).
stock_up(stock_889) with 0.2.
shareholder(paul, stock_890).
stock_up(stock_890) with 0.2.
shareholder(paul, stock_891).
stock_up(stock_891) with 0.2.
shareholder(paul, stock_892).
stock_up(stock_892) with 0.2.
shareholder(paul, stock_893).
stock_up(stock_893) with 0.2.
shareholder(paul, stock_894).
stock_up(stock_894) with 0.2.
shareholder(paul, stock_895).
stock_up(stock_895) with 0.2.
shareholder(paul, stock_896).
stock_up(stock_896) with 0.2.
shareholder(paul, stock_897).
stock_up(stock_897) with 0.2.
shareholder(paul, stock_898).
stock_up(stock_898) with 0.2.
shareholder(paul, stock_899).
stock_up(stock_899) with 0.2.
shareholder(paul, stock_900).
stock_up(stock_900) with 0.2.
shareholder(paul, stock_901).
stock_up(stock_901) with 0.2.
shareholder(paul, stock_902).
stock_up(stock_902) with 0.2.
shareholder(paul, stock_903).
stock_up(stock_903) with 0.2.
shareholder(paul, stock_904).
stock_up(stock_904) with 0.2.
shareholder(paul, stock_905).
stock_up(stock_905) with 0.2.
shareholder(paul, stock_906).
stock_up(stock_906) with 0.2.
shareholder(paul, stock_907).
stock_up(stock_907) with 0.2.
shareholder(paul, stock_908).
stock_up(stock_908) with 0.2.
shareholder(paul, stock_909).
stock_up(stock_909) with 0.2.
shareholder(paul, stock_910).
stock_up(stock_910) with 0.2.
shareholder(paul, stock_911).
stock_up(stock_911) with 0.2.
shareholder(paul, stock_912).
stock_up(stock_912) with 0.2.
shareholder(paul, stock_913).
stock_up(stock_913) with 0.2.
shareholder(paul, stock_914).
stock_up(stock_914) with 0.2.
shareholder(paul, stock_915).
stock_up(stock_915) with 0.2.
shareholder(paul, stock_916).
stock_up(stock_916) with 0.2.
shareholder(paul, stock_917).
stock_up(stock_917) with 0.2.
shareholder(paul, stock_918).
stock_up(stock_918) with 0.2.
shareholder(paul, stock_919).
stock_up(stock_919) with 0.2.
shareholder(paul, stock_920).
stock_up(stock_920) with 0.2.
shareholder(paul, stock_921).
stock_up(stock_921) with 0.2.
shareholder(paul, stock_922).
stock_up(stock_922) with 0.2.
shareholder(paul, stock_923).
stock_up(stock_923) with 0.2.
shareholder(paul, stock_924).
stock_up(stock_924) with 0.2.
shareholder(paul, stock_925).
stock_up(stock_925) with 0.2.
shareholder(paul, stock_926).
stock_up(stock_926) with 0.2.
shareholder(paul, stock_927).
stock_up(stock_927) with 0.2.
shareholder(paul, stock_928).
stock_up(stock_928) with 0.2.
shareholder(paul, stock_929).
stock_up(stock_929) with 0.2.
shareholder(paul, stock_930).
stock_up(stock_930) with 0.2.
shareholder(paul, stock_931).
stock_up(stock_931) with 0.2.
shareholder(paul, stock_932).
stock_up(stock_932) with 0.2.
shareholder(paul, stock_933).
stock_up(stock_933) with 0.2.
shareholder(paul, stock_934).
stock_up(stock_934) with 0.2.
shareholder(paul, stock_935).
stock_up(stock_935) with 0.2.
shareholder(paul, stock_936).
stock_up(stock_936) with 0.2.
shareholder(paul, stock_937).
stock_up(stock_937) with 0.2.
shareholder(paul, stock_938).
stock_up(stock_938) with 0.2.
shareholder(paul, stock_939).
stock_up(stock_939) with 0.2.
shareholder(paul, stock_940).
stock_up(stock_940) with 0.2.
shareholder(paul, stock_941).
stock_up(stock_941) with 0.2.
shareholder(paul, stock_942).
stock_up(stock_942) with 0.2.
shareholder(paul, stock_943).
stock_up(stock_943) with 0.2.
shareholder(paul, stock_944).
stock_up(stock_944) with 0.2.
shareholder(paul, stock_945).
stock_up(stock_945) with 0.2.
shareholder(paul, stock_946).
stock_up(stock_946) with 0.2.
shareholder(paul, stock_947).
stock_up(stock_947) with 0.2.
shareholder(paul, stock_948).
stock_up(stock_948) with 0.2.
shareholder(paul, stock_949).
stock_up(stock_949) with 0.2.
shareholder(paul, stock_950).
stock_up(stock_950) with 0.2.
shareholder(paul, stock_951).
stock_up(stock_951) with 0.2.
shareholder(paul, stock_952).
stock_up(stock_952) with 0.2.
shareholder(paul, stock_953).
stock_up(stock_953) with 0.2.
shareholder(paul, stock_954).
stock_up(stock_954) with 0.2.
shareholder(paul, stock_955).
stock_up(stock_955) with 0.2.
shareholder(paul, stock_956).
stock_up(stock_956) with 0.2.
shareholder(paul, stock_957).
stock_up(stock_957) with 0.2.
shareholder(paul, stock_958).
stock_up(stock_958) with 0.2.
shareholder(paul, stock_959).
stock_up(stock_959) with 0.2.
shareholder(paul, stock_960).
stock_up(stock_960) with 0.2.
shareholder(paul, stock_961).
stock_up(stock_961) with 0.2.
shareholder(paul, stock_962).
stock_up(stock_962) with 0.2.
shareholder(paul, stock_963).
stock_up(stock_963) with 0.2.
shareholder(paul, stock_964).
stock_up(stock_964) with 0.2.
shareholder(paul, stock_965).
stock_up(stock_965) with 0.2.
shareholder(paul, stock_966).
stock_up(stock_966) with 0.2.
shareholder(paul, stock_967).
stock_up(stock_967) with 0.2.
shareholder(paul, stock_968).
stock_up(stock_968) with 0.2.
shareholder(paul, stock_969).
stock_up(stock_969) with 0.2.
shareholder(paul, stock_970).
stock_up(stock_970) with 0.2.
shareholder(paul, stock_971).
stock_up(stock_971) with 0.2.
shareholder(paul, stock_972).
stock_up(stock_972) with 0.2.
shareholder(paul, stock_973).
stock_up(stock_973) with 0.2.
shareholder(paul, stock_974).
stock_up(stock_974) with 0.2.
shareholder(paul, stock_975).
stock_up(stock_975) with 0.2.
shareholder(paul, stock_976).
stock_up(stock_976) with 0.2.
shareholder(paul, stock_977).
stock_up(stock_977) with 0.2.
shareholder(paul, stock_978).
stock_up(stock_978) with 0.2.
shareholder(paul, stock_979).
stock_up(stock_979) with 0.2.
shareholder(paul, stock_980).
stock_up(stock_980) with 0.2.
shareholder(paul, stock_981).
stock_up(stock_981) with 0.2.
shareholder(paul, stock_982).
stock_up(stock_982) with 0.2.
shareholder(paul, stock_983).
stock_up(stock_983) with 0.2.
shareholder(paul, stock_984).
stock_up(stock_984) with 0.2.
shareholder(paul, stock_985).
stock_up(stock_985) with 0.2.
shareholder(paul, stock_986).
stock_up(stock_986) with 0.2.
shareholder(paul, stock_987).
stock_up(stock_987) with 0.2.
shareholder(paul, stock_988).
stock_up(stock_988) with 0.2.
shareholder(paul, stock_989).
stock_up(stock_989) with 0.2.
shareholder(paul, stock_990).
stock_up(stock_990) with 0.2.
shareholder(paul, stock_991).
stock_up(stock_991) with 0.2.
shareholder(paul, stock_992).
stock_up(stock_992) with 0.2.
shareholder(paul, stock_993).
stock_up(stock_993) with 0.2.
shareholder(paul, stock_994).
stock_up(stock_994) with 0.2.
shareholder(paul, stock_995).
stock_up(stock_995) with 0.2.
shareholder(paul, stock_996).
stock_up(stock_996) with 0.2.
shareholder(paul, stock_997).
stock_up(stock_997) with 0.2.
shareholder(paul, stock_998).
stock_up(stock_998) with 0.2.
shareholder(paul, stock_999).
stock_up(stock_999) with 0.2.
shareholder(paul, stock_1000).
stock_up(stock_1000) with 0.2.
shareholder(paul, stock_1001).
stock_up(stock_1001) with 0.2.
shareholder(paul, stock_1002).
stock_up(stock_1002) with 0.2.
shareholder(paul, stock_1003).
stock_up(stock_1003) with 0.2.
shareholder(paul, stock_1004).
stock_up(stock_1004) with 0.2.
shareholder(paul, stock_1005).
stock_up(stock_1005) with 0.2.
shareholder(paul, stock_1006).
stock_up(stock_1006) with 0.2.
shareholder(paul, stock_1007).
stock_up(stock_1007) with 0.2.
shareholder(paul, stock_1008).
stock_up(stock_1008) with 0.2.
shareholder(paul, stock_1009).
stock_up(stock_1009) with 0.2.
shareholder(paul, stock_1010).
stock_up(stock_1010) with 0.2.
shareholder(paul, stock_1011).
stock_up(stock_1011) with 0.2.
shareholder(paul, stock_1012).
stock_up(stock_1012) with 0.2.
shareholder(paul, stock_1013).
stock_up(stock_1013) with 0.2.
shareholder(paul, stock_1014).
stock_up(stock_1014) with 0.2.
shareholder(paul, stock_1015).
stock_up(stock_1015) with 0.2.
shareholder(paul, stock_1016).
stock_up(stock_1016) with 0.2.
shareholder(paul, stock_1017).
stock_up(stock_1017) with 0.2.
shareholder(paul, stock_1018).
stock_up(stock_1018) with 0.2.
shareholder(paul, stock_1019).
stock_up(stock_1019) with 0.2.
shareholder(paul, stock_1020).
stock_up(stock_1020) with 0.2.
shareholder(paul, stock_1021).
stock_up(stock_1021) with 0.2.
shareholder(paul, stock_1022).
stock_up(stock_1022) with 0.2.
shareholder(paul, stock_1023).
stock_up(stock_1023) with 0.2.
shareholder(paul, stock_1024).
stock_up(stock_1024) with 0.2.
shareholder(paul, stock_1025).
stock_up(stock_1025) with 0.2.
shareholder(paul, stock_1026).
stock_up(stock_1026) with 0.2.
shareholder(paul, stock_1027).
stock_up(stock_1027) with 0.2.
shareholder(paul, stock_1028).
stock_up(stock_1028) with 0.2.
shareholder(paul, stock_1029).
stock_up(stock_1029) with 0.2.
shareholder(paul, stock_1030).
stock_up(stock_1030) with 0.2.
shareholder(paul, stock_1031).
stock_up(stock_1031) with 0.2.
shareholder(paul, stock_1032).
stock_up(stock_1032) with 0.2.
shareholder(paul, stock_1033).
stock_up(stock_1033) with 0.2.
shareholder(paul, stock_1034).
stock_up(stock_1034) with 0.2.
shareholder(paul, stock_1035).
stock_up(stock_1035) with 0.2.
shareholder(paul, stock_1036).
stock_up(stock_1036) with 0.2.
shareholder(paul, stock_1037).
stock_up(stock_1037) with 0.2.
shareholder(paul, stock_1038).
stock_up(stock_1038) with 0.2.
shareholder(paul, stock_1039).
stock_up(stock_1039) with 0.2.
shareholder(paul, stock_1040).
stock_up(stock_1040) with 0.2.
shareholder(paul, stock_1041).
stock_up(stock_1041) with 0.2.
shareholder(paul, stock_1042).
stock_up(stock_1042) with 0.2.
shareholder(paul, stock_1043).
stock_up(stock_1043) with 0.2.
shareholder(paul, stock_1044).
stock_up(stock_1044) with 0.2.
shareholder(paul, stock_1045).
stock_up(stock_1045) with 0.2.
shareholder(paul, stock_1046).
stock_up(stock_1046) with 0.2.
shareholder(paul, stock_1047).
stock_up(stock_1047) with 0.2.
shareholder(paul, stock_1048).
stock_up(stock_1048) with 0.2.
shareholder(paul, stock_1049).
stock_up(stock_1049) with 0.2.
shareholder(paul, stock_1050).
stock_up(stock_1050) with 0.2.
shareholder(paul, stock_1051).
stock_up(stock_1051) with 0.2.
shareholder(paul, stock_1052).
stock_up(stock_1052) with 0.2.
shareholder(paul, stock_1053).
stock_up(stock_1053) with 0.2.
shareholder(paul, stock_1054).
stock_up(stock_1054) with 0.2.
shareholder(paul, stock_1055).
stock_up(stock_1055) with 0.2.
shareholder(paul, stock_1056).
stock_up(stock_1056) with 0.2.
shareholder(paul, stock_1057).
stock_up(stock_1057) with 0.2.
shareholder(paul, stock_1058).
stock_up(stock_1058) with 0.2.
shareholder(paul, stock_1059).
stock_up(stock_1059) with 0.2.
shareholder(paul, stock_1060).
stock_up(stock_1060) with 0.2.
shareholder(paul, stock_1061).
stock_up(stock_1061) with 0.2.
shareholder(paul, stock_1062).
stock_up(stock_1062) with 0.2.
shareholder(paul, stock_1063).
stock_up(stock_1063) with 0.2.
shareholder(paul, stock_1064).
stock_up(stock_1064) with 0.2.
shareholder(paul, stock_1065).
stock_up(stock_1065) with 0.2.
shareholder(paul, stock_1066).
stock_up(stock_1066) with 0.2.
shareholder(paul, stock_1067).
stock_up(stock_1067) with 0.2.
shareholder(paul, stock_1068).
stock_up(stock_1068) with 0.2.
shareholder(paul, stock_1069).
stock_up(stock_1069) with 0.2.
shareholder(paul, stock_1070).
stock_up(stock_1070) with 0.2.
shareholder(paul, stock_1071).
stock_up(stock_1071) with 0.2.
shareholder(paul, stock_1072).
stock_up(stock_1072) with 0.2.
shareholder(paul, stock_1073).
stock_up(stock_1073) with 0.2.
shareholder(paul, stock_1074).
stock_up(stock_1074) with 0.2.
shareholder(paul, stock_1075).
stock_up(stock_1075) with 0.2.
shareholder(paul, stock_1076).
stock_up(stock_1076) with 0.2.
shareholder(paul, stock_1077).
stock_up(stock_1077) with 0.2.
shareholder(paul, stock_1078).
stock_up(stock_1078) with 0.2.
shareholder(paul, stock_1079).
stock_up(stock_1079) with 0.2.
shareholder(paul, stock_1080).
stock_up(stock_1080) with 0.2.
shareholder(paul, stock_1081).
stock_up(stock_1081) with 0.2.
shareholder(paul, stock_1082).
stock_up(stock_1082) with 0.2.
shareholder(paul, stock_1083).
stock_up(stock_1083) with 0.2.
shareholder(paul, stock_1084).
stock_up(stock_1084) with 0.2.
shareholder(paul, stock_1085).
stock_up(stock_1085) with 0.2.
shareholder(paul, stock_1086).
stock_up(stock_1086) with 0.2.
shareholder(paul, stock_1087).
stock_up(stock_1087) with 0.2.
shareholder(paul, stock_1088).
stock_up(stock_1088) with 0.2.
shareholder(paul, stock_1089).
stock_up(stock_1089) with 0.2.
shareholder(paul, stock_1090).
stock_up(stock_1090) with 0.2.
shareholder(paul, stock_1091).
stock_up(stock_1091) with 0.2.
shareholder(paul, stock_1092).
stock_up(stock_1092) with 0.2.
shareholder(paul, stock_1093).
stock_up(stock_1093) with 0.2.
shareholder(paul, stock_1094).
stock_up(stock_1094) with 0.2.
shareholder(paul, stock_1095).
stock_up(stock_1095) with 0.2.
shareholder(paul, stock_1096).
stock_up(stock_1096) with 0.2.
shareholder(paul, stock_1097).
stock_up(stock_1097) with 0.2.
shareholder(paul, stock_1098).
stock_up(stock_1098) with 0.2.
shareholder(paul, stock_1099).
stock_up(stock_1099) with 0.2.
shareholder(paul, stock_1100).
stock_up(stock_1100) with 0.2.
shareholder(paul, stock_1101).
stock_up(stock_1101) with 0.2.
shareholder(paul, stock_1102).
stock_up(stock_1102) with 0.2.
shareholder(paul, stock_1103).
stock_up(stock_1103) with 0.2.
shareholder(paul, stock_1104).
stock_up(stock_1104) with 0.2.
shareholder(paul, stock_1105).
stock_up(stock_1105) with 0.2.
shareholder(paul, stock_1106).
stock_up(stock_1106) with 0.2.
shareholder(paul, stock_1107).
stock_up(stock_1107) with 0.2.
shareholder(paul, stock_1108).
stock_up(stock_1108) with 0.2.
shareholder(paul, stock_1109).
stock_up(stock_1109) with 0.2.
shareholder(paul, stock_1110).
stock_up(stock_1110) with 0.2.
shareholder(paul, stock_1111).
stock_up(stock_1111) with 0.2.
shareholder(paul, stock_1112).
stock_up(stock_1112) with 0.2.
shareholder(paul, stock_1113).
stock_up(stock_1113) with 0.2.
shareholder(paul, stock_1114).
stock_up(stock_1114) with 0.2.
shareholder(paul, stock_1115).
stock_up(stock_1115) with 0.2.
shareholder(paul, stock_1116).
stock_up(stock_1116) with 0.2.
shareholder(paul, stock_1117).
stock_up(stock_1117) with 0.2.
shareholder(paul, stock_1118).
stock_up(stock_1118) with 0.2.
shareholder(paul, stock_1119).
stock_up(stock_1119) with 0.2.
shareholder(paul, stock_1120).
stock_up(stock_1120) with 0.2.
shareholder(paul, stock_1121).
stock_up(stock_1121) with 0.2.
shareholder(paul, stock_1122).
stock_up(stock_1122) with 0.2.
shareholder(paul, stock_1123).
stock_up(stock_1123) with 0.2.
shareholder(paul, stock_1124).
stock_up(stock_1124) with 0.2.
shareholder(paul, stock_1125).
stock_up(stock_1125) with 0.2.
shareholder(paul, stock_1126).
stock_up(stock_1126) with 0.2.
shareholder(paul, stock_1127).
stock_up(stock_1127) with 0.2.
shareholder(paul, stock_1128).
stock_up(stock_1128) with 0.2.
shareholder(paul, stock_1129).
stock_up(stock_1129) with 0.2.
shareholder(paul, stock_1130).
stock_up(stock_1130) with 0.2.
shareholder(paul, stock_1131).
stock_up(stock_1131) with 0.2.
shareholder(paul, stock_1132).
stock_up(stock_1132) with 0.2.
shareholder(paul, stock_1133).
stock_up(stock_1133) with 0.2.
shareholder(paul, stock_1134).
stock_up(stock_1134) with 0.2.
shareholder(paul, stock_1135).
stock_up(stock_1135) with 0.2.
shareholder(paul, stock_1136).
stock_up(stock_1136) with 0.2.
shareholder(paul, stock_1137).
stock_up(stock_1137) with 0.2.
shareholder(paul, stock_1138).
stock_up(stock_1138) with 0.2.
shareholder(paul, stock_1139).
stock_up(stock_1139) with 0.2.
shareholder(paul, stock_1140).
stock_up(stock_1140) with 0.2.
shareholder(paul, stock_1141).
stock_up(stock_1141) with 0.2.
shareholder(paul, stock_1142).
stock_up(stock_1142) with 0.2.
shareholder(paul, stock_1143).
stock_up(stock_1143) with 0.2.
shareholder(paul, stock_1144).
stock_up(stock_1144) with 0.2.
shareholder(paul, stock_1145).
stock_up(stock_1145) with 0.2.
shareholder(paul, stock_1146).
stock_up(stock_1146) with 0.2.
shareholder(paul, stock_1147).
stock_up(stock_1147) with 0.2.
shareholder(paul, stock_1148).
stock_up(stock_1148) with 0.2.
shareholder(paul, stock_1149).
stock_up(stock_1149) with 0.2.
shareholder(paul, stock_1150).
stock_up(stock_1150) with 0.2.
shareholder(paul, stock_1151).
stock_up(stock_1151) with 0.2.
shareholder(paul, stock_1152).
stock_up(stock_1152) with 0.2.
shareholder(paul, stock_1153).
stock_up(stock_1153) with 0.2.
shareholder(paul, stock_1154).
stock_up(stock_1154) with 0.2.
shareholder(paul, stock_1155).
stock_up(stock_1155) with 0.2.
shareholder(paul, stock_1156).
stock_up(stock_1156) with 0.2.
shareholder(paul, stock_1157).
stock_up(stock_1157) with 0.2.
shareholder(paul, stock_1158).
stock_up(stock_1158) with 0.2.
shareholder(paul, stock_1159).
stock_up(stock_1159) with 0.2.
shareholder(paul, stock_1160).
stock_up(stock_1160) with 0.2.
shareholder(paul, stock_1161).
stock_up(stock_1161) with 0.2.
shareholder(paul, stock_1162).
stock_up(stock_1162) with 0.2.
shareholder(paul, stock_1163).
stock_up(stock_1163) with 0.2.
shareholder(paul, stock_1164).
stock_up(stock_1164) with 0.2.
shareholder(paul, stock_1165).
stock_up(stock_1165) with 0.2.
shareholder(paul, stock_1166).
stock_up(stock_1166) with 0.2.
shareholder(paul, stock_1167).
stock_up(stock_1167) with 0.2.
shareholder(paul, stock_1168).
stock_up(stock_1168) with 0.2.
shareholder(paul, stock_1169).
stock_up(stock_1169) with 0.2.
shareholder(paul, stock_1170).
stock_up(stock_1170) with 0.2.
shareholder(paul, stock_1171).
stock_up(stock_1171) with 0.2.
shareholder(paul, stock_1172).
stock_up(stock_1172) with 0.2.
shareholder(paul, stock_1173).
stock_up(stock_1173) with 0.2.
shareholder(paul, stock_1174).
stock_up(stock_1174) with 0.2.
shareholder(paul, stock_1175).
stock_up(stock_1175) with 0.2.
shareholder(paul, stock_1176).
stock_up(stock_1176) with 0.2.
shareholder(paul, stock_1177).
stock_up(stock_1177) with 0.2.
shareholder(paul, stock_1178).
stock_up(stock_1178) with 0.2.
shareholder(paul, stock_1179).
stock_up(stock_1179) with 0.2.
shareholder(paul, stock_1180).
stock_up(stock_1180) with 0.2.
shareholder(paul, stock_1181).
stock_up(stock_1181) with 0.2.
shareholder(paul, stock_1182).
stock_up(stock_1182) with 0.2.
shareholder(paul, stock_1183).
stock_up(stock_1183) with 0.2.
shareholder(paul, stock_1184).
stock_up(stock_1184) with 0.2.
shareholder(paul, stock_1185).
stock_up(stock_1185) with 0.2.
shareholder(paul, stock_1186).
stock_up(stock_1186) with 0.2.
shareholder(paul, stock_1187).
stock_up(stock_1187) with 0.2.
shareholder(paul, stock_1188).
stock_up(stock_1188) with 0.2.
shareholder(paul, stock_1189).
stock_up(stock_1189) with 0.2.
shareholder(paul, stock_1190).
stock_up(stock_1190) with 0.2.
shareholder(paul, stock_1191).
stock_up(stock_1191) with 0.2.
shareholder(paul, stock_1192).
stock_up(stock_1192) with 0.2.
shareholder(paul, stock_1193).
stock_up(stock_1193) with 0.2.
shareholder(paul, stock_1194).
stock_up(stock_1194) with 0.2.
shareholder(paul, stock_1195).
stock_up(stock_1195) with 0.2.
shareholder(paul, stock_1196).
stock_up(stock_1196) with 0.2.
shareholder(paul, stock_1197).
stock_up(stock_1197) with 0.2.
shareholder(paul, stock_1198).
stock_up(stock_1198) with 0.2.
shareholder(paul, stock_1199).
stock_up(stock_1199) with 0.2.
shareholder(paul, stock_1200).
stock_up(stock_1200) with 0.2.
shareholder(paul, stock_1201).
stock_up(stock_1201) with 0.2.
shareholder(paul, stock_1202).
stock_up(stock_1202) with 0.2.
shareholder(paul, stock_1203).
stock_up(stock_1203) with 0.2.
shareholder(paul, stock_1204).
stock_up(stock_1204) with 0.2.
shareholder(paul, stock_1205).
stock_up(stock_1205) with 0.2.
shareholder(paul, stock_1206).
stock_up(stock_1206) with 0.2.
shareholder(paul, stock_1207).
stock_up(stock_1207) with 0.2.
shareholder(paul, stock_1208).
stock_up(stock_1208) with 0.2.
shareholder(paul, stock_1209).
stock_up(stock_1209) with 0.2.
shareholder(paul, stock_1210).
stock_up(stock_1210) with 0.2.
shareholder(paul, stock_1211).
stock_up(stock_1211) with 0.2.
shareholder(paul, stock_1212).
stock_up(stock_1212) with 0.2.
shareholder(paul, stock_1213).
stock_up(stock_1213) with 0.2.
shareholder(paul, stock_1214).
stock_up(stock_1214) with 0.2.
shareholder(paul, stock_1215).
stock_up(stock_1215) with 0.2.
shareholder(paul, stock_1216).
stock_up(stock_1216) with 0.2.
shareholder(paul, stock_1217).
stock_up(stock_1217) with 0.2.
shareholder(paul, stock_1218).
stock_up(stock_1218) with 0.2.
shareholder(paul, stock_1219).
stock_up(stock_1219) with 0.2.
shareholder(paul, stock_1220).
stock_up(stock_1220) with 0.2.
shareholder(paul, stock_1221).
stock_up(stock_1221) with 0.2.
shareholder(paul, stock_1222).
stock_up(stock_1222) with 0.2.
shareholder(paul, stock_1223).
stock_up(stock_1223) with 0.2.
shareholder(paul, stock_1224).
stock_up(stock_1224) with 0.2.
shareholder(paul, stock_1225).
stock_up(stock_1225) with 0.2.
shareholder(paul, stock_1226).
stock_up(stock_1226) with 0.2.
shareholder(paul, stock_1227).
stock_up(stock_1227) with 0.2.
shareholder(paul, stock_1228).
stock_up(stock_1228) with 0.2.
shareholder(paul, stock_1229).
stock_up(stock_1229) with 0.2.
shareholder(paul, stock_1230).
stock_up(stock_1230) with 0.2.
shareholder(paul, stock_1231).
stock_up(stock_1231) with 0.2.
shareholder(paul, stock_1232).
stock_up(stock_1232) with 0.2.
shareholder(paul, stock_1233).
stock_up(stock_1233) with 0.2.
shareholder(paul, stock_1234).
stock_up(stock_1234) with 0.2.
shareholder(paul, stock_1235).
stock_up(stock_1235) with 0.2.
shareholder(paul, stock_1236).
stock_up(stock_1236) with 0.2.
shareholder(paul, stock_1237).
stock_up(stock_1237) with 0.2.
shareholder(paul, stock_1238).
stock_up(stock_1238) with 0.2.
shareholder(paul, stock_1239).
stock_up(stock_1239) with 0.2.
shareholder(paul, stock_1240).
stock_up(stock_1240) with 0.2.
shareholder(paul, stock_1241).
stock_up(stock_1241) with 0.2.
shareholder(paul, stock_1242).
stock_up(stock_1242) with 0.2.
shareholder(paul, stock_1243).
stock_up(stock_1243) with 0.2.
shareholder(paul, stock_1244).
stock_up(stock_1244) with 0.2.
shareholder(paul, stock_1245).
stock_up(stock_1245) with 0.2.
shareholder(paul, stock_1246).
stock_up(stock_1246) with 0.2.
shareholder(paul, stock_1247).
stock_up(stock_1247) with 0.2.
shareholder(paul, stock_1248).
stock_up(stock_1248) with 0.2.
shareholder(paul, stock_1249).
stock_up(stock_1249) with 0.2.
shareholder(paul, stock_1250).
stock_up(stock_1250) with 0.2.
shareholder(paul, stock_1251).
stock_up(stock_1251) with 0.2.
shareholder(paul, stock_1252).
stock_up(stock_1252) with 0.2.
shareholder(paul, stock_1253).
stock_up(stock_1253) with 0.2.
shareholder(paul, stock_1254).
stock_up(stock_1254) with 0.2.
shareholder(paul, stock_1255).
stock_up(stock_1255) with 0.2.
shareholder(paul, stock_1256).
stock_up(stock_1256) with 0.2.
shareholder(paul, stock_1257).
stock_up(stock_1257) with 0.2.
shareholder(paul, stock_1258).
stock_up(stock_1258) with 0.2.
shareholder(paul, stock_1259).
stock_up(stock_1259) with 0.2.
shareholder(paul, stock_1260).
stock_up(stock_1260) with 0.2.
shareholder(paul, stock_1261).
stock_up(stock_1261) with 0.2.
shareholder(paul, stock_1262).
stock_up(stock_1262) with 0.2.
shareholder(paul, stock_1263).
stock_up(stock_1263) with 0.2.
shareholder(paul, stock_1264).
stock_up(stock_1264) with 0.2.
shareholder(paul, stock_1265).
stock_up(stock_1265) with 0.2.
shareholder(paul, stock_1266).
stock_up(stock_1266) with 0.2.
shareholder(paul, stock_1267).
stock_up(stock_1267) with 0.2.
shareholder(paul, stock_1268).
stock_up(stock_1268) with 0.2.
shareholder(paul, stock_1269).
stock_up(stock_1269) with 0.2.
shareholder(paul, stock_1270).
stock_up(stock_1270) with 0.2.
shareholder(paul, stock_1271).
stock_up(stock_1271) with 0.2.
shareholder(paul, stock_1272).
stock_up(stock_1272) with 0.2.
shareholder(paul, stock_1273).
stock_up(stock_1273) with 0.2.
shareholder(paul, stock_1274).
stock_up(stock_1274) with 0.2.
shareholder(paul, stock_1275).
stock_up(stock_1275) with 0.2.
shareholder(paul, stock_1276).
stock_up(stock_1276) with 0.2.
shareholder(paul, stock_1277).
stock_up(stock_1277) with 0.2.
shareholder(paul, stock_1278).
stock_up(stock_1278) with 0.2.
shareholder(paul, stock_1279).
stock_up(stock_1279) with 0.2.
shareholder(paul, stock_1280).
stock_up(stock_1280) with 0.2.
shareholder(paul, stock_1281).
stock_up(stock_1281) with 0.2.
shareholder(paul, stock_1282).
stock_up(stock_1282) with 0.2.
shareholder(paul, stock_1283).
stock_up(stock_1283) with 0.2.
shareholder(paul, stock_1284).
stock_up(stock_1284) with 0.2.
shareholder(paul, stock_1285).
stock_up(stock_1285) with 0.2.
shareholder(paul, stock_1286).
stock_up(stock_1286) with 0.2.
shareholder(paul, stock_1287).
stock_up(stock_1287) with 0.2.
shareholder(paul, stock_1288).
stock_up(stock_1288) with 0.2.
shareholder(paul, stock_1289).
stock_up(stock_1289) with 0.2.
shareholder(paul, stock_1290).
stock_up(stock_1290) with 0.2.
shareholder(paul, stock_1291).
stock_up(stock_1291) with 0.2.
shareholder(paul, stock_1292).
stock_up(stock_1292) with 0.2.
shareholder(paul, stock_1293).
stock_up(stock_1293) with 0.2.
shareholder(paul, stock_1294).
stock_up(stock_1294) with 0.2.
shareholder(paul, stock_1295).
stock_up(stock_1295) with 0.2.
shareholder(paul, stock_1296).
stock_up(stock_1296) with 0.2.
shareholder(paul, stock_1297).
stock_up(stock_1297) with 0.2.
shareholder(paul, stock_1298).
stock_up(stock_1298) with 0.2.
shareholder(paul, stock_1299).
stock_up(stock_1299) with 0.2.
shareholder(paul, stock_1300).
stock_up(stock_1300) with 0.2.
shareholder(paul, stock_1301).
stock_up(stock_1301) with 0.2.
shareholder(paul, stock_1302).
stock_up(stock_1302) with 0.2.
shareholder(paul, stock_1303).
stock_up(stock_1303) with 0.2.
shareholder(paul, stock_1304).
stock_up(stock_1304) with 0.2.
shareholder(paul, stock_1305).
stock_up(stock_1305) with 0.2.
shareholder(paul, stock_1306).
stock_up(stock_1306) with 0.2.
shareholder(paul, stock_1307).
stock_up(stock_1307) with 0.2.
shareholder(paul, stock_1308).
stock_up(stock_1308) with 0.2.
shareholder(paul, stock_1309).
stock_up(stock_1309) with 0.2.
shareholder(paul, stock_1310).
stock_up(stock_1310) with 0.2.
shareholder(paul, stock_1311).
stock_up(stock_1311) with 0.2.
shareholder(paul, stock_1312).
stock_up(stock_1312) with 0.2.
shareholder(paul, stock_1313).
stock_up(stock_1313) with 0.2.
shareholder(paul, stock_1314).
stock_up(stock_1314) with 0.2.
shareholder(paul, stock_1315).
stock_up(stock_1315) with 0.2.
shareholder(paul, stock_1316).
stock_up(stock_1316) with 0.2.
shareholder(paul, stock_1317).
stock_up(stock_1317) with 0.2.
shareholder(paul, stock_1318).
stock_up(stock_1318) with 0.2.
shareholder(paul, stock_1319).
stock_up(stock_1319) with 0.2.
shareholder(paul, stock_1320).
stock_up(stock_1320) with 0.2.
shareholder(paul, stock_1321).
stock_up(stock_1321) with 0.2.
shareholder(paul, stock_1322).
stock_up(stock_1322) with 0.2.
shareholder(paul, stock_1323).
stock_up(stock_1323) with 0.2.
shareholder(paul, stock_1324).
stock_up(stock_1324) with 0.2.
shareholder(paul, stock_1325).
stock_up(stock_1325) with 0.2.
shareholder(paul, stock_1326).
stock_up(stock_1326) with 0.2.
shareholder(paul, stock_1327).
stock_up(stock_1327) with 0.2.
shareholder(paul, stock_1328).
stock_up(stock_1328) with 0.2.
shareholder(paul, stock_1329).
stock_up(stock_1329) with 0.2.
shareholder(paul, stock_1330).
stock_up(stock_1330) with 0.2.
shareholder(paul, stock_1331).
stock_up(stock_1331) with 0.2.
shareholder(paul, stock_1332).
stock_up(stock_1332) with 0.2.
shareholder(paul, stock_1333).
stock_up(stock_1333) with 0.2.
shareholder(paul, stock_1334).
stock_up(stock_1334) with 0.2.
shareholder(paul, stock_1335).
stock_up(stock_1335) with 0.2.
shareholder(paul, stock_1336).
stock_up(stock_1336) with 0.2.
shareholder(paul, stock_1337).
stock_up(stock_1337) with 0.2.
shareholder(paul, stock_1338).
stock_up(stock_1338) with 0.2.
shareholder(paul, stock_1339).
stock_up(stock_1339) with 0.2.
shareholder(paul, stock_1340).
stock_up(stock_1340) with 0.2.
shareholder(paul, stock_1341).
stock_up(stock_1341) with 0.2.
shareholder(paul, stock_1342).
stock_up(stock_1342) with 0.2.
shareholder(paul, stock_1343).
stock_up(stock_1343) with 0.2.
shareholder(paul, stock_1344).
stock_up(stock_1344) with 0.2.
shareholder(paul, stock_1345).
stock_up(stock_1345) with 0.2.
shareholder(paul, stock_1346).
stock_up(stock_1346) with 0.2.
shareholder(paul, stock_1347).
stock_up(stock_1347) with 0.2.
shareholder(paul, stock_1348).
stock_up(stock_1348) with 0.2.
shareholder(paul, stock_1349).
stock_up(stock_1349) with 0.2.
shareholder(paul, stock_1350).
stock_up(stock_1350) with 0.2.
shareholder(paul, stock_1351).
stock_up(stock_1351) with 0.2.
shareholder(paul, stock_1352).
stock_up(stock_1352) with 0.2.
shareholder(paul, stock_1353).
stock_up(stock_1353) with 0.2.
shareholder(paul, stock_1354).
stock_up(stock_1354) with 0.2.
shareholder(paul, stock_1355).
stock_up(stock_1355) with 0.2.
shareholder(paul, stock_1356).
stock_up(stock_1356) with 0.2.
shareholder(paul, stock_1357).
stock_up(stock_1357) with 0.2.
shareholder(paul, stock_1358).
stock_up(stock_1358) with 0.2.
shareholder(paul, stock_1359).
stock_up(stock_1359) with 0.2.
shareholder(paul, stock_1360).
stock_up(stock_1360) with 0.2.
shareholder(paul, stock_1361).
stock_up(stock_1361) with 0.2.
shareholder(paul, stock_1362).
stock_up(stock_1362) with 0.2.
shareholder(paul, stock_1363).
stock_up(stock_1363) with 0.2.
shareholder(paul, stock_1364).
stock_up(stock_1364) with 0.2.
shareholder(paul, stock_1365).
stock_up(stock_1365) with 0.2.
shareholder(paul, stock_1366).
stock_up(stock_1366) with 0.2.
shareholder(paul, stock_1367).
stock_up(stock_1367) with 0.2.
shareholder(paul, stock_1368).
stock_up(stock_1368) with 0.2.
shareholder(paul, stock_1369).
stock_up(stock_1369) with 0.2.
shareholder(paul, stock_1370).
stock_up(stock_1370) with 0.2.
shareholder(paul, stock_1371).
stock_up(stock_1371) with 0.2.
shareholder(paul, stock_1372).
stock_up(stock_1372) with 0.2.
shareholder(paul, stock_1373).
stock_up(stock_1373) with 0.2.
shareholder(paul, stock_1374).
stock_up(stock_1374) with 0.2.
shareholder(paul, stock_1375).
stock_up(stock_1375) with 0.2.
shareholder(paul, stock_1376).
stock_up(stock_1376) with 0.2.
shareholder(paul, stock_1377).
stock_up(stock_1377) with 0.2.
shareholder(paul, stock_1378).
stock_up(stock_1378) with 0.2.
shareholder(paul, stock_1379).
stock_up(stock_1379) with 0.2.
shareholder(paul, stock_1380).
stock_up(stock_1380) with 0.2.
shareholder(paul, stock_1381).
stock_up(stock_1381) with 0.2.
shareholder(paul, stock_1382).
stock_up(stock_1382) with 0.2.
shareholder(paul, stock_1383).
stock_up(stock_1383) with 0.2.
shareholder(paul, stock_1384).
stock_up(stock_1384) with 0.2.
shareholder(paul, stock_1385).
stock_up(stock_1385) with 0.2.
shareholder(paul, stock_1386).
stock_up(stock_1386) with 0.2.
shareholder(paul, stock_1387).
stock_up(stock_1387) with 0.2.
shareholder(paul, stock_1388).
stock_up(stock_1388) with 0.2.
shareholder(paul, stock_1389).
stock_up(stock_1389) with 0.2.
shareholder(paul, stock_1390).
stock_up(stock_1390) with 0.2.
shareholder(paul, stock_1391).
stock_up(stock_1391) with 0.2.
shareholder(paul, stock_1392).
stock_up(stock_1392) with 0.2.
shareholder(paul, stock_1393).
stock_up(stock_1393) with 0.2.
shareholder(paul, stock_1394).
stock_up(stock_1394) with 0.2.
shareholder(paul, stock_1395).
stock_up(stock_1395) with 0.2.
shareholder(paul, stock_1396).
stock_up(stock_1396) with 0.2.
shareholder(paul, stock_1397).
stock_up(stock_1397) with 0.2.
shareholder(paul, stock_1398).
stock_up(stock_1398) with 0.2.
shareholder(paul, stock_1399).
stock_up(stock_1399) with 0.2.
shareholder(paul, stock_1400).
stock_up(stock_1400) with 0.2.
shareholder(paul, stock_1401).
stock_up(stock_1401) with 0.2.
shareholder(paul, stock_1402).
stock_up(stock_1402) with 0.2.
shareholder(paul, stock_1403).
stock_up(stock_1403) with 0.2.
shareholder(paul, stock_1404).
stock_up(stock_1404) with 0.2.
shareholder(paul, stock_1405).
stock_up(stock_1405) with 0.2.
shareholder(paul, stock_1406).
stock_up(stock_1406) with 0.2.
shareholder(paul, stock_1407).
stock_up(stock_1407) with 0.2.
shareholder(paul, stock_1408).
stock_up(stock_1408) with 0.2.
shareholder(paul, stock_1409).
stock_up(stock_1409) with 0.2.
shareholder(paul, stock_1410).
stock_up(stock_1410) with 0.2.
shareholder(paul, stock_1411).
stock_up(stock_1411) with 0.2.
shareholder(paul, stock_1412).
stock_up(stock_1412) with 0.2.
shareholder(paul, stock_1413).
stock_up(stock_1413) with 0.2.
shareholder(paul, stock_1414).
stock_up(stock_1414) with 0.2.
shareholder(paul, stock_1415).
stock_up(stock_1415) with 0.2.
shareholder(paul, stock_1416).
stock_up(stock_1416) with 0.2.
shareholder(paul, stock_1417).
stock_up(stock_1417) with 0.2.
shareholder(paul, stock_1418).
stock_up(stock_1418) with 0.2.
shareholder(paul, stock_1419).
stock_up(stock_1419) with 0.2.
shareholder(paul, stock_1420).
stock_up(stock_1420) with 0.2.
shareholder(paul, stock_1421).
stock_up(stock_1421) with 0.2.
shareholder(paul, stock_1422).
stock_up(stock_1422) with 0.2.
shareholder(paul, stock_1423).
stock_up(stock_1423) with 0.2.
shareholder(paul, stock_1424).
stock_up(stock_1424) with 0.2.
shareholder(paul, stock_1425).
stock_up(stock_1425) with 0.2.
shareholder(paul, stock_1426).
stock_up(stock_1426) with 0.2.
shareholder(paul, stock_1427).
stock_up(stock_1427) with 0.2.
shareholder(paul, stock_1428).
stock_up(stock_1428) with 0.2.
shareholder(paul, stock_1429).
stock_up(stock_1429) with 0.2.
shareholder(paul, stock_1430).
stock_up(stock_1430) with 0.2.
shareholder(paul, stock_1431).
stock_up(stock_1431) with 0.2.
shareholder(paul, stock_1432).
stock_up(stock_1432) with 0.2.
shareholder(paul, stock_1433).
stock_up(stock_1433) with 0.2.
shareholder(paul, stock_1434).
stock_up(stock_1434) with 0.2.
shareholder(paul, stock_1435).
stock_up(stock_1435) with 0.2.
shareholder(paul, stock_1436).
stock_up(stock_1436) with 0.2.
shareholder(paul, stock_1437).
stock_up(stock_1437) with 0.2.
shareholder(paul, stock_1438).
stock_up(stock_1438) with 0.2.
shareholder(paul, stock_1439).
stock_up(stock_1439) with 0.2.
shareholder(paul, stock_1440).
stock_up(stock_1440) with 0.2.
shareholder(paul, stock_1441).
stock_up(stock_1441) with 0.2.
shareholder(paul, stock_1442).
stock_up(stock_1442) with 0.2.
shareholder(paul, stock_1443).
stock_up(stock_1443) with 0.2.
shareholder(paul, stock_1444).
stock_up(stock_1444) with 0.2.
shareholder(paul, stock_1445).
stock_up(stock_1445) with 0.2.
shareholder(paul, stock_1446).
stock_up(stock_1446) with 0.2.
shareholder(paul, stock_1447).
stock_up(stock_1447) with 0.2.
shareholder(paul, stock_1448).
stock_up(stock_1448) with 0.2.
shareholder(paul, stock_1449).
stock_up(stock_1449) with 0.2.
shareholder(paul, stock_1450).
stock_up(stock_1450) with 0.2.
shareholder(paul, stock_1451).
stock_up(stock_1451) with 0.2.
shareholder(paul, stock_1452).
stock_up(stock_1452) with 0.2.
shareholder(paul, stock_1453).
stock_up(stock_1453) with 0.2.
shareholder(paul, stock_1454).
stock_up(stock_1454) with 0.2.
shareholder(paul, stock_1455).
stock_up(stock_1455) with 0.2.
shareholder(paul, stock_1456).
stock_up(stock_1456) with 0.2.
shareholder(paul, stock_1457).
stock_up(stock_1457) with 0.2.
shareholder(paul, stock_1458).
stock_up(stock_1458) with 0.2.
shareholder(paul, stock_1459).
stock_up(stock_1459) with 0.2.
shareholder(paul, stock_1460).
stock_up(stock_1460) with 0.2.
shareholder(paul, stock_1461).
stock_up(stock_1461) with 0.2.
shareholder(paul, stock_1462).
stock_up(stock_1462) with 0.2.
shareholder(paul, stock_1463).
stock_up(stock_1463) with 0.2.
shareholder(paul, stock_1464).
stock_up(stock_1464) with 0.2.
shareholder(paul, stock_1465).
stock_up(stock_1465) with 0.2.
shareholder(paul, stock_1466).
stock_up(stock_1466) with 0.2.
shareholder(paul, stock_1467).
stock_up(stock_1467) with 0.2.
shareholder(paul, stock_1468).
stock_up(stock_1468) with 0.2.
shareholder(paul, stock_1469).
stock_up(stock_1469) with 0.2.
shareholder(paul, stock_1470).
stock_up(stock_1470) with 0.2.
shareholder(paul, stock_1471).
stock_up(stock_1471) with 0.2.
shareholder(paul, stock_1472).
stock_up(stock_1472) with 0.2.
shareholder(paul, stock_1473).
stock_up(stock_1473) with 0.2.
shareholder(paul, stock_1474).
stock_up(stock_1474) with 0.2.
shareholder(paul, stock_1475).
stock_up(stock_1475) with 0.2.
shareholder(paul, stock_1476).
stock_up(stock_1476) with 0.2.
shareholder(paul, stock_1477).
stock_up(stock_1477) with 0.2.
shareholder(paul, stock_1478).
stock_up(stock_1478) with 0.2.
shareholder(paul, stock_1479).
stock_up(stock_1479) with 0.2.
shareholder(paul, stock_1480).
stock_up(stock_1480) with 0.2.
shareholder(paul, stock_1481).
stock_up(stock_1481) with 0.2.
shareholder(paul, stock_1482).
stock_up(stock_1482) with 0.2.
shareholder(paul, stock_1483).
stock_up(stock_1483) with 0.2.
shareholder(paul, stock_1484).
stock_up(stock_1484) with 0.2.
shareholder(paul, stock_1485).
stock_up(stock_1485) with 0.2.
shareholder(paul, stock_1486).
stock_up(stock_1486) with 0.2.
shareholder(paul, stock_1487).
stock_up(stock_1487) with 0.2.
shareholder(paul, stock_1488).
stock_up(stock_1488) with 0.2.
shareholder(paul, stock_1489).
stock_up(stock_1489) with 0.2.
shareholder(paul, stock_1490).
stock_up(stock_1490) with 0.2.
shareholder(paul, stock_1491).
stock_up(stock_1491) with 0.2.
shareholder(paul, stock_1492).
stock_up(stock_1492) with 0.2.
shareholder(paul, stock_1493).
stock_up(stock_1493) with 0.2.
shareholder(paul, stock_1494).
stock_up(stock_1494) with 0.2.
shareholder(paul, stock_1495).
stock_up(stock_1495) with 0.2.
shareholder(paul, stock_1496).
stock_up(stock_1496) with 0.2.
shareholder(paul, stock_1497).
stock_up(stock_1497) with 0.2.
shareholder(paul, stock_1498).
stock_up(stock_1498) with 0.2.
shareholder(paul, stock_1499).
stock_up(stock_1499) with 0.2.
shareholder(paul, stock_1500).
stock_up(stock_1500) with 0.2.
shareholder(paul, stock_1501).
stock_up(stock_1501) with 0.2.
shareholder(paul, stock_1502).
stock_up(stock_1502) with 0.2.
shareholder(paul, stock_1503).
stock_up(stock_1503) with 0.2.
shareholder(paul, stock_1504).
stock_up(stock_1504) with 0.2.
shareholder(paul, stock_1505).
stock_up(stock_1505) with 0.2.
shareholder(paul, stock_1506).
stock_up(stock_1506) with 0.2.
shareholder(paul, stock_1507).
stock_up(stock_1507) with 0.2.
shareholder(paul, stock_1508).
stock_up(stock_1508) with 0.2.
shareholder(paul, stock_1509).
stock_up(stock_1509) with 0.2.
shareholder(paul, stock_1510).
stock_up(stock_1510) with 0.2.
shareholder(paul, stock_1511).
stock_up(stock_1511) with 0.2.
shareholder(paul, stock_1512).
stock_up(stock_1512) with 0.2.
shareholder(paul, stock_1513).
stock_up(stock_1513) with 0.2.
shareholder(paul, stock_1514).
stock_up(stock_1514) with 0.2.
shareholder(paul, stock_1515).
stock_up(stock_1515) with 0.2.
shareholder(paul, stock_1516).
stock_up(stock_1516) with 0.2.
shareholder(paul, stock_1517).
stock_up(stock_1517) with 0.2.
shareholder(paul, stock_1518).
stock_up(stock_1518) with 0.2.
shareholder(paul, stock_1519).
stock_up(stock_1519) with 0.2.
shareholder(paul, stock_1520).
stock_up(stock_1520) with 0.2.
shareholder(paul, stock_1521).
stock_up(stock_1521) with 0.2.
shareholder(paul, stock_1522).
stock_up(stock_1522) with 0.2.
shareholder(paul, stock_1523).
stock_up(stock_1523) with 0.2.
shareholder(paul, stock_1524).
stock_up(stock_1524) with 0.2.
shareholder(paul, stock_1525).
stock_up(stock_1525) with 0.2.
shareholder(paul, stock_1526).
stock_up(stock_1526) with 0.2.
shareholder(paul, stock_1527).
stock_up(stock_1527) with 0.2.
shareholder(paul, stock_1528).
stock_up(stock_1528) with 0.2.
shareholder(paul, stock_1529).
stock_up(stock_1529) with 0.2.
shareholder(paul, stock_1530).
stock_up(stock_1530) with 0.2.
shareholder(paul, stock_1531).
stock_up(stock_1531) with 0.2.
shareholder(paul, stock_1532).
stock_up(stock_1532) with 0.2.
shareholder(paul, stock_1533).
stock_up(stock_1533) with 0.2.
shareholder(paul, stock_1534).
stock_up(stock_1534) with 0.2.
shareholder(paul, stock_1535).
stock_up(stock_1535) with 0.2.
shareholder(paul, stock_1536).
stock_up(stock_1536) with 0.2.
shareholder(paul, stock_1537).
stock_up(stock_1537) with 0.2.
shareholder(paul, stock_1538).
stock_up(stock_1538) with 0.2.
shareholder(paul, stock_1539).
stock_up(stock_1539) with 0.2.
shareholder(paul, stock_1540).
stock_up(stock_1540) with 0.2.
shareholder(paul, stock_1541).
stock_up(stock_1541) with 0.2.
shareholder(paul, stock_1542).
stock_up(stock_1542) with 0.2.
shareholder(paul, stock_1543).
stock_up(stock_1543) with 0.2.
shareholder(paul, stock_1544).
stock_up(stock_1544) with 0.2.
shareholder(paul, stock_1545).
stock_up(stock_1545) with 0.2.
shareholder(paul, stock_1546).
stock_up(stock_1546) with 0.2.
shareholder(paul, stock_1547).
stock_up(stock_1547) with 0.2.
shareholder(paul, stock_1548).
stock_up(stock_1548) with 0.2.
shareholder(paul, stock_1549).
stock_up(stock_1549) with 0.2.
shareholder(paul, stock_1550).
stock_up(stock_1550) with 0.2.
shareholder(paul, stock_1551).
stock_up(stock_1551) with 0.2.
shareholder(paul, stock_1552).
stock_up(stock_1552) with 0.2.
shareholder(paul, stock_1553).
stock_up(stock_1553) with 0.2.
shareholder(paul, stock_1554).
stock_up(stock_1554) with 0.2.
shareholder(paul, stock_1555).
stock_up(stock_1555) with 0.2.
shareholder(paul, stock_1556).
stock_up(stock_1556) with 0.2.
shareholder(paul, stock_1557).
stock_up(stock_1557) with 0.2.
shareholder(paul, stock_1558).
stock_up(stock_1558) with 0.2.
shareholder(paul, stock_1559).
stock_up(stock_1559) with 0.2.
shareholder(paul, stock_1560).
stock_up(stock_1560) with 0.2.
shareholder(paul, stock_1561).
stock_up(stock_1561) with 0.2.
shareholder(paul, stock_1562).
stock_up(stock_1562) with 0.2.
shareholder(paul, stock_1563).
stock_up(stock_1563) with 0.2.
shareholder(paul, stock_1564).
stock_up(stock_1564) with 0.2.
shareholder(paul, stock_1565).
stock_up(stock_1565) with 0.2.
shareholder(paul, stock_1566).
stock_up(stock_1566) with 0.2.
shareholder(paul, stock_1567).
stock_up(stock_1567) with 0.2.
shareholder(paul, stock_1568).
stock_up(stock_1568) with 0.2.
shareholder(paul, stock_1569).
stock_up(stock_1569) with 0.2.
shareholder(paul, stock_1570).
stock_up(stock_1570) with 0.2.
shareholder(paul, stock_1571).
stock_up(stock_1571) with 0.2.
shareholder(paul, stock_1572).
stock_up(stock_1572) with 0.2.
shareholder(paul, stock_1573).
stock_up(stock_1573) with 0.2.
shareholder(paul, stock_1574).
stock_up(stock_1574) with 0.2.
shareholder(paul, stock_1575).
stock_up(stock_1575) with 0.2.
shareholder(paul, stock_1576).
stock_up(stock_1576) with 0.2.
shareholder(paul, stock_1577).
stock_up(stock_1577) with 0.2.
shareholder(paul, stock_1578).
stock_up(stock_1578) with 0.2.
shareholder(paul, stock_1579).
stock_up(stock_1579) with 0.2.
shareholder(paul, stock_1580).
stock_up(stock_1580) with 0.2.
shareholder(paul, stock_1581).
stock_up(stock_1581) with 0.2.
shareholder(paul, stock_1582).
stock_up(stock_1582) with 0.2.
shareholder(paul, stock_1583).
stock_up(stock_1583) with 0.2.
shareholder(paul, stock_1584).
stock_up(stock_1584) with 0.2.
shareholder(paul, stock_1585).
stock_up(stock_1585) with 0.2.
shareholder(paul, stock_1586).
stock_up(stock_1586) with 0.2.
shareholder(paul, stock_1587).
stock_up(stock_1587) with 0.2.
shareholder(paul, stock_1588).
stock_up(stock_1588) with 0.2.
shareholder(paul, stock_1589).
stock_up(stock_1589) with 0.2.
shareholder(paul, stock_1590).
stock_up(stock_1590) with 0.2.
shareholder(paul, stock_1591).
stock_up(stock_1591) with 0.2.
shareholder(paul, stock_1592).
stock_up(stock_1592) with 0.2.
shareholder(paul, stock_1593).
stock_up(stock_1593) with 0.2.
shareholder(paul, stock_1594).
stock_up(stock_1594) with 0.2.
shareholder(paul, stock_1595).
stock_up(stock_1595) with 0.2.
shareholder(paul, stock_1596).
stock_up(stock_1596) with 0.2.
shareholder(paul, stock_1597).
stock_up(stock_1597) with 0.2.
shareholder(paul, stock_1598).
stock_up(stock_1598) with 0.2.
shareholder(paul, stock_1599).
stock_up(stock_1599) with 0.2.
shareholder(paul, stock_1600).
stock_up(stock_1600) with 0.2.
shareholder(paul, stock_1601).
stock_up(stock_1601) with 0.2.
shareholder(paul, stock_1602).
stock_up(stock_1602) with 0.2.
shareholder(paul, stock_1603).
stock_up(stock_1603) with 0.2.
shareholder(paul, stock_1604).
stock_up(stock_1604) with 0.2.
shareholder(paul, stock_1605).
stock_up(stock_1605) with 0.2.
shareholder(paul, stock_1606).
stock_up(stock_1606) with 0.2.
shareholder(paul, stock_1607).
stock_up(stock_1607) with 0.2.
shareholder(paul, stock_1608).
stock_up(stock_1608) with 0.2.
shareholder(paul, stock_1609).
stock_up(stock_1609) with 0.2.
shareholder(paul, stock_1610).
stock_up(stock_1610) with 0.2.
shareholder(paul, stock_1611).
stock_up(stock_1611) with 0.2.
shareholder(paul, stock_1612).
stock_up(stock_1612) with 0.2.
shareholder(paul, stock_1613).
stock_up(stock_1613) with 0.2.
shareholder(paul, stock_1614).
stock_up(stock_1614) with 0.2.
shareholder(paul, stock_1615).
stock_up(stock_1615) with 0.2.
shareholder(paul, stock_1616).
stock_up(stock_1616) with 0.2.
shareholder(paul, stock_1617).
stock_up(stock_1617) with 0.2.
shareholder(paul, stock_1618).
stock_up(stock_1618) with 0.2.
shareholder(paul, stock_1619).
stock_up(stock_1619) with 0.2.
shareholder(paul, stock_1620).
stock_up(stock_1620) with 0.2.
shareholder(paul, stock_1621).
stock_up(stock_1621) with 0.2.
shareholder(paul, stock_1622).
stock_up(stock_1622) with 0.2.
shareholder(paul, stock_1623).
stock_up(stock_1623) with 0.2.
shareholder(paul, stock_1624).
stock_up(stock_1624) with 0.2.
shareholder(paul, stock_1625).
stock_up(stock_1625) with 0.2.
shareholder(paul, stock_1626).
stock_up(stock_1626) with 0.2.
shareholder(paul, stock_1627).
stock_up(stock_1627) with 0.2.
shareholder(paul, stock_1628).
stock_up(stock_1628) with 0.2.
shareholder(paul, stock_1629).
stock_up(stock_1629) with 0.2.
shareholder(paul, stock_1630).
stock_up(stock_1630) with 0.2.
shareholder(paul, stock_1631).
stock_up(stock_1631) with 0.2.
shareholder(paul, stock_1632).
stock_up(stock_1632) with 0.2.
shareholder(paul, stock_1633).
stock_up(stock_1633) with 0.2.
shareholder(paul, stock_1634).
stock_up(stock_1634) with 0.2.
shareholder(paul, stock_1635).
stock_up(stock_1635) with 0.2.
shareholder(paul, stock_1636).
stock_up(stock_1636) with 0.2.
shareholder(paul, stock_1637).
stock_up(stock_1637) with 0.2.
shareholder(paul, stock_1638).
stock_up(stock_1638) with 0.2.
shareholder(paul, stock_1639).
stock_up(stock_1639) with 0.2.
shareholder(paul, stock_1640).
stock_up(stock_1640) with 0.2.
shareholder(paul, stock_1641).
stock_up(stock_1641) with 0.2.
shareholder(paul, stock_1642).
stock_up(stock_1642) with 0.2.
shareholder(paul, stock_1643).
stock_up(stock_1643) with 0.2.
shareholder(paul, stock_1644).
stock_up(stock_1644) with 0.2.
shareholder(paul, stock_1645).
stock_up(stock_1645) with 0.2.
shareholder(paul, stock_1646).
stock_up(stock_1646) with 0.2.
shareholder(paul, stock_1647).
stock_up(stock_1647) with 0.2.
shareholder(paul, stock_1648).
stock_up(stock_1648) with 0.2.
shareholder(paul, stock_1649).
stock_up(stock_1649) with 0.2.
shareholder(paul, stock_1650).
stock_up(stock_1650) with 0.2.
shareholder(paul, stock_1651).
stock_up(stock_1651) with 0.2.
shareholder(paul, stock_1652).
stock_up(stock_1652) with 0.2.
shareholder(paul, stock_1653).
stock_up(stock_1653) with 0.2.
shareholder(paul, stock_1654).
stock_up(stock_1654) with 0.2.
shareholder(paul, stock_1655).
stock_up(stock_1655) with 0.2.
shareholder(paul, stock_1656).
stock_up(stock_1656) with 0.2.
shareholder(paul, stock_1657).
stock_up(stock_1657) with 0.2.
shareholder(paul, stock_1658).
stock_up(stock_1658) with 0.2.
shareholder(paul, stock_1659).
stock_up(stock_1659) with 0.2.
shareholder(paul, stock_1660).
stock_up(stock_1660) with 0.2.
shareholder(paul, stock_1661).
stock_up(stock_1661) with 0.2.
shareholder(paul, stock_1662).
stock_up(stock_1662) with 0.2.
shareholder(paul, stock_1663).
stock_up(stock_1663) with 0.2.
shareholder(paul, stock_1664).
stock_up(stock_1664) with 0.2.
shareholder(paul, stock_1665).
stock_up(stock_1665) with 0.2.
shareholder(paul, stock_1666).
stock_up(stock_1666) with 0.2.
shareholder(paul, stock_1667).
stock_up(stock_1667) with 0.2.
shareholder(paul, stock_1668).
stock_up(stock_1668) with 0.2.
shareholder(paul, stock_1669).
stock_up(stock_1669) with 0.2.
shareholder(paul, stock_1670).
stock_up(stock_1670) with 0.2.
shareholder(paul, stock_1671).
stock_up(stock_1671) with 0.2.
shareholder(paul, stock_1672).
stock_up(stock_1672) with 0.2.
shareholder(paul, stock_1673).
stock_up(stock_1673) with 0.2.
shareholder(paul, stock_1674).
stock_up(stock_1674) with 0.2.
shareholder(paul, stock_1675).
stock_up(stock_1675) with 0.2.
shareholder(paul, stock_1676).
stock_up(stock_1676) with 0.2.
shareholder(paul, stock_1677).
stock_up(stock_1677) with 0.2.
shareholder(paul, stock_1678).
stock_up(stock_1678) with 0.2.
shareholder(paul, stock_1679).
stock_up(stock_1679) with 0.2.
shareholder(paul, stock_1680).
stock_up(stock_1680) with 0.2.
shareholder(paul, stock_1681).
stock_up(stock_1681) with 0.2.
shareholder(paul, stock_1682).
stock_up(stock_1682) with 0.2.
shareholder(paul, stock_1683).
stock_up(stock_1683) with 0.2.
shareholder(paul, stock_1684).
stock_up(stock_1684) with 0.2.
shareholder(paul, stock_1685).
stock_up(stock_1685) with 0.2.
shareholder(paul, stock_1686).
stock_up(stock_1686) with 0.2.
shareholder(paul, stock_1687).
stock_up(stock_1687) with 0.2.
shareholder(paul, stock_1688).
stock_up(stock_1688) with 0.2.
shareholder(paul, stock_1689).
stock_up(stock_1689) with 0.2.
shareholder(paul, stock_1690).
stock_up(stock_1690) with 0.2.
shareholder(paul, stock_1691).
stock_up(stock_1691) with 0.2.
shareholder(paul, stock_1692).
stock_up(stock_1692) with 0.2.
shareholder(paul, stock_1693).
stock_up(stock_1693) with 0.2.
shareholder(paul, stock_1694).
stock_up(stock_1694) with 0.2.
shareholder(paul, stock_1695).
stock_up(stock_1695) with 0.2.
shareholder(paul, stock_1696).
stock_up(stock_1696) with 0.2.
shareholder(paul, stock_1697).
stock_up(stock_1697) with 0.2.
shareholder(paul, stock_1698).
stock_up(stock_1698) with 0.2.
shareholder(paul, stock_1699).
stock_up(stock_1699) with 0.2.
shareholder(paul, stock_1700).
stock_up(stock_1700) with 0.2.
shareholder(paul, stock_1701).
stock_up(stock_1701) with 0.2.
shareholder(paul, stock_1702).
stock_up(stock_1702) with 0.2.
shareholder(paul, stock_1703).
stock_up(stock_1703) with 0.2.
shareholder(paul, stock_1704).
stock_up(stock_1704) with 0.2.
shareholder(paul, stock_1705).
stock_up(stock_1705) with 0.2.
shareholder(paul, stock_1706).
stock_up(stock_1706) with 0.2.
shareholder(paul, stock_1707).
stock_up(stock_1707) with 0.2.
shareholder(paul, stock_1708).
stock_up(stock_1708) with 0.2.
shareholder(paul, stock_1709).
stock_up(stock_1709) with 0.2.
shareholder(paul, stock_1710).
stock_up(stock_1710) with 0.2.
shareholder(paul, stock_1711).
stock_up(stock_1711) with 0.2.
shareholder(paul, stock_1712).
stock_up(stock_1712) with 0.2.
shareholder(paul, stock_1713).
stock_up(stock_1713) with 0.2.
shareholder(paul, stock_1714).
stock_up(stock_1714) with 0.2.
shareholder(paul, stock_1715).
stock_up(stock_1715) with 0.2.
shareholder(paul, stock_1716).
stock_up(stock_1716) with 0.2.
shareholder(paul, stock_1717).
stock_up(stock_1717) with 0.2.
shareholder(paul, stock_1718).
stock_up(stock_1718) with 0.2.
shareholder(paul, stock_1719).
stock_up(stock_1719) with 0.2.
shareholder(paul, stock_1720).
stock_up(stock_1720) with 0.2.
shareholder(paul, stock_1721).
stock_up(stock_1721) with 0.2.
shareholder(paul, stock_1722).
stock_up(stock_1722) with 0.2.
shareholder(paul, stock_1723).
stock_up(stock_1723) with 0.2.
shareholder(paul, stock_1724).
stock_up(stock_1724) with 0.2.
shareholder(paul, stock_1725).
stock_up(stock_1725) with 0.2.
shareholder(paul, stock_1726).
stock_up(stock_1726) with 0.2.
shareholder(paul, stock_1727).
stock_up(stock_1727) with 0.2.
shareholder(paul, stock_1728).
stock_up(stock_1728) with 0.2.
shareholder(paul, stock_1729).
stock_up(stock_1729) with 0.2.
shareholder(paul, stock_1730).
stock_up(stock_1730) with 0.2.
shareholder(paul, stock_1731).
stock_up(stock_1731) with 0.2.
shareholder(paul, stock_1732).
stock_up(stock_1732) with 0.2.
shareholder(paul, stock_1733).
stock_up(stock_1733) with 0.2.
shareholder(paul, stock_1734).
stock_up(stock_1734) with 0.2.
shareholder(paul, stock_1735).
stock_up(stock_1735) with 0.2.
shareholder(paul, stock_1736).
stock_up(stock_1736) with 0.2.
shareholder(paul, stock_1737).
stock_up(stock_1737) with 0.2.
shareholder(paul, stock_1738).
stock_up(stock_1738) with 0.2.
shareholder(paul, stock_1739).
stock_up(stock_1739) with 0.2.
shareholder(paul, stock_1740).
stock_up(stock_1740) with 0.2.
shareholder(paul, stock_1741).
stock_up(stock_1741) with 0.2.
shareholder(paul, stock_1742).
stock_up(stock_1742) with 0.2.
shareholder(paul, stock_1743).
stock_up(stock_1743) with 0.2.
shareholder(paul, stock_1744).
stock_up(stock_1744) with 0.2.
shareholder(paul, stock_1745).
stock_up(stock_1745) with 0.2.
shareholder(paul, stock_1746).
stock_up(stock_1746) with 0.2.
shareholder(paul, stock_1747).
stock_up(stock_1747) with 0.2.
shareholder(paul, stock_1748).
stock_up(stock_1748) with 0.2.
shareholder(paul, stock_1749).
stock_up(stock_1749) with 0.2.
shareholder(paul, stock_1750).
stock_up(stock_1750) with 0.2.
shareholder(paul, stock_1751).
stock_up(stock_1751) with 0.2.
shareholder(paul, stock_1752).
stock_up(stock_1752) with 0.2.
shareholder(paul, stock_1753).
stock_up(stock_1753) with 0.2.
shareholder(paul, stock_1754).
stock_up(stock_1754) with 0.2.
shareholder(paul, stock_1755).
stock_up(stock_1755) with 0.2.
shareholder(paul, stock_1756).
stock_up(stock_1756) with 0.2.
shareholder(paul, stock_1757).
stock_up(stock_1757) with 0.2.
shareholder(paul, stock_1758).
stock_up(stock_1758) with 0.2.
shareholder(paul, stock_1759).
stock_up(stock_1759) with 0.2.
shareholder(paul, stock_1760).
stock_up(stock_1760) with 0.2.
shareholder(paul, stock_1761).
stock_up(stock_1761) with 0.2.
shareholder(paul, stock_1762).
stock_up(stock_1762) with 0.2.
shareholder(paul, stock_1763).
stock_up(stock_1763) with 0.2.
shareholder(paul, stock_1764).
stock_up(stock_1764) with 0.2.
shareholder(paul, stock_1765).
stock_up(stock_1765) with 0.2.
shareholder(paul, stock_1766).
stock_up(stock_1766) with 0.2.
shareholder(paul, stock_1767).
stock_up(stock_1767) with 0.2.
shareholder(paul, stock_1768).
stock_up(stock_1768) with 0.2.
shareholder(paul, stock_1769).
stock_up(stock_1769) with 0.2.
shareholder(paul, stock_1770).
stock_up(stock_1770) with 0.2.
shareholder(paul, stock_1771).
stock_up(stock_1771) with 0.2.
shareholder(paul, stock_1772).
stock_up(stock_1772) with 0.2.
shareholder(paul, stock_1773).
stock_up(stock_1773) with 0.2.
shareholder(paul, stock_1774).
stock_up(stock_1774) with 0.2.
shareholder(paul, stock_1775).
stock_up(stock_1775) with 0.2.
shareholder(paul, stock_1776).
stock_up(stock_1776) with 0.2.
shareholder(paul, stock_1777).
stock_up(stock_1777) with 0.2.
shareholder(paul, stock_1778).
stock_up(stock_1778) with 0.2.
shareholder(paul, stock_1779).
stock_up(stock_1779) with 0.2.
shareholder(paul, stock_1780).
stock_up(stock_1780) with 0.2.
shareholder(paul, stock_1781).
stock_up(stock_1781) with 0.2.
shareholder(paul, stock_1782).
stock_up(stock_1782) with 0.2.
shareholder(paul, stock_1783).
stock_up(stock_1783) with 0.2.
shareholder(paul, stock_1784).
stock_up(stock_1784) with 0.2.
shareholder(paul, stock_1785).
stock_up(stock_1785) with 0.2.
shareholder(paul, stock_1786).
stock_up(stock_1786) with 0.2.
shareholder(paul, stock_1787).
stock_up(stock_1787) with 0.2.
shareholder(paul, stock_1788).
stock_up(stock_1788) with 0.2.
shareholder(paul, stock_1789).
stock_up(stock_1789) with 0.2.
shareholder(paul, stock_1790).
stock_up(stock_1790) with 0.2.
shareholder(paul, stock_1791).
stock_up(stock_1791) with 0.2.
shareholder(paul, stock_1792).
stock_up(stock_1792) with 0.2.
shareholder(paul, stock_1793).
stock_up(stock_1793) with 0.2.
shareholder(paul, stock_1794).
stock_up(stock_1794) with 0.2.
shareholder(paul, stock_1795).
stock_up(stock_1795) with 0.2.
shareholder(paul, stock_1796).
stock_up(stock_1796) with 0.2.
shareholder(paul, stock_1797).
stock_up(stock_1797) with 0.2.
shareholder(paul, stock_1798).
stock_up(stock_1798) with 0.2.
shareholder(paul, stock_1799).
stock_up(stock_1799) with 0.2.
shareholder(paul, stock_1800).
stock_up(stock_1800) with 0.2.
shareholder(paul, stock_1801).
stock_up(stock_1801) with 0.2.
shareholder(paul, stock_1802).
stock_up(stock_1802) with 0.2.
shareholder(paul, stock_1803).
stock_up(stock_1803) with 0.2.
shareholder(paul, stock_1804).
stock_up(stock_1804) with 0.2.
shareholder(paul, stock_1805).
stock_up(stock_1805) with 0.2.
shareholder(paul, stock_1806).
stock_up(stock_1806) with 0.2.
shareholder(paul, stock_1807).
stock_up(stock_1807) with 0.2.
shareholder(paul, stock_1808).
stock_up(stock_1808) with 0.2.
shareholder(paul, stock_1809).
stock_up(stock_1809) with 0.2.
shareholder(paul, stock_1810).
stock_up(stock_1810) with 0.2.
shareholder(paul, stock_1811).
stock_up(stock_1811) with 0.2.
shareholder(paul, stock_1812).
stock_up(stock_1812) with 0.2.
shareholder(paul, stock_1813).
stock_up(stock_1813) with 0.2.
shareholder(paul, stock_1814).
stock_up(stock_1814) with 0.2.
shareholder(paul, stock_1815).
stock_up(stock_1815) with 0.2.
shareholder(paul, stock_1816).
stock_up(stock_1816) with 0.2.
shareholder(paul, stock_1817).
stock_up(stock_1817) with 0.2.
shareholder(paul, stock_1818).
stock_up(stock_1818) with 0.2.
shareholder(paul, stock_1819).
stock_up(stock_1819) with 0.2.
shareholder(paul, stock_1820).
stock_up(stock_1820) with 0.2.
shareholder(paul, stock_1821).
stock_up(stock_1821) with 0.2.
shareholder(paul, stock_1822).
stock_up(stock_1822) with 0.2.
shareholder(paul, stock_1823).
stock_up(stock_1823) with 0.2.
shareholder(paul, stock_1824).
stock_up(stock_1824) with 0.2.
shareholder(paul, stock_1825).
stock_up(stock_1825) with 0.2.
shareholder(paul, stock_1826).
stock_up(stock_1826) with 0.2.
shareholder(paul, stock_1827).
stock_up(stock_1827) with 0.2.
shareholder(paul, stock_1828).
stock_up(stock_1828) with 0.2.
shareholder(paul, stock_1829).
stock_up(stock_1829) with 0.2.
shareholder(paul, stock_1830).
stock_up(stock_1830) with 0.2.
shareholder(paul, stock_1831).
stock_up(stock_1831) with 0.2.
shareholder(paul, stock_1832).
stock_up(stock_1832) with 0.2.
shareholder(paul, stock_1833).
stock_up(stock_1833) with 0.2.
shareholder(paul, stock_1834).
stock_up(stock_1834) with 0.2.
shareholder(paul, stock_1835).
stock_up(stock_1835) with 0.2.
shareholder(paul, stock_1836).
stock_up(stock_1836) with 0.2.
shareholder(paul, stock_1837).
stock_up(stock_1837) with 0.2.
shareholder(paul, stock_1838).
stock_up(stock_1838) with 0.2.
shareholder(paul, stock_1839).
stock_up(stock_1839) with 0.2.
shareholder(paul, stock_1840).
stock_up(stock_1840) with 0.2.
shareholder(paul, stock_1841).
stock_up(stock_1841) with 0.2.
shareholder(paul, stock_1842).
stock_up(stock_1842) with 0.2.
shareholder(paul, stock_1843).
stock_up(stock_1843) with 0.2.
shareholder(paul, stock_1844).
stock_up(stock_1844) with 0.2.
shareholder(paul, stock_1845).
stock_up(stock_1845) with 0.2.
shareholder(paul, stock_1846).
stock_up(stock_1846) with 0.2.
shareholder(paul, stock_1847).
stock_up(stock_1847) with 0.2.
shareholder(paul, stock_1848).
stock_up(stock_1848) with 0.2.
shareholder(paul, stock_1849).
stock_up(stock_1849) with 0.2.
shareholder(paul, stock_1850).
stock_up(stock_1850) with 0.2.
shareholder(paul, stock_1851).
stock_up(stock_1851) with 0.2.
shareholder(paul, stock_1852).
stock_up(stock_1852) with 0.2.
shareholder(paul, stock_1853).
stock_up(stock_1853) with 0.2.
shareholder(paul, stock_1854).
stock_up(stock_1854) with 0.2.
shareholder(paul, stock_1855).
stock_up(stock_1855) with 0.2.
shareholder(paul, stock_1856).
stock_up(stock_1856) with 0.2.
shareholder(paul, stock_1857).
stock_up(stock_1857) with 0.2.
shareholder(paul, stock_1858).
stock_up(stock_1858) with 0.2.
shareholder(paul, stock_1859).
stock_up(stock_1859) with 0.2.
shareholder(paul, stock_1860).
stock_up(stock_1860) with 0.2.
shareholder(paul, stock_1861).
stock_up(stock_1861) with 0.2.
shareholder(paul, stock_1862).
stock_up(stock_1862) with 0.2.
shareholder(paul, stock_1863).
stock_up(stock_1863) with 0.2.
shareholder(paul, stock_1864).
stock_up(stock_1864) with 0.2.
shareholder(paul, stock_1865).
stock_up(stock_1865) with 0.2.
shareholder(paul, stock_1866).
stock_up(stock_1866) with 0.2.
shareholder(paul, stock_1867).
stock_up(stock_1867) with 0.2.
shareholder(paul, stock_1868).
stock_up(stock_1868) with 0.2.
shareholder(paul, stock_1869).
stock_up(stock_1869) with 0.2.
shareholder(paul, stock_1870).
stock_up(stock_1870) with 0.2.
shareholder(paul, stock_1871).
stock_up(stock_1871) with 0.2.
shareholder(paul, stock_1872).
stock_up(stock_1872) with 0.2.
shareholder(paul, stock_1873).
stock_up(stock_1873) with 0.2.
shareholder(paul, stock_1874).
stock_up(stock_1874) with 0.2.
shareholder(paul, stock_1875).
stock_up(stock_1875) with 0.2.
shareholder(paul, stock_1876).
stock_up(stock_1876) with 0.2.
shareholder(paul, stock_1877).
stock_up(stock_1877) with 0.2.
shareholder(paul, stock_1878).
stock_up(stock_1878) with 0.2.
shareholder(paul, stock_1879).
stock_up(stock_1879) with 0.2.
shareholder(paul, stock_1880).
stock_up(stock_1880) with 0.2.
shareholder(paul, stock_1881).
stock_up(stock_1881) with 0.2.
shareholder(paul, stock_1882).
stock_up(stock_1882) with 0.2.
shareholder(paul, stock_1883).
stock_up(stock_1883) with 0.2.
shareholder(paul, stock_1884).
stock_up(stock_1884) with 0.2.
shareholder(paul, stock_1885).
stock_up(stock_1885) with 0.2.
shareholder(paul, stock_1886).
stock_up(stock_1886) with 0.2.
shareholder(paul, stock_1887).
stock_up(stock_1887) with 0.2.
shareholder(paul, stock_1888).
stock_up(stock_1888) with 0.2.
shareholder(paul, stock_1889).
stock_up(stock_1889) with 0.2.
shareholder(paul, stock_1890).
stock_up(stock_1890) with 0.2.
shareholder(paul, stock_1891).
stock_up(stock_1891) with 0.2.
shareholder(paul, stock_1892).
stock_up(stock_1892) with 0.2.
shareholder(paul, stock_1893).
stock_up(stock_1893) with 0.2.
shareholder(paul, stock_1894).
stock_up(stock_1894) with 0.2.
shareholder(paul, stock_1895).
stock_up(stock_1895) with 0.2.
shareholder(paul, stock_1896).
stock_up(stock_1896) with 0.2.
shareholder(paul, stock_1897).
stock_up(stock_1897) with 0.2.
shareholder(paul, stock_1898).
stock_up(stock_1898) with 0.2.
shareholder(paul, stock_1899).
stock_up(stock_1899) with 0.2.
shareholder(paul, stock_1900).
stock_up(stock_1900) with 0.2.
shareholder(paul, stock_1901).
stock_up(stock_1901) with 0.2.
shareholder(paul, stock_1902).
stock_up(stock_1902) with 0.2.
shareholder(paul, stock_1903).
stock_up(stock_1903) with 0.2.
shareholder(paul, stock_1904).
stock_up(stock_1904) with 0.2.
shareholder(paul, stock_1905).
stock_up(stock_1905) with 0.2.
shareholder(paul, stock_1906).
stock_up(stock_1906) with 0.2.
shareholder(paul, stock_1907).
stock_up(stock_1907) with 0.2.
shareholder(paul, stock_1908).
stock_up(stock_1908) with 0.2.
shareholder(paul, stock_1909).
stock_up(stock_1909) with 0.2.
shareholder(paul, stock_1910).
stock_up(stock_1910) with 0.2.
shareholder(paul, stock_1911).
stock_up(stock_1911) with 0.2.
shareholder(paul, stock_1912).
stock_up(stock_1912) with 0.2.
shareholder(paul, stock_1913).
stock_up(stock_1913) with 0.2.
shareholder(paul, stock_1914).
stock_up(stock_1914) with 0.2.
shareholder(paul, stock_1915).
stock_up(stock_1915) with 0.2.
shareholder(paul, stock_1916).
stock_up(stock_1916) with 0.2.
shareholder(paul, stock_1917).
stock_up(stock_1917) with 0.2.
shareholder(paul, stock_1918).
stock_up(stock_1918) with 0.2.
shareholder(paul, stock_1919).
stock_up(stock_1919) with 0.2.
shareholder(paul, stock_1920).
stock_up(stock_1920) with 0.2.
shareholder(paul, stock_1921).
stock_up(stock_1921) with 0.2.
shareholder(paul, stock_1922).
stock_up(stock_1922) with 0.2.
shareholder(paul, stock_1923).
stock_up(stock_1923) with 0.2.
shareholder(paul, stock_1924).
stock_up(stock_1924) with 0.2.
shareholder(paul, stock_1925).
stock_up(stock_1925) with 0.2.
shareholder(paul, stock_1926).
stock_up(stock_1926) with 0.2.
shareholder(paul, stock_1927).
stock_up(stock_1927) with 0.2.
shareholder(paul, stock_1928).
stock_up(stock_1928) with 0.2.
shareholder(paul, stock_1929).
stock_up(stock_1929) with 0.2.
shareholder(paul, stock_1930).
stock_up(stock_1930) with 0.2.
shareholder(paul, stock_1931).
stock_up(stock_1931) with 0.2.
shareholder(paul, stock_1932).
stock_up(stock_1932) with 0.2.
shareholder(paul, stock_1933).
stock_up(stock_1933) with 0.2.
shareholder(paul, stock_1934).
stock_up(stock_1934) with 0.2.
shareholder(paul, stock_1935).
stock_up(stock_1935) with 0.2.
shareholder(paul, stock_1936).
stock_up(stock_1936) with 0.2.
shareholder(paul, stock_1937).
stock_up(stock_1937) with 0.2.
shareholder(paul, stock_1938).
stock_up(stock_1938) with 0.2.
shareholder(paul, stock_1939).
stock_up(stock_1939) with 0.2.
shareholder(paul, stock_1940).
stock_up(stock_1940) with 0.2.
shareholder(paul, stock_1941).
stock_up(stock_1941) with 0.2.
shareholder(paul, stock_1942).
stock_up(stock_1942) with 0.2.
shareholder(paul, stock_1943).
stock_up(stock_1943) with 0.2.
shareholder(paul, stock_1944).
stock_up(stock_1944) with 0.2.
shareholder(paul, stock_1945).
stock_up(stock_1945) with 0.2.
shareholder(paul, stock_1946).
stock_up(stock_1946) with 0.2.
shareholder(paul, stock_1947).
stock_up(stock_1947) with 0.2.
shareholder(paul, stock_1948).
stock_up(stock_1948) with 0.2.
shareholder(paul, stock_1949).
stock_up(stock_1949) with 0.2.
shareholder(paul, stock_1950).
stock_up(stock_1950) with 0.2.
shareholder(paul, stock_1951).
stock_up(stock_1951) with 0.2.
shareholder(paul, stock_1952).
stock_up(stock_1952) with 0.2.
shareholder(paul, stock_1953).
stock_up(stock_1953) with 0.2.
shareholder(paul, stock_1954).
stock_up(stock_1954) with 0.2.
shareholder(paul, stock_1955).
stock_up(stock_1955) with 0.2.
shareholder(paul, stock_1956).
stock_up(stock_1956) with 0.2.
shareholder(paul, stock_1957).
stock_up(stock_1957) with 0.2.
shareholder(paul, stock_1958).
stock_up(stock_1958) with 0.2.
shareholder(paul, stock_1959).
stock_up(stock_1959) with 0.2.
shareholder(paul, stock_1960).
stock_up(stock_1960) with 0.2.
shareholder(paul, stock_1961).
stock_up(stock_1961) with 0.2.
shareholder(paul, stock_1962).
stock_up(stock_1962) with 0.2.
shareholder(paul, stock_1963).
stock_up(stock_1963) with 0.2.
shareholder(paul, stock_1964).
stock_up(stock_1964) with 0.2.
shareholder(paul, stock_1965).
stock_up(stock_1965) with 0.2.
shareholder(paul, stock_1966).
stock_up(stock_1966) with 0.2.
shareholder(paul, stock_1967).
stock_up(stock_1967) with 0.2.
shareholder(paul, stock_1968).
stock_up(stock_1968) with 0.2.
shareholder(paul, stock_1969).
stock_up(stock_1969) with 0.2.
shareholder(paul, stock_1970).
stock_up(stock_1970) with 0.2.
shareholder(paul, stock_1971).
stock_up(stock_1971) with 0.2.
shareholder(paul, stock_1972).
stock_up(stock_1972) with 0.2.
shareholder(paul, stock_1973).
stock_up(stock_1973) with 0.2.
shareholder(paul, stock_1974).
stock_up(stock_1974) with 0.2.
shareholder(paul, stock_1975).
stock_up(stock_1975) with 0.2.
shareholder(paul, stock_1976).
stock_up(stock_1976) with 0.2.
shareholder(paul, stock_1977).
stock_up(stock_1977) with 0.2.
shareholder(paul, stock_1978).
stock_up(stock_1978) with 0.2.
shareholder(paul, stock_1979).
stock_up(stock_1979) with 0.2.
shareholder(paul, stock_1980).
stock_up(stock_1980) with 0.2.
shareholder(paul, stock_1981).
stock_up(stock_1981) with 0.2.
shareholder(paul, stock_1982).
stock_up(stock_1982) with 0.2.
shareholder(paul, stock_1983).
stock_up(stock_1983) with 0.2.
shareholder(paul, stock_1984).
stock_up(stock_1984) with 0.2.
shareholder(paul, stock_1985).
stock_up(stock_1985) with 0.2.
shareholder(paul, stock_1986).
stock_up(stock_1986) with 0.2.
shareholder(paul, stock_1987).
stock_up(stock_1987) with 0.2.
shareholder(paul, stock_1988).
stock_up(stock_1988) with 0.2.
shareholder(paul, stock_1989).
stock_up(stock_1989) with 0.2.
shareholder(paul, stock_1990).
stock_up(stock_1990) with 0.2.
shareholder(paul, stock_1991).
stock_up(stock_1991) with 0.2.
shareholder(paul, stock_1992).
stock_up(stock_1992) with 0.2.
shareholder(paul, stock_1993).
stock_up(stock_1993) with 0.2.
shareholder(paul, stock_1994).
stock_up(stock_1994) with 0.2.
shareholder(paul, stock_1995).
stock_up(stock_1995) with 0.2.
shareholder(paul, stock_1996).
stock_up(stock_1996) with 0.2.
shareholder(paul, stock_1997).
stock_up(stock_1997) with 0.2.
shareholder(paul, stock_1998).
stock_up(stock_1998) with 0.2.
shareholder(paul, stock_1999).
stock_up(stock_1999) with 0.2.
shareholder(paul, stock_2000).
stock_up(stock_2000) with 0.2.
shareholder(paul, stock_2001).
stock_up(stock_2001) with 0.2.
shareholder(paul, stock_2002).
stock_up(stock_2002) with 0.2.
shareholder(paul, stock_2003).
stock_up(stock_2003) with 0.2.
shareholder(paul, stock_2004).
stock_up(stock_2004) with 0.2.
shareholder(paul, stock_2005).
stock_up(stock_2005) with 0.2.
shareholder(paul, stock_2006).
stock_up(stock_2006) with 0.2.
shareholder(paul, stock_2007).
stock_up(stock_2007) with 0.2.
shareholder(paul, stock_2008).
stock_up(stock_2008) with 0.2.
shareholder(paul, stock_2009).
stock_up(stock_2009) with 0.2.
shareholder(paul, stock_2010).
stock_up(stock_2010) with 0.2.
shareholder(paul, stock_2011).
stock_up(stock_2011) with 0.2.
shareholder(paul, stock_2012).
stock_up(stock_2012) with 0.2.
shareholder(paul, stock_2013).
stock_up(stock_2013) with 0.2.
shareholder(paul, stock_2014).
stock_up(stock_2014) with 0.2.
shareholder(paul, stock_2015).
stock_up(stock_2015) with 0.2.
shareholder(paul, stock_2016).
stock_up(stock_2016) with 0.2.
shareholder(paul, stock_2017).
stock_up(stock_2017) with 0.2.
shareholder(paul, stock_2018).
stock_up(stock_2018) with 0.2.
shareholder(paul, stock_2019).
stock_up(stock_2019) with 0.2.
shareholder(paul, stock_2020).
stock_up(stock_2020) with 0.2.
shareholder(paul, stock_2021).
stock_up(stock_2021) with 0.2.
shareholder(paul, stock_2022).
stock_up(stock_2022) with 0.2.
shareholder(paul, stock_2023).
stock_up(stock_2023) with 0.2.
shareholder(paul, stock_2024).
stock_up(stock_2024) with 0.2.
shareholder(paul, stock_2025).
stock_up(stock_2025) with 0.2.
shareholder(paul, stock_2026).
stock_up(stock_2026) with 0.2.
shareholder(paul, stock_2027).
stock_up(stock_2027) with 0.2.
shareholder(paul, stock_2028).
stock_up(stock_2028) with 0.2.
shareholder(paul, stock_2029).
stock_up(stock_2029) with 0.2.
shareholder(paul, stock_2030).
stock_up(stock_2030) with 0.2.
shareholder(paul, stock_2031).
stock_up(stock_2031) with 0.2.
shareholder(paul, stock_2032).
stock_up(stock_2032) with 0.2.
shareholder(paul, stock_2033).
stock_up(stock_2033) with 0.2.
shareholder(paul, stock_2034).
stock_up(stock_2034) with 0.2.
shareholder(paul, stock_2035).
stock_up(stock_2035) with 0.2.
shareholder(paul, stock_2036).
stock_up(stock_2036) with 0.2.
shareholder(paul, stock_2037).
stock_up(stock_2037) with 0.2.
shareholder(paul, stock_2038).
stock_up(stock_2038) with 0.2.
shareholder(paul, stock_2039).
stock_up(stock_2039) with 0.2.
shareholder(paul, stock_2040).
stock_up(stock_2040) with 0.2.
shareholder(paul, stock_2041).
stock_up(stock_2041) with 0.2.
shareholder(paul, stock_2042).
stock_up(stock_2042) with 0.2.
shareholder(paul, stock_2043).
stock_up(stock_2043) with 0.2.
shareholder(paul, stock_2044).
stock_up(stock_2044) with 0.2.
shareholder(paul, stock_2045).
stock_up(stock_2045) with 0.2.
shareholder(paul, stock_2046).
stock_up(stock_2046) with 0.2.
shareholder(paul, stock_2047).
stock_up(stock_2047) with 0.2.
shareholder(paul, stock_2048).
stock_up(stock_2048) with 0.2.
shareholder(paul, stock_2049).
stock_up(stock_2049) with 0.2.
shareholder(paul, stock_2050).
stock_up(stock_2050) with 0.2.
shareholder(paul, stock_2051).
stock_up(stock_2051) with 0.2.
shareholder(paul, stock_2052).
stock_up(stock_2052) with 0.2.
shareholder(paul, stock_2053).
stock_up(stock_2053) with 0.2.
shareholder(paul, stock_2054).
stock_up(stock_2054) with 0.2.
shareholder(paul, stock_2055).
stock_up(stock_2055) with 0.2.
shareholder(paul, stock_2056).
stock_up(stock_2056) with 0.2.
shareholder(paul, stock_2057).
stock_up(stock_2057) with 0.2.
shareholder(paul, stock_2058).
stock_up(stock_2058) with 0.2.
shareholder(paul, stock_2059).
stock_up(stock_2059) with 0.2.
shareholder(paul, stock_2060).
stock_up(stock_2060) with 0.2.
shareholder(paul, stock_2061).
stock_up(stock_2061) with 0.2.
shareholder(paul, stock_2062).
stock_up(stock_2062) with 0.2.
shareholder(paul, stock_2063).
stock_up(stock_2063) with 0.2.
shareholder(paul, stock_2064).
stock_up(stock_2064) with 0.2.
shareholder(paul, stock_2065).
stock_up(stock_2065) with 0.2.
shareholder(paul, stock_2066).
stock_up(stock_2066) with 0.2.
shareholder(paul, stock_2067).
stock_up(stock_2067) with 0.2.
shareholder(paul, stock_2068).
stock_up(stock_2068) with 0.2.
shareholder(paul, stock_2069).
stock_up(stock_2069) with 0.2.
shareholder(paul, stock_2070).
stock_up(stock_2070) with 0.2.
shareholder(paul, stock_2071).
stock_up(stock_2071) with 0.2.
shareholder(paul, stock_2072).
stock_up(stock_2072) with 0.2.
shareholder(paul, stock_2073).
stock_up(stock_2073) with 0.2.
shareholder(paul, stock_2074).
stock_up(stock_2074) with 0.2.
shareholder(paul, stock_2075).
stock_up(stock_2075) with 0.2.
shareholder(paul, stock_2076).
stock_up(stock_2076) with 0.2.
shareholder(paul, stock_2077).
stock_up(stock_2077) with 0.2.
shareholder(paul, stock_2078).
stock_up(stock_2078) with 0.2.
shareholder(paul, stock_2079).
stock_up(stock_2079) with 0.2.
shareholder(paul, stock_2080).
stock_up(stock_2080) with 0.2.
shareholder(paul, stock_2081).
stock_up(stock_2081) with 0.2.
shareholder(paul, stock_2082).
stock_up(stock_2082) with 0.2.
shareholder(paul, stock_2083).
stock_up(stock_2083) with 0.2.
shareholder(paul, stock_2084).
stock_up(stock_2084) with 0.2.
shareholder(paul, stock_2085).
stock_up(stock_2085) with 0.2.
shareholder(paul, stock_2086).
stock_up(stock_2086) with 0.2.
shareholder(paul, stock_2087).
stock_up(stock_2087) with 0.2.
shareholder(paul, stock_2088).
stock_up(stock_2088) with 0.2.
shareholder(paul, stock_2089).
stock_up(stock_2089) with 0.2.
shareholder(paul, stock_2090).
stock_up(stock_2090) with 0.2.
shareholder(paul, stock_2091).
stock_up(stock_2091) with 0.2.
shareholder(paul, stock_2092).
stock_up(stock_2092) with 0.2.
shareholder(paul, stock_2093).
stock_up(stock_2093) with 0.2.
shareholder(paul, stock_2094).
stock_up(stock_2094) with 0.2.
shareholder(paul, stock_2095).
stock_up(stock_2095) with 0.2.
shareholder(paul, stock_2096).
stock_up(stock_2096) with 0.2.
shareholder(paul, stock_2097).
stock_up(stock_2097) with 0.2.
shareholder(paul, stock_2098).
stock_up(stock_2098) with 0.2.
shareholder(paul, stock_2099).
stock_up(stock_2099) with 0.2.
shareholder(paul, stock_2100).
stock_up(stock_2100) with 0.2.
shareholder(paul, stock_2101).
stock_up(stock_2101) with 0.2.
shareholder(paul, stock_2102).
stock_up(stock_2102) with 0.2.
shareholder(paul, stock_2103).
stock_up(stock_2103) with 0.2.
shareholder(paul, stock_2104).
stock_up(stock_2104) with 0.2.
shareholder(paul, stock_2105).
stock_up(stock_2105) with 0.2.
shareholder(paul, stock_2106).
stock_up(stock_2106) with 0.2.
shareholder(paul, stock_2107).
stock_up(stock_2107) with 0.2.
shareholder(paul, stock_2108).
stock_up(stock_2108) with 0.2.
shareholder(paul, stock_2109).
stock_up(stock_2109) with 0.2.
shareholder(paul, stock_2110).
stock_up(stock_2110) with 0.2.
shareholder(paul, stock_2111).
stock_up(stock_2111) with 0.2.
shareholder(paul, stock_2112).
stock_up(stock_2112) with 0.2.
shareholder(paul, stock_2113).
stock_up(stock_2113) with 0.2.
shareholder(paul, stock_2114).
stock_up(stock_2114) with 0.2.
shareholder(paul, stock_2115).
stock_up(stock_2115) with 0.2.
shareholder(paul, stock_2116).
stock_up(stock_2116) with 0.2.
shareholder(paul, stock_2117).
stock_up(stock_2117) with 0.2.
shareholder(paul, stock_2118).
stock_up(stock_2118) with 0.2.
shareholder(paul, stock_2119).
stock_up(stock_2119) with 0.2.
shareholder(paul, stock_2120).
stock_up(stock_2120) with 0.2.
shareholder(paul, stock_2121).
stock_up(stock_2121) with 0.2.
shareholder(paul, stock_2122).
stock_up(stock_2122) with 0.2.
shareholder(paul, stock_2123).
stock_up(stock_2123) with 0.2.
shareholder(paul, stock_2124).
stock_up(stock_2124) with 0.2.
shareholder(paul, stock_2125).
stock_up(stock_2125) with 0.2.
shareholder(paul, stock_2126).
stock_up(stock_2126) with 0.2.
shareholder(paul, stock_2127).
stock_up(stock_2127) with 0.2.
shareholder(paul, stock_2128).
stock_up(stock_2128) with 0.2.
shareholder(paul, stock_2129).
stock_up(stock_2129) with 0.2.
shareholder(paul, stock_2130).
stock_up(stock_2130) with 0.2.
shareholder(paul, stock_2131).
stock_up(stock_2131) with 0.2.
shareholder(paul, stock_2132).
stock_up(stock_2132) with 0.2.
shareholder(paul, stock_2133).
stock_up(stock_2133) with 0.2.
shareholder(paul, stock_2134).
stock_up(stock_2134) with 0.2.
shareholder(paul, stock_2135).
stock_up(stock_2135) with 0.2.
shareholder(paul, stock_2136).
stock_up(stock_2136) with 0.2.
shareholder(paul, stock_2137).
stock_up(stock_2137) with 0.2.
shareholder(paul, stock_2138).
stock_up(stock_2138) with 0.2.
shareholder(paul, stock_2139).
stock_up(stock_2139) with 0.2.
shareholder(paul, stock_2140).
stock_up(stock_2140) with 0.2.
shareholder(paul, stock_2141).
stock_up(stock_2141) with 0.2.
shareholder(paul, stock_2142).
stock_up(stock_2142) with 0.2.
shareholder(paul, stock_2143).
stock_up(stock_2143) with 0.2.
shareholder(paul, stock_2144).
stock_up(stock_2144) with 0.2.
shareholder(paul, stock_2145).
stock_up(stock_2145) with 0.2.
shareholder(paul, stock_2146).
stock_up(stock_2146) with 0.2.
shareholder(paul, stock_2147).
stock_up(stock_2147) with 0.2.
shareholder(paul, stock_2148).
stock_up(stock_2148) with 0.2.
shareholder(paul, stock_2149).
stock_up(stock_2149) with 0.2.
shareholder(paul, stock_2150).
stock_up(stock_2150) with 0.2.
shareholder(paul, stock_2151).
stock_up(stock_2151) with 0.2.
shareholder(paul, stock_2152).
stock_up(stock_2152) with 0.2.
shareholder(paul, stock_2153).
stock_up(stock_2153) with 0.2.
shareholder(paul, stock_2154).
stock_up(stock_2154) with 0.2.
shareholder(paul, stock_2155).
stock_up(stock_2155) with 0.2.
shareholder(paul, stock_2156).
stock_up(stock_2156) with 0.2.
shareholder(paul, stock_2157).
stock_up(stock_2157) with 0.2.
shareholder(paul, stock_2158).
stock_up(stock_2158) with 0.2.
shareholder(paul, stock_2159).
stock_up(stock_2159) with 0.2.
shareholder(paul, stock_2160).
stock_up(stock_2160) with 0.2.
shareholder(paul, stock_2161).
stock_up(stock_2161) with 0.2.
shareholder(paul, stock_2162).
stock_up(stock_2162) with 0.2.
shareholder(paul, stock_2163).
stock_up(stock_2163) with 0.2.
shareholder(paul, stock_2164).
stock_up(stock_2164) with 0.2.
shareholder(paul, stock_2165).
stock_up(stock_2165) with 0.2.
shareholder(paul, stock_2166).
stock_up(stock_2166) with 0.2.
shareholder(paul, stock_2167).
stock_up(stock_2167) with 0.2.
shareholder(paul, stock_2168).
stock_up(stock_2168) with 0.2.
shareholder(paul, stock_2169).
stock_up(stock_2169) with 0.2.
shareholder(paul, stock_2170).
stock_up(stock_2170) with 0.2.
shareholder(paul, stock_2171).
stock_up(stock_2171) with 0.2.
shareholder(paul, stock_2172).
stock_up(stock_2172) with 0.2.
shareholder(paul, stock_2173).
stock_up(stock_2173) with 0.2.
shareholder(paul, stock_2174).
stock_up(stock_2174) with 0.2.
shareholder(paul, stock_2175).
stock_up(stock_2175) with 0.2.
shareholder(paul, stock_2176).
stock_up(stock_2176) with 0.2.
shareholder(paul, stock_2177).
stock_up(stock_2177) with 0.2.
shareholder(paul, stock_2178).
stock_up(stock_2178) with 0.2.
shareholder(paul, stock_2179).
stock_up(stock_2179) with 0.2.
shareholder(paul, stock_2180).
stock_up(stock_2180) with 0.2.
shareholder(paul, stock_2181).
stock_up(stock_2181) with 0.2.
shareholder(paul, stock_2182).
stock_up(stock_2182) with 0.2.
shareholder(paul, stock_2183).
stock_up(stock_2183) with 0.2.
shareholder(paul, stock_2184).
stock_up(stock_2184) with 0.2.
shareholder(paul, stock_2185).
stock_up(stock_2185) with 0.2.
shareholder(paul, stock_2186).
stock_up(stock_2186) with 0.2.
shareholder(paul, stock_2187).
stock_up(stock_2187) with 0.2.
shareholder(paul, stock_2188).
stock_up(stock_2188) with 0.2.
shareholder(paul, stock_2189).
stock_up(stock_2189) with 0.2.
shareholder(paul, stock_2190).
stock_up(stock_2190) with 0.2.
shareholder(paul, stock_2191).
stock_up(stock_2191) with 0.2.
shareholder(paul, stock_2192).
stock_up(stock_2192) with 0.2.
shareholder(paul, stock_2193).
stock_up(stock_2193) with 0.2.
shareholder(paul, stock_2194).
stock_up(stock_2194) with 0.2.
shareholder(paul, stock_2195).
stock_up(stock_2195) with 0.2.
shareholder(paul, stock_2196).
stock_up(stock_2196) with 0.2.
shareholder(paul, stock_2197).
stock_up(stock_2197) with 0.2.
shareholder(paul, stock_2198).
stock_up(stock_2198) with 0.2.
shareholder(paul, stock_2199).
stock_up(stock_2199) with 0.2.
shareholder(paul, stock_2200).
stock_up(stock_2200) with 0.2.
shareholder(paul, stock_2201).
stock_up(stock_2201) with 0.2.
shareholder(paul, stock_2202).
stock_up(stock_2202) with 0.2.
shareholder(paul, stock_2203).
stock_up(stock_2203) with 0.2.
shareholder(paul, stock_2204).
stock_up(stock_2204) with 0.2.
shareholder(paul, stock_2205).
stock_up(stock_2205) with 0.2.
shareholder(paul, stock_2206).
stock_up(stock_2206) with 0.2.
shareholder(paul, stock_2207).
stock_up(stock_2207) with 0.2.
shareholder(paul, stock_2208).
stock_up(stock_2208) with 0.2.
shareholder(paul, stock_2209).
stock_up(stock_2209) with 0.2.
shareholder(paul, stock_2210).
stock_up(stock_2210) with 0.2.
shareholder(paul, stock_2211).
stock_up(stock_2211) with 0.2.
shareholder(paul, stock_2212).
stock_up(stock_2212) with 0.2.
shareholder(paul, stock_2213).
stock_up(stock_2213) with 0.2.
shareholder(paul, stock_2214).
stock_up(stock_2214) with 0.2.
shareholder(paul, stock_2215).
stock_up(stock_2215) with 0.2.
shareholder(paul, stock_2216).
stock_up(stock_2216) with 0.2.
shareholder(paul, stock_2217).
stock_up(stock_2217) with 0.2.
shareholder(paul, stock_2218).
stock_up(stock_2218) with 0.2.
shareholder(paul, stock_2219).
stock_up(stock_2219) with 0.2.
shareholder(paul, stock_2220).
stock_up(stock_2220) with 0.2.
shareholder(paul, stock_2221).
stock_up(stock_2221) with 0.2.
shareholder(paul, stock_2222).
stock_up(stock_2222) with 0.2.
shareholder(paul, stock_2223).
stock_up(stock_2223) with 0.2.
shareholder(paul, stock_2224).
stock_up(stock_2224) with 0.2.
shareholder(paul, stock_2225).
stock_up(stock_2225) with 0.2.
shareholder(paul, stock_2226).
stock_up(stock_2226) with 0.2.
shareholder(paul, stock_2227).
stock_up(stock_2227) with 0.2.
shareholder(paul, stock_2228).
stock_up(stock_2228) with 0.2.
shareholder(paul, stock_2229).
stock_up(stock_2229) with 0.2.
shareholder(paul, stock_2230).
stock_up(stock_2230) with 0.2.
shareholder(paul, stock_2231).
stock_up(stock_2231) with 0.2.
shareholder(paul, stock_2232).
stock_up(stock_2232) with 0.2.
shareholder(paul, stock_2233).
stock_up(stock_2233) with 0.2.
shareholder(paul, stock_2234).
stock_up(stock_2234) with 0.2.
shareholder(paul, stock_2235).
stock_up(stock_2235) with 0.2.
shareholder(paul, stock_2236).
stock_up(stock_2236) with 0.2.
shareholder(paul, stock_2237).
stock_up(stock_2237) with 0.2.
shareholder(paul, stock_2238).
stock_up(stock_2238) with 0.2.
shareholder(paul, stock_2239).
stock_up(stock_2239) with 0.2.
shareholder(paul, stock_2240).
stock_up(stock_2240) with 0.2.
shareholder(paul, stock_2241).
stock_up(stock_2241) with 0.2.
shareholder(paul, stock_2242).
stock_up(stock_2242) with 0.2.
shareholder(paul, stock_2243).
stock_up(stock_2243) with 0.2.
shareholder(paul, stock_2244).
stock_up(stock_2244) with 0.2.
shareholder(paul, stock_2245).
stock_up(stock_2245) with 0.2.
shareholder(paul, stock_2246).
stock_up(stock_2246) with 0.2.
shareholder(paul, stock_2247).
stock_up(stock_2247) with 0.2.
shareholder(paul, stock_2248).
stock_up(stock_2248) with 0.2.
shareholder(paul, stock_2249).
stock_up(stock_2249) with 0.2.
shareholder(paul, stock_2250).
stock_up(stock_2250) with 0.2.
shareholder(paul, stock_2251).
stock_up(stock_2251) with 0.2.
shareholder(paul, stock_2252).
stock_up(stock_2252) with 0.2.
shareholder(paul, stock_2253).
stock_up(stock_2253) with 0.2.
shareholder(paul, stock_2254).
stock_up(stock_2254) with 0.2.
shareholder(paul, stock_2255).
stock_up(stock_2255) with 0.2.
shareholder(paul, stock_2256).
stock_up(stock_2256) with 0.2.
shareholder(paul, stock_2257).
stock_up(stock_2257) with 0.2.
shareholder(paul, stock_2258).
stock_up(stock_2258) with 0.2.
shareholder(paul, stock_2259).
stock_up(stock_2259) with 0.2.
shareholder(paul, stock_2260).
stock_up(stock_2260) with 0.2.
shareholder(paul, stock_2261).
stock_up(stock_2261) with 0.2.
shareholder(paul, stock_2262).
stock_up(stock_2262) with 0.2.
shareholder(paul, stock_2263).
stock_up(stock_2263) with 0.2.
shareholder(paul, stock_2264).
stock_up(stock_2264) with 0.2.
shareholder(paul, stock_2265).
stock_up(stock_2265) with 0.2.
shareholder(paul, stock_2266).
stock_up(stock_2266) with 0.2.
shareholder(paul, stock_2267).
stock_up(stock_2267) with 0.2.
shareholder(paul, stock_2268).
stock_up(stock_2268) with 0.2.
shareholder(paul, stock_2269).
stock_up(stock_2269) with 0.2.
shareholder(paul, stock_2270).
stock_up(stock_2270) with 0.2.
shareholder(paul, stock_2271).
stock_up(stock_2271) with 0.2.
shareholder(paul, stock_2272).
stock_up(stock_2272) with 0.2.
shareholder(paul, stock_2273).
stock_up(stock_2273) with 0.2.
shareholder(paul, stock_2274).
stock_up(stock_2274) with 0.2.
shareholder(paul, stock_2275).
stock_up(stock_2275) with 0.2.
shareholder(paul, stock_2276).
stock_up(stock_2276) with 0.2.
shareholder(paul, stock_2277).
stock_up(stock_2277) with 0.2.
shareholder(paul, stock_2278).
stock_up(stock_2278) with 0.2.
shareholder(paul, stock_2279).
stock_up(stock_2279) with 0.2.
shareholder(paul, stock_2280).
stock_up(stock_2280) with 0.2.
shareholder(paul, stock_2281).
stock_up(stock_2281) with 0.2.
shareholder(paul, stock_2282).
stock_up(stock_2282) with 0.2.
shareholder(paul, stock_2283).
stock_up(stock_2283) with 0.2.
shareholder(paul, stock_2284).
stock_up(stock_2284) with 0.2.
shareholder(paul, stock_2285).
stock_up(stock_2285) with 0.2.
shareholder(paul, stock_2286).
stock_up(stock_2286) with 0.2.
shareholder(paul, stock_2287).
stock_up(stock_2287) with 0.2.
shareholder(paul, stock_2288).
stock_up(stock_2288) with 0.2.
shareholder(paul, stock_2289).
stock_up(stock_2289) with 0.2.
shareholder(paul, stock_2290).
stock_up(stock_2290) with 0.2.
shareholder(paul, stock_2291).
stock_up(stock_2291) with 0.2.
shareholder(paul, stock_2292).
stock_up(stock_2292) with 0.2.
shareholder(paul, stock_2293).
stock_up(stock_2293) with 0.2.
shareholder(paul, stock_2294).
stock_up(stock_2294) with 0.2.
shareholder(paul, stock_2295).
stock_up(stock_2295) with 0.2.
shareholder(paul, stock_2296).
stock_up(stock_2296) with 0.2.
shareholder(paul, stock_2297).
stock_up(stock_2297) with 0.2.
shareholder(paul, stock_2298).
stock_up(stock_2298) with 0.2.
shareholder(paul, stock_2299).
stock_up(stock_2299) with 0.2.
shareholder(paul, stock_2300).
stock_up(stock_2300) with 0.2.
shareholder(paul, stock_2301).
stock_up(stock_2301) with 0.2.
shareholder(paul, stock_2302).
stock_up(stock_2302) with 0.2.
shareholder(paul, stock_2303).
stock_up(stock_2303) with 0.2.
shareholder(paul, stock_2304).
stock_up(stock_2304) with 0.2.
shareholder(paul, stock_2305).
stock_up(stock_2305) with 0.2.
shareholder(paul, stock_2306).
stock_up(stock_2306) with 0.2.
shareholder(paul, stock_2307).
stock_up(stock_2307) with 0.2.
shareholder(paul, stock_2308).
stock_up(stock_2308) with 0.2.
shareholder(paul, stock_2309).
stock_up(stock_2309) with 0.2.
shareholder(paul, stock_2310).
stock_up(stock_2310) with 0.2.
shareholder(paul, stock_2311).
stock_up(stock_2311) with 0.2.
shareholder(paul, stock_2312).
stock_up(stock_2312) with 0.2.
shareholder(paul, stock_2313).
stock_up(stock_2313) with 0.2.
shareholder(paul, stock_2314).
stock_up(stock_2314) with 0.2.
shareholder(paul, stock_2315).
stock_up(stock_2315) with 0.2.
shareholder(paul, stock_2316).
stock_up(stock_2316) with 0.2.
shareholder(paul, stock_2317).
stock_up(stock_2317) with 0.2.
shareholder(paul, stock_2318).
stock_up(stock_2318) with 0.2.
shareholder(paul, stock_2319).
stock_up(stock_2319) with 0.2.
shareholder(paul, stock_2320).
stock_up(stock_2320) with 0.2.
shareholder(paul, stock_2321).
stock_up(stock_2321) with 0.2.
shareholder(paul, stock_2322).
stock_up(stock_2322) with 0.2.
shareholder(paul, stock_2323).
stock_up(stock_2323) with 0.2.
shareholder(paul, stock_2324).
stock_up(stock_2324) with 0.2.
shareholder(paul, stock_2325).
stock_up(stock_2325) with 0.2.
shareholder(paul, stock_2326).
stock_up(stock_2326) with 0.2.
shareholder(paul, stock_2327).
stock_up(stock_2327) with 0.2.
shareholder(paul, stock_2328).
stock_up(stock_2328) with 0.2.
shareholder(paul, stock_2329).
stock_up(stock_2329) with 0.2.
shareholder(paul, stock_2330).
stock_up(stock_2330) with 0.2.
shareholder(paul, stock_2331).
stock_up(stock_2331) with 0.2.
shareholder(paul, stock_2332).
stock_up(stock_2332) with 0.2.
shareholder(paul, stock_2333).
stock_up(stock_2333) with 0.2.
shareholder(paul, stock_2334).
stock_up(stock_2334) with 0.2.
shareholder(paul, stock_2335).
stock_up(stock_2335) with 0.2.
shareholder(paul, stock_2336).
stock_up(stock_2336) with 0.2.
shareholder(paul, stock_2337).
stock_up(stock_2337) with 0.2.
shareholder(paul, stock_2338).
stock_up(stock_2338) with 0.2.
shareholder(paul, stock_2339).
stock_up(stock_2339) with 0.2.
shareholder(paul, stock_2340).
stock_up(stock_2340) with 0.2.
shareholder(paul, stock_2341).
stock_up(stock_2341) with 0.2.
shareholder(paul, stock_2342).
stock_up(stock_2342) with 0.2.
shareholder(paul, stock_2343).
stock_up(stock_2343) with 0.2.
shareholder(paul, stock_2344).
stock_up(stock_2344) with 0.2.
shareholder(paul, stock_2345).
stock_up(stock_2345) with 0.2.
shareholder(paul, stock_2346).
stock_up(stock_2346) with 0.2.
shareholder(paul, stock_2347).
stock_up(stock_2347) with 0.2.
shareholder(paul, stock_2348).
stock_up(stock_2348) with 0.2.
shareholder(paul, stock_2349).
stock_up(stock_2349) with 0.2.
shareholder(paul, stock_2350).
stock_up(stock_2350) with 0.2.
shareholder(paul, stock_2351).
stock_up(stock_2351) with 0.2.
shareholder(paul, stock_2352).
stock_up(stock_2352) with 0.2.
shareholder(paul, stock_2353).
stock_up(stock_2353) with 0.2.
shareholder(paul, stock_2354).
stock_up(stock_2354) with 0.2.
shareholder(paul, stock_2355).
stock_up(stock_2355) with 0.2.
shareholder(paul, stock_2356).
stock_up(stock_2356) with 0.2.
shareholder(paul, stock_2357).
stock_up(stock_2357) with 0.2.
shareholder(paul, stock_2358).
stock_up(stock_2358) with 0.2.
shareholder(paul, stock_2359).
stock_up(stock_2359) with 0.2.
shareholder(paul, stock_2360).
stock_up(stock_2360) with 0.2.
shareholder(paul, stock_2361).
stock_up(stock_2361) with 0.2.
shareholder(paul, stock_2362).
stock_up(stock_2362) with 0.2.
shareholder(paul, stock_2363).
stock_up(stock_2363) with 0.2.
shareholder(paul, stock_2364).
stock_up(stock_2364) with 0.2.
shareholder(paul, stock_2365).
stock_up(stock_2365) with 0.2.
shareholder(paul, stock_2366).
stock_up(stock_2366) with 0.2.
shareholder(paul, stock_2367).
stock_up(stock_2367) with 0.2.
shareholder(paul, stock_2368).
stock_up(stock_2368) with 0.2.
shareholder(paul, stock_2369).
stock_up(stock_2369) with 0.2.
shareholder(paul, stock_2370).
stock_up(stock_2370) with 0.2.
shareholder(paul, stock_2371).
stock_up(stock_2371) with 0.2.
shareholder(paul, stock_2372).
stock_up(stock_2372) with 0.2.
shareholder(paul, stock_2373).
stock_up(stock_2373) with 0.2.
shareholder(paul, stock_2374).
stock_up(stock_2374) with 0.2.
shareholder(paul, stock_2375).
stock_up(stock_2375) with 0.2.
shareholder(paul, stock_2376).
stock_up(stock_2376) with 0.2.
shareholder(paul, stock_2377).
stock_up(stock_2377) with 0.2.
shareholder(paul, stock_2378).
stock_up(stock_2378) with 0.2.
shareholder(paul, stock_2379).
stock_up(stock_2379) with 0.2.
shareholder(paul, stock_2380).
stock_up(stock_2380) with 0.2.
shareholder(paul, stock_2381).
stock_up(stock_2381) with 0.2.
shareholder(paul, stock_2382).
stock_up(stock_2382) with 0.2.
shareholder(paul, stock_2383).
stock_up(stock_2383) with 0.2.
shareholder(paul, stock_2384).
stock_up(stock_2384) with 0.2.
shareholder(paul, stock_2385).
stock_up(stock_2385) with 0.2.
shareholder(paul, stock_2386).
stock_up(stock_2386) with 0.2.
shareholder(paul, stock_2387).
stock_up(stock_2387) with 0.2.
shareholder(paul, stock_2388).
stock_up(stock_2388) with 0.2.
shareholder(paul, stock_2389).
stock_up(stock_2389) with 0.2.
shareholder(paul, stock_2390).
stock_up(stock_2390) with 0.2.
shareholder(paul, stock_2391).
stock_up(stock_2391) with 0.2.
shareholder(paul, stock_2392).
stock_up(stock_2392) with 0.2.
shareholder(paul, stock_2393).
stock_up(stock_2393) with 0.2.
shareholder(paul, stock_2394).
stock_up(stock_2394) with 0.2.
shareholder(paul, stock_2395).
stock_up(stock_2395) with 0.2.
shareholder(paul, stock_2396).
stock_up(stock_2396) with 0.2.
shareholder(paul, stock_2397).
stock_up(stock_2397) with 0.2.
shareholder(paul, stock_2398).
stock_up(stock_2398) with 0.2.
shareholder(paul, stock_2399).
stock_up(stock_2399) with 0.2.
shareholder(paul, stock_2400).
stock_up(stock_2400) with 0.2.
shareholder(paul, stock_2401).
stock_up(stock_2401) with 0.2.
shareholder(paul, stock_2402).
stock_up(stock_2402) with 0.2.
shareholder(paul, stock_2403).
stock_up(stock_2403) with 0.2.
shareholder(paul, stock_2404).
stock_up(stock_2404) with 0.2.
shareholder(paul, stock_2405).
stock_up(stock_2405) with 0.2.
shareholder(paul, stock_2406).
stock_up(stock_2406) with 0.2.
shareholder(paul, stock_2407).
stock_up(stock_2407) with 0.2.
shareholder(paul, stock_2408).
stock_up(stock_2408) with 0.2.
shareholder(paul, stock_2409).
stock_up(stock_2409) with 0.2.
shareholder(paul, stock_2410).
stock_up(stock_2410) with 0.2.
shareholder(paul, stock_2411).
stock_up(stock_2411) with 0.2.
shareholder(paul, stock_2412).
stock_up(stock_2412) with 0.2.
shareholder(paul, stock_2413).
stock_up(stock_2413) with 0.2.
shareholder(paul, stock_2414).
stock_up(stock_2414) with 0.2.
shareholder(paul, stock_2415).
stock_up(stock_2415) with 0.2.
shareholder(paul, stock_2416).
stock_up(stock_2416) with 0.2.
shareholder(paul, stock_2417).
stock_up(stock_2417) with 0.2.
shareholder(paul, stock_2418).
stock_up(stock_2418) with 0.2.
shareholder(paul, stock_2419).
stock_up(stock_2419) with 0.2.
shareholder(paul, stock_2420).
stock_up(stock_2420) with 0.2.
shareholder(paul, stock_2421).
stock_up(stock_2421) with 0.2.
shareholder(paul, stock_2422).
stock_up(stock_2422) with 0.2.
shareholder(paul, stock_2423).
stock_up(stock_2423) with 0.2.
shareholder(paul, stock_2424).
stock_up(stock_2424) with 0.2.
shareholder(paul, stock_2425).
stock_up(stock_2425) with 0.2.
shareholder(paul, stock_2426).
stock_up(stock_2426) with 0.2.
shareholder(paul, stock_2427).
stock_up(stock_2427) with 0.2.
shareholder(paul, stock_2428).
stock_up(stock_2428) with 0.2.
shareholder(paul, stock_2429).
stock_up(stock_2429) with 0.2.
shareholder(paul, stock_2430).
stock_up(stock_2430) with 0.2.
shareholder(paul, stock_2431).
stock_up(stock_2431) with 0.2.
shareholder(paul, stock_2432).
stock_up(stock_2432) with 0.2.
shareholder(paul, stock_2433).
stock_up(stock_2433) with 0.2.
shareholder(paul, stock_2434).
stock_up(stock_2434) with 0.2.
shareholder(paul, stock_2435).
stock_up(stock_2435) with 0.2.
shareholder(paul, stock_2436).
stock_up(stock_2436) with 0.2.
shareholder(paul, stock_2437).
stock_up(stock_2437) with 0.2.
shareholder(paul, stock_2438).
stock_up(stock_2438) with 0.2.
shareholder(paul, stock_2439).
stock_up(stock_2439) with 0.2.
shareholder(paul, stock_2440).
stock_up(stock_2440) with 0.2.
shareholder(paul, stock_2441).
stock_up(stock_2441) with 0.2.
shareholder(paul, stock_2442).
stock_up(stock_2442) with 0.2.
shareholder(paul, stock_2443).
stock_up(stock_2443) with 0.2.
shareholder(paul, stock_2444).
stock_up(stock_2444) with 0.2.
shareholder(paul, stock_2445).
stock_up(stock_2445) with 0.2.
shareholder(paul, stock_2446).
stock_up(stock_2446) with 0.2.
shareholder(paul, stock_2447).
stock_up(stock_2447) with 0.2.
shareholder(paul, stock_2448).
stock_up(stock_2448) with 0.2.
shareholder(paul, stock_2449).
stock_up(stock_2449) with 0.2.
shareholder(paul, stock_2450).
stock_up(stock_2450) with 0.2.
shareholder(paul, stock_2451).
stock_up(stock_2451) with 0.2.
shareholder(paul, stock_2452).
stock_up(stock_2452) with 0.2.
shareholder(paul, stock_2453).
stock_up(stock_2453) with 0.2.
shareholder(paul, stock_2454).
stock_up(stock_2454) with 0.2.
shareholder(paul, stock_2455).
stock_up(stock_2455) with 0.2.
shareholder(paul, stock_2456).
stock_up(stock_2456) with 0.2.
shareholder(paul, stock_2457).
stock_up(stock_2457) with 0.2.
shareholder(paul, stock_2458).
stock_up(stock_2458) with 0.2.
shareholder(paul, stock_2459).
stock_up(stock_2459) with 0.2.
shareholder(paul, stock_2460).
stock_up(stock_2460) with 0.2.
shareholder(paul, stock_2461).
stock_up(stock_2461) with 0.2.
shareholder(paul, stock_2462).
stock_up(stock_2462) with 0.2.
shareholder(paul, stock_2463).
stock_up(stock_2463) with 0.2.
shareholder(paul, stock_2464).
stock_up(stock_2464) with 0.2.
shareholder(paul, stock_2465).
stock_up(stock_2465) with 0.2.
shareholder(paul, stock_2466).
stock_up(stock_2466) with 0.2.
shareholder(paul, stock_2467).
stock_up(stock_2467) with 0.2.
shareholder(paul, stock_2468).
stock_up(stock_2468) with 0.2.
shareholder(paul, stock_2469).
stock_up(stock_2469) with 0.2.
shareholder(paul, stock_2470).
stock_up(stock_2470) with 0.2.
shareholder(paul, stock_2471).
stock_up(stock_2471) with 0.2.
shareholder(paul, stock_2472).
stock_up(stock_2472) with 0.2.
shareholder(paul, stock_2473).
stock_up(stock_2473) with 0.2.
shareholder(paul, stock_2474).
stock_up(stock_2474) with 0.2.
shareholder(paul, stock_2475).
stock_up(stock_2475) with 0.2.
shareholder(paul, stock_2476).
stock_up(stock_2476) with 0.2.
shareholder(paul, stock_2477).
stock_up(stock_2477) with 0.2.
shareholder(paul, stock_2478).
stock_up(stock_2478) with 0.2.
shareholder(paul, stock_2479).
stock_up(stock_2479) with 0.2.
shareholder(paul, stock_2480).
stock_up(stock_2480) with 0.2.
shareholder(paul, stock_2481).
stock_up(stock_2481) with 0.2.
shareholder(paul, stock_2482).
stock_up(stock_2482) with 0.2.
shareholder(paul, stock_2483).
stock_up(stock_2483) with 0.2.
shareholder(paul, stock_2484).
stock_up(stock_2484) with 0.2.
shareholder(paul, stock_2485).
stock_up(stock_2485) with 0.2.
shareholder(paul, stock_2486).
stock_up(stock_2486) with 0.2.
shareholder(paul, stock_2487).
stock_up(stock_2487) with 0.2.
shareholder(paul, stock_2488).
stock_up(stock_2488) with 0.2.
shareholder(paul, stock_2489).
stock_up(stock_2489) with 0.2.
shareholder(paul, stock_2490).
stock_up(stock_2490) with 0.2.
shareholder(paul, stock_2491).
stock_up(stock_2491) with 0.2.
shareholder(paul, stock_2492).
stock_up(stock_2492) with 0.2.
shareholder(paul, stock_2493).
stock_up(stock_2493) with 0.2.
shareholder(paul, stock_2494).
stock_up(stock_2494) with 0.2.
shareholder(paul, stock_2495).
stock_up(stock_2495) with 0.2.
shareholder(paul, stock_2496).
stock_up(stock_2496) with 0.2.
shareholder(paul, stock_2497).
stock_up(stock_2497) with 0.2.
shareholder(paul, stock_2498).
stock_up(stock_2498) with 0.2.
shareholder(paul, stock_2499).
stock_up(stock_2499) with 0.2.
shareholder(paul, stock_2500).
stock_up(stock_2500) with 0.2.
shareholder(paul, stock_2501).
stock_up(stock_2501) with 0.2.
shareholder(paul, stock_2502).
stock_up(stock_2502) with 0.2.
shareholder(paul, stock_2503).
stock_up(stock_2503) with 0.2.
shareholder(paul, stock_2504).
stock_up(stock_2504) with 0.2.
shareholder(paul, stock_2505).
stock_up(stock_2505) with 0.2.
shareholder(paul, stock_2506).
stock_up(stock_2506) with 0.2.
shareholder(paul, stock_2507).
stock_up(stock_2507) with 0.2.
shareholder(paul, stock_2508).
stock_up(stock_2508) with 0.2.
shareholder(paul, stock_2509).
stock_up(stock_2509) with 0.2.
shareholder(paul, stock_2510).
stock_up(stock_2510) with 0.2.
shareholder(paul, stock_2511).
stock_up(stock_2511) with 0.2.
shareholder(paul, stock_2512).
stock_up(stock_2512) with 0.2.
shareholder(paul, stock_2513).
stock_up(stock_2513) with 0.2.
shareholder(paul, stock_2514).
stock_up(stock_2514) with 0.2.
shareholder(paul, stock_2515).
stock_up(stock_2515) with 0.2.
shareholder(paul, stock_2516).
stock_up(stock_2516) with 0.2.
shareholder(paul, stock_2517).
stock_up(stock_2517) with 0.2.
shareholder(paul, stock_2518).
stock_up(stock_2518) with 0.2.
shareholder(paul, stock_2519).
stock_up(stock_2519) with 0.2.
shareholder(paul, stock_2520).
stock_up(stock_2520) with 0.2.
shareholder(paul, stock_2521).
stock_up(stock_2521) with 0.2.
shareholder(paul, stock_2522).
stock_up(stock_2522) with 0.2.
shareholder(paul, stock_2523).
stock_up(stock_2523) with 0.2.
shareholder(paul, stock_2524).
stock_up(stock_2524) with 0.2.
shareholder(paul, stock_2525).
stock_up(stock_2525) with 0.2.
shareholder(paul, stock_2526).
stock_up(stock_2526) with 0.2.
shareholder(paul, stock_2527).
stock_up(stock_2527) with 0.2.
shareholder(paul, stock_2528).
stock_up(stock_2528) with 0.2.
shareholder(paul, stock_2529).
stock_up(stock_2529) with 0.2.
shareholder(paul, stock_2530).
stock_up(stock_2530) with 0.2.
shareholder(paul, stock_2531).
stock_up(stock_2531) with 0.2.
shareholder(paul, stock_2532).
stock_up(stock_2532) with 0.2.
shareholder(paul, stock_2533).
stock_up(stock_2533) with 0.2.
shareholder(paul, stock_2534).
stock_up(stock_2534) with 0.2.
shareholder(paul, stock_2535).
stock_up(stock_2535) with 0.2.
shareholder(paul, stock_2536).
stock_up(stock_2536) with 0.2.
shareholder(paul, stock_2537).
stock_up(stock_2537) with 0.2.
shareholder(paul, stock_2538).
stock_up(stock_2538) with 0.2.
shareholder(paul, stock_2539).
stock_up(stock_2539) with 0.2.
shareholder(paul, stock_2540).
stock_up(stock_2540) with 0.2.
shareholder(paul, stock_2541).
stock_up(stock_2541) with 0.2.
shareholder(paul, stock_2542).
stock_up(stock_2542) with 0.2.
shareholder(paul, stock_2543).
stock_up(stock_2543) with 0.2.
shareholder(paul, stock_2544).
stock_up(stock_2544) with 0.2.
shareholder(paul, stock_2545).
stock_up(stock_2545) with 0.2.
shareholder(paul, stock_2546).
stock_up(stock_2546) with 0.2.
shareholder(paul, stock_2547).
stock_up(stock_2547) with 0.2.
shareholder(paul, stock_2548).
stock_up(stock_2548) with 0.2.
shareholder(paul, stock_2549).
stock_up(stock_2549) with 0.2.
shareholder(paul, stock_2550).
stock_up(stock_2550) with 0.2.
shareholder(paul, stock_2551).
stock_up(stock_2551) with 0.2.
shareholder(paul, stock_2552).
stock_up(stock_2552) with 0.2.
shareholder(paul, stock_2553).
stock_up(stock_2553) with 0.2.
shareholder(paul, stock_2554).
stock_up(stock_2554) with 0.2.
shareholder(paul, stock_2555).
stock_up(stock_2555) with 0.2.
shareholder(paul, stock_2556).
stock_up(stock_2556) with 0.2.
shareholder(paul, stock_2557).
stock_up(stock_2557) with 0.2.
shareholder(paul, stock_2558).
stock_up(stock_2558) with 0.2.
shareholder(paul, stock_2559).
stock_up(stock_2559) with 0.2.
shareholder(paul, stock_2560).
stock_up(stock_2560) with 0.2.
shareholder(paul, stock_2561).
stock_up(stock_2561) with 0.2.
shareholder(paul, stock_2562).
stock_up(stock_2562) with 0.2.
shareholder(paul, stock_2563).
stock_up(stock_2563) with 0.2.
shareholder(paul, stock_2564).
stock_up(stock_2564) with 0.2.
shareholder(paul, stock_2565).
stock_up(stock_2565) with 0.2.
shareholder(paul, stock_2566).
stock_up(stock_2566) with 0.2.
shareholder(paul, stock_2567).
stock_up(stock_2567) with 0.2.
shareholder(paul, stock_2568).
stock_up(stock_2568) with 0.2.
shareholder(paul, stock_2569).
stock_up(stock_2569) with 0.2.
shareholder(paul, stock_2570).
stock_up(stock_2570) with 0.2.
shareholder(paul, stock_2571).
stock_up(stock_2571) with 0.2.
shareholder(paul, stock_2572).
stock_up(stock_2572) with 0.2.
shareholder(paul, stock_2573).
stock_up(stock_2573) with 0.2.
shareholder(paul, stock_2574).
stock_up(stock_2574) with 0.2.
shareholder(paul, stock_2575).
stock_up(stock_2575) with 0.2.
shareholder(paul, stock_2576).
stock_up(stock_2576) with 0.2.
shareholder(paul, stock_2577).
stock_up(stock_2577) with 0.2.
shareholder(paul, stock_2578).
stock_up(stock_2578) with 0.2.
shareholder(paul, stock_2579).
stock_up(stock_2579) with 0.2.
shareholder(paul, stock_2580).
stock_up(stock_2580) with 0.2.
shareholder(paul, stock_2581).
stock_up(stock_2581) with 0.2.
shareholder(paul, stock_2582).
stock_up(stock_2582) with 0.2.
shareholder(paul, stock_2583).
stock_up(stock_2583) with 0.2.
shareholder(paul, stock_2584).
stock_up(stock_2584) with 0.2.
shareholder(paul, stock_2585).
stock_up(stock_2585) with 0.2.
shareholder(paul, stock_2586).
stock_up(stock_2586) with 0.2.
shareholder(paul, stock_2587).
stock_up(stock_2587) with 0.2.
shareholder(paul, stock_2588).
stock_up(stock_2588) with 0.2.
shareholder(paul, stock_2589).
stock_up(stock_2589) with 0.2.
shareholder(paul, stock_2590).
stock_up(stock_2590) with 0.2.
shareholder(paul, stock_2591).
stock_up(stock_2591) with 0.2.
shareholder(paul, stock_2592).
stock_up(stock_2592) with 0.2.
shareholder(paul, stock_2593).
stock_up(stock_2593) with 0.2.
shareholder(paul, stock_2594).
stock_up(stock_2594) with 0.2.
shareholder(paul, stock_2595).
stock_up(stock_2595) with 0.2.
shareholder(paul, stock_2596).
stock_up(stock_2596) with 0.2.
shareholder(paul, stock_2597).
stock_up(stock_2597) with 0.2.
shareholder(paul, stock_2598).
stock_up(stock_2598) with 0.2.
shareholder(paul, stock_2599).
stock_up(stock_2599) with 0.2.
shareholder(paul, stock_2600).
stock_up(stock_2600) with 0.2.
shareholder(paul, stock_2601).
stock_up(stock_2601) with 0.2.
shareholder(paul, stock_2602).
stock_up(stock_2602) with 0.2.
shareholder(paul, stock_2603).
stock_up(stock_2603) with 0.2.
shareholder(paul, stock_2604).
stock_up(stock_2604) with 0.2.
shareholder(paul, stock_2605).
stock_up(stock_2605) with 0.2.
shareholder(paul, stock_2606).
stock_up(stock_2606) with 0.2.
shareholder(paul, stock_2607).
stock_up(stock_2607) with 0.2.
shareholder(paul, stock_2608).
stock_up(stock_2608) with 0.2.
shareholder(paul, stock_2609).
stock_up(stock_2609) with 0.2.
shareholder(paul, stock_2610).
stock_up(stock_2610) with 0.2.
shareholder(paul, stock_2611).
stock_up(stock_2611) with 0.2.
shareholder(paul, stock_2612).
stock_up(stock_2612) with 0.2.
shareholder(paul, stock_2613).
stock_up(stock_2613) with 0.2.
shareholder(paul, stock_2614).
stock_up(stock_2614) with 0.2.
shareholder(paul, stock_2615).
stock_up(stock_2615) with 0.2.
shareholder(paul, stock_2616).
stock_up(stock_2616) with 0.2.
shareholder(paul, stock_2617).
stock_up(stock_2617) with 0.2.
shareholder(paul, stock_2618).
stock_up(stock_2618) with 0.2.
shareholder(paul, stock_2619).
stock_up(stock_2619) with 0.2.
shareholder(paul, stock_2620).
stock_up(stock_2620) with 0.2.
shareholder(paul, stock_2621).
stock_up(stock_2621) with 0.2.
shareholder(paul, stock_2622).
stock_up(stock_2622) with 0.2.
shareholder(paul, stock_2623).
stock_up(stock_2623) with 0.2.
shareholder(paul, stock_2624).
stock_up(stock_2624) with 0.2.
shareholder(paul, stock_2625).
stock_up(stock_2625) with 0.2.
shareholder(paul, stock_2626).
stock_up(stock_2626) with 0.2.
shareholder(paul, stock_2627).
stock_up(stock_2627) with 0.2.
shareholder(paul, stock_2628).
stock_up(stock_2628) with 0.2.
shareholder(paul, stock_2629).
stock_up(stock_2629) with 0.2.
shareholder(paul, stock_2630).
stock_up(stock_2630) with 0.2.
shareholder(paul, stock_2631).
stock_up(stock_2631) with 0.2.
shareholder(paul, stock_2632).
stock_up(stock_2632) with 0.2.
shareholder(paul, stock_2633).
stock_up(stock_2633) with 0.2.
shareholder(paul, stock_2634).
stock_up(stock_2634) with 0.2.
shareholder(paul, stock_2635).
stock_up(stock_2635) with 0.2.
shareholder(paul, stock_2636).
stock_up(stock_2636) with 0.2.
shareholder(paul, stock_2637).
stock_up(stock_2637) with 0.2.
shareholder(paul, stock_2638).
stock_up(stock_2638) with 0.2.
shareholder(paul, stock_2639).
stock_up(stock_2639) with 0.2.
shareholder(paul, stock_2640).
stock_up(stock_2640) with 0.2.
shareholder(paul, stock_2641).
stock_up(stock_2641) with 0.2.
shareholder(paul, stock_2642).
stock_up(stock_2642) with 0.2.
shareholder(paul, stock_2643).
stock_up(stock_2643) with 0.2.
shareholder(paul, stock_2644).
stock_up(stock_2644) with 0.2.
shareholder(paul, stock_2645).
stock_up(stock_2645) with 0.2.
shareholder(paul, stock_2646).
stock_up(stock_2646) with 0.2.
shareholder(paul, stock_2647).
stock_up(stock_2647) with 0.2.
shareholder(paul, stock_2648).
stock_up(stock_2648) with 0.2.
shareholder(paul, stock_2649).
stock_up(stock_2649) with 0.2.
shareholder(paul, stock_2650).
stock_up(stock_2650) with 0.2.
shareholder(paul, stock_2651).
stock_up(stock_2651) with 0.2.
shareholder(paul, stock_2652).
stock_up(stock_2652) with 0.2.
shareholder(paul, stock_2653).
stock_up(stock_2653) with 0.2.
shareholder(paul, stock_2654).
stock_up(stock_2654) with 0.2.
shareholder(paul, stock_2655).
stock_up(stock_2655) with 0.2.
shareholder(paul, stock_2656).
stock_up(stock_2656) with 0.2.
shareholder(paul, stock_2657).
stock_up(stock_2657) with 0.2.
shareholder(paul, stock_2658).
stock_up(stock_2658) with 0.2.
shareholder(paul, stock_2659).
stock_up(stock_2659) with 0.2.
shareholder(paul, stock_2660).
stock_up(stock_2660) with 0.2.
shareholder(paul, stock_2661).
stock_up(stock_2661) with 0.2.
shareholder(paul, stock_2662).
stock_up(stock_2662) with 0.2.
shareholder(paul, stock_2663).
stock_up(stock_2663) with 0.2.
shareholder(paul, stock_2664).
stock_up(stock_2664) with 0.2.
shareholder(paul, stock_2665).
stock_up(stock_2665) with 0.2.
shareholder(paul, stock_2666).
stock_up(stock_2666) with 0.2.
shareholder(paul, stock_2667).
stock_up(stock_2667) with 0.2.
shareholder(paul, stock_2668).
stock_up(stock_2668) with 0.2.
shareholder(paul, stock_2669).
stock_up(stock_2669) with 0.2.
shareholder(paul, stock_2670).
stock_up(stock_2670) with 0.2.
shareholder(paul, stock_2671).
stock_up(stock_2671) with 0.2.
shareholder(paul, stock_2672).
stock_up(stock_2672) with 0.2.
shareholder(paul, stock_2673).
stock_up(stock_2673) with 0.2.
shareholder(paul, stock_2674).
stock_up(stock_2674) with 0.2.
shareholder(paul, stock_2675).
stock_up(stock_2675) with 0.2.
shareholder(paul, stock_2676).
stock_up(stock_2676) with 0.2.
shareholder(paul, stock_2677).
stock_up(stock_2677) with 0.2.
shareholder(paul, stock_2678).
stock_up(stock_2678) with 0.2.
shareholder(paul, stock_2679).
stock_up(stock_2679) with 0.2.
shareholder(paul, stock_2680).
stock_up(stock_2680) with 0.2.
shareholder(paul, stock_2681).
stock_up(stock_2681) with 0.2.
shareholder(paul, stock_2682).
stock_up(stock_2682) with 0.2.
shareholder(paul, stock_2683).
stock_up(stock_2683) with 0.2.
shareholder(paul, stock_2684).
stock_up(stock_2684) with 0.2.
shareholder(paul, stock_2685).
stock_up(stock_2685) with 0.2.
shareholder(paul, stock_2686).
stock_up(stock_2686) with 0.2.
shareholder(paul, stock_2687).
stock_up(stock_2687) with 0.2.
shareholder(paul, stock_2688).
stock_up(stock_2688) with 0.2.
shareholder(paul, stock_2689).
stock_up(stock_2689) with 0.2.
shareholder(paul, stock_2690).
stock_up(stock_2690) with 0.2.
shareholder(paul, stock_2691).
stock_up(stock_2691) with 0.2.
shareholder(paul, stock_2692).
stock_up(stock_2692) with 0.2.
shareholder(paul, stock_2693).
stock_up(stock_2693) with 0.2.
shareholder(paul, stock_2694).
stock_up(stock_2694) with 0.2.
shareholder(paul, stock_2695).
stock_up(stock_2695) with 0.2.
shareholder(paul, stock_2696).
stock_up(stock_2696) with 0.2.
shareholder(paul, stock_2697).
stock_up(stock_2697) with 0.2.
shareholder(paul, stock_2698).
stock_up(stock_2698) with 0.2.
shareholder(paul, stock_2699).
stock_up(stock_2699) with 0.2.
shareholder(paul, stock_2700).
stock_up(stock_2700) with 0.2.
shareholder(paul, stock_2701).
stock_up(stock_2701) with 0.2.
shareholder(paul, stock_2702).
stock_up(stock_2702) with 0.2.
shareholder(paul, stock_2703).
stock_up(stock_2703) with 0.2.
shareholder(paul, stock_2704).
stock_up(stock_2704) with 0.2.
shareholder(paul, stock_2705).
stock_up(stock_2705) with 0.2.
shareholder(paul, stock_2706).
stock_up(stock_2706) with 0.2.
shareholder(paul, stock_2707).
stock_up(stock_2707) with 0.2.
shareholder(paul, stock_2708).
stock_up(stock_2708) with 0.2.
shareholder(paul, stock_2709).
stock_up(stock_2709) with 0.2.
shareholder(paul, stock_2710).
stock_up(stock_2710) with 0.2.
shareholder(paul, stock_2711).
stock_up(stock_2711) with 0.2.
shareholder(paul, stock_2712).
stock_up(stock_2712) with 0.2.
shareholder(paul, stock_2713).
stock_up(stock_2713) with 0.2.
shareholder(paul, stock_2714).
stock_up(stock_2714) with 0.2.
shareholder(paul, stock_2715).
stock_up(stock_2715) with 0.2.
shareholder(paul, stock_2716).
stock_up(stock_2716) with 0.2.
shareholder(paul, stock_2717).
stock_up(stock_2717) with 0.2.
shareholder(paul, stock_2718).
stock_up(stock_2718) with 0.2.
shareholder(paul, stock_2719).
stock_up(stock_2719) with 0.2.
shareholder(paul, stock_2720).
stock_up(stock_2720) with 0.2.
shareholder(paul, stock_2721).
stock_up(stock_2721) with 0.2.
shareholder(paul, stock_2722).
stock_up(stock_2722) with 0.2.
shareholder(paul, stock_2723).
stock_up(stock_2723) with 0.2.
shareholder(paul, stock_2724).
stock_up(stock_2724) with 0.2.
shareholder(paul, stock_2725).
stock_up(stock_2725) with 0.2.
shareholder(paul, stock_2726).
stock_up(stock_2726) with 0.2.
shareholder(paul, stock_2727).
stock_up(stock_2727) with 0.2.
shareholder(paul, stock_2728).
stock_up(stock_2728) with 0.2.
shareholder(paul, stock_2729).
stock_up(stock_2729) with 0.2.
shareholder(paul, stock_2730).
stock_up(stock_2730) with 0.2.
shareholder(paul, stock_2731).
stock_up(stock_2731) with 0.2.
shareholder(paul, stock_2732).
stock_up(stock_2732) with 0.2.
shareholder(paul, stock_2733).
stock_up(stock_2733) with 0.2.
shareholder(paul, stock_2734).
stock_up(stock_2734) with 0.2.
shareholder(paul, stock_2735).
stock_up(stock_2735) with 0.2.
shareholder(paul, stock_2736).
stock_up(stock_2736) with 0.2.
shareholder(paul, stock_2737).
stock_up(stock_2737) with 0.2.
shareholder(paul, stock_2738).
stock_up(stock_2738) with 0.2.
shareholder(paul, stock_2739).
stock_up(stock_2739) with 0.2.
shareholder(paul, stock_2740).
stock_up(stock_2740) with 0.2.
shareholder(paul, stock_2741).
stock_up(stock_2741) with 0.2.
shareholder(paul, stock_2742).
stock_up(stock_2742) with 0.2.
shareholder(paul, stock_2743).
stock_up(stock_2743) with 0.2.
shareholder(paul, stock_2744).
stock_up(stock_2744) with 0.2.
shareholder(paul, stock_2745).
stock_up(stock_2745) with 0.2.
shareholder(paul, stock_2746).
stock_up(stock_2746) with 0.2.
shareholder(paul, stock_2747).
stock_up(stock_2747) with 0.2.
shareholder(paul, stock_2748).
stock_up(stock_2748) with 0.2.
shareholder(paul, stock_2749).
stock_up(stock_2749) with 0.2.
shareholder(paul, stock_2750).
stock_up(stock_2750) with 0.2.
shareholder(paul, stock_2751).
stock_up(stock_2751) with 0.2.
shareholder(paul, stock_2752).
stock_up(stock_2752) with 0.2.
shareholder(paul, stock_2753).
stock_up(stock_2753) with 0.2.
shareholder(paul, stock_2754).
stock_up(stock_2754) with 0.2.
shareholder(paul, stock_2755).
stock_up(stock_2755) with 0.2.
shareholder(paul, stock_2756).
stock_up(stock_2756) with 0.2.
shareholder(paul, stock_2757).
stock_up(stock_2757) with 0.2.
shareholder(paul, stock_2758).
stock_up(stock_2758) with 0.2.
shareholder(paul, stock_2759).
stock_up(stock_2759) with 0.2.
shareholder(paul, stock_2760).
stock_up(stock_2760) with 0.2.
shareholder(paul, stock_2761).
stock_up(stock_2761) with 0.2.
shareholder(paul, stock_2762).
stock_up(stock_2762) with 0.2.
shareholder(paul, stock_2763).
stock_up(stock_2763) with 0.2.
shareholder(paul, stock_2764).
stock_up(stock_2764) with 0.2.
shareholder(paul, stock_2765).
stock_up(stock_2765) with 0.2.
shareholder(paul, stock_2766).
stock_up(stock_2766) with 0.2.
shareholder(paul, stock_2767).
stock_up(stock_2767) with 0.2.
shareholder(paul, stock_2768).
stock_up(stock_2768) with 0.2.
shareholder(paul, stock_2769).
stock_up(stock_2769) with 0.2.
shareholder(paul, stock_2770).
stock_up(stock_2770) with 0.2.
shareholder(paul, stock_2771).
stock_up(stock_2771) with 0.2.
shareholder(paul, stock_2772).
stock_up(stock_2772) with 0.2.
shareholder(paul, stock_2773).
stock_up(stock_2773) with 0.2.
shareholder(paul, stock_2774).
stock_up(stock_2774) with 0.2.
shareholder(paul, stock_2775).
stock_up(stock_2775) with 0.2.
shareholder(paul, stock_2776).
stock_up(stock_2776) with 0.2.
shareholder(paul, stock_2777).
stock_up(stock_2777) with 0.2.
shareholder(paul, stock_2778).
stock_up(stock_2778) with 0.2.
shareholder(paul, stock_2779).
stock_up(stock_2779) with 0.2.
shareholder(paul, stock_2780).
stock_up(stock_2780) with 0.2.
shareholder(paul, stock_2781).
stock_up(stock_2781) with 0.2.
shareholder(paul, stock_2782).
stock_up(stock_2782) with 0.2.
shareholder(paul, stock_2783).
stock_up(stock_2783) with 0.2.
shareholder(paul, stock_2784).
stock_up(stock_2784) with 0.2.
shareholder(paul, stock_2785).
stock_up(stock_2785) with 0.2.
shareholder(paul, stock_2786).
stock_up(stock_2786) with 0.2.
shareholder(paul, stock_2787).
stock_up(stock_2787) with 0.2.
shareholder(paul, stock_2788).
stock_up(stock_2788) with 0.2.
shareholder(paul, stock_2789).
stock_up(stock_2789) with 0.2.
shareholder(paul, stock_2790).
stock_up(stock_2790) with 0.2.
shareholder(paul, stock_2791).
stock_up(stock_2791) with 0.2.
shareholder(paul, stock_2792).
stock_up(stock_2792) with 0.2.
shareholder(paul, stock_2793).
stock_up(stock_2793) with 0.2.
shareholder(paul, stock_2794).
stock_up(stock_2794) with 0.2.
shareholder(paul, stock_2795).
stock_up(stock_2795) with 0.2.
shareholder(paul, stock_2796).
stock_up(stock_2796) with 0.2.
shareholder(paul, stock_2797).
stock_up(stock_2797) with 0.2.
shareholder(paul, stock_2798).
stock_up(stock_2798) with 0.2.
shareholder(paul, stock_2799).
stock_up(stock_2799) with 0.2.
shareholder(paul, stock_2800).
stock_up(stock_2800) with 0.2.
shareholder(paul, stock_2801).
stock_up(stock_2801) with 0.2.
shareholder(paul, stock_2802).
stock_up(stock_2802) with 0.2.
shareholder(paul, stock_2803).
stock_up(stock_2803) with 0.2.
shareholder(paul, stock_2804).
stock_up(stock_2804) with 0.2.
shareholder(paul, stock_2805).
stock_up(stock_2805) with 0.2.
shareholder(paul, stock_2806).
stock_up(stock_2806) with 0.2.
shareholder(paul, stock_2807).
stock_up(stock_2807) with 0.2.
shareholder(paul, stock_2808).
stock_up(stock_2808) with 0.2.
shareholder(paul, stock_2809).
stock_up(stock_2809) with 0.2.
shareholder(paul, stock_2810).
stock_up(stock_2810) with 0.2.
shareholder(paul, stock_2811).
stock_up(stock_2811) with 0.2.
shareholder(paul, stock_2812).
stock_up(stock_2812) with 0.2.
shareholder(paul, stock_2813).
stock_up(stock_2813) with 0.2.
shareholder(paul, stock_2814).
stock_up(stock_2814) with 0.2.
shareholder(paul, stock_2815).
stock_up(stock_2815) with 0.2.
shareholder(paul, stock_2816).
stock_up(stock_2816) with 0.2.
shareholder(paul, stock_2817).
stock_up(stock_2817) with 0.2.
shareholder(paul, stock_2818).
stock_up(stock_2818) with 0.2.
shareholder(paul, stock_2819).
stock_up(stock_2819) with 0.2.
shareholder(paul, stock_2820).
stock_up(stock_2820) with 0.2.
shareholder(paul, stock_2821).
stock_up(stock_2821) with 0.2.
shareholder(paul, stock_2822).
stock_up(stock_2822) with 0.2.
shareholder(paul, stock_2823).
stock_up(stock_2823) with 0.2.
shareholder(paul, stock_2824).
stock_up(stock_2824) with 0.2.
shareholder(paul, stock_2825).
stock_up(stock_2825) with 0.2.
shareholder(paul, stock_2826).
stock_up(stock_2826) with 0.2.
shareholder(paul, stock_2827).
stock_up(stock_2827) with 0.2.
shareholder(paul, stock_2828).
stock_up(stock_2828) with 0.2.
shareholder(paul, stock_2829).
stock_up(stock_2829) with 0.2.
shareholder(paul, stock_2830).
stock_up(stock_2830) with 0.2.
shareholder(paul, stock_2831).
stock_up(stock_2831) with 0.2.
shareholder(paul, stock_2832).
stock_up(stock_2832) with 0.2.
shareholder(paul, stock_2833).
stock_up(stock_2833) with 0.2.
shareholder(paul, stock_2834).
stock_up(stock_2834) with 0.2.
shareholder(paul, stock_2835).
stock_up(stock_2835) with 0.2.
shareholder(paul, stock_2836).
stock_up(stock_2836) with 0.2.
shareholder(paul, stock_2837).
stock_up(stock_2837) with 0.2.
shareholder(paul, stock_2838).
stock_up(stock_2838) with 0.2.
shareholder(paul, stock_2839).
stock_up(stock_2839) with 0.2.
shareholder(paul, stock_2840).
stock_up(stock_2840) with 0.2.
shareholder(paul, stock_2841).
stock_up(stock_2841) with 0.2.
shareholder(paul, stock_2842).
stock_up(stock_2842) with 0.2.
shareholder(paul, stock_2843).
stock_up(stock_2843) with 0.2.
shareholder(paul, stock_2844).
stock_up(stock_2844) with 0.2.
shareholder(paul, stock_2845).
stock_up(stock_2845) with 0.2.
shareholder(paul, stock_2846).
stock_up(stock_2846) with 0.2.
shareholder(paul, stock_2847).
stock_up(stock_2847) with 0.2.
shareholder(paul, stock_2848).
stock_up(stock_2848) with 0.2.
shareholder(paul, stock_2849).
stock_up(stock_2849) with 0.2.
shareholder(paul, stock_2850).
stock_up(stock_2850) with 0.2.
shareholder(paul, stock_2851).
stock_up(stock_2851) with 0.2.
shareholder(paul, stock_2852).
stock_up(stock_2852) with 0.2.
shareholder(paul, stock_2853).
stock_up(stock_2853) with 0.2.
shareholder(paul, stock_2854).
stock_up(stock_2854) with 0.2.
shareholder(paul, stock_2855).
stock_up(stock_2855) with 0.2.
shareholder(paul, stock_2856).
stock_up(stock_2856) with 0.2.
shareholder(paul, stock_2857).
stock_up(stock_2857) with 0.2.
shareholder(paul, stock_2858).
stock_up(stock_2858) with 0.2.
shareholder(paul, stock_2859).
stock_up(stock_2859) with 0.2.
shareholder(paul, stock_2860).
stock_up(stock_2860) with 0.2.
shareholder(paul, stock_2861).
stock_up(stock_2861) with 0.2.
shareholder(paul, stock_2862).
stock_up(stock_2862) with 0.2.
shareholder(paul, stock_2863).
stock_up(stock_2863) with 0.2.
shareholder(paul, stock_2864).
stock_up(stock_2864) with 0.2.
shareholder(paul, stock_2865).
stock_up(stock_2865) with 0.2.
shareholder(paul, stock_2866).
stock_up(stock_2866) with 0.2.
shareholder(paul, stock_2867).
stock_up(stock_2867) with 0.2.
shareholder(paul, stock_2868).
stock_up(stock_2868) with 0.2.
shareholder(paul, stock_2869).
stock_up(stock_2869) with 0.2.
shareholder(paul, stock_2870).
stock_up(stock_2870) with 0.2.
shareholder(paul, stock_2871).
stock_up(stock_2871) with 0.2.
shareholder(paul, stock_2872).
stock_up(stock_2872) with 0.2.
shareholder(paul, stock_2873).
stock_up(stock_2873) with 0.2.
shareholder(paul, stock_2874).
stock_up(stock_2874) with 0.2.
shareholder(paul, stock_2875).
stock_up(stock_2875) with 0.2.
shareholder(paul, stock_2876).
stock_up(stock_2876) with 0.2.
shareholder(paul, stock_2877).
stock_up(stock_2877) with 0.2.
shareholder(paul, stock_2878).
stock_up(stock_2878) with 0.2.
shareholder(paul, stock_2879).
stock_up(stock_2879) with 0.2.
shareholder(paul, stock_2880).
stock_up(stock_2880) with 0.2.
shareholder(paul, stock_2881).
stock_up(stock_2881) with 0.2.
shareholder(paul, stock_2882).
stock_up(stock_2882) with 0.2.
shareholder(paul, stock_2883).
stock_up(stock_2883) with 0.2.
shareholder(paul, stock_2884).
stock_up(stock_2884) with 0.2.
shareholder(paul, stock_2885).
stock_up(stock_2885) with 0.2.
shareholder(paul, stock_2886).
stock_up(stock_2886) with 0.2.
shareholder(paul, stock_2887).
stock_up(stock_2887) with 0.2.
shareholder(paul, stock_2888).
stock_up(stock_2888) with 0.2.
shareholder(paul, stock_2889).
stock_up(stock_2889) with 0.2.
shareholder(paul, stock_2890).
stock_up(stock_2890) with 0.2.
shareholder(paul, stock_2891).
stock_up(stock_2891) with 0.2.
shareholder(paul, stock_2892).
stock_up(stock_2892) with 0.2.
shareholder(paul, stock_2893).
stock_up(stock_2893) with 0.2.
shareholder(paul, stock_2894).
stock_up(stock_2894) with 0.2.
shareholder(paul, stock_2895).
stock_up(stock_2895) with 0.2.
shareholder(paul, stock_2896).
stock_up(stock_2896) with 0.2.
shareholder(paul, stock_2897).
stock_up(stock_2897) with 0.2.
shareholder(paul, stock_2898).
stock_up(stock_2898) with 0.2.
shareholder(paul, stock_2899).
stock_up(stock_2899) with 0.2.
shareholder(paul, stock_2900).
stock_up(stock_2900) with 0.2.
shareholder(paul, stock_2901).
stock_up(stock_2901) with 0.2.
shareholder(paul, stock_2902).
stock_up(stock_2902) with 0.2.
shareholder(paul, stock_2903).
stock_up(stock_2903) with 0.2.
shareholder(paul, stock_2904).
stock_up(stock_2904) with 0.2.
shareholder(paul, stock_2905).
stock_up(stock_2905) with 0.2.
shareholder(paul, stock_2906).
stock_up(stock_2906) with 0.2.
shareholder(paul, stock_2907).
stock_up(stock_2907) with 0.2.
shareholder(paul, stock_2908).
stock_up(stock_2908) with 0.2.
shareholder(paul, stock_2909).
stock_up(stock_2909) with 0.2.
shareholder(paul, stock_2910).
stock_up(stock_2910) with 0.2.
shareholder(paul, stock_2911).
stock_up(stock_2911) with 0.2.
shareholder(paul, stock_2912).
stock_up(stock_2912) with 0.2.
shareholder(paul, stock_2913).
stock_up(stock_2913) with 0.2.
shareholder(paul, stock_2914).
stock_up(stock_2914) with 0.2.
shareholder(paul, stock_2915).
stock_up(stock_2915) with 0.2.
shareholder(paul, stock_2916).
stock_up(stock_2916) with 0.2.
shareholder(paul, stock_2917).
stock_up(stock_2917) with 0.2.
shareholder(paul, stock_2918).
stock_up(stock_2918) with 0.2.
shareholder(paul, stock_2919).
stock_up(stock_2919) with 0.2.
shareholder(paul, stock_2920).
stock_up(stock_2920) with 0.2.
shareholder(paul, stock_2921).
stock_up(stock_2921) with 0.2.
shareholder(paul, stock_2922).
stock_up(stock_2922) with 0.2.
shareholder(paul, stock_2923).
stock_up(stock_2923) with 0.2.
shareholder(paul, stock_2924).
stock_up(stock_2924) with 0.2.
shareholder(paul, stock_2925).
stock_up(stock_2925) with 0.2.
shareholder(paul, stock_2926).
stock_up(stock_2926) with 0.2.
shareholder(paul, stock_2927).
stock_up(stock_2927) with 0.2.
shareholder(paul, stock_2928).
stock_up(stock_2928) with 0.2.
shareholder(paul, stock_2929).
stock_up(stock_2929) with 0.2.
shareholder(paul, stock_2930).
stock_up(stock_2930) with 0.2.
shareholder(paul, stock_2931).
stock_up(stock_2931) with 0.2.
shareholder(paul, stock_2932).
stock_up(stock_2932) with 0.2.
shareholder(paul, stock_2933).
stock_up(stock_2933) with 0.2.
shareholder(paul, stock_2934).
stock_up(stock_2934) with 0.2.
shareholder(paul, stock_2935).
stock_up(stock_2935) with 0.2.
shareholder(paul, stock_2936).
stock_up(stock_2936) with 0.2.
shareholder(paul, stock_2937).
stock_up(stock_2937) with 0.2.
shareholder(paul, stock_2938).
stock_up(stock_2938) with 0.2.
shareholder(paul, stock_2939).
stock_up(stock_2939) with 0.2.
shareholder(paul, stock_2940).
stock_up(stock_2940) with 0.2.
shareholder(paul, stock_2941).
stock_up(stock_2941) with 0.2.
shareholder(paul, stock_2942).
stock_up(stock_2942) with 0.2.
shareholder(paul, stock_2943).
stock_up(stock_2943) with 0.2.
shareholder(paul, stock_2944).
stock_up(stock_2944) with 0.2.
shareholder(paul, stock_2945).
stock_up(stock_2945) with 0.2.
shareholder(paul, stock_2946).
stock_up(stock_2946) with 0.2.
shareholder(paul, stock_2947).
stock_up(stock_2947) with 0.2.
shareholder(paul, stock_2948).
stock_up(stock_2948) with 0.2.
shareholder(paul, stock_2949).
stock_up(stock_2949) with 0.2.
shareholder(paul, stock_2950).
stock_up(stock_2950) with 0.2.
shareholder(paul, stock_2951).
stock_up(stock_2951) with 0.2.
shareholder(paul, stock_2952).
stock_up(stock_2952) with 0.2.
shareholder(paul, stock_2953).
stock_up(stock_2953) with 0.2.
shareholder(paul, stock_2954).
stock_up(stock_2954) with 0.2.
shareholder(paul, stock_2955).
stock_up(stock_2955) with 0.2.
shareholder(paul, stock_2956).
stock_up(stock_2956) with 0.2.
shareholder(paul, stock_2957).
stock_up(stock_2957) with 0.2.
shareholder(paul, stock_2958).
stock_up(stock_2958) with 0.2.
shareholder(paul, stock_2959).
stock_up(stock_2959) with 0.2.
shareholder(paul, stock_2960).
stock_up(stock_2960) with 0.2.
shareholder(paul, stock_2961).
stock_up(stock_2961) with 0.2.
shareholder(paul, stock_2962).
stock_up(stock_2962) with 0.2.
shareholder(paul, stock_2963).
stock_up(stock_2963) with 0.2.
shareholder(paul, stock_2964).
stock_up(stock_2964) with 0.2.
shareholder(paul, stock_2965).
stock_up(stock_2965) with 0.2.
shareholder(paul, stock_2966).
stock_up(stock_2966) with 0.2.
shareholder(paul, stock_2967).
stock_up(stock_2967) with 0.2.
shareholder(paul, stock_2968).
stock_up(stock_2968) with 0.2.
shareholder(paul, stock_2969).
stock_up(stock_2969) with 0.2.
shareholder(paul, stock_2970).
stock_up(stock_2970) with 0.2.
shareholder(paul, stock_2971).
stock_up(stock_2971) with 0.2.
shareholder(paul, stock_2972).
stock_up(stock_2972) with 0.2.
shareholder(paul, stock_2973).
stock_up(stock_2973) with 0.2.
shareholder(paul, stock_2974).
stock_up(stock_2974) with 0.2.
shareholder(paul, stock_2975).
stock_up(stock_2975) with 0.2.
shareholder(paul, stock_2976).
stock_up(stock_2976) with 0.2.
shareholder(paul, stock_2977).
stock_up(stock_2977) with 0.2.
shareholder(paul, stock_2978).
stock_up(stock_2978) with 0.2.
shareholder(paul, stock_2979).
stock_up(stock_2979) with 0.2.
shareholder(paul, stock_2980).
stock_up(stock_2980) with 0.2.
shareholder(paul, stock_2981).
stock_up(stock_2981) with 0.2.
shareholder(paul, stock_2982).
stock_up(stock_2982) with 0.2.
shareholder(paul, stock_2983).
stock_up(stock_2983) with 0.2.
shareholder(paul, stock_2984).
stock_up(stock_2984) with 0.2.
shareholder(paul, stock_2985).
stock_up(stock_2985) with 0.2.
shareholder(paul, stock_2986).
stock_up(stock_2986) with 0.2.
shareholder(paul, stock_2987).
stock_up(stock_2987) with 0.2.
shareholder(paul, stock_2988).
stock_up(stock_2988) with 0.2.
shareholder(paul, stock_2989).
stock_up(stock_2989) with 0.2.
shareholder(paul, stock_2990).
stock_up(stock_2990) with 0.2.
shareholder(paul, stock_2991).
stock_up(stock_2991) with 0.2.
shareholder(paul, stock_2992).
stock_up(stock_2992) with 0.2.
shareholder(paul, stock_2993).
stock_up(stock_2993) with 0.2.
shareholder(paul, stock_2994).
stock_up(stock_2994) with 0.2.
shareholder(paul, stock_2995).
stock_up(stock_2995) with 0.2.
shareholder(paul, stock_2996).
stock_up(stock_2996) with 0.2.
shareholder(paul, stock_2997).
stock_up(stock_2997) with 0.2.
shareholder(paul, stock_2998).
stock_up(stock_2998) with 0.2.
shareholder(paul, stock_2999).
stock_up(stock_2999) with 0.2.
shareholder(paul, stock_3000).
stock_up(stock_3000) with 0.2.
shareholder(paul, stock_3001).
stock_up(stock_3001) with 0.2.
shareholder(paul, stock_3002).
stock_up(stock_3002) with 0.2.
shareholder(paul, stock_3003).
stock_up(stock_3003) with 0.2.
shareholder(paul, stock_3004).
stock_up(stock_3004) with 0.2.
shareholder(paul, stock_3005).
stock_up(stock_3005) with 0.2.
shareholder(paul, stock_3006).
stock_up(stock_3006) with 0.2.
shareholder(paul, stock_3007).
stock_up(stock_3007) with 0.2.
shareholder(paul, stock_3008).
stock_up(stock_3008) with 0.2.
shareholder(paul, stock_3009).
stock_up(stock_3009) with 0.2.
shareholder(paul, stock_3010).
stock_up(stock_3010) with 0.2.
shareholder(paul, stock_3011).
stock_up(stock_3011) with 0.2.
shareholder(paul, stock_3012).
stock_up(stock_3012) with 0.2.
shareholder(paul, stock_3013).
stock_up(stock_3013) with 0.2.
shareholder(paul, stock_3014).
stock_up(stock_3014) with 0.2.
shareholder(paul, stock_3015).
stock_up(stock_3015) with 0.2.
shareholder(paul, stock_3016).
stock_up(stock_3016) with 0.2.
shareholder(paul, stock_3017).
stock_up(stock_3017) with 0.2.
shareholder(paul, stock_3018).
stock_up(stock_3018) with 0.2.
shareholder(paul, stock_3019).
stock_up(stock_3019) with 0.2.
shareholder(paul, stock_3020).
stock_up(stock_3020) with 0.2.
shareholder(paul, stock_3021).
stock_up(stock_3021) with 0.2.
shareholder(paul, stock_3022).
stock_up(stock_3022) with 0.2.
shareholder(paul, stock_3023).
stock_up(stock_3023) with 0.2.
shareholder(paul, stock_3024).
stock_up(stock_3024) with 0.2.
shareholder(paul, stock_3025).
stock_up(stock_3025) with 0.2.
shareholder(paul, stock_3026).
stock_up(stock_3026) with 0.2.
shareholder(paul, stock_3027).
stock_up(stock_3027) with 0.2.
shareholder(paul, stock_3028).
stock_up(stock_3028) with 0.2.
shareholder(paul, stock_3029).
stock_up(stock_3029) with 0.2.
shareholder(paul, stock_3030).
stock_up(stock_3030) with 0.2.
shareholder(paul, stock_3031).
stock_up(stock_3031) with 0.2.
shareholder(paul, stock_3032).
stock_up(stock_3032) with 0.2.
shareholder(paul, stock_3033).
stock_up(stock_3033) with 0.2.
shareholder(paul, stock_3034).
stock_up(stock_3034) with 0.2.
shareholder(paul, stock_3035).
stock_up(stock_3035) with 0.2.
shareholder(paul, stock_3036).
stock_up(stock_3036) with 0.2.
shareholder(paul, stock_3037).
stock_up(stock_3037) with 0.2.
shareholder(paul, stock_3038).
stock_up(stock_3038) with 0.2.
shareholder(paul, stock_3039).
stock_up(stock_3039) with 0.2.
shareholder(paul, stock_3040).
stock_up(stock_3040) with 0.2.
shareholder(paul, stock_3041).
stock_up(stock_3041) with 0.2.
shareholder(paul, stock_3042).
stock_up(stock_3042) with 0.2.
shareholder(paul, stock_3043).
stock_up(stock_3043) with 0.2.
shareholder(paul, stock_3044).
stock_up(stock_3044) with 0.2.
shareholder(paul, stock_3045).
stock_up(stock_3045) with 0.2.
shareholder(paul, stock_3046).
stock_up(stock_3046) with 0.2.
shareholder(paul, stock_3047).
stock_up(stock_3047) with 0.2.
shareholder(paul, stock_3048).
stock_up(stock_3048) with 0.2.
shareholder(paul, stock_3049).
stock_up(stock_3049) with 0.2.
shareholder(paul, stock_3050).
stock_up(stock_3050) with 0.2.
shareholder(paul, stock_3051).
stock_up(stock_3051) with 0.2.
shareholder(paul, stock_3052).
stock_up(stock_3052) with 0.2.
shareholder(paul, stock_3053).
stock_up(stock_3053) with 0.2.
shareholder(paul, stock_3054).
stock_up(stock_3054) with 0.2.
shareholder(paul, stock_3055).
stock_up(stock_3055) with 0.2.
shareholder(paul, stock_3056).
stock_up(stock_3056) with 0.2.
shareholder(paul, stock_3057).
stock_up(stock_3057) with 0.2.
shareholder(paul, stock_3058).
stock_up(stock_3058) with 0.2.
shareholder(paul, stock_3059).
stock_up(stock_3059) with 0.2.
shareholder(paul, stock_3060).
stock_up(stock_3060) with 0.2.
shareholder(paul, stock_3061).
stock_up(stock_3061) with 0.2.
shareholder(paul, stock_3062).
stock_up(stock_3062) with 0.2.
shareholder(paul, stock_3063).
stock_up(stock_3063) with 0.2.
shareholder(paul, stock_3064).
stock_up(stock_3064) with 0.2.
shareholder(paul, stock_3065).
stock_up(stock_3065) with 0.2.
shareholder(paul, stock_3066).
stock_up(stock_3066) with 0.2.
shareholder(paul, stock_3067).
stock_up(stock_3067) with 0.2.
shareholder(paul, stock_3068).
stock_up(stock_3068) with 0.2.
shareholder(paul, stock_3069).
stock_up(stock_3069) with 0.2.
shareholder(paul, stock_3070).
stock_up(stock_3070) with 0.2.
shareholder(paul, stock_3071).
stock_up(stock_3071) with 0.2.
shareholder(paul, stock_3072).
stock_up(stock_3072) with 0.2.
shareholder(paul, stock_3073).
stock_up(stock_3073) with 0.2.
shareholder(paul, stock_3074).
stock_up(stock_3074) with 0.2.
shareholder(paul, stock_3075).
stock_up(stock_3075) with 0.2.
shareholder(paul, stock_3076).
stock_up(stock_3076) with 0.2.
shareholder(paul, stock_3077).
stock_up(stock_3077) with 0.2.
shareholder(paul, stock_3078).
stock_up(stock_3078) with 0.2.
shareholder(paul, stock_3079).
stock_up(stock_3079) with 0.2.
shareholder(paul, stock_3080).
stock_up(stock_3080) with 0.2.
shareholder(paul, stock_3081).
stock_up(stock_3081) with 0.2.
shareholder(paul, stock_3082).
stock_up(stock_3082) with 0.2.
shareholder(paul, stock_3083).
stock_up(stock_3083) with 0.2.
shareholder(paul, stock_3084).
stock_up(stock_3084) with 0.2.
shareholder(paul, stock_3085).
stock_up(stock_3085) with 0.2.
shareholder(paul, stock_3086).
stock_up(stock_3086) with 0.2.
shareholder(paul, stock_3087).
stock_up(stock_3087) with 0.2.
shareholder(paul, stock_3088).
stock_up(stock_3088) with 0.2.
shareholder(paul, stock_3089).
stock_up(stock_3089) with 0.2.
shareholder(paul, stock_3090).
stock_up(stock_3090) with 0.2.
shareholder(paul, stock_3091).
stock_up(stock_3091) with 0.2.
shareholder(paul, stock_3092).
stock_up(stock_3092) with 0.2.
shareholder(paul, stock_3093).
stock_up(stock_3093) with 0.2.
shareholder(paul, stock_3094).
stock_up(stock_3094) with 0.2.
shareholder(paul, stock_3095).
stock_up(stock_3095) with 0.2.
shareholder(paul, stock_3096).
stock_up(stock_3096) with 0.2.
shareholder(paul, stock_3097).
stock_up(stock_3097) with 0.2.
shareholder(paul, stock_3098).
stock_up(stock_3098) with 0.2.
shareholder(paul, stock_3099).
stock_up(stock_3099) with 0.2.
shareholder(paul, stock_3100).
stock_up(stock_3100) with 0.2.
shareholder(paul, stock_3101).
stock_up(stock_3101) with 0.2.
shareholder(paul, stock_3102).
stock_up(stock_3102) with 0.2.
shareholder(paul, stock_3103).
stock_up(stock_3103) with 0.2.
shareholder(paul, stock_3104).
stock_up(stock_3104) with 0.2.
shareholder(paul, stock_3105).
stock_up(stock_3105) with 0.2.
shareholder(paul, stock_3106).
stock_up(stock_3106) with 0.2.
shareholder(paul, stock_3107).
stock_up(stock_3107) with 0.2.
shareholder(paul, stock_3108).
stock_up(stock_3108) with 0.2.
shareholder(paul, stock_3109).
stock_up(stock_3109) with 0.2.
shareholder(paul, stock_3110).
stock_up(stock_3110) with 0.2.
shareholder(paul, stock_3111).
stock_up(stock_3111) with 0.2.
shareholder(paul, stock_3112).
stock_up(stock_3112) with 0.2.
shareholder(paul, stock_3113).
stock_up(stock_3113) with 0.2.
shareholder(paul, stock_3114).
stock_up(stock_3114) with 0.2.
shareholder(paul, stock_3115).
stock_up(stock_3115) with 0.2.
shareholder(paul, stock_3116).
stock_up(stock_3116) with 0.2.
shareholder(paul, stock_3117).
stock_up(stock_3117) with 0.2.
shareholder(paul, stock_3118).
stock_up(stock_3118) with 0.2.
shareholder(paul, stock_3119).
stock_up(stock_3119) with 0.2.
shareholder(paul, stock_3120).
stock_up(stock_3120) with 0.2.
shareholder(paul, stock_3121).
stock_up(stock_3121) with 0.2.
shareholder(paul, stock_3122).
stock_up(stock_3122) with 0.2.
shareholder(paul, stock_3123).
stock_up(stock_3123) with 0.2.
shareholder(paul, stock_3124).
stock_up(stock_3124) with 0.2.
shareholder(paul, stock_3125).
stock_up(stock_3125) with 0.2.
shareholder(paul, stock_3126).
stock_up(stock_3126) with 0.2.
shareholder(paul, stock_3127).
stock_up(stock_3127) with 0.2.
shareholder(paul, stock_3128).
stock_up(stock_3128) with 0.2.
shareholder(paul, stock_3129).
stock_up(stock_3129) with 0.2.
shareholder(paul, stock_3130).
stock_up(stock_3130) with 0.2.
shareholder(paul, stock_3131).
stock_up(stock_3131) with 0.2.
shareholder(paul, stock_3132).
stock_up(stock_3132) with 0.2.
shareholder(paul, stock_3133).
stock_up(stock_3133) with 0.2.
shareholder(paul, stock_3134).
stock_up(stock_3134) with 0.2.
shareholder(paul, stock_3135).
stock_up(stock_3135) with 0.2.
shareholder(paul, stock_3136).
stock_up(stock_3136) with 0.2.
shareholder(paul, stock_3137).
stock_up(stock_3137) with 0.2.
shareholder(paul, stock_3138).
stock_up(stock_3138) with 0.2.
shareholder(paul, stock_3139).
stock_up(stock_3139) with 0.2.
shareholder(paul, stock_3140).
stock_up(stock_3140) with 0.2.
shareholder(paul, stock_3141).
stock_up(stock_3141) with 0.2.
shareholder(paul, stock_3142).
stock_up(stock_3142) with 0.2.
shareholder(paul, stock_3143).
stock_up(stock_3143) with 0.2.
shareholder(paul, stock_3144).
stock_up(stock_3144) with 0.2.
shareholder(paul, stock_3145).
stock_up(stock_3145) with 0.2.
shareholder(paul, stock_3146).
stock_up(stock_3146) with 0.2.
shareholder(paul, stock_3147).
stock_up(stock_3147) with 0.2.
shareholder(paul, stock_3148).
stock_up(stock_3148) with 0.2.
shareholder(paul, stock_3149).
stock_up(stock_3149) with 0.2.
shareholder(paul, stock_3150).
stock_up(stock_3150) with 0.2.
shareholder(paul, stock_3151).
stock_up(stock_3151) with 0.2.
shareholder(paul, stock_3152).
stock_up(stock_3152) with 0.2.
shareholder(paul, stock_3153).
stock_up(stock_3153) with 0.2.
shareholder(paul, stock_3154).
stock_up(stock_3154) with 0.2.
shareholder(paul, stock_3155).
stock_up(stock_3155) with 0.2.
shareholder(paul, stock_3156).
stock_up(stock_3156) with 0.2.
shareholder(paul, stock_3157).
stock_up(stock_3157) with 0.2.
shareholder(paul, stock_3158).
stock_up(stock_3158) with 0.2.
shareholder(paul, stock_3159).
stock_up(stock_3159) with 0.2.
shareholder(paul, stock_3160).
stock_up(stock_3160) with 0.2.
shareholder(paul, stock_3161).
stock_up(stock_3161) with 0.2.
shareholder(paul, stock_3162).
stock_up(stock_3162) with 0.2.
shareholder(paul, stock_3163).
stock_up(stock_3163) with 0.2.
shareholder(paul, stock_3164).
stock_up(stock_3164) with 0.2.
shareholder(paul, stock_3165).
stock_up(stock_3165) with 0.2.
shareholder(paul, stock_3166).
stock_up(stock_3166) with 0.2.
shareholder(paul, stock_3167).
stock_up(stock_3167) with 0.2.
shareholder(paul, stock_3168).
stock_up(stock_3168) with 0.2.
shareholder(paul, stock_3169).
stock_up(stock_3169) with 0.2.
shareholder(paul, stock_3170).
stock_up(stock_3170) with 0.2.
shareholder(paul, stock_3171).
stock_up(stock_3171) with 0.2.
shareholder(paul, stock_3172).
stock_up(stock_3172) with 0.2.
shareholder(paul, stock_3173).
stock_up(stock_3173) with 0.2.
shareholder(paul, stock_3174).
stock_up(stock_3174) with 0.2.
shareholder(paul, stock_3175).
stock_up(stock_3175) with 0.2.
shareholder(paul, stock_3176).
stock_up(stock_3176) with 0.2.
shareholder(paul, stock_3177).
stock_up(stock_3177) with 0.2.
shareholder(paul, stock_3178).
stock_up(stock_3178) with 0.2.
shareholder(paul, stock_3179).
stock_up(stock_3179) with 0.2.
shareholder(paul, stock_3180).
stock_up(stock_3180) with 0.2.
shareholder(paul, stock_3181).
stock_up(stock_3181) with 0.2.
shareholder(paul, stock_3182).
stock_up(stock_3182) with 0.2.
shareholder(paul, stock_3183).
stock_up(stock_3183) with 0.2.
shareholder(paul, stock_3184).
stock_up(stock_3184) with 0.2.
shareholder(paul, stock_3185).
stock_up(stock_3185) with 0.2.
shareholder(paul, stock_3186).
stock_up(stock_3186) with 0.2.
shareholder(paul, stock_3187).
stock_up(stock_3187) with 0.2.
shareholder(paul, stock_3188).
stock_up(stock_3188) with 0.2.
shareholder(paul, stock_3189).
stock_up(stock_3189) with 0.2.
shareholder(paul, stock_3190).
stock_up(stock_3190) with 0.2.
shareholder(paul, stock_3191).
stock_up(stock_3191) with 0.2.
shareholder(paul, stock_3192).
stock_up(stock_3192) with 0.2.
shareholder(paul, stock_3193).
stock_up(stock_3193) with 0.2.
shareholder(paul, stock_3194).
stock_up(stock_3194) with 0.2.
shareholder(paul, stock_3195).
stock_up(stock_3195) with 0.2.
shareholder(paul, stock_3196).
stock_up(stock_3196) with 0.2.
shareholder(paul, stock_3197).
stock_up(stock_3197) with 0.2.
shareholder(paul, stock_3198).
stock_up(stock_3198) with 0.2.
shareholder(paul, stock_3199).
stock_up(stock_3199) with 0.2.
shareholder(paul, stock_3200).
stock_up(stock_3200) with 0.2.
shareholder(paul, stock_3201).
stock_up(stock_3201) with 0.2.
shareholder(paul, stock_3202).
stock_up(stock_3202) with 0.2.
shareholder(paul, stock_3203).
stock_up(stock_3203) with 0.2.
shareholder(paul, stock_3204).
stock_up(stock_3204) with 0.2.
shareholder(paul, stock_3205).
stock_up(stock_3205) with 0.2.
shareholder(paul, stock_3206).
stock_up(stock_3206) with 0.2.
shareholder(paul, stock_3207).
stock_up(stock_3207) with 0.2.
shareholder(paul, stock_3208).
stock_up(stock_3208) with 0.2.
shareholder(paul, stock_3209).
stock_up(stock_3209) with 0.2.
shareholder(paul, stock_3210).
stock_up(stock_3210) with 0.2.
shareholder(paul, stock_3211).
stock_up(stock_3211) with 0.2.
shareholder(paul, stock_3212).
stock_up(stock_3212) with 0.2.
shareholder(paul, stock_3213).
stock_up(stock_3213) with 0.2.
shareholder(paul, stock_3214).
stock_up(stock_3214) with 0.2.
shareholder(paul, stock_3215).
stock_up(stock_3215) with 0.2.
shareholder(paul, stock_3216).
stock_up(stock_3216) with 0.2.
shareholder(paul, stock_3217).
stock_up(stock_3217) with 0.2.
shareholder(paul, stock_3218).
stock_up(stock_3218) with 0.2.
shareholder(paul, stock_3219).
stock_up(stock_3219) with 0.2.
shareholder(paul, stock_3220).
stock_up(stock_3220) with 0.2.
shareholder(paul, stock_3221).
stock_up(stock_3221) with 0.2.
shareholder(paul, stock_3222).
stock_up(stock_3222) with 0.2.
shareholder(paul, stock_3223).
stock_up(stock_3223) with 0.2.
shareholder(paul, stock_3224).
stock_up(stock_3224) with 0.2.
shareholder(paul, stock_3225).
stock_up(stock_3225) with 0.2.
shareholder(paul, stock_3226).
stock_up(stock_3226) with 0.2.
shareholder(paul, stock_3227).
stock_up(stock_3227) with 0.2.
shareholder(paul, stock_3228).
stock_up(stock_3228) with 0.2.
shareholder(paul, stock_3229).
stock_up(stock_3229) with 0.2.
shareholder(paul, stock_3230).
stock_up(stock_3230) with 0.2.
shareholder(paul, stock_3231).
stock_up(stock_3231) with 0.2.
shareholder(paul, stock_3232).
stock_up(stock_3232) with 0.2.
shareholder(paul, stock_3233).
stock_up(stock_3233) with 0.2.
shareholder(paul, stock_3234).
stock_up(stock_3234) with 0.2.
shareholder(paul, stock_3235).
stock_up(stock_3235) with 0.2.
shareholder(paul, stock_3236).
stock_up(stock_3236) with 0.2.
shareholder(paul, stock_3237).
stock_up(stock_3237) with 0.2.
shareholder(paul, stock_3238).
stock_up(stock_3238) with 0.2.
shareholder(paul, stock_3239).
stock_up(stock_3239) with 0.2.
shareholder(paul, stock_3240).
stock_up(stock_3240) with 0.2.
shareholder(paul, stock_3241).
stock_up(stock_3241) with 0.2.
shareholder(paul, stock_3242).
stock_up(stock_3242) with 0.2.
shareholder(paul, stock_3243).
stock_up(stock_3243) with 0.2.
shareholder(paul, stock_3244).
stock_up(stock_3244) with 0.2.
shareholder(paul, stock_3245).
stock_up(stock_3245) with 0.2.
shareholder(paul, stock_3246).
stock_up(stock_3246) with 0.2.
shareholder(paul, stock_3247).
stock_up(stock_3247) with 0.2.
shareholder(paul, stock_3248).
stock_up(stock_3248) with 0.2.
shareholder(paul, stock_3249).
stock_up(stock_3249) with 0.2.
shareholder(paul, stock_3250).
stock_up(stock_3250) with 0.2.
shareholder(paul, stock_3251).
stock_up(stock_3251) with 0.2.
shareholder(paul, stock_3252).
stock_up(stock_3252) with 0.2.
shareholder(paul, stock_3253).
stock_up(stock_3253) with 0.2.
shareholder(paul, stock_3254).
stock_up(stock_3254) with 0.2.
shareholder(paul, stock_3255).
stock_up(stock_3255) with 0.2.
shareholder(paul, stock_3256).
stock_up(stock_3256) with 0.2.
shareholder(paul, stock_3257).
stock_up(stock_3257) with 0.2.
shareholder(paul, stock_3258).
stock_up(stock_3258) with 0.2.
shareholder(paul, stock_3259).
stock_up(stock_3259) with 0.2.
shareholder(paul, stock_3260).
stock_up(stock_3260) with 0.2.
shareholder(paul, stock_3261).
stock_up(stock_3261) with 0.2.
shareholder(paul, stock_3262).
stock_up(stock_3262) with 0.2.
shareholder(paul, stock_3263).
stock_up(stock_3263) with 0.2.
shareholder(paul, stock_3264).
stock_up(stock_3264) with 0.2.
shareholder(paul, stock_3265).
stock_up(stock_3265) with 0.2.
shareholder(paul, stock_3266).
stock_up(stock_3266) with 0.2.
shareholder(paul, stock_3267).
stock_up(stock_3267) with 0.2.
shareholder(paul, stock_3268).
stock_up(stock_3268) with 0.2.
shareholder(paul, stock_3269).
stock_up(stock_3269) with 0.2.
shareholder(paul, stock_3270).
stock_up(stock_3270) with 0.2.
shareholder(paul, stock_3271).
stock_up(stock_3271) with 0.2.
shareholder(paul, stock_3272).
stock_up(stock_3272) with 0.2.
shareholder(paul, stock_3273).
stock_up(stock_3273) with 0.2.
shareholder(paul, stock_3274).
stock_up(stock_3274) with 0.2.
shareholder(paul, stock_3275).
stock_up(stock_3275) with 0.2.
shareholder(paul, stock_3276).
stock_up(stock_3276) with 0.2.
shareholder(paul, stock_3277).
stock_up(stock_3277) with 0.2.
shareholder(paul, stock_3278).
stock_up(stock_3278) with 0.2.
shareholder(paul, stock_3279).
stock_up(stock_3279) with 0.2.
shareholder(paul, stock_3280).
stock_up(stock_3280) with 0.2.
shareholder(paul, stock_3281).
stock_up(stock_3281) with 0.2.
shareholder(paul, stock_3282).
stock_up(stock_3282) with 0.2.
shareholder(paul, stock_3283).
stock_up(stock_3283) with 0.2.
shareholder(paul, stock_3284).
stock_up(stock_3284) with 0.2.
shareholder(paul, stock_3285).
stock_up(stock_3285) with 0.2.
shareholder(paul, stock_3286).
stock_up(stock_3286) with 0.2.
shareholder(paul, stock_3287).
stock_up(stock_3287) with 0.2.
shareholder(paul, stock_3288).
stock_up(stock_3288) with 0.2.
shareholder(paul, stock_3289).
stock_up(stock_3289) with 0.2.
shareholder(paul, stock_3290).
stock_up(stock_3290) with 0.2.
shareholder(paul, stock_3291).
stock_up(stock_3291) with 0.2.
shareholder(paul, stock_3292).
stock_up(stock_3292) with 0.2.
shareholder(paul, stock_3293).
stock_up(stock_3293) with 0.2.
shareholder(paul, stock_3294).
stock_up(stock_3294) with 0.2.
shareholder(paul, stock_3295).
stock_up(stock_3295) with 0.2.
shareholder(paul, stock_3296).
stock_up(stock_3296) with 0.2.
shareholder(paul, stock_3297).
stock_up(stock_3297) with 0.2.
shareholder(paul, stock_3298).
stock_up(stock_3298) with 0.2.
shareholder(paul, stock_3299).
stock_up(stock_3299) with 0.2.
shareholder(paul, stock_3300).
stock_up(stock_3300) with 0.2.
shareholder(paul, stock_3301).
stock_up(stock_3301) with 0.2.
shareholder(paul, stock_3302).
stock_up(stock_3302) with 0.2.
shareholder(paul, stock_3303).
stock_up(stock_3303) with 0.2.
shareholder(paul, stock_3304).
stock_up(stock_3304) with 0.2.
shareholder(paul, stock_3305).
stock_up(stock_3305) with 0.2.
shareholder(paul, stock_3306).
stock_up(stock_3306) with 0.2.
shareholder(paul, stock_3307).
stock_up(stock_3307) with 0.2.
shareholder(paul, stock_3308).
stock_up(stock_3308) with 0.2.
shareholder(paul, stock_3309).
stock_up(stock_3309) with 0.2.
shareholder(paul, stock_3310).
stock_up(stock_3310) with 0.2.
shareholder(paul, stock_3311).
stock_up(stock_3311) with 0.2.
shareholder(paul, stock_3312).
stock_up(stock_3312) with 0.2.
shareholder(paul, stock_3313).
stock_up(stock_3313) with 0.2.
shareholder(paul, stock_3314).
stock_up(stock_3314) with 0.2.
shareholder(paul, stock_3315).
stock_up(stock_3315) with 0.2.
shareholder(paul, stock_3316).
stock_up(stock_3316) with 0.2.
shareholder(paul, stock_3317).
stock_up(stock_3317) with 0.2.
shareholder(paul, stock_3318).
stock_up(stock_3318) with 0.2.
shareholder(paul, stock_3319).
stock_up(stock_3319) with 0.2.
shareholder(paul, stock_3320).
stock_up(stock_3320) with 0.2.
shareholder(paul, stock_3321).
stock_up(stock_3321) with 0.2.
shareholder(paul, stock_3322).
stock_up(stock_3322) with 0.2.
shareholder(paul, stock_3323).
stock_up(stock_3323) with 0.2.
shareholder(paul, stock_3324).
stock_up(stock_3324) with 0.2.
shareholder(paul, stock_3325).
stock_up(stock_3325) with 0.2.
shareholder(paul, stock_3326).
stock_up(stock_3326) with 0.2.
shareholder(paul, stock_3327).
stock_up(stock_3327) with 0.2.
shareholder(paul, stock_3328).
stock_up(stock_3328) with 0.2.
shareholder(paul, stock_3329).
stock_up(stock_3329) with 0.2.
shareholder(paul, stock_3330).
stock_up(stock_3330) with 0.2.
shareholder(paul, stock_3331).
stock_up(stock_3331) with 0.2.
shareholder(paul, stock_3332).
stock_up(stock_3332) with 0.2.
shareholder(paul, stock_3333).
stock_up(stock_3333) with 0.2.
shareholder(paul, stock_3334).
stock_up(stock_3334) with 0.2.
shareholder(paul, stock_3335).
stock_up(stock_3335) with 0.2.
shareholder(paul, stock_3336).
stock_up(stock_3336) with 0.2.
shareholder(paul, stock_3337).
stock_up(stock_3337) with 0.2.
shareholder(paul, stock_3338).
stock_up(stock_3338) with 0.2.
shareholder(paul, stock_3339).
stock_up(stock_3339) with 0.2.
shareholder(paul, stock_3340).
stock_up(stock_3340) with 0.2.
shareholder(paul, stock_3341).
stock_up(stock_3341) with 0.2.
shareholder(paul, stock_3342).
stock_up(stock_3342) with 0.2.
shareholder(paul, stock_3343).
stock_up(stock_3343) with 0.2.
shareholder(paul, stock_3344).
stock_up(stock_3344) with 0.2.
shareholder(paul, stock_3345).
stock_up(stock_3345) with 0.2.
shareholder(paul, stock_3346).
stock_up(stock_3346) with 0.2.
shareholder(paul, stock_3347).
stock_up(stock_3347) with 0.2.
shareholder(paul, stock_3348).
stock_up(stock_3348) with 0.2.
shareholder(paul, stock_3349).
stock_up(stock_3349) with 0.2.
shareholder(paul, stock_3350).
stock_up(stock_3350) with 0.2.
shareholder(paul, stock_3351).
stock_up(stock_3351) with 0.2.
shareholder(paul, stock_3352).
stock_up(stock_3352) with 0.2.
shareholder(paul, stock_3353).
stock_up(stock_3353) with 0.2.
shareholder(paul, stock_3354).
stock_up(stock_3354) with 0.2.
shareholder(paul, stock_3355).
stock_up(stock_3355) with 0.2.
shareholder(paul, stock_3356).
stock_up(stock_3356) with 0.2.
shareholder(paul, stock_3357).
stock_up(stock_3357) with 0.2.
shareholder(paul, stock_3358).
stock_up(stock_3358) with 0.2.
shareholder(paul, stock_3359).
stock_up(stock_3359) with 0.2.
shareholder(paul, stock_3360).
stock_up(stock_3360) with 0.2.
shareholder(paul, stock_3361).
stock_up(stock_3361) with 0.2.
shareholder(paul, stock_3362).
stock_up(stock_3362) with 0.2.
shareholder(paul, stock_3363).
stock_up(stock_3363) with 0.2.
shareholder(paul, stock_3364).
stock_up(stock_3364) with 0.2.
shareholder(paul, stock_3365).
stock_up(stock_3365) with 0.2.
shareholder(paul, stock_3366).
stock_up(stock_3366) with 0.2.
shareholder(paul, stock_3367).
stock_up(stock_3367) with 0.2.
shareholder(paul, stock_3368).
stock_up(stock_3368) with 0.2.
shareholder(paul, stock_3369).
stock_up(stock_3369) with 0.2.
shareholder(paul, stock_3370).
stock_up(stock_3370) with 0.2.
shareholder(paul, stock_3371).
stock_up(stock_3371) with 0.2.
shareholder(paul, stock_3372).
stock_up(stock_3372) with 0.2.
shareholder(paul, stock_3373).
stock_up(stock_3373) with 0.2.
shareholder(paul, stock_3374).
stock_up(stock_3374) with 0.2.
shareholder(paul, stock_3375).
stock_up(stock_3375) with 0.2.
shareholder(paul, stock_3376).
stock_up(stock_3376) with 0.2.
shareholder(paul, stock_3377).
stock_up(stock_3377) with 0.2.
shareholder(paul, stock_3378).
stock_up(stock_3378) with 0.2.
shareholder(paul, stock_3379).
stock_up(stock_3379) with 0.2.
shareholder(paul, stock_3380).
stock_up(stock_3380) with 0.2.
shareholder(paul, stock_3381).
stock_up(stock_3381) with 0.2.
shareholder(paul, stock_3382).
stock_up(stock_3382) with 0.2.
shareholder(paul, stock_3383).
stock_up(stock_3383) with 0.2.
shareholder(paul, stock_3384).
stock_up(stock_3384) with 0.2.
shareholder(paul, stock_3385).
stock_up(stock_3385) with 0.2.
shareholder(paul, stock_3386).
stock_up(stock_3386) with 0.2.
shareholder(paul, stock_3387).
stock_up(stock_3387) with 0.2.
shareholder(paul, stock_3388).
stock_up(stock_3388) with 0.2.
shareholder(paul, stock_3389).
stock_up(stock_3389) with 0.2.
shareholder(paul, stock_3390).
stock_up(stock_3390) with 0.2.
shareholder(paul, stock_3391).
stock_up(stock_3391) with 0.2.
shareholder(paul, stock_3392).
stock_up(stock_3392) with 0.2.
shareholder(paul, stock_3393).
stock_up(stock_3393) with 0.2.
shareholder(paul, stock_3394).
stock_up(stock_3394) with 0.2.
shareholder(paul, stock_3395).
stock_up(stock_3395) with 0.2.
shareholder(paul, stock_3396).
stock_up(stock_3396) with 0.2.
shareholder(paul, stock_3397).
stock_up(stock_3397) with 0.2.
shareholder(paul, stock_3398).
stock_up(stock_3398) with 0.2.
shareholder(paul, stock_3399).
stock_up(stock_3399) with 0.2.
shareholder(paul, stock_3400).
stock_up(stock_3400) with 0.2.
shareholder(paul, stock_3401).
stock_up(stock_3401) with 0.2.
shareholder(paul, stock_3402).
stock_up(stock_3402) with 0.2.
shareholder(paul, stock_3403).
stock_up(stock_3403) with 0.2.
shareholder(paul, stock_3404).
stock_up(stock_3404) with 0.2.
shareholder(paul, stock_3405).
stock_up(stock_3405) with 0.2.
shareholder(paul, stock_3406).
stock_up(stock_3406) with 0.2.
shareholder(paul, stock_3407).
stock_up(stock_3407) with 0.2.
shareholder(paul, stock_3408).
stock_up(stock_3408) with 0.2.
shareholder(paul, stock_3409).
stock_up(stock_3409) with 0.2.
shareholder(paul, stock_3410).
stock_up(stock_3410) with 0.2.
shareholder(paul, stock_3411).
stock_up(stock_3411) with 0.2.
shareholder(paul, stock_3412).
stock_up(stock_3412) with 0.2.
shareholder(paul, stock_3413).
stock_up(stock_3413) with 0.2.
shareholder(paul, stock_3414).
stock_up(stock_3414) with 0.2.
shareholder(paul, stock_3415).
stock_up(stock_3415) with 0.2.
shareholder(paul, stock_3416).
stock_up(stock_3416) with 0.2.
shareholder(paul, stock_3417).
stock_up(stock_3417) with 0.2.
shareholder(paul, stock_3418).
stock_up(stock_3418) with 0.2.
shareholder(paul, stock_3419).
stock_up(stock_3419) with 0.2.
shareholder(paul, stock_3420).
stock_up(stock_3420) with 0.2.
shareholder(paul, stock_3421).
stock_up(stock_3421) with 0.2.
shareholder(paul, stock_3422).
stock_up(stock_3422) with 0.2.
shareholder(paul, stock_3423).
stock_up(stock_3423) with 0.2.
shareholder(paul, stock_3424).
stock_up(stock_3424) with 0.2.
shareholder(paul, stock_3425).
stock_up(stock_3425) with 0.2.
shareholder(paul, stock_3426).
stock_up(stock_3426) with 0.2.
shareholder(paul, stock_3427).
stock_up(stock_3427) with 0.2.
shareholder(paul, stock_3428).
stock_up(stock_3428) with 0.2.
shareholder(paul, stock_3429).
stock_up(stock_3429) with 0.2.
shareholder(paul, stock_3430).
stock_up(stock_3430) with 0.2.
shareholder(paul, stock_3431).
stock_up(stock_3431) with 0.2.
shareholder(paul, stock_3432).
stock_up(stock_3432) with 0.2.
shareholder(paul, stock_3433).
stock_up(stock_3433) with 0.2.
shareholder(paul, stock_3434).
stock_up(stock_3434) with 0.2.
shareholder(paul, stock_3435).
stock_up(stock_3435) with 0.2.
shareholder(paul, stock_3436).
stock_up(stock_3436) with 0.2.
shareholder(paul, stock_3437).
stock_up(stock_3437) with 0.2.
shareholder(paul, stock_3438).
stock_up(stock_3438) with 0.2.
shareholder(paul, stock_3439).
stock_up(stock_3439) with 0.2.
shareholder(paul, stock_3440).
stock_up(stock_3440) with 0.2.
shareholder(paul, stock_3441).
stock_up(stock_3441) with 0.2.
shareholder(paul, stock_3442).
stock_up(stock_3442) with 0.2.
shareholder(paul, stock_3443).
stock_up(stock_3443) with 0.2.
shareholder(paul, stock_3444).
stock_up(stock_3444) with 0.2.
shareholder(paul, stock_3445).
stock_up(stock_3445) with 0.2.
shareholder(paul, stock_3446).
stock_up(stock_3446) with 0.2.
shareholder(paul, stock_3447).
stock_up(stock_3447) with 0.2.
shareholder(paul, stock_3448).
stock_up(stock_3448) with 0.2.
shareholder(paul, stock_3449).
stock_up(stock_3449) with 0.2.
shareholder(paul, stock_3450).
stock_up(stock_3450) with 0.2.
shareholder(paul, stock_3451).
stock_up(stock_3451) with 0.2.
shareholder(paul, stock_3452).
stock_up(stock_3452) with 0.2.
shareholder(paul, stock_3453).
stock_up(stock_3453) with 0.2.
shareholder(paul, stock_3454).
stock_up(stock_3454) with 0.2.
shareholder(paul, stock_3455).
stock_up(stock_3455) with 0.2.
shareholder(paul, stock_3456).
stock_up(stock_3456) with 0.2.
shareholder(paul, stock_3457).
stock_up(stock_3457) with 0.2.
shareholder(paul, stock_3458).
stock_up(stock_3458) with 0.2.
shareholder(paul, stock_3459).
stock_up(stock_3459) with 0.2.
shareholder(paul, stock_3460).
stock_up(stock_3460) with 0.2.
shareholder(paul, stock_3461).
stock_up(stock_3461) with 0.2.
shareholder(paul, stock_3462).
stock_up(stock_3462) with 0.2.
shareholder(paul, stock_3463).
stock_up(stock_3463) with 0.2.
shareholder(paul, stock_3464).
stock_up(stock_3464) with 0.2.
shareholder(paul, stock_3465).
stock_up(stock_3465) with 0.2.
shareholder(paul, stock_3466).
stock_up(stock_3466) with 0.2.
shareholder(paul, stock_3467).
stock_up(stock_3467) with 0.2.
shareholder(paul, stock_3468).
stock_up(stock_3468) with 0.2.
shareholder(paul, stock_3469).
stock_up(stock_3469) with 0.2.
shareholder(paul, stock_3470).
stock_up(stock_3470) with 0.2.
shareholder(paul, stock_3471).
stock_up(stock_3471) with 0.2.
shareholder(paul, stock_3472).
stock_up(stock_3472) with 0.2.
shareholder(paul, stock_3473).
stock_up(stock_3473) with 0.2.
shareholder(paul, stock_3474).
stock_up(stock_3474) with 0.2.
shareholder(paul, stock_3475).
stock_up(stock_3475) with 0.2.
shareholder(paul, stock_3476).
stock_up(stock_3476) with 0.2.
shareholder(paul, stock_3477).
stock_up(stock_3477) with 0.2.
shareholder(paul, stock_3478).
stock_up(stock_3478) with 0.2.
shareholder(paul, stock_3479).
stock_up(stock_3479) with 0.2.
shareholder(paul, stock_3480).
stock_up(stock_3480) with 0.2.
shareholder(paul, stock_3481).
stock_up(stock_3481) with 0.2.
shareholder(paul, stock_3482).
stock_up(stock_3482) with 0.2.
shareholder(paul, stock_3483).
stock_up(stock_3483) with 0.2.
shareholder(paul, stock_3484).
stock_up(stock_3484) with 0.2.
shareholder(paul, stock_3485).
stock_up(stock_3485) with 0.2.
shareholder(paul, stock_3486).
stock_up(stock_3486) with 0.2.
shareholder(paul, stock_3487).
stock_up(stock_3487) with 0.2.
shareholder(paul, stock_3488).
stock_up(stock_3488) with 0.2.
shareholder(paul, stock_3489).
stock_up(stock_3489) with 0.2.
shareholder(paul, stock_3490).
stock_up(stock_3490) with 0.2.
shareholder(paul, stock_3491).
stock_up(stock_3491) with 0.2.
shareholder(paul, stock_3492).
stock_up(stock_3492) with 0.2.
shareholder(paul, stock_3493).
stock_up(stock_3493) with 0.2.
shareholder(paul, stock_3494).
stock_up(stock_3494) with 0.2.
shareholder(paul, stock_3495).
stock_up(stock_3495) with 0.2.
shareholder(paul, stock_3496).
stock_up(stock_3496) with 0.2.
shareholder(paul, stock_3497).
stock_up(stock_3497) with 0.2.
shareholder(paul, stock_3498).
stock_up(stock_3498) with 0.2.
shareholder(paul, stock_3499).
stock_up(stock_3499) with 0.2.
shareholder(paul, stock_3500).
stock_up(stock_3500) with 0.2.
shareholder(paul, stock_3501).
stock_up(stock_3501) with 0.2.
shareholder(paul, stock_3502).
stock_up(stock_3502) with 0.2.
shareholder(paul, stock_3503).
stock_up(stock_3503) with 0.2.
shareholder(paul, stock_3504).
stock_up(stock_3504) with 0.2.
shareholder(paul, stock_3505).
stock_up(stock_3505) with 0.2.
shareholder(paul, stock_3506).
stock_up(stock_3506) with 0.2.
shareholder(paul, stock_3507).
stock_up(stock_3507) with 0.2.
shareholder(paul, stock_3508).
stock_up(stock_3508) with 0.2.
shareholder(paul, stock_3509).
stock_up(stock_3509) with 0.2.
shareholder(paul, stock_3510).
stock_up(stock_3510) with 0.2.
shareholder(paul, stock_3511).
stock_up(stock_3511) with 0.2.
shareholder(paul, stock_3512).
stock_up(stock_3512) with 0.2.
shareholder(paul, stock_3513).
stock_up(stock_3513) with 0.2.
shareholder(paul, stock_3514).
stock_up(stock_3514) with 0.2.
shareholder(paul, stock_3515).
stock_up(stock_3515) with 0.2.
shareholder(paul, stock_3516).
stock_up(stock_3516) with 0.2.
shareholder(paul, stock_3517).
stock_up(stock_3517) with 0.2.
shareholder(paul, stock_3518).
stock_up(stock_3518) with 0.2.
shareholder(paul, stock_3519).
stock_up(stock_3519) with 0.2.
shareholder(paul, stock_3520).
stock_up(stock_3520) with 0.2.
shareholder(paul, stock_3521).
stock_up(stock_3521) with 0.2.
shareholder(paul, stock_3522).
stock_up(stock_3522) with 0.2.
shareholder(paul, stock_3523).
stock_up(stock_3523) with 0.2.
shareholder(paul, stock_3524).
stock_up(stock_3524) with 0.2.
shareholder(paul, stock_3525).
stock_up(stock_3525) with 0.2.
shareholder(paul, stock_3526).
stock_up(stock_3526) with 0.2.
shareholder(paul, stock_3527).
stock_up(stock_3527) with 0.2.
shareholder(paul, stock_3528).
stock_up(stock_3528) with 0.2.
shareholder(paul, stock_3529).
stock_up(stock_3529) with 0.2.
shareholder(paul, stock_3530).
stock_up(stock_3530) with 0.2.
shareholder(paul, stock_3531).
stock_up(stock_3531) with 0.2.
shareholder(paul, stock_3532).
stock_up(stock_3532) with 0.2.
shareholder(paul, stock_3533).
stock_up(stock_3533) with 0.2.
shareholder(paul, stock_3534).
stock_up(stock_3534) with 0.2.
shareholder(paul, stock_3535).
stock_up(stock_3535) with 0.2.
shareholder(paul, stock_3536).
stock_up(stock_3536) with 0.2.
shareholder(paul, stock_3537).
stock_up(stock_3537) with 0.2.
shareholder(paul, stock_3538).
stock_up(stock_3538) with 0.2.
shareholder(paul, stock_3539).
stock_up(stock_3539) with 0.2.
shareholder(paul, stock_3540).
stock_up(stock_3540) with 0.2.
shareholder(paul, stock_3541).
stock_up(stock_3541) with 0.2.
shareholder(paul, stock_3542).
stock_up(stock_3542) with 0.2.
shareholder(paul, stock_3543).
stock_up(stock_3543) with 0.2.
shareholder(paul, stock_3544).
stock_up(stock_3544) with 0.2.
shareholder(paul, stock_3545).
stock_up(stock_3545) with 0.2.
shareholder(paul, stock_3546).
stock_up(stock_3546) with 0.2.
shareholder(paul, stock_3547).
stock_up(stock_3547) with 0.2.
shareholder(paul, stock_3548).
stock_up(stock_3548) with 0.2.
shareholder(paul, stock_3549).
stock_up(stock_3549) with 0.2.
shareholder(paul, stock_3550).
stock_up(stock_3550) with 0.2.
shareholder(paul, stock_3551).
stock_up(stock_3551) with 0.2.
shareholder(paul, stock_3552).
stock_up(stock_3552) with 0.2.
shareholder(paul, stock_3553).
stock_up(stock_3553) with 0.2.
shareholder(paul, stock_3554).
stock_up(stock_3554) with 0.2.
shareholder(paul, stock_3555).
stock_up(stock_3555) with 0.2.
shareholder(paul, stock_3556).
stock_up(stock_3556) with 0.2.
shareholder(paul, stock_3557).
stock_up(stock_3557) with 0.2.
shareholder(paul, stock_3558).
stock_up(stock_3558) with 0.2.
shareholder(paul, stock_3559).
stock_up(stock_3559) with 0.2.
shareholder(paul, stock_3560).
stock_up(stock_3560) with 0.2.
shareholder(paul, stock_3561).
stock_up(stock_3561) with 0.2.
shareholder(paul, stock_3562).
stock_up(stock_3562) with 0.2.
shareholder(paul, stock_3563).
stock_up(stock_3563) with 0.2.
shareholder(paul, stock_3564).
stock_up(stock_3564) with 0.2.
shareholder(paul, stock_3565).
stock_up(stock_3565) with 0.2.
shareholder(paul, stock_3566).
stock_up(stock_3566) with 0.2.
shareholder(paul, stock_3567).
stock_up(stock_3567) with 0.2.
shareholder(paul, stock_3568).
stock_up(stock_3568) with 0.2.
shareholder(paul, stock_3569).
stock_up(stock_3569) with 0.2.
shareholder(paul, stock_3570).
stock_up(stock_3570) with 0.2.
shareholder(paul, stock_3571).
stock_up(stock_3571) with 0.2.
shareholder(paul, stock_3572).
stock_up(stock_3572) with 0.2.
shareholder(paul, stock_3573).
stock_up(stock_3573) with 0.2.
shareholder(paul, stock_3574).
stock_up(stock_3574) with 0.2.
shareholder(paul, stock_3575).
stock_up(stock_3575) with 0.2.
shareholder(paul, stock_3576).
stock_up(stock_3576) with 0.2.
shareholder(paul, stock_3577).
stock_up(stock_3577) with 0.2.
shareholder(paul, stock_3578).
stock_up(stock_3578) with 0.2.
shareholder(paul, stock_3579).
stock_up(stock_3579) with 0.2.
shareholder(paul, stock_3580).
stock_up(stock_3580) with 0.2.
shareholder(paul, stock_3581).
stock_up(stock_3581) with 0.2.
shareholder(paul, stock_3582).
stock_up(stock_3582) with 0.2.
shareholder(paul, stock_3583).
stock_up(stock_3583) with 0.2.
shareholder(paul, stock_3584).
stock_up(stock_3584) with 0.2.
shareholder(paul, stock_3585).
stock_up(stock_3585) with 0.2.
shareholder(paul, stock_3586).
stock_up(stock_3586) with 0.2.
shareholder(paul, stock_3587).
stock_up(stock_3587) with 0.2.
shareholder(paul, stock_3588).
stock_up(stock_3588) with 0.2.
shareholder(paul, stock_3589).
stock_up(stock_3589) with 0.2.
shareholder(paul, stock_3590).
stock_up(stock_3590) with 0.2.
shareholder(paul, stock_3591).
stock_up(stock_3591) with 0.2.
shareholder(paul, stock_3592).
stock_up(stock_3592) with 0.2.
shareholder(paul, stock_3593).
stock_up(stock_3593) with 0.2.
shareholder(paul, stock_3594).
stock_up(stock_3594) with 0.2.
shareholder(paul, stock_3595).
stock_up(stock_3595) with 0.2.
shareholder(paul, stock_3596).
stock_up(stock_3596) with 0.2.
shareholder(paul, stock_3597).
stock_up(stock_3597) with 0.2.
shareholder(paul, stock_3598).
stock_up(stock_3598) with 0.2.
shareholder(paul, stock_3599).
stock_up(stock_3599) with 0.2.
shareholder(paul, stock_3600).
stock_up(stock_3600) with 0.2.
shareholder(paul, stock_3601).
stock_up(stock_3601) with 0.2.
shareholder(paul, stock_3602).
stock_up(stock_3602) with 0.2.
shareholder(paul, stock_3603).
stock_up(stock_3603) with 0.2.
shareholder(paul, stock_3604).
stock_up(stock_3604) with 0.2.
shareholder(paul, stock_3605).
stock_up(stock_3605) with 0.2.
shareholder(paul, stock_3606).
stock_up(stock_3606) with 0.2.
shareholder(paul, stock_3607).
stock_up(stock_3607) with 0.2.
shareholder(paul, stock_3608).
stock_up(stock_3608) with 0.2.
shareholder(paul, stock_3609).
stock_up(stock_3609) with 0.2.
shareholder(paul, stock_3610).
stock_up(stock_3610) with 0.2.
shareholder(paul, stock_3611).
stock_up(stock_3611) with 0.2.
shareholder(paul, stock_3612).
stock_up(stock_3612) with 0.2.
shareholder(paul, stock_3613).
stock_up(stock_3613) with 0.2.
shareholder(paul, stock_3614).
stock_up(stock_3614) with 0.2.
shareholder(paul, stock_3615).
stock_up(stock_3615) with 0.2.
shareholder(paul, stock_3616).
stock_up(stock_3616) with 0.2.
shareholder(paul, stock_3617).
stock_up(stock_3617) with 0.2.
shareholder(paul, stock_3618).
stock_up(stock_3618) with 0.2.
shareholder(paul, stock_3619).
stock_up(stock_3619) with 0.2.
shareholder(paul, stock_3620).
stock_up(stock_3620) with 0.2.
shareholder(paul, stock_3621).
stock_up(stock_3621) with 0.2.
shareholder(paul, stock_3622).
stock_up(stock_3622) with 0.2.
shareholder(paul, stock_3623).
stock_up(stock_3623) with 0.2.
shareholder(paul, stock_3624).
stock_up(stock_3624) with 0.2.
shareholder(paul, stock_3625).
stock_up(stock_3625) with 0.2.
shareholder(paul, stock_3626).
stock_up(stock_3626) with 0.2.
shareholder(paul, stock_3627).
stock_up(stock_3627) with 0.2.
shareholder(paul, stock_3628).
stock_up(stock_3628) with 0.2.
shareholder(paul, stock_3629).
stock_up(stock_3629) with 0.2.
shareholder(paul, stock_3630).
stock_up(stock_3630) with 0.2.
shareholder(paul, stock_3631).
stock_up(stock_3631) with 0.2.
shareholder(paul, stock_3632).
stock_up(stock_3632) with 0.2.
shareholder(paul, stock_3633).
stock_up(stock_3633) with 0.2.
shareholder(paul, stock_3634).
stock_up(stock_3634) with 0.2.
shareholder(paul, stock_3635).
stock_up(stock_3635) with 0.2.
shareholder(paul, stock_3636).
stock_up(stock_3636) with 0.2.
shareholder(paul, stock_3637).
stock_up(stock_3637) with 0.2.
shareholder(paul, stock_3638).
stock_up(stock_3638) with 0.2.
shareholder(paul, stock_3639).
stock_up(stock_3639) with 0.2.
shareholder(paul, stock_3640).
stock_up(stock_3640) with 0.2.
shareholder(paul, stock_3641).
stock_up(stock_3641) with 0.2.
shareholder(paul, stock_3642).
stock_up(stock_3642) with 0.2.
shareholder(paul, stock_3643).
stock_up(stock_3643) with 0.2.
shareholder(paul, stock_3644).
stock_up(stock_3644) with 0.2.
shareholder(paul, stock_3645).
stock_up(stock_3645) with 0.2.
shareholder(paul, stock_3646).
stock_up(stock_3646) with 0.2.
shareholder(paul, stock_3647).
stock_up(stock_3647) with 0.2.
shareholder(paul, stock_3648).
stock_up(stock_3648) with 0.2.
shareholder(paul, stock_3649).
stock_up(stock_3649) with 0.2.
shareholder(paul, stock_3650).
stock_up(stock_3650) with 0.2.
shareholder(paul, stock_3651).
stock_up(stock_3651) with 0.2.
shareholder(paul, stock_3652).
stock_up(stock_3652) with 0.2.
shareholder(paul, stock_3653).
stock_up(stock_3653) with 0.2.
shareholder(paul, stock_3654).
stock_up(stock_3654) with 0.2.
shareholder(paul, stock_3655).
stock_up(stock_3655) with 0.2.
shareholder(paul, stock_3656).
stock_up(stock_3656) with 0.2.
shareholder(paul, stock_3657).
stock_up(stock_3657) with 0.2.
shareholder(paul, stock_3658).
stock_up(stock_3658) with 0.2.
shareholder(paul, stock_3659).
stock_up(stock_3659) with 0.2.
shareholder(paul, stock_3660).
stock_up(stock_3660) with 0.2.
shareholder(paul, stock_3661).
stock_up(stock_3661) with 0.2.
shareholder(paul, stock_3662).
stock_up(stock_3662) with 0.2.
shareholder(paul, stock_3663).
stock_up(stock_3663) with 0.2.
shareholder(paul, stock_3664).
stock_up(stock_3664) with 0.2.
shareholder(paul, stock_3665).
stock_up(stock_3665) with 0.2.
shareholder(paul, stock_3666).
stock_up(stock_3666) with 0.2.
shareholder(paul, stock_3667).
stock_up(stock_3667) with 0.2.
shareholder(paul, stock_3668).
stock_up(stock_3668) with 0.2.
shareholder(paul, stock_3669).
stock_up(stock_3669) with 0.2.
shareholder(paul, stock_3670).
stock_up(stock_3670) with 0.2.
shareholder(paul, stock_3671).
stock_up(stock_3671) with 0.2.
shareholder(paul, stock_3672).
stock_up(stock_3672) with 0.2.
shareholder(paul, stock_3673).
stock_up(stock_3673) with 0.2.
shareholder(paul, stock_3674).
stock_up(stock_3674) with 0.2.
shareholder(paul, stock_3675).
stock_up(stock_3675) with 0.2.
shareholder(paul, stock_3676).
stock_up(stock_3676) with 0.2.
shareholder(paul, stock_3677).
stock_up(stock_3677) with 0.2.
shareholder(paul, stock_3678).
stock_up(stock_3678) with 0.2.
shareholder(paul, stock_3679).
stock_up(stock_3679) with 0.2.
shareholder(paul, stock_3680).
stock_up(stock_3680) with 0.2.
shareholder(paul, stock_3681).
stock_up(stock_3681) with 0.2.
shareholder(paul, stock_3682).
stock_up(stock_3682) with 0.2.
shareholder(paul, stock_3683).
stock_up(stock_3683) with 0.2.
shareholder(paul, stock_3684).
stock_up(stock_3684) with 0.2.
shareholder(paul, stock_3685).
stock_up(stock_3685) with 0.2.
shareholder(paul, stock_3686).
stock_up(stock_3686) with 0.2.
shareholder(paul, stock_3687).
stock_up(stock_3687) with 0.2.
shareholder(paul, stock_3688).
stock_up(stock_3688) with 0.2.
shareholder(paul, stock_3689).
stock_up(stock_3689) with 0.2.
shareholder(paul, stock_3690).
stock_up(stock_3690) with 0.2.
shareholder(paul, stock_3691).
stock_up(stock_3691) with 0.2.
shareholder(paul, stock_3692).
stock_up(stock_3692) with 0.2.
shareholder(paul, stock_3693).
stock_up(stock_3693) with 0.2.
shareholder(paul, stock_3694).
stock_up(stock_3694) with 0.2.
shareholder(paul, stock_3695).
stock_up(stock_3695) with 0.2.
shareholder(paul, stock_3696).
stock_up(stock_3696) with 0.2.
shareholder(paul, stock_3697).
stock_up(stock_3697) with 0.2.
shareholder(paul, stock_3698).
stock_up(stock_3698) with 0.2.
shareholder(paul, stock_3699).
stock_up(stock_3699) with 0.2.
shareholder(paul, stock_3700).
stock_up(stock_3700) with 0.2.
shareholder(paul, stock_3701).
stock_up(stock_3701) with 0.2.
shareholder(paul, stock_3702).
stock_up(stock_3702) with 0.2.
shareholder(paul, stock_3703).
stock_up(stock_3703) with 0.2.
shareholder(paul, stock_3704).
stock_up(stock_3704) with 0.2.
shareholder(paul, stock_3705).
stock_up(stock_3705) with 0.2.
shareholder(paul, stock_3706).
stock_up(stock_3706) with 0.2.
shareholder(paul, stock_3707).
stock_up(stock_3707) with 0.2.
shareholder(paul, stock_3708).
stock_up(stock_3708) with 0.2.
shareholder(paul, stock_3709).
stock_up(stock_3709) with 0.2.
shareholder(paul, stock_3710).
stock_up(stock_3710) with 0.2.
shareholder(paul, stock_3711).
stock_up(stock_3711) with 0.2.
shareholder(paul, stock_3712).
stock_up(stock_3712) with 0.2.
shareholder(paul, stock_3713).
stock_up(stock_3713) with 0.2.
shareholder(paul, stock_3714).
stock_up(stock_3714) with 0.2.
shareholder(paul, stock_3715).
stock_up(stock_3715) with 0.2.
shareholder(paul, stock_3716).
stock_up(stock_3716) with 0.2.
shareholder(paul, stock_3717).
stock_up(stock_3717) with 0.2.
shareholder(paul, stock_3718).
stock_up(stock_3718) with 0.2.
shareholder(paul, stock_3719).
stock_up(stock_3719) with 0.2.
shareholder(paul, stock_3720).
stock_up(stock_3720) with 0.2.
shareholder(paul, stock_3721).
stock_up(stock_3721) with 0.2.
shareholder(paul, stock_3722).
stock_up(stock_3722) with 0.2.
shareholder(paul, stock_3723).
stock_up(stock_3723) with 0.2.
shareholder(paul, stock_3724).
stock_up(stock_3724) with 0.2.
shareholder(paul, stock_3725).
stock_up(stock_3725) with 0.2.
shareholder(paul, stock_3726).
stock_up(stock_3726) with 0.2.
shareholder(paul, stock_3727).
stock_up(stock_3727) with 0.2.
shareholder(paul, stock_3728).
stock_up(stock_3728) with 0.2.
shareholder(paul, stock_3729).
stock_up(stock_3729) with 0.2.
shareholder(paul, stock_3730).
stock_up(stock_3730) with 0.2.
shareholder(paul, stock_3731).
stock_up(stock_3731) with 0.2.
shareholder(paul, stock_3732).
stock_up(stock_3732) with 0.2.
shareholder(paul, stock_3733).
stock_up(stock_3733) with 0.2.
shareholder(paul, stock_3734).
stock_up(stock_3734) with 0.2.
shareholder(paul, stock_3735).
stock_up(stock_3735) with 0.2.
shareholder(paul, stock_3736).
stock_up(stock_3736) with 0.2.
shareholder(paul, stock_3737).
stock_up(stock_3737) with 0.2.
shareholder(paul, stock_3738).
stock_up(stock_3738) with 0.2.
shareholder(paul, stock_3739).
stock_up(stock_3739) with 0.2.
shareholder(paul, stock_3740).
stock_up(stock_3740) with 0.2.
shareholder(paul, stock_3741).
stock_up(stock_3741) with 0.2.
shareholder(paul, stock_3742).
stock_up(stock_3742) with 0.2.
shareholder(paul, stock_3743).
stock_up(stock_3743) with 0.2.
shareholder(paul, stock_3744).
stock_up(stock_3744) with 0.2.
shareholder(paul, stock_3745).
stock_up(stock_3745) with 0.2.
shareholder(paul, stock_3746).
stock_up(stock_3746) with 0.2.
shareholder(paul, stock_3747).
stock_up(stock_3747) with 0.2.
shareholder(paul, stock_3748).
stock_up(stock_3748) with 0.2.
shareholder(paul, stock_3749).
stock_up(stock_3749) with 0.2.
shareholder(paul, stock_3750).
stock_up(stock_3750) with 0.2.
shareholder(paul, stock_3751).
stock_up(stock_3751) with 0.2.
shareholder(paul, stock_3752).
stock_up(stock_3752) with 0.2.
shareholder(paul, stock_3753).
stock_up(stock_3753) with 0.2.
shareholder(paul, stock_3754).
stock_up(stock_3754) with 0.2.
shareholder(paul, stock_3755).
stock_up(stock_3755) with 0.2.
shareholder(paul, stock_3756).
stock_up(stock_3756) with 0.2.
shareholder(paul, stock_3757).
stock_up(stock_3757) with 0.2.
shareholder(paul, stock_3758).
stock_up(stock_3758) with 0.2.
shareholder(paul, stock_3759).
stock_up(stock_3759) with 0.2.
shareholder(paul, stock_3760).
stock_up(stock_3760) with 0.2.
shareholder(paul, stock_3761).
stock_up(stock_3761) with 0.2.
shareholder(paul, stock_3762).
stock_up(stock_3762) with 0.2.
shareholder(paul, stock_3763).
stock_up(stock_3763) with 0.2.
shareholder(paul, stock_3764).
stock_up(stock_3764) with 0.2.
shareholder(paul, stock_3765).
stock_up(stock_3765) with 0.2.
shareholder(paul, stock_3766).
stock_up(stock_3766) with 0.2.
shareholder(paul, stock_3767).
stock_up(stock_3767) with 0.2.
shareholder(paul, stock_3768).
stock_up(stock_3768) with 0.2.
shareholder(paul, stock_3769).
stock_up(stock_3769) with 0.2.
shareholder(paul, stock_3770).
stock_up(stock_3770) with 0.2.
shareholder(paul, stock_3771).
stock_up(stock_3771) with 0.2.
shareholder(paul, stock_3772).
stock_up(stock_3772) with 0.2.
shareholder(paul, stock_3773).
stock_up(stock_3773) with 0.2.
shareholder(paul, stock_3774).
stock_up(stock_3774) with 0.2.
shareholder(paul, stock_3775).
stock_up(stock_3775) with 0.2.
shareholder(paul, stock_3776).
stock_up(stock_3776) with 0.2.
shareholder(paul, stock_3777).
stock_up(stock_3777) with 0.2.
shareholder(paul, stock_3778).
stock_up(stock_3778) with 0.2.
shareholder(paul, stock_3779).
stock_up(stock_3779) with 0.2.
shareholder(paul, stock_3780).
stock_up(stock_3780) with 0.2.
shareholder(paul, stock_3781).
stock_up(stock_3781) with 0.2.
shareholder(paul, stock_3782).
stock_up(stock_3782) with 0.2.
shareholder(paul, stock_3783).
stock_up(stock_3783) with 0.2.
shareholder(paul, stock_3784).
stock_up(stock_3784) with 0.2.
shareholder(paul, stock_3785).
stock_up(stock_3785) with 0.2.
shareholder(paul, stock_3786).
stock_up(stock_3786) with 0.2.
shareholder(paul, stock_3787).
stock_up(stock_3787) with 0.2.
shareholder(paul, stock_3788).
stock_up(stock_3788) with 0.2.
shareholder(paul, stock_3789).
stock_up(stock_3789) with 0.2.
shareholder(paul, stock_3790).
stock_up(stock_3790) with 0.2.
shareholder(paul, stock_3791).
stock_up(stock_3791) with 0.2.
shareholder(paul, stock_3792).
stock_up(stock_3792) with 0.2.
shareholder(paul, stock_3793).
stock_up(stock_3793) with 0.2.
shareholder(paul, stock_3794).
stock_up(stock_3794) with 0.2.
shareholder(paul, stock_3795).
stock_up(stock_3795) with 0.2.
shareholder(paul, stock_3796).
stock_up(stock_3796) with 0.2.
shareholder(paul, stock_3797).
stock_up(stock_3797) with 0.2.
shareholder(paul, stock_3798).
stock_up(stock_3798) with 0.2.
shareholder(paul, stock_3799).
stock_up(stock_3799) with 0.2.
shareholder(paul, stock_3800).
stock_up(stock_3800) with 0.2.
shareholder(paul, stock_3801).
stock_up(stock_3801) with 0.2.
shareholder(paul, stock_3802).
stock_up(stock_3802) with 0.2.
shareholder(paul, stock_3803).
stock_up(stock_3803) with 0.2.
shareholder(paul, stock_3804).
stock_up(stock_3804) with 0.2.
shareholder(paul, stock_3805).
stock_up(stock_3805) with 0.2.
shareholder(paul, stock_3806).
stock_up(stock_3806) with 0.2.
shareholder(paul, stock_3807).
stock_up(stock_3807) with 0.2.
shareholder(paul, stock_3808).
stock_up(stock_3808) with 0.2.
shareholder(paul, stock_3809).
stock_up(stock_3809) with 0.2.
shareholder(paul, stock_3810).
stock_up(stock_3810) with 0.2.
shareholder(paul, stock_3811).
stock_up(stock_3811) with 0.2.
shareholder(paul, stock_3812).
stock_up(stock_3812) with 0.2.
shareholder(paul, stock_3813).
stock_up(stock_3813) with 0.2.
shareholder(paul, stock_3814).
stock_up(stock_3814) with 0.2.
shareholder(paul, stock_3815).
stock_up(stock_3815) with 0.2.
shareholder(paul, stock_3816).
stock_up(stock_3816) with 0.2.
shareholder(paul, stock_3817).
stock_up(stock_3817) with 0.2.
shareholder(paul, stock_3818).
stock_up(stock_3818) with 0.2.
shareholder(paul, stock_3819).
stock_up(stock_3819) with 0.2.
shareholder(paul, stock_3820).
stock_up(stock_3820) with 0.2.
shareholder(paul, stock_3821).
stock_up(stock_3821) with 0.2.
shareholder(paul, stock_3822).
stock_up(stock_3822) with 0.2.
shareholder(paul, stock_3823).
stock_up(stock_3823) with 0.2.
shareholder(paul, stock_3824).
stock_up(stock_3824) with 0.2.
shareholder(paul, stock_3825).
stock_up(stock_3825) with 0.2.
shareholder(paul, stock_3826).
stock_up(stock_3826) with 0.2.
shareholder(paul, stock_3827).
stock_up(stock_3827) with 0.2.
shareholder(paul, stock_3828).
stock_up(stock_3828) with 0.2.
shareholder(paul, stock_3829).
stock_up(stock_3829) with 0.2.
shareholder(paul, stock_3830).
stock_up(stock_3830) with 0.2.
shareholder(paul, stock_3831).
stock_up(stock_3831) with 0.2.
shareholder(paul, stock_3832).
stock_up(stock_3832) with 0.2.
shareholder(paul, stock_3833).
stock_up(stock_3833) with 0.2.
shareholder(paul, stock_3834).
stock_up(stock_3834) with 0.2.
shareholder(paul, stock_3835).
stock_up(stock_3835) with 0.2.
shareholder(paul, stock_3836).
stock_up(stock_3836) with 0.2.
shareholder(paul, stock_3837).
stock_up(stock_3837) with 0.2.
shareholder(paul, stock_3838).
stock_up(stock_3838) with 0.2.
shareholder(paul, stock_3839).
stock_up(stock_3839) with 0.2.
shareholder(paul, stock_3840).
stock_up(stock_3840) with 0.2.
shareholder(paul, stock_3841).
stock_up(stock_3841) with 0.2.
shareholder(paul, stock_3842).
stock_up(stock_3842) with 0.2.
shareholder(paul, stock_3843).
stock_up(stock_3843) with 0.2.
shareholder(paul, stock_3844).
stock_up(stock_3844) with 0.2.
shareholder(paul, stock_3845).
stock_up(stock_3845) with 0.2.
shareholder(paul, stock_3846).
stock_up(stock_3846) with 0.2.
shareholder(paul, stock_3847).
stock_up(stock_3847) with 0.2.
shareholder(paul, stock_3848).
stock_up(stock_3848) with 0.2.
shareholder(paul, stock_3849).
stock_up(stock_3849) with 0.2.
shareholder(paul, stock_3850).
stock_up(stock_3850) with 0.2.
shareholder(paul, stock_3851).
stock_up(stock_3851) with 0.2.
shareholder(paul, stock_3852).
stock_up(stock_3852) with 0.2.
shareholder(paul, stock_3853).
stock_up(stock_3853) with 0.2.
shareholder(paul, stock_3854).
stock_up(stock_3854) with 0.2.
shareholder(paul, stock_3855).
stock_up(stock_3855) with 0.2.
shareholder(paul, stock_3856).
stock_up(stock_3856) with 0.2.
shareholder(paul, stock_3857).
stock_up(stock_3857) with 0.2.
shareholder(paul, stock_3858).
stock_up(stock_3858) with 0.2.
shareholder(paul, stock_3859).
stock_up(stock_3859) with 0.2.
shareholder(paul, stock_3860).
stock_up(stock_3860) with 0.2.
shareholder(paul, stock_3861).
stock_up(stock_3861) with 0.2.
shareholder(paul, stock_3862).
stock_up(stock_3862) with 0.2.
shareholder(paul, stock_3863).
stock_up(stock_3863) with 0.2.
shareholder(paul, stock_3864).
stock_up(stock_3864) with 0.2.
shareholder(paul, stock_3865).
stock_up(stock_3865) with 0.2.
shareholder(paul, stock_3866).
stock_up(stock_3866) with 0.2.
shareholder(paul, stock_3867).
stock_up(stock_3867) with 0.2.
shareholder(paul, stock_3868).
stock_up(stock_3868) with 0.2.
shareholder(paul, stock_3869).
stock_up(stock_3869) with 0.2.
shareholder(paul, stock_3870).
stock_up(stock_3870) with 0.2.
shareholder(paul, stock_3871).
stock_up(stock_3871) with 0.2.
shareholder(paul, stock_3872).
stock_up(stock_3872) with 0.2.
shareholder(paul, stock_3873).
stock_up(stock_3873) with 0.2.
shareholder(paul, stock_3874).
stock_up(stock_3874) with 0.2.
shareholder(paul, stock_3875).
stock_up(stock_3875) with 0.2.
shareholder(paul, stock_3876).
stock_up(stock_3876) with 0.2.
shareholder(paul, stock_3877).
stock_up(stock_3877) with 0.2.
shareholder(paul, stock_3878).
stock_up(stock_3878) with 0.2.
shareholder(paul, stock_3879).
stock_up(stock_3879) with 0.2.
shareholder(paul, stock_3880).
stock_up(stock_3880) with 0.2.
shareholder(paul, stock_3881).
stock_up(stock_3881) with 0.2.
shareholder(paul, stock_3882).
stock_up(stock_3882) with 0.2.
shareholder(paul, stock_3883).
stock_up(stock_3883) with 0.2.
shareholder(paul, stock_3884).
stock_up(stock_3884) with 0.2.
shareholder(paul, stock_3885).
stock_up(stock_3885) with 0.2.
shareholder(paul, stock_3886).
stock_up(stock_3886) with 0.2.
shareholder(paul, stock_3887).
stock_up(stock_3887) with 0.2.
shareholder(paul, stock_3888).
stock_up(stock_3888) with 0.2.
shareholder(paul, stock_3889).
stock_up(stock_3889) with 0.2.
shareholder(paul, stock_3890).
stock_up(stock_3890) with 0.2.
shareholder(paul, stock_3891).
stock_up(stock_3891) with 0.2.
shareholder(paul, stock_3892).
stock_up(stock_3892) with 0.2.
shareholder(paul, stock_3893).
stock_up(stock_3893) with 0.2.
shareholder(paul, stock_3894).
stock_up(stock_3894) with 0.2.
shareholder(paul, stock_3895).
stock_up(stock_3895) with 0.2.
shareholder(paul, stock_3896).
stock_up(stock_3896) with 0.2.
shareholder(paul, stock_3897).
stock_up(stock_3897) with 0.2.
shareholder(paul, stock_3898).
stock_up(stock_3898) with 0.2.
shareholder(paul, stock_3899).
stock_up(stock_3899) with 0.2.
shareholder(paul, stock_3900).
stock_up(stock_3900) with 0.2.
shareholder(paul, stock_3901).
stock_up(stock_3901) with 0.2.
shareholder(paul, stock_3902).
stock_up(stock_3902) with 0.2.
shareholder(paul, stock_3903).
stock_up(stock_3903) with 0.2.
shareholder(paul, stock_3904).
stock_up(stock_3904) with 0.2.
shareholder(paul, stock_3905).
stock_up(stock_3905) with 0.2.
shareholder(paul, stock_3906).
stock_up(stock_3906) with 0.2.
shareholder(paul, stock_3907).
stock_up(stock_3907) with 0.2.
shareholder(paul, stock_3908).
stock_up(stock_3908) with 0.2.
shareholder(paul, stock_3909).
stock_up(stock_3909) with 0.2.
shareholder(paul, stock_3910).
stock_up(stock_3910) with 0.2.
shareholder(paul, stock_3911).
stock_up(stock_3911) with 0.2.
shareholder(paul, stock_3912).
stock_up(stock_3912) with 0.2.
shareholder(paul, stock_3913).
stock_up(stock_3913) with 0.2.
shareholder(paul, stock_3914).
stock_up(stock_3914) with 0.2.
shareholder(paul, stock_3915).
stock_up(stock_3915) with 0.2.
shareholder(paul, stock_3916).
stock_up(stock_3916) with 0.2.
shareholder(paul, stock_3917).
stock_up(stock_3917) with 0.2.
shareholder(paul, stock_3918).
stock_up(stock_3918) with 0.2.
shareholder(paul, stock_3919).
stock_up(stock_3919) with 0.2.
shareholder(paul, stock_3920).
stock_up(stock_3920) with 0.2.
shareholder(paul, stock_3921).
stock_up(stock_3921) with 0.2.
shareholder(paul, stock_3922).
stock_up(stock_3922) with 0.2.
shareholder(paul, stock_3923).
stock_up(stock_3923) with 0.2.
shareholder(paul, stock_3924).
stock_up(stock_3924) with 0.2.
shareholder(paul, stock_3925).
stock_up(stock_3925) with 0.2.
shareholder(paul, stock_3926).
stock_up(stock_3926) with 0.2.
shareholder(paul, stock_3927).
stock_up(stock_3927) with 0.2.
shareholder(paul, stock_3928).
stock_up(stock_3928) with 0.2.
shareholder(paul, stock_3929).
stock_up(stock_3929) with 0.2.
shareholder(paul, stock_3930).
stock_up(stock_3930) with 0.2.
shareholder(paul, stock_3931).
stock_up(stock_3931) with 0.2.
shareholder(paul, stock_3932).
stock_up(stock_3932) with 0.2.
shareholder(paul, stock_3933).
stock_up(stock_3933) with 0.2.
shareholder(paul, stock_3934).
stock_up(stock_3934) with 0.2.
shareholder(paul, stock_3935).
stock_up(stock_3935) with 0.2.
shareholder(paul, stock_3936).
stock_up(stock_3936) with 0.2.
shareholder(paul, stock_3937).
stock_up(stock_3937) with 0.2.
shareholder(paul, stock_3938).
stock_up(stock_3938) with 0.2.
shareholder(paul, stock_3939).
stock_up(stock_3939) with 0.2.
shareholder(paul, stock_3940).
stock_up(stock_3940) with 0.2.
shareholder(paul, stock_3941).
stock_up(stock_3941) with 0.2.
shareholder(paul, stock_3942).
stock_up(stock_3942) with 0.2.
shareholder(paul, stock_3943).
stock_up(stock_3943) with 0.2.
shareholder(paul, stock_3944).
stock_up(stock_3944) with 0.2.
shareholder(paul, stock_3945).
stock_up(stock_3945) with 0.2.
shareholder(paul, stock_3946).
stock_up(stock_3946) with 0.2.
shareholder(paul, stock_3947).
stock_up(stock_3947) with 0.2.
shareholder(paul, stock_3948).
stock_up(stock_3948) with 0.2.
shareholder(paul, stock_3949).
stock_up(stock_3949) with 0.2.
shareholder(paul, stock_3950).
stock_up(stock_3950) with 0.2.
shareholder(paul, stock_3951).
stock_up(stock_3951) with 0.2.
shareholder(paul, stock_3952).
stock_up(stock_3952) with 0.2.
shareholder(paul, stock_3953).
stock_up(stock_3953) with 0.2.
shareholder(paul, stock_3954).
stock_up(stock_3954) with 0.2.
shareholder(paul, stock_3955).
stock_up(stock_3955) with 0.2.
shareholder(paul, stock_3956).
stock_up(stock_3956) with 0.2.
shareholder(paul, stock_3957).
stock_up(stock_3957) with 0.2.
shareholder(paul, stock_3958).
stock_up(stock_3958) with 0.2.
shareholder(paul, stock_3959).
stock_up(stock_3959) with 0.2.
shareholder(paul, stock_3960).
stock_up(stock_3960) with 0.2.
shareholder(paul, stock_3961).
stock_up(stock_3961) with 0.2.
shareholder(paul, stock_3962).
stock_up(stock_3962) with 0.2.
shareholder(paul, stock_3963).
stock_up(stock_3963) with 0.2.
shareholder(paul, stock_3964).
stock_up(stock_3964) with 0.2.
shareholder(paul, stock_3965).
stock_up(stock_3965) with 0.2.
shareholder(paul, stock_3966).
stock_up(stock_3966) with 0.2.
shareholder(paul, stock_3967).
stock_up(stock_3967) with 0.2.
shareholder(paul, stock_3968).
stock_up(stock_3968) with 0.2.
shareholder(paul, stock_3969).
stock_up(stock_3969) with 0.2.
shareholder(paul, stock_3970).
stock_up(stock_3970) with 0.2.
shareholder(paul, stock_3971).
stock_up(stock_3971) with 0.2.
shareholder(paul, stock_3972).
stock_up(stock_3972) with 0.2.
shareholder(paul, stock_3973).
stock_up(stock_3973) with 0.2.
shareholder(paul, stock_3974).
stock_up(stock_3974) with 0.2.
shareholder(paul, stock_3975).
stock_up(stock_3975) with 0.2.
shareholder(paul, stock_3976).
stock_up(stock_3976) with 0.2.
shareholder(paul, stock_3977).
stock_up(stock_3977) with 0.2.
shareholder(paul, stock_3978).
stock_up(stock_3978) with 0.2.
shareholder(paul, stock_3979).
stock_up(stock_3979) with 0.2.
shareholder(paul, stock_3980).
stock_up(stock_3980) with 0.2.
shareholder(paul, stock_3981).
stock_up(stock_3981) with 0.2.
shareholder(paul, stock_3982).
stock_up(stock_3982) with 0.2.
shareholder(paul, stock_3983).
stock_up(stock_3983) with 0.2.
shareholder(paul, stock_3984).
stock_up(stock_3984) with 0.2.
shareholder(paul, stock_3985).
stock_up(stock_3985) with 0.2.
shareholder(paul, stock_3986).
stock_up(stock_3986) with 0.2.
shareholder(paul, stock_3987).
stock_up(stock_3987) with 0.2.
shareholder(paul, stock_3988).
stock_up(stock_3988) with 0.2.
shareholder(paul, stock_3989).
stock_up(stock_3989) with 0.2.
shareholder(paul, stock_3990).
stock_up(stock_3990) with 0.2.
shareholder(paul, stock_3991).
stock_up(stock_3991) with 0.2.
shareholder(paul, stock_3992).
stock_up(stock_3992) with 0.2.
shareholder(paul, stock_3993).
stock_up(stock_3993) with 0.2.
shareholder(paul, stock_3994).
stock_up(stock_3994) with 0.2.
shareholder(paul, stock_3995).
stock_up(stock_3995) with 0.2.
shareholder(paul, stock_3996).
stock_up(stock_3996) with 0.2.
shareholder(paul, stock_3997).
stock_up(stock_3997) with 0.2.
shareholder(paul, stock_3998).
stock_up(stock_3998) with 0.2.
shareholder(paul, stock_3999).
stock_up(stock_3999) with 0.2.
shareholder(paul, stock_4000).
stock_up(stock_4000) with 0.2.

% Core Rules
keep_stock(Name, Stock) :- shareholder(Name, Stock), (stock_up(Stock); young(Name)).
sell_stock(Name, Stock) :- shareholder(Name, Stock), stock_down(Stock), old(Name).

% RQ2 Target Goal: Nested Implication Structure (Depth K = 0)
bench :- findall(S,
     keep_stock(paul, S),
    Answers), length(Answers, L), write('Number of answers: '), writeln(L), setenv('Answers', L).
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE     := libvoikko-jni
LOCAL_CPP_FEATURES += exceptions
LOCAL_CFLAGS := -DHAVE_MALAGA
LOCAL_C_INCLUDES := $(LOCAL_PATH)/corevoikko/libvoikko/src
LOCAL_SRC_FILES  := \
	voikko-jni.cpp \
	corevoikko/libvoikko/src/morphology/interface.cpp \
	corevoikko/libvoikko/src/morphology/AnalyzerFactory.cpp \
	corevoikko/libvoikko/src/morphology/Analysis.cpp \
	corevoikko/libvoikko/src/morphology/Analyzer.cpp \
	corevoikko/libvoikko/src/morphology/NullAnalyzer.cpp \
	corevoikko/libvoikko/src/morphology/malaga/rules.cpp \
	corevoikko/libvoikko/src/morphology/malaga/pools.cpp \
	corevoikko/libvoikko/src/morphology/malaga/malaga_lib.cpp \
	corevoikko/libvoikko/src/morphology/malaga/libmalaga.cpp \
	corevoikko/libvoikko/src/morphology/malaga/patterns.cpp \
	corevoikko/libvoikko/src/morphology/malaga/tries.cpp \
	corevoikko/libvoikko/src/morphology/malaga/basic.cpp \
	corevoikko/libvoikko/src/morphology/malaga/MalagaState.cpp \
	corevoikko/libvoikko/src/morphology/malaga/analysis.cpp \
	corevoikko/libvoikko/src/morphology/malaga/lexicon.cpp \
	corevoikko/libvoikko/src/morphology/malaga/values.cpp \
	corevoikko/libvoikko/src/morphology/malaga/files.cpp \
	corevoikko/libvoikko/src/morphology/malaga/symbols.cpp \
	corevoikko/libvoikko/src/morphology/malaga/malaga_files.cpp \
	corevoikko/libvoikko/src/morphology/MalagaAnalyzer.cpp \
	corevoikko/libvoikko/src/hyphenator/Hyphenator.cpp \
	corevoikko/libvoikko/src/hyphenator/interface.cpp \
	corevoikko/libvoikko/src/hyphenator/AnalyzerToFinnishHyphenatorAdapter.cpp \
	corevoikko/libvoikko/src/hyphenator/HyphenatorFactory.cpp \
	corevoikko/libvoikko/src/autocorrect/AutoCorrect.cpp \
	corevoikko/libvoikko/src/compatibility/interface.cpp \
	corevoikko/libvoikko/src/spellchecker/Speller.cpp \
	corevoikko/libvoikko/src/spellchecker/SpellWithPriority.cpp \
	corevoikko/libvoikko/src/spellchecker/SpellUtils.cpp \
	corevoikko/libvoikko/src/spellchecker/AnalyzerToSpellerAdapter.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestion/SuggestionGeneratorDeletion.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestion/SuggestionGeneratorReplacement.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestion/SuggestionStatus.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestion/SuggestionGeneratorFactory.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestion/SuggestionGeneratorCaseChange.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestion/SuggestionGeneratorMultiReplacement.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestion/SuggestionGeneratorReplaceTwo.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestion/SuggestionStrategy.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestion/Suggestion.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestion/SuggestionGeneratorDeleteTwo.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestion/SuggestionGeneratorVowelChange.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestion/SuggestionStrategyTyping.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestion/SuggestionGeneratorSoftHyphens.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestion/SuggestionGeneratorNull.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestion/SuggestionGeneratorSplitWord.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestion/SuggestionGeneratorSwap.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestion/SuggestionStrategyOcr.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestion/SuggestionGeneratorInsertSpecial.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestion/SuggestionGeneratorInsertion.cpp \
	corevoikko/libvoikko/src/spellchecker/spell.cpp \
	corevoikko/libvoikko/src/spellchecker/FixedResultSpeller.cpp \
	corevoikko/libvoikko/src/spellchecker/SpellerCache.cpp \
	corevoikko/libvoikko/src/spellchecker/SpellerFactory.cpp \
	corevoikko/libvoikko/src/spellchecker/FinnishSpellerTweaksWrapper.cpp \
	corevoikko/libvoikko/src/spellchecker/suggestions.cpp \
	corevoikko/libvoikko/src/sentence/interface.cpp \
	corevoikko/libvoikko/src/sentence/Sentence.cpp \
	corevoikko/libvoikko/src/setup/DictionaryLoader.cpp \
	corevoikko/libvoikko/src/setup/interface.cpp \
	corevoikko/libvoikko/src/setup/DictionaryException.cpp \
	corevoikko/libvoikko/src/setup/Dictionary.cpp \
	corevoikko/libvoikko/src/setup/setup.cpp \
	corevoikko/libvoikko/src/setup/LanguageTag.cpp \
	corevoikko/libvoikko/src/utils/utils.cpp \
	corevoikko/libvoikko/src/utils/StringUtils.cpp \
	corevoikko/libvoikko/src/character/charset.cpp \
	corevoikko/libvoikko/src/character/SimpleChar.cpp \
	corevoikko/libvoikko/src/fst/Transducer.cpp \
	corevoikko/libvoikko/src/fst/Configuration.cpp \
	corevoikko/libvoikko/src/tokenizer/Tokenizer.cpp \
	corevoikko/libvoikko/src/tokenizer/interface.cpp \
	corevoikko/libvoikko/src/grammar/GcCache.cpp \
	corevoikko/libvoikko/src/grammar/checks.cpp \
	corevoikko/libvoikko/src/grammar/interface.cpp \
	corevoikko/libvoikko/src/grammar/check/MissingVerbCheck.cpp \
	corevoikko/libvoikko/src/grammar/check/NegativeVerbCheck.cpp \
	corevoikko/libvoikko/src/grammar/check/SidesanaCheck.cpp \
	corevoikko/libvoikko/src/grammar/check/SentenceCheck.cpp \
	corevoikko/libvoikko/src/grammar/check/CapitalizationCheck.cpp \
	corevoikko/libvoikko/src/grammar/check/ParagraphCheck.cpp \
	corevoikko/libvoikko/src/grammar/check/CompoundVerbCheck.cpp \
	corevoikko/libvoikko/src/grammar/Sentence.cpp \
	corevoikko/libvoikko/src/grammar/error.cpp \
	corevoikko/libvoikko/src/grammar/Paragraph.cpp \
	corevoikko/libvoikko/src/grammar/analysis.cpp \
	corevoikko/libvoikko/src/grammar/cache.cpp \
	corevoikko/libvoikko/src/grammar/CacheEntry.cpp \
	corevoikko/libvoikko/src/grammar/cachesetup.cpp

include $(BUILD_SHARED_LIBRARY)

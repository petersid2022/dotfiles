.PHONY: all
all: el.utf-8.spl

el.utf-8.spl : el_GR.dic el_GR.aff
	vim --clean --cmd "mkspell! el el_GR" --cmd q

el_GR.diff:
	curl -Lo el_GR.diff https://github.com/vim/vim/raw/master/runtime/spell/el/el_GR.diff
	vim --clean -c 'e ++enc=iso-8859-7 el_GR.diff' -c '3,47d' -c 'exe "4normal 62\<C-a>"' -c 'exe "5normal 62\<C-a>E62\<C-a>"' -c 'w ++enc=utf-8' -c 'q'

el_GR.aff: el_GR.diff
	curl -Lo el_GR.aff https://github.com/wooorm/dictionaries/raw/main/dictionaries/el/index.aff
	patch < el_GR.diff

el_GR.dic:
	curl -Lo el_GR.dic https://github.com/wooorm/dictionaries/raw/main/dictionaries/el/index.dic

.PHONY: clear
clear:
	rm el_GR.{aff,dic,diff} el.utf-8.{spl,sug}

.PHONY: clean
clean:
	rm el.utf-8.{spl,sug}

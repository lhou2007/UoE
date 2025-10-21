MAIN        := main.s
EVAL_MAIN   := eval.s
LIBS		:= libio.s divider.s
JAVA		:= java
MARS		:= ../../Mars4_5.jar
MARSFLAGS	:= sm nc p

run: $(LIBS) $(MAIN)
	@$(JAVA) -jar $(MARS) $(MARSFLAGS) $(MAIN)

run-eval: $(LIBS) $(EVAL_MAIN)
	@$(JAVA) -jar $(MARS) $(MARSFLAGS) $(EVAL_MAIN)
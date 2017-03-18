Activity1_tidy.csv: Activity1.csv Scripts/make_tidy.R
	Scripts/make_tidy.R $< $@

Activity1.csv: Activity1.xlsx Scripts/xlsx2csv.py
	Scripts/xlsx2csv.py $< $@

clean:
	rm *.csv

/*示例1*/
ods escapechar='#';
options formchar='|—-|+|—+=|-/\<>*';

data class;
length Sex $20;
format Sex $20.;
set sashelp.class;
if sex='男' then sex="#{unicode 00AE}"||'男';
run;
title;
ods rtf  file = "G:\LST5_2.rtf" ;
proc report data=class  nowd  ;
	Column name sex age height weight;
	Define name		/display center style(column)={width=2.2cm}  ;
	Define sex		/display center style(column)={width=3.0cm} ;
	Define age		/display left   style(column)={width=3.2cm} ;
	Define height	/display left   style(column)={width=3.2cm} ;
	Define weight	/display left   style(column)={width=3.2cm} '体重';
	run;
ods rtf  close;


/*示例2*/
data unicode;
input @1 code $1-70;
datalines;
~{unicode 03B1} ~{unicode 03B2} ~{unicode 03B3} ~{unicode 03B4}
~{unicode 03B5} ~{unicode 03B6} ~{unicode 03B7} ~{unicode 03B8}
~{unicode 03BB} ~{unicode 03BC} ~{unicode 03BD} ~{unicode 03BE}
~{unicode 03BF} ~{unicode 03C3} ~{unicode 03C6} ~{unicode 03C0}
~{unicode 2265} ~{unicode 2264} ~{unicode 2260} ~{unicode 2030}
~{unicode 2248} ~{unicode 2261} ~{unicode 00B1}
~{unicode 221A} ~{unicode 221E} ~{unicode 2229} ~{unicode 222B}
~{unicode 00B0}C ~{unicode 03BC}mol/L
~{unicode 00AE} ~{unicode 00A9} ~{unicode 0040} ~{unicode 2122}
~{unicode 002B} ~{unicode 002D} ~{unicode 00D7} ~{unicode 00F7}
~{unicode 00B9} ~{unicode 00B2} ~{unicode 00B3} ~{unicode 0060}
~{unicode 2153} ~{unicode 2154}
~{unicode 00BC} ~{unicode 00BD} ~{unicode 00BE}
~{unicode 2155} ~{unicode 2156} ~{unicode 2157} ~{unicode 2158}
~{unicode 2159} ~{unicode 215A}
~{unicode 215B} ~{unicode 215C} ~{unicode 215D} ~{unicode 215E}
~{unicode 2190} ~{unicode 2191} ~{unicode 2192} ~{unicode 2193}
~{unicode 2194} ~{unicode 2195} ~{unicode 21A8}
~{unicode 2196} ~{unicode 2197} ~{unicode 2198} ~{unicode 2199}
~{unicode 25A1} ~{unicode 25AA} ~{unicode 25AB}
~{unicode 25CA} ~{unicode 25CB} ~{unicode 25CC} ~{unicode 25CF}
run;
ods escapechar='~' ;
options orientation=landscape nodate nonumber noquotelenmax;
options formchar='|—-|+|—+=|-/\<>*';
ods rtf file='g:\test.rtf' nogtitle nogfootnote;
proc report data=unicode style(column)=[just=l];
run;
ods rtf close;

ods escapechar='~' ;
options orientation=landscape nodate nonumber noquotelenmax;
options formchar='|—-|+|—+=|-/\<>*';
ods tagsets.rtf file='g:\test.rtf' uniform nogtitle nogfootnote device=ACTXIMG;
proc report data=unicode style(column)=[just=l];
run;
ods tagsets.rtf close;

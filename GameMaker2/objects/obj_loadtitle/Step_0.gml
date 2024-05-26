/// @description Fade Text
var inc = 0.01;

if(flag_zero){
	alpha += inc;
	if(alpha>1){ alpha=1; flag_zero=false; }
}
else{
	alpha -= inc;
	if(alpha<0.3){ alpha=0.3; flag_zero=true; }
}
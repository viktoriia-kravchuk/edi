function data()
{
    var data=new Date();
	var dzien=data.getDate();
	var miesiac=data.getMonth();
	var rok=data.getFullYear();
	var godziny=data.getHours();
	var minuty=data.getMinutes();
    var sekundy=data.getSeconds();
    var x=rok+"-"+miesiac+"-"+dzien+" "+godziny+":"+minuty+":"+sekundy;
	return x;
}

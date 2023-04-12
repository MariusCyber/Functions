#!/bin/bash

# 1) Cititi de la tastatura un string si afisati-l.
# 2) Calculati si afisati suma a 2 numere.
# 3) Calculati si afisati suma elementelor unui vector
# 4) Afisati toate elementele pare dintr-un vector
# 5) Calculati media artimetica a elementelor impare dintr-un vector
# 6) Afisati frecventa de apartie a unui nr k dintr-un vector. K citit de la tastatura.
# 7) Se citeste un vector de cuvinte, sa se afiseze lungimea fiecarui cuvant
# 8) Se citeste un vector de cuvinte, sa se afiseze cel mai lung cuvant
# 9) Se citeste un vector de numare si un interval a, b. Sa se afiseze toate elementele vectorului care    					apartin intervalului (a,b).
#10) Se citese de la tastatura numele unui director, sa se creeze directorul respectiv.
#11) Se citeste de la tastatura numele unui fisier, se se stearga fisierul respectiv doar daca acesta exista. Daca fisierul nu exista sa se afiseze un mesaj de eroare.
#12) Se citeste un numar n, sa se creeze n conturi de utilizatator.
#13) Se introduce numele unui utilizator de la tastatura, sa se stearga user-ul respectiv.
#14) Se citeste de la tastatura un vector de cuvinte, se se scrie cu majuscule toate elementele.
#15) Se citeste continutul unui fisier. Sa se afiseze lunigimea celei mai lungi linii si sa se afiseze lungimea ei

function problema_1()
{
	read -p "Introduceti sirul: " K
	echo $K
}
#problema_1 

function problema_2()
{
	read -p "Introceti primul numar: " a
	read -p "Introduceti al doilea numar: " b
	let S=$a+$b
	echo "Suma este: $S"
	
}
#problema_2

function problema_3()
{
	read -p "Introduceti elementele vectorului: " vector
	suma=0
	for item in ${vector[@]}
	do
		let suma=$suma+$item
	done
	echo "Suma elementelor din vector este: $suma"
}
#problema_3

function problema_4()
{
	read -p "Introduceti elementele vectorului: " vector
	for item in ${vector[@]}
	do
		if [ $(($item%2)) -eq 0 ] 
		then 
			echo "Suma elementelor pare din vector este: $item"
		fi
	done
}
#problema_4

function problema_5()
{
	read -p "Introduceti elementele vectorului: " vector	
	suma=0
	counter=0
	for item in ${vector[@]}
	do
		if [ $(($item%2)) -eq 1 ]
		then
			let suma=$suma+$item
			let counter=$counter+1
		fi
	done
	echo $(($suma/$counter))
}

#problema_6

function problema_6()
{	
	read -p "Introduceti elementele vectorului: " vector	
	read -p "Introduceti numarul de cautat: " k
	contor=0
	for item in ${vector[@]}
	do
		if [ $k -eq $item ]
		then 
			contor=$(($contor+1))
		fi
	done	
	echo "Numarul $k apare de $contor ori"
}
#problema_7

function problema_7()
{
read -p "Introduceti elementele vectorului: " vector
	for item in ${vector[@]}
	do
		echo "Lungimea cuvantului $item este ${#item}"
	done
}
#problema_8

function problema_8()
{
	read -p "Introduceti elementele vectorului: " vector
	max=0
	cuvant=0
	for item in ${vector[@]}
	do
		if [ ${#item} -gt $max ]
		then 
			max=${#item} 
			cuvant=$item
		fi
		
	done
	echo  "Cel mai lung cuvant este $cuvant"
}
#problema_8

function problema_9
{
	read -p "Introduceti elementele vectorului: " vector
	read -p "Introduceti a: " a
	read -p "Introduceti b: " b
	for item in ${vector[@]}
	do
		if [ $item -gt $a -a $item -lt $b  ]	
		then
			echo "$item se afla in intervalul (a,b)"
		fi		
	done

}
#problema_9

function problema_10
{
	read -p "Introduceti numele directorului" director
	mkdir $director
}
#problema_10

function problema_11
{
	read -p "Introduceti fisierul care se va sterge: " fisier
	if [ -f $fisier ]
	then
		rm $fisier
	else 
		echo " Fisierul nu exista si nu poate fi sters" 
	fi
}
#problema_11

function problema_12
{
	read -p "Introduceti numarul de utilizatori " n 
	for i in $(seq 1 $n)
	do
		read -p "Introduceti numele user-ului $i: " nume
		sudo useradd $nume
	done 
}
#problema_12

function problema_13()
{
	read -p "Introduceti numele de utilizator care va fi sters " user
	sudo userdel $user
}
#problema_13

function problema_14()
{
	read -p "Introduceti cuvantul: " cuvant
	for item in ${cuvant[@]}
	do
		echo ${item^^}
	done
}
#problema_14

function problema_15()
{
	max=0
	cuvant=0
	while read line
	do
		if [ ${#line} -gt $max ]
		then
			max=${#line}
			cuvant=$line
		fi
		
	done < file.txt
	echo "Linia: $cuvant are lungimea de $max litere."
}
#problema_15

exit 0



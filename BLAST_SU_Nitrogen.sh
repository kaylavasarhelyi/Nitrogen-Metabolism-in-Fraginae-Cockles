#setting the organism undergoing the blast
ORG="Photosymbiont_Suezi.fna"
echo $ORG

#setting the first part of the file name 
NAME="Sueziense_photosymbiont_genes"
echo $NAME

#setting the location of the enzymes
NITMET="../Nit.Metab.Enzymes"
echo $NITMET

#calling all directories in nitrogen metabolism enzymes
for d in $NITMET/*
do
echo $d

#calling all enzymes in each directory
for x in $d/*
do
echo $x

#seperating the last portion of the enzyme location (specific enzyme name) to be used in file name
ENZ=$(basename "$x")
echo $ENZ

#running blast
tblastn -query $x -db $ORG -num_threads 34 -outfmt 6 -evalue 1e-10 > "$NAME"."$ENZ"."blast"

echo "tblastn -query $x -db $ORG -num_threads 34 -outfmt 6 -evalue 1e-10 > "$NAME"."$ENZ"."blast""

#ending both loops 
done
done



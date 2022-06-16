# Nitrogen-Metabolism-in-Fraginae-Cockles

 
TO DO:

Kayla

Photosynthesis table
Github readme / upload related scripts
Nitrogen graphs

Vam 

Nitrogen code and table format


### Process for determining nitrogen metabolism expression in the algal photosymbionts of marine Fraginae cockles

# Step 1
Collect nitrogen metabolism enzymes from *Cladocopium* or closely related species from the Kyoto Encyclopedia of Genes and Genomics (KEGG)

# Step 2
Blast enzymes against *Cladocopium* transcriptomes from each species of cockle to find their nucleotide sequences

Run this script https://github.com/kaylavasarhelyi/Nitrogen-Metabolism-in-Fraginae-Cockles/blob/main/BLAST_FR_Nitrogen.sh

*F. fragum*
```
#setting the organism undergoing the blast
ORG="Photosymbiont_Fragum_genes.fna"
echo $ORG

#setting the first part of the file name 
NAME="Fragum_photosymbiont_genes"
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
```

*F. whitleyi*
```
#setting the organism undergoing the blast
ORG="Photosymbiont_Whitleyi_genes.fna"
echo $ORG

#setting the first part of the file name 
NAME="Whitleyi_photosymbiont_genes"
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
```


*F. sueziense*
```
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
```

# Step 3
Input nucleotide sequences into blastx to determine significance of transcriptome alignments

# Step 4
Remove sequences not found within *Cladocopium* species or with poor alignment 

# Step 5
Identify gene expression values across *Cladocopium* species from their gene expression matrix 

Code to grep enzymes 
```
#setting the kallisto undergoing the grep
KAL="kallisto.isoform.TPM.not_cross_norm"
echo $KAL

#setting directory for the enzymes
NITMET="Enzymes"
echo $NITMET

#calling all directories in enzymes
for d in $NITMET/*
do
echo $d

#seperating the last portion of the enzyme location (specific enzyme name) to be used in file name
ENZ=$(basename "$d")
echo $ENZ

#running grep
grep -Fwf $d $KAL > "$ENZ"."TPM.Expression"

echo "grep -Fwf $d $KAL > "$ENZ"."TPM.Expression""

#ending loop 
done
```

# Step 6
Remove genes with low levels of expression



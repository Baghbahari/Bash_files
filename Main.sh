./svm-scale -l -1 -u 1 -s range4 DATA > DATA.scale

python subset.py -s 1 DATA.scale 300 Test Train


for dd in 4
do
	b=$(( 2**15 ))
	echo $b
	./svm-train -c $b -t 1 -d $dd -v 10 DATA.scale
	./svm-predict DATA.scale Train.model pred
	./svm-predict Test Train.model pred
done
#./svm-train -c $b -t 1 -d 4 -v 10 -h 0 DATA.scale
#OUTPUT=$(./svm-train -c $b -t 1 -d 4 -v 10 -h 0 DATA.scale) > /dev/null
#echo $OUTPUT

#./svm-train -v 10 DATA.scale #-c 512 -t 1 -d 4 -v 10 DATA.scale


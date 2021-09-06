echo base path is $1
cd $1
for dir in `ls .`
 do
   if [ -d $dir ]
   then
     cd $dir
     	echo build docker image $dir
	sh ../../build.sh
     cd ..
   fi
done 

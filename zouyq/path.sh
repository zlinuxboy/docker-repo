#!/bin/bash
 for dir in `ls .`
 do
   if [ -d $dir ]
   then
     echo $dir
     cd $dir
     pwd
     cd ..
   fi
done

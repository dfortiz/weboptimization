#!/bin/bash


doReplace() {
    echo "\n$2\n"

    for f in `ls $1`;
	do
		count=$(find $fullpath -type f -name "$f" | wc -l)
	  	if [ $count -gt 0 ]
	  	then
	    	size1=$(du -b $1/$f | cut -f -1)
	    	#echo  "$f found: $count  optimized size: $size1"
	    	
	    	for f1 in $(find $fullpath -name "$f"); 
	    	do
	    		#du -b $f1;
				cp -f $1/$f $f1;
				echo  "OK: $f found: $count  optimized size: $size1"
	    	done

		else
			echo "NOT FOUND: $f"
		fi

	done
}


read -p "Enter the full path to the magento root site [/var/www/magento]: " fullpath
echo -n "$fullpath\n"

if [ -z "$fullpath" ]; then
    fullpath="/var/www/magento"
fi

if [ ! -d "$fullpath" ]; then
  echo "path to directory invalid!!\nExit\n"
  exit 1
fi

doReplace 'image' '####### IMAGES ########'
doReplace 'js' '####### JS ########'
doReplace 'css' '####### CSS ########'


# Deploy wrapper for go-deploy.sh
#
if [ -f ./settings/$1 ]; then
	file=$1
else
	file="main"
fi

tag_count=$2
[ $tag_count ] || tag_count=1


./update-from-tag.sh $file $tag_count >> ./logs/$file.log 2>&1
echo "1947248"
echo "nithin"
echo "1.Write a shell program to find the number of unique words and vowels in a file along with line number. "
echo "2.Write a shell script to display the frequency of occurrence of each character present in the text document and display the character which has the maximum frequency of occurrences and store it in a separate file."
echo "3.Write a shell script to replace the string Christ University as CHRIST (Deemed to be University) in the given text document."
echo "Enter your choice"
read choice
case "$choice" in
     1) echo "Enter file name"
	read file
	vowCount=$(cat $file | grep -n -o -i "[aeiou]")
        echo "The given string has $vowCount vowels"
        awk '{for(i = 1; i <= NF; i++) {a[$i]++}} END {for(k in a) if(a[k] == 1) {print NR k,a[k]}}' $file
        ;;
     2) echo "Enter file name"
        read file
        sed 's/\(.\)/\1\n/g' $file | grep '[A-Za-z]' | sort | uniq -c > a.txt
        cat a.txt
        sed '2d' a.txt > a1.txt
        sort -nr a1.txt > a.txt
        echo "Word with maximum character"
        head -n 1 a.txt
        ;;
     3) echo "Enter the file name"
        read file
        sed 's/Christ University/Christ(Deemed to be university)/g' $file
        ;;
esac

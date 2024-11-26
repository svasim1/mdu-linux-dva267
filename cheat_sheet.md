
# Linux/Bash Cheat Sheet

## 1. Common Commands

```
ls             - List directory contents
cd <dir>       - Change directory to <dir>
pwd            - Print working directory
mkdir <dir>    - Create directory <dir>
rm <file>      - Remove file <file>
rmdir <dir>    - Remove directory <dir>
touch <file>   - Create an empty file
cp <source> <dest>  - Copy file from <source> to <dest>
mv <source> <dest>  - Move or rename file from <source> to <dest>
cat <file>     - Display contents of file
grep <pattern> <file> - Search for a pattern in a file
man <command>  - Display the manual for <command>
history        - Show command history
sudo <command> - Run <command> with superuser privileges
```

## 2. Loops

### For loop (iterate over a list or range)
```bash
for i in {1..5}; do
    echo $i
done
```

### While loop (run while a condition is true)
```bash
count=1
while [ $count -le 5 ]; do
    echo $count
    ((count++))
done
```

### Until loop (run until a condition is true)
```bash
count=1
until [ $count -gt 5 ]; do
    echo $count
    ((count++))
done
```

## 3. Pipe Commands

### Redirect output of one command to another
```bash
ls | grep "txt"    - List files and filter with grep
```

### Redirect output to a file
```bash
echo "Hello" > file.txt   - Write "Hello" to file.txt (overwrite)
echo "Hello" >> file.txt  - Append "Hello" to file.txt
```

### Combine multiple commands
```bash
ps aux | grep "bash"   - Find processes related to bash
```

### Count lines of a file
```bash
wc -l file.txt   - Count number of lines in file.txt
```

### Sort output
```bash
ls -l | sort -k 5   - Sort files by size
```

### Show top 10 largest files
```bash
du -ah . | sort -rh | head -n 10
```

## 4. Useful Tips

### Check if a file exists
```bash
if [ -f file.txt ]; then
    echo "File exists"
fi
```

### Find a file
```bash
find /path/to/search -name "filename.txt"    - Search for a file by name
```

### Run command in background
```bash
command &   - Run the command in the background
```

### Exit from a script
```bash
exit 0  - Exit with success
exit 1  - Exit with failure
```

### Change file permissions
```bash
chmod +x script.sh    - Make a script executable
```

## 5. Special Variables

```
$0 - Name of the script
$1, $2, ... - Positional parameters (arguments passed to the script)
$# - Number of arguments
$@ - All arguments as separate strings
$? - Exit status of last command
$$ - Process ID of the script
```


## 6. Regular Expressions & Text Processing

### Using `awk` for text processing
`awk` is a powerful text-processing tool used for pattern scanning and processing.

#### Example: Print the second column of a file or output
```bash
awk '{print $2}' file.txt    - Print the second column of file.txt
```

#### Example: Print lines where the first column equals "abc"
```bash
awk '$1 == "abc" {print $0}' file.txt  - Print lines where first column equals "abc"
```

#### Example: Print the first and second columns
```bash
awk '{print $1, $2}' file.txt   - Print the first and second columns
```

### Using `sed` for regular expressions (regex)

`sed` (stream editor) is a tool used for parsing and transforming text using regular expressions.

#### Example: Replace "apple" with "orange" in a string
```bash
echo "I have an apple" | sed 's/apple/orange/'   - Replace first occurrence of apple with orange
```

#### Example: Replace "apple" with "orange" globally (every occurrence)
```bash
echo "apple apple apple" | sed 's/apple/orange/g'  - Replace all occurrences of apple with orange
```

#### Example: Delete lines containing "banana"
```bash
sed '/banana/d' file.txt   - Delete lines containing the word "banana"
```

#### Example: Print only lines that match a pattern
```bash
sed -n '/pattern/p' file.txt    - Print lines containing the word "pattern"
```


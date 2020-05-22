# –split-3 separates the read into left and right ends, but if there is a left end without a matching right end, or a right end without a matching left end, they will be put in a single file.

fastq-dump --split-3 $1

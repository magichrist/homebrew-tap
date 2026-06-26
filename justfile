alias g:=generate
#Generate rb file
generate:
    python release_getter.py && git add . && git commit -m "new version" && git push
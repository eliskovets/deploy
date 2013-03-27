#Deploy scripts
======

##Diem deploy script
How to use:

1. Copy repo to your server
2. Fill settings data in main.sh file or create your own settings file.
3. Go to diem folder and run prod.sh file with next params:
```
./prod.sh $setting_file_name_without_sh_extension(def:main) $number_of_revisions_in_repo_tags_folder(def: 1)
```
4. Look at logs/$setting_file_name.log file if some errors there

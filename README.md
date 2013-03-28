#Deploy scripts
======

##Description:
Deployment application allows you easy deploy different type of application on many servers via SVN.


##How to use:

1. Copy repo to your server
2. Fill settings data in ./scripts/{project_type}/main.sh file or create your own settings file.
3. Run prod.sh file with next params:
```bash
./prod.sh {project_type} {setting_file_name_without_sh_extension}(default:"main") {number_of_revisions_in_repo_tags_folder}(default:"1")
```

4. Look at logs/{project_type}/{setting_file_name}.log file if some errors there

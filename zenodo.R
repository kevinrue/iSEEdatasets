project_dir <- getwd()
zenodo_dir <- "zenodo_upload_dir"

unlink(zenodo_dir, recursive = TRUE)

dir.create(zenodo_dir)

target_files <- c(
    "ReprocessedAllenData/ReprocessedAllenData.rds",
    "ReprocessedAllenData/ReprocessedAllenData_config_01.R",
    "ReprocessedAllenData/ReprocessedAllenData_config_02.R"
)

file.link(from = file.path(project_dir, target_files), to = file.path(zenodo_dir, basename(target_files)))

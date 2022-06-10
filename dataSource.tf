data "archive_file" "archive_data" {
  type             = var.archive_type
  source_dir       = var.archive_folder != null ? "${path.module}/${var.archive_folder}" : null
  output_path      = var.archive_folder != null ? "${path.module}/${var.archive_folder}" : null
  output_file_mode = "0666"
}
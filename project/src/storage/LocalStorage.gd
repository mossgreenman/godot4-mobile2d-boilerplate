class_name LOCAL_STORAGE

# --------------------------------------------------
# Save data
func save_data(data, file_path):
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	file.store_var(data, true)
	file.close()
# --------------------------------------------------

# --------------------------------------------------
# Load data
func load_data(file_path):
	var file = FileAccess.open(file_path, FileAccess.READ_WRITE)
	var data = file.get_var(true)
	file.close()
	return data
# --------------------------------------------------

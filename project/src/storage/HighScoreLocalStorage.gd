class_name HIGH_SCORE_LOCAL_STORAGE

# --------------------------------------------------
# Init high score
func inti_high_score():
	var local_storage = LOCAL_STORAGE.new()
	local_storage.save_data(STORAGE_CONST.HIGH_SCORE_OBJ, STORAGE_CONST.HIGH_SCORE_FILE_PATH)
# --------------------------------------------------

# --------------------------------------------------
# Save high score
func save_high_score(score):
	var local_storage = LOCAL_STORAGE.new()
	var saved_score = local_storage.load_data(STORAGE_CONST.HIGH_SCORE_FILE_PATH)
	
	if(!saved_score):
		saved_score = STORAGE_CONST.HIGH_SCORE_OBJ
	
	if(score > saved_score.high_score):
		saved_score.high_score = score
	
	local_storage.save_data(saved_score, STORAGE_CONST.HIGH_SCORE_FILE_PATH)
# --------------------------------------------------

# --------------------------------------------------
# Load high score
func load_high_score():
	var local_storage = LOCAL_STORAGE.new()
	var saved_score = local_storage.load_data(STORAGE_CONST.HIGH_SCORE_FILE_PATH)
	
	var high_score = 0
	if(saved_score):
		high_score = saved_score.high_score
	
	return high_score
# --------------------------------------------------

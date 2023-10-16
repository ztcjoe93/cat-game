extends Node

var rng = RandomNumberGenerator.new()
var cat_list: Array[String] = [
	"napolean", "munchkin", "tabby",
	"calico", "sphynx", "siamese",
	"british_shorthair", "maine_coon", "bobtail",
	"bengal"
]

var cat_map: Dictionary = {
	"napolean": {
		"path": "res://assets/cat_0.png",
		"asset": null,
		"index": 0,
		"level": 1,
	},
	"munchkin": {
		"path": "res://assets/cat_1.png",
		"asset": null,
		"index": 1,
		"level": 1,
	},
	"tabby": {
		"path": "res://assets/cat_2.png",
		"asset": null,
		"index": 2,
		"level": 2,
	},
	"calico": {
		"path": "res://assets/cat_3.png",
		"asset": null,
		"index": 3,
		"level": 3,
	},
	"sphynx": {
		"path": "res://assets/cat_4.png",
		"asset": null,
		"index": 4,
		"level": 4,
	},
	"siamese": {
		"path": "res://assets/cat_5.png",
		"asset": null,
		"index": 5,
		"level": 5,
	},
	"british_shorthair": {
		"path": "res://assets/cat_6.png",
		"asset": null,
		"index": 6,
		"level": 6,
	},
	"maine_coon": {
		"path": "res://assets/cat_7.png",
		"asset": null,
		"index": 7,
		"level": 6,
	},
	"bobtail": {
		"path": "res://assets/cat_8.png",
		"asset": null,
		"index": 8,
		"level": 6,
	},
	"bengal": {
		"path": "res://assets/cat_9.png",
		"asset": null,
		"index": 9,
		"level": 6,
	}
}

# an array of probabilities for each type depending on the current level
var probability_chart: Array[Array] = [
	[0.9, 0.1],
	[0.85, 0.1, 0.05],
	[0.75, 0.1, 0.1, 0.05],
	[0.7, 0.1, 0.1, 0.05, 0.05],
	[0.55, 0.15, 0.1, 0.1, 0.05, 0.05],
	[0.5, 0.15, 0.15, 0.1, 0.05, 0.05]	
]

# generates a blob based off level + probabililty chart distribution
func generate_blob(level: int) -> String:
	var probabilities: Array = probability_chart[level-1]
	rng.randomize()
	
	var roll: float = rng.randf()
	print("rolled %s" % roll)
	
	for i in range(probabilities.size() - 1):
		if i == 0:
			if roll <= probabilities[i]:
				return cat_list[i]
		else:
			if roll > probabilities[i-1] and roll <= probabilities[i+1]:
				return cat_list[i]
	
	return cat_list[probabilities.size()-1]

func preload_catmap() -> void:
	for cat in cat_map:
		cat_map[cat]["asset"] = load(cat_map[cat]["path"])

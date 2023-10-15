extends Node

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
		"index": 0
	},
	"munchkin": {
		"path": "res://assets/cat_1.png",
		"asset": null,
		"index": 1
	},
	"tabby": {
		"path": "res://assets/cat_2.png",
		"asset": null,
		"index": 2
	},
	"calico": {
		"path": "res://assets/cat_3.png",
		"asset": null,
		"index": 3
	},
	"sphynx": {
		"path": "res://assets/cat_4.png",
		"asset": null,
		"index": 4
	},
	"siamese": {
		"path": "res://assets/cat_5.png",
		"asset": null,
		"index": 5
	},
	"british_shorthair": {
		"path": "res://assets/cat_6.png",
		"asset": null,
		"index": 6
	},
	"maine_coon": {
		"path": "res://assets/cat_7.png",
		"asset": null,
		"index": 7
	},
	"bobtail": {
		"path": "res://assets/cat_8.png",
		"asset": null,
		"index": 8
	},
	"bengal": {
		"path": "res://assets/cat_9.png",
		"asset": null,
		"index": 9
	}
}

func preload_catmap() -> void:
	for cat in cat_map:
		cat_map[cat]["asset"] = load(cat_map[cat]["path"])

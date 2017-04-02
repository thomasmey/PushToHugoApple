import Foundation

func createBlogPost(title: String, url: String, date: Date, extras: [String:String]) -> String {

	var bp = "---\n" +
		"title: \(title)\n" +
		"type: post\n" +
		"date: \(date)\n"

	for (k,v) in extras {
		bp += "\(k): \(v)\n"
	}
	bp += "\n---\n" +
	"<\(url)>\n"
	return bp
}



import Foundation

func createBlogPost(title: String, url: String, date: Date, extras: [String:String]) -> String {

	let bp = "---\n" +
		"title: \(title)\n" +
		"type: post\n" +
		"date: \(date)\n" +
//		for(Map.Entry<String, String> e : extras.entrySet()) {
//			sb.append(e.getKey()).append(": ").append(e.getValue()).append("\n");
//		}
//		sb.append("\n")
		"---\n" +
		"<\(url)>"
	return bp
}



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

func createRepoAndAddPost(title: String, link: String, extras: [String:String]) {

	let currentDate = Date()
	let repoUrl = URL(string: getRemoteUrl())

	let blogPost = [UInt8] (createBlogPost(title: title, url: link, date: currentDate, extras: extras).utf8)
	
	let (gitBlobObjectId, gitBlobData) = gitCreateObject(type: "blob", data: blogPost);

}

func getRemoteUrl() -> String {

	return "GET http://server/simplegit-progit.git/info/refs?service=git-receive-pack";
}

/* creates an git object,
 * see https://www.kernel.org/pub/software/scm/git/docs/user-manual.html#object-details
 */
func gitCreateObject(type: String, data: [UInt8]) -> ([UInt8], [UInt8]) {

	let objectWithHeader = gitObjectAddHeader(type: type, data: data)
	let objectId = determineObjectId(data: objectWithHeader);

	// compress data
	let compressedObject = compressObject(data: objectWithHeader)
	return (objectId, compressedObject)
}

func determineObjectId(data: [UInt8]) -> [UInt8] {
	// returns the SHA-1 digest of the input data
	let sha1 = [UInt8] (repeating: 0, count:12)
	return sha1
}

func gitObjectAddHeader(type: String, data: [UInt8]) -> [UInt8] {
	let header = "\(type) \(data.count)\0"

	// insert headerbefore data
	return [UInt8](header.utf8) + data
}

func compressObject(data: [UInt8]) -> [UInt8] {
	return data;
}


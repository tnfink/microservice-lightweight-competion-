import Kitura

let router = Router()
router.get("/add/:summand1/and/:summand2") { request, response, next in
    if let summand1 = Int(request.parameters["summand1"] ?? "0") {
        if let summand2 = Int(request.parameters["summand2"] ?? "0") {
            response.status(.OK).send("The sum of \(summand1) and \(summand2) equals \(summand1 + summand2).\n")
            next()
            return
        }
    }
    response.status(.badRequest).send("ERROR: Cannot calculate with non integer values.\n")
    next()
}

Kitura.addHTTPServer(onPort: 8080, with: router)
Kitura.run()

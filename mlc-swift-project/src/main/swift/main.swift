import Kitura

let router = Router()
router.get("/adder") { request, response, next in
    if let summand1Str = request.queryParameters["summand1"],
       let summand1 = Float(summand1Str),
       let summand2Str = request.queryParameters["summand2"],
       let summand2 = Float(summand2Str) {
            let result = summand1 + summand2
            response.status(.OK).send("\(result)")
    } else {
       response.status(.badRequest).send("ERROR")
    }
    next()
}

Kitura.addHTTPServer(onPort: 8080, with: router)
print("Microservice is starting..")
Kitura.run()


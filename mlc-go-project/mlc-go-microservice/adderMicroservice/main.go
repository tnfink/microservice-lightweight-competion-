package main

import (
	"io"
	"net/http"
	"strconv"
	"fmt"
)

func handler(w http.ResponseWriter, r *http.Request) {
	summand1, err1 := strconv.ParseFloat(r.URL.Query().Get("summand1"), 64)

	if err1 != nil {
		w.WriteHeader(http.StatusBadRequest)
		io.WriteString(w, "summand1 not a float")
		return
	}

	summand2, err2 := strconv.ParseFloat(r.URL.Query().Get("summand2"), 64)

	if err2 != nil {
		w.WriteHeader(http.StatusBadRequest)
		io.WriteString(w, "summand2 not a float")
		return
	}

	sum := summand1 + summand2

	io.WriteString(w, strconv.FormatFloat(sum, 'f', -1, 64))
}

func main() {
	http.HandleFunc("/adder", handler)
	fmt.Print("Starting up")
	http.ListenAndServe(":8080", nil)
}
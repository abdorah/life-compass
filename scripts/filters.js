#!/usr/bin/env node

// Pandoc filter to convert all text to uppercase

var pandoc = require("pandoc-filter");
var Str = pandoc.Str;

function action({ t: type, c: value }, format, meta) {
	if (type === "Str") return Str(value.toUpperCase());
}

pandoc.stdio(action);

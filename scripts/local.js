var index = Math.floor(Math.random() * quotes.length)
document.getElementById("quote").innerHTML = (quotes[index].quote);
document.getElementById("source").innerHTML = "-- " + (quotes[index].source);

$(document).foundation()
$(".image").each(function() {
    $(tis).attr("rel","lightbox[group]");
});
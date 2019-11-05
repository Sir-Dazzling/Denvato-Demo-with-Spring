
//To prevent user from using back button
$(document).ready(function() {
function disableBack() { window.history.forward() }

window.onload = disableBack();
window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
});
/* http://learningprogramming.net/java/spring-mvc/build-shopping-cart-in-spring-mvc/*/
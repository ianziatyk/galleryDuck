function getFilm () {
    //Get all Cakes
	var film_one = document.querySelectorAll('#priceBox')

	//Loop through cakes Nodelist and Add event Listeners
	for(let i = 0; i < film_one.length; i++) {
		film_one[i].addEventListener('click', () => {
			fetch('http://localhost:4567/update/films')
			
		
			
		})
	}
}

function getCamera () {
    //Get all Cakes
	var camera_one = document.querySelectorAll('#priceBox')

	//Loop through cakes Nodelist and Add event Listeners
	for(let i = 0; i < camera_one.length; i++) {
		camera_one[i].addEventListener('click', () => {
			fetch('http://localhost:4567/update/cameras')
			
		
			
		})
	}
}
	
	function getLens () {
		//Get all Cakes
		var camera_one = document.querySelectorAll('#priceBox')
	
		//Loop through cakes Nodelist and Add event Listeners
		for(let i = 0; i < camera_one.length; i++) {
			camera_one[i].addEventListener('click', () => {
				fetch('http://localhost:4567/update/lenses')
				
			
				
			})
		}
	}
	



// var box = document.getElementById("box");

// box.addEventListener("click", function(){
// box.style.borderRadius = "50%"
// box.style.width = "150px"
// box.style.height = "150px"
// box.style.backgroundColor = "salmon"
// })



// var slideIndex = 1;
// showSlides(slideIndex);

// // Next/previous controls
// function plusSlides(n) {
//   showSlides(slideIndex += n);
// }

// // Thumbnail image controls
// function currentSlide(n) {
//   showSlides(slideIndex = n);
// }

// function showSlides(n) {
//   var i;
//   var slides = document.getElementsByClassName("mySlides");
//   var dots = document.getElementsByClassName("dot");
//   if (n > slides.length) {slideIndex = 1} 
//   if (n < 1) {slideIndex = slides.length}
//   for (i = 0; i < slides.length; i++) {
//       slides[i].style.display = "none"; 
//   }
//   for (i = 0; i < dots.length; i++) {
//       dots[i].className = dots[i].className.replace(" active", "");
//   }
//   slides[slideIndex-1].style.display = "block"; 
//   dots[slideIndex-1].className += " active";
// }

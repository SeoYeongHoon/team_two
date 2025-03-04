/**
 * request.js
 */

function showImage() {
	var newImage = document.getElementById('image-show').lastElementChild;
	newImage.style.visibility = "visible";
	
	document.getElementById('image-upload').style.visibility = 'hidden';

	document.getElementById('fileName').textContent = null;     //기존 파일 이름 지우기
}


function loadFile(input) {
	var file = input.files[0];

	var name = document.getElementById('fileName');
	name.textContent = file.name;

	var newImage = document.createElement("img");
	newImage.setAttribute("class", 'img');

	newImage.src = URL.createObjectURL(file);

	newImage.style.width = "70%";
	newImage.style.height = "70%";
	newImage.style.objectFit = "contain";

	var container = document.getElementById('image-show');
	container.appendChild(newImage);
};

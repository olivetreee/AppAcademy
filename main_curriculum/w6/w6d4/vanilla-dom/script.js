document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  const addFavPlace = (e) => {
    e.preventDefault();

    const list = document.getElementById("sf-places");
    const newPlace = document.querySelectorAll(".favorite-input")[0].value;
    const listItem = document.createElement("li");
    listItem.textContent = newPlace;
    list.appendChild(listItem);

    document.querySelectorAll(".favorite-input")[0].value = "";
  }

  document.querySelectorAll(".favorite-submit")[0].addEventListener("click", addFavPlace);





  // adding new photos

  const submitPhoto = (e) => {
    e.preventDefault();
    console.log(e);

    const newImageUrl = document.querySelectorAll(".photo-url-input")[0].value;
    let newImageTag = document.createElement("img");
    newImageTag.src = newImageUrl;

    let listItem = document.createElement("li");
    listItem.appendChild(newImageTag);
    let list = document.querySelectorAll(".dog-photos")[0];
    list.appendChild(listItem);

    document.querySelectorAll(".photo-url-input")[0].value = "";
  }

  const showForm = (e) => {
    e.preventDefault();

    let form = document.querySelectorAll(".photo-form-container")[0];
    form.className = "";
    form.className = "photo-form-container";

    let submitPhotoBtn = document.querySelectorAll(".photo-url-submit")[0];
    submitPhotoBtn.addEventListener("click", submitPhoto);
  }

  document.querySelectorAll(".photo-show-button")[0].addEventListener("click", showForm);
  // --- your code here!



});

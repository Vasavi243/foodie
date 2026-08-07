<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>Create Restaurant</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{

    background:#f4f6fb;

}


/*==============================
        PAGE
===============================*/

.page{

    display:flex;
    justify-content:center;
    align-items:center;

    padding:45px;

}


/*==============================
        CARD
===============================*/

.card{

    width:900px;

    background:#fff;

    border-radius:20px;

    overflow:hidden;

    box-shadow:0 12px 35px rgba(0,0,0,.10);

}


/*==============================
        HEADER
===============================*/

.card-header{

    background:linear-gradient(135deg,#ff7a3d,#ff5b29);

    color:#fff;

    text-align:center;

    padding:35px;

}

.card-header i{

    font-size:48px;

    margin-bottom:15px;

}

.card-header h1{

    font-size:34px;

    font-weight:700;

}

.card-header p{

    margin-top:10px;

    opacity:.95;

    font-size:15px;

}


/*==============================
        BODY
===============================*/

.card-body{

    padding:40px;

}


/*==============================
        GRID
===============================*/

.form-grid{

    display:grid;

    grid-template-columns:1fr 1fr;

    gap:25px;

}


/*==============================
        INPUT GROUP
===============================*/

.input-group{

    display:flex;

    flex-direction:column;

}

.input-group label{

    font-weight:600;

    margin-bottom:8px;

    color:#444;

}

.input-box{

    position:relative;

}

.input-box i{

    position:absolute;

    left:16px;

    top:50%;

    transform:translateY(-50%);

    color:#ff6b35;

}

.input-box input{

    width:100%;

    height:48px;

    padding-left:48px;

    border:1px solid #ddd;

    border-radius:12px;

    outline:none;

    font-size:15px;

    transition:.3s;

}

.input-box input:focus{

    border-color:#ff6b35;

    box-shadow:0 0 8px rgba(255,107,53,.25);

}


/*==============================
        ADDRESS
===============================*/

.full{

    grid-column:1/3;

}

textarea{

    width:100%;

    height:100px;

    resize:none;

    border:1px solid #ddd;

    border-radius:12px;

    padding:15px;

    font-size:15px;

    outline:none;

    transition:.3s;

}

textarea:focus{

    border-color:#ff6b35;

    box-shadow:0 0 8px rgba(255,107,53,.25);

}


/*==============================
        IMAGE PREVIEW
===============================*/

.preview{

    grid-column:1/3;

    text-align:center;

}

.preview img{

    width:180px;

    height:180px;

    object-fit:cover;

    border-radius:18px;

    border:3px dashed #ff6b35;

    padding:8px;

    display:none;

}


/*==============================
        BUTTON
===============================*/

.btn-area{

    grid-column:1/3;

    text-align:center;

    margin-top:10px;

}

.btn{

    border:none;

    background:#ff6b35;

    color:#fff;

    font-size:17px;

    padding:14px 45px;

    border-radius:30px;

    cursor:pointer;

    transition:.3s;

    font-weight:600;

}

.btn:hover{

    transform:translateY(-3px);

    background:#f55a20;

    box-shadow:0 8px 18px rgba(255,107,53,.35);

}


/*==============================
      RESPONSIVE
===============================*/

@media(max-width:900px){

.card{

width:100%;

}

.form-grid{

grid-template-columns:1fr;

}

.full,
.preview,
.btn-area{

grid-column:1;

}

}

</style>

</head>

<body>

<div class="page">

<div class="card">

<div class="card-header">

<i class="fa-solid fa-store"></i>

<h1>Create Restaurant</h1>

<p>Add your restaurant details to start serving customers.</p>

</div>

<div class="card-body">

<form action="<%=request.getContextPath()%>/createRestuarant"
      method="post">
      
<div class="form-grid">

<!-- Restaurant Name -->

<div class="input-group">

    <label>Restaurant Name</label>

    <div class="input-box">

        <i class="fa-solid fa-store"></i>

        <input
            type="text"
            name="restaurantName"
            placeholder="Enter Restaurant Name"
            required>

    </div>

</div>

<!-- Cuisine -->

<div class="input-group">

    <label>Cuisine</label>

    <div class="input-box">

        <i class="fa-solid fa-utensils"></i>

        <input
            type="text"
            name="cuisine"
            placeholder="Eg. Biryani, Chinese"
            required>

    </div>

</div>

<!-- Delivery Time -->

<div class="input-group">

    <label>Delivery Time</label>

    <div class="input-box">

        <i class="fa-solid fa-clock"></i>

        <input
            type="text"
            name="deliveryTime"
            placeholder="30 - 40 mins"
            required>

    </div>

</div>

<!-- Image Path -->

<div class="input-group">

    <label>Image Path</label>

    <div class="input-box">

        <i class="fa-solid fa-image"></i>

        <input
            type="text"
            id="imagePath"
            name="imagePath"
            placeholder="images/paradise.jpg"
            onkeyup="previewImage()"
            required>

    </div>

</div>

<!-- Address -->

<div class="input-group full">

    <label>Restaurant Address</label>

    <textarea
        name="address"
        placeholder="Enter Complete Address"
        required></textarea>

</div>

<!-- Image Preview -->

<div class="preview">

    <img
        id="preview"
        src=""
        alt="Restaurant Preview">

</div>

<!-- Button -->

<div class="btn-area">

    <button class="btn" type="submit">

        <i class="fa-solid fa-plus"></i>

        Create Restaurant

    </button>

</div>

</div>

</form>

</div>

</div>

</div>

<script>

function previewImage(){

    let path = document.getElementById("imagePath").value;

    let img = document.getElementById("preview");

    if(path.trim()!=""){

        img.src = path;
        img.style.display = "inline-block";

    }
    else{

        img.style.display = "none";

    }

}

</script>

</body>

</html>
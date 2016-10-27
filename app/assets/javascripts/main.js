$(document).on('turbolinks:load', function(){
   var preview = $(".upload-preview img")

    $(".cloudinary-fileupload").change(function(event){

        var f = this.files[0]

        if (f.size > 3388608 || f.fileSize > 3388608)
        {
           alert("Max file size 3 MB")
           this.value = null;
           return
        }

       var input = $(event.currentTarget);
       var file = input[0].files[0];
       var reader = new FileReader();
       reader.onload = function(e){
           image_base64 = e.target.result;
           preview.attr("src", image_base64);
       };
       reader.readAsDataURL(file);
    });
});

$(function(){
  
  $(document).on("click", "#add-more-photos", function(){
    
    var html      = "<p class='photo-field'>";
    var container = $(this).prev("p.photo-field");
    var number    = $.now();

    html += container.html();
    html  = html.replace(/_\d+_/g,  "_" + number + "_" );
    html  = html.replace(/\[\d+\]/g,  "[" + number + "]" );
    html += "</p>";

    container.after(html);

    $("#folder_photos_attributes_" + number + "_pic").val("");
    $("#folder_photos_attributes_" + number + "_tag_names").val("");

    return false;

  });
});
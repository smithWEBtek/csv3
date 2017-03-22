// examples for response of HTML

// ---------1st draft ------ajax low level -------------------------
// $(document).ready(function(){
// ....or this....
// $(function(){
//   $("a.load_contacts").on("click", function(e){
//     // ... to show this jquery function hijacking the contacts link
//     // alert("Call me, we have a job for you!!");
//     // using ajax 'GET' request 
//     // using ajax example from http://api.jquery.com/jquery.ajax/
//     // get a response
//     $.ajax({
//       method: "GET",
//       url: this.href
//     }).done(function(response){
//     // load that responese into the HTML of the page. 
//     // document.getElementById("ajax-contacts").innerHTML = response;
//     // ...or...

//       $("div#ajax-contacts").html(response);
//     }).error(function(){
//       alert("we broke!!!");
//     });
//     e.preventDefault();
//   });
// });

// refactor at 37:15
// https://www.youtube.com/watch?v=E8TJmwW5ayQ
// ---------------------------------------------------------------

// ---------2nd draft ------ajax higher level ----shorthand method ----------------
    // http://api.jquery.com/jQuery.get/
 
// $(function(){
//   $("a.load_contacts").on("click", function(e){
//     $.get(this.href).success(function(response){
//       $("div#ajax-contacts").html(response);
//     }).error(function(){
//       alert("we broke!!!");
//     });
//     e.preventDefault();
//   });
// }); 
// ---------------------------------------------------------------
// json example follows, ends at 49:30
// summary at 50:39
// ----------------------------------------
// Server side AJAX model 52:47
// to 1:10
// -----------------------------------
// remote: true
// pattern 






















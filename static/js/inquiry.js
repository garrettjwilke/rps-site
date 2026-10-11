(function () {
  var email = document.currentScript.dataset.email;
  var form = document.getElementById("inquiry-form");
  form.addEventListener("submit", function (event) {
    event.preventDefault();
    if (!this.reportValidity()) return;
    var data = new FormData(this);
    var body = [
      "Name: " + data.get("name"),
      "Email: " + data.get("email"),
      "Phone: " + (data.get("phone") || "Not provided"),
      "Service: " + data.get("service"),
      "Location: " + data.get("location"),
      "Date / deadline: " + (data.get("deadline") || "Not specified"),
      "",
      "Message:",
      data.get("message")
    ].join("\n");
    var subject = "Service request: " + data.get("service");
    window.location.href = "mailto:" + email + "?subject=" + encodeURIComponent(subject) + "&body=" + encodeURIComponent(body);
    document.getElementById("form-status").textContent = "Your email app has been requested. Review and send the email there to deliver your inquiry to RPS. Your request has not been submitted by this website.";
  });
})();

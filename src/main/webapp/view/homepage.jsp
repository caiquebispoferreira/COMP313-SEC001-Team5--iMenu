<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>
@mixin coverer {
  width: 100vw;
  height: 100vh;
  position: absolute;
  top: 0;
  left: 0;
}

.video-header {
  position: absolute;
  text-align: center;
  width: 100vw;
  height: 100vh;
  &, video, .viewport-header {
    @include coverer;
  }
  video {
    background: brown;
    object-fit: cover;
  }
  .viewport-header {
    display: flex;
    align-items: center;
    justify-content: center;
  }
}

html, body {
  height: 100%;
  overflow-x: hidden;
}
html {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
  font-size: 150%;
  line-height: 1.4;
}
body {
  margin: 0;
}



h1 {
  font-family: 'Syncopate', sans-serif;
  color: white;
  text-transform: uppercase;
  letter-spacing: 3vw;
  line-height: 1.2;
  font-size: 3vw;
  text-align: center;
  span {
    display: block;
    font-size: 10vw;
    letter-spacing: -0.6rem;
  }
}

</style>

<header class="video-header">
  <video src="${contextPath}/resources/video/homevideo.mp4" autoplay loop playsinline muted></video>
  <div class="viewport-header">
    <h1>
      Explore
      <span>iMenu</span>
    </h1>
  </div>
</header>

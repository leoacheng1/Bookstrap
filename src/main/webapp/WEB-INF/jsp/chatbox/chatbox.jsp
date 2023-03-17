<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
        <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

        <!DOCTYPE html>
        <html>

        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">

            <link rel="stylesheet" href="${contextRoot}/css/chatbox.css" />
            <link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />

            <link rel="preconnect" href="https://fonts.googleapis.com" />
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
            <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet" />


            <link rel="preconnect" href="https://fonts.googleapis.com" />
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
            <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@500&display=swap" rel="stylesheet" />

            <link rel="preconnect" href="https://fonts.googleapis.com" />
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
            <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@600&display=swap" rel="stylesheet" />
            <style>
                .top_search_table {
                    padding-left: 50px;
                }

                .searchBar {
                    padding-left: 500px;
                }

                .w-10 {
                    width: 10%;
                }

                .ms-45 {
                    margin-left: 30px;
                }

                .logoFont {
                    font-family: 'Roboto', sans-serif;
                }

                .nav-link {
                    position: relative;
                }

                .nav-link::after {
                    content: '';
                    opacity: 0;
                    transition: all 0.3s;
                    height: 3px;
                    width: 100%;
                    background-color: black;
                    position: absolute;
                    bottom: 0;
                    left: 0;
                }

                .nav-link:hover::after {
                    content: '';
                    opacity: 1;
                }

                .slick-prev:before {
                    color: black;
                }

                .slick-next::before {
                    color: black;
                }

                body {
                    font-family: 'Noto Sans TC', sans-serif;
                }

                .icon-text {
                    text-decoration: none;
                    color: black;
                }

                .icon-text:hover {
                    color: black;
                }

                .slider-title-en {
                    font-family: 'Roboto Slab', serif;
                }

                .bg-custom {
                    background-color: #5ea0cc;
                }
            </style>
        </head>

        <body>
            <noscript>
                <h2>Sorry! Your browser doesn't support Javascript</h2>
            </noscript>
            <jsp:include page="../layout/header.jsp"></jsp:include>


            <div id="chat-page">
                <div class="chat-container">
                    <div class="chat-header">
                        <h2>${sessionScope.memberName} Chat Box</h2>
                    </div>
     
                    <ul id="messageArea">

                    </ul>
                    <form id="messageForm" name="messageForm" nameForm="messageForm">
                        <div class="form-group">
                            <div class="input-group clearfix">
                                <input type="text" id="message" placeholder="Type a message..." autocomplete="off"
                                    class="form-control" />
                                <button type="submit" class="primary">Send</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>





            <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
            <script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
            <script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
            <script>'use strict';

                var usernamePage = document.querySelector('#username-page');
                var chatPage = document.querySelector('#chat-page');
                var usernameForm = document.querySelector('#usernameForm');
                var messageForm = document.querySelector('#messageForm');
                var messageInput = document.querySelector('#message');
                var messageArea = document.querySelector('#messageArea');
                var connectingElement = document.querySelector('.connecting');

                var stompClient = null;
                var username = "`${sessionScope.memberName}`";
                username=username.slice(1, -1);
                var colors = [
                    '#2196F3', '#32c787', '#00BCD4', '#ff5652',
                    '#ffc107', '#ff85af', '#FF9800', '#39bbb0'
                ];



                messageForm.addEventListener('submit', send, true)


             



                var socket = new SockJS('${contextRoot}/javatechie');
                stompClient = Stomp.over(socket);

                stompClient.connect({}, onConnected1, onError);

                function onConnected1() {

                    var Username = {
                        username: username
                    };
                    stompClient.send("/app/chat.username", {}, JSON.stringify(Username));
                    // stompClient.subscribe("/topic/public/"+username, onMessageReceived);
                    stompClient.subscribe("/topic/public/"+username, onMessageReceived);
            
                }

                


                function onError(error) {
                    connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
                    connectingElement.style.color = 'red';
                }


                function send(event) {
                    var messageContent = messageInput.value.trim();

                    if (messageContent && stompClient) {
                        var chatMessage = {
                            sender: username,
                            content: messageInput.value,
                            type: 'CHAT'
                        };

                        stompClient.send("/app/chat/"+username, {}, JSON.stringify(chatMessage));
                        messageInput.value = '';
                    }
                    event.preventDefault();
                }


                function onMessageReceived(payload) {
                    var message = JSON.parse(payload.body);

                    var messageElement = document.createElement('li');

                    if (message.type === 'JOIN') {
                        messageElement.classList.add('event-message');
                        message.content = message.sender + ' joined!';
                    } else if (message.type === 'LEAVE') {
                        messageElement.classList.add('event-message');
                        message.content = message.sender + ' left!';
                    } else {
                        messageElement.classList.add('chat-message');

                        var avatarElement = document.createElement('i');
                        var avatarText = document.createTextNode(message.sender[0]);
                        avatarElement.appendChild(avatarText);
                        avatarElement.style['background-color'] = getAvatarColor(message.sender);

                        messageElement.appendChild(avatarElement);

                        var usernameElement = document.createElement('span');
                        var usernameText = document.createTextNode(message.sender);
                        usernameElement.appendChild(usernameText);
                        messageElement.appendChild(usernameElement);
                    }

                    var textElement = document.createElement('p');
                    var messageText = document.createTextNode(message.content);
                    textElement.appendChild(messageText);

                    messageElement.appendChild(textElement);

                    messageArea.appendChild(messageElement);
                    messageArea.scrollTop = messageArea.scrollHeight;
                }


                function getAvatarColor(messageSender) {
                    var hash = 0;
                    for (var i = 0; i < messageSender.length; i++) {
                        hash = 31 * hash + messageSender.charCodeAt(i);
                    }

                    var index = Math.abs(hash % colors.length);
                    return colors[index];
                }

            </script>
        </body>

        </html>
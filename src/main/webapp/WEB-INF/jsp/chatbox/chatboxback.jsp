<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
        <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

        <!DOCTYPE html>
        <html>

        <head>
            <link rel="stylesheet" href="${contextRoot}/css/chatbox.css" />

            <style>
                .msggroup {
                    position: absolute;

                    text-align: left;
                    padding-left: 20px;
                    margin-top: 25px;
                    width: 16%;
                    max-height: 60%;
                    overflow: scroll;

                }

                #chat-page {
                    position: relative;
                    height: 100%;
                }
            </style>
        </head>

        <body
            class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse">
            <div class="wrapper">
                <%@ include file="/WEB-INF/jsp/backend/layout/css.jsp" %>
                    <!--上面導覽列 -->
                    <%@ include file="/WEB-INF/jsp/backend/layout/nav.jsp" %>
                        <!-- 左邊導覽列 -->
                        <%@ include file="/WEB-INF/jsp/backend/layout/sidebar/adminsidebar.jsp" %>
                            <div class="content-wrapper">
                                <div class="content-header">

                                </div>
                                <section class="content">
                                    <h2>客服中心</h2>
                                    <br>
                                    <br>
                                    <h2>客戶訊息</h2>
                                    <div id="msggroup" class="msggroup">


                                    </div>
                                    <div id="chat-page">


                                    </div>



                                </section>
                                
                            </div>
            </div>
            <!--右側彈跳式功能列 -->
            <%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp" %>
                <!--版型需要的js-->
                <%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
        </body>







        <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
        <script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
        <script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
        <script>'use strict';



            var connectingElement = document.querySelector('.connecting');

            var stompClient = null;


            var sender = "admin";
            var colors = [
                '#2196F3', '#32c787', '#00BCD4', '#ff5652',
                '#ffc107', '#ff85af', '#FF9800', '#39bbb0'
            ];



            var socket = new SockJS('${contextRoot}/javatechie');
            stompClient = Stomp.over(socket);

            stompClient.connect({}, onConnected1, onError);



            function onConnected1() {
                // Subscribe to the Public Topic
                stompClient.subscribe('/topic/username', getUsername);
            }
            function getUsername(payload) {
                var message = JSON.parse(payload.body);
                let username = message.username;
                console.log("username:  " + username)
                stompClient.subscribe("/topic/public/" + username, onMessageReceived);

                if (document.querySelector("#" + username)) {
                    console.log("元素已存在，不需要創建。");
                }
                else {
                    // 創建新的 <a> 元素
                    var linkElement = document.createElement("a");
                    linkElement.href = "#";
                    linkElement.id = username;
                    linkElement.className = "list-group-item list-group-item-action";
                    linkElement.textContent = username;
                    linkElement.style = "background-color: #C4E1FF";

                    // 添加新的 <a> 元素到 #msggroup 中
                    var msggroup = document.querySelector("#msggroup");
                    msggroup.appendChild(linkElement);

                    document.querySelector("#" + username).addEventListener('click', function (e) {

                        console.log(username)
                        linkElement.style.backgroundColor = "";

                        var chatPage = document.querySelector('#chat-page');
                        chatPage.innerHTML = ""

                        let str = `<div class="chat-container "">
                                <div class="chat-header">
                                    <h2>`+ username + ` Chat Box</h2>
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
                            </div>`


                        chatPage.innerHTML = str


                        var messageInput = document.querySelector('#message');
                        var messageArea = document.querySelector('#messageArea');
                        var messageForm = document.querySelector('#messageForm');
                        var messageInput = document.querySelector('#message');

                        messageForm.addEventListener('submit', function (e) {
                            e.preventDefault();
                            send(messageInput, username);
                        })

                    })
                }



            }
            function onError(error) {
                connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
                connectingElement.style.color = 'red';
            }


            function send(messageInput, username) {
                var messageContent = messageInput.value.trim();

                if (messageContent && stompClient) {
                    var chatMessage = {
                        sender: sender,
                        content: messageInput.value,
                        type: 'CHAT'
                    };

                    stompClient.send("/app/chat/" + username, {}, JSON.stringify(chatMessage));
                    messageInput.value = '';
                }

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
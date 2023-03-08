<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
        <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
        <!DOCTYPE html>
        <!DOCTYPE html>
        <!-- Created By CodingNepal -->
        <html lang="en" dir="ltr">

        <head>
            <meta charset="utf-8">
            <title>Responsive Chat Box Design | CodingNepal</title>
            <link rel="stylesheet" href="style.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <style>
                @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');

                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                    font-family: 'Poppins', sans-serif;
                }

                body {
                    overflow: hidden;
                    background: #f2f2f2;
                }

                #click {
                    display: none;
                }

                label {
                    position: absolute;
                    right: 30px;
                    bottom: 20px;
                    height: 55px;
                    width: 55px;
                    background: -webkit-linear-gradient(left, #a445b2, #fa4299);
                    text-align: center;
                    line-height: 55px;
                    border-radius: 50px;
                    font-size: 30px;
                    color: #fff;
                    cursor: pointer;
                }

                label i {
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    transition: all 0.4s ease;
                }

                label i.fas {
                    opacity: 0;
                    pointer-events: none;
                }

                #click:checked~label i.fas {
                    opacity: 1;
                    pointer-events: auto;
                    transform: translate(-50%, -50%) rotate(180deg);
                }

                #click:checked~label i.fab {
                    opacity: 0;
                    pointer-events: none;
                    transform: translate(-50%, -50%) rotate(180deg);
                }

                .wrapper {
                    position: absolute;
                    right: 30px;
                    bottom: 0px;
                    max-width: 400px;
                    background: #fff;
                    border-radius: 15px;
                    box-shadow: 0px 15px 20px rgba(0, 0, 0, 0.1);
                    opacity: 0;
                    pointer-events: none;
                    transition: all 0.6s cubic-bezier(0.68, -0.55, 0.265, 1.55);
                }

                #click:checked~.wrapper {
                    opacity: 1;
                    bottom: 85px;
                    pointer-events: auto;
                }

                .wrapper .head-text {
                    line-height: 60px;
                    color: #fff;
                    border-radius: 15px 15px 0 0;
                    padding: 0 20px;
                    font-weight: 500;
                    font-size: 20px;
                    background: -webkit-linear-gradient(left, #a445b2, #fa4299);
                }

                .wrapper .chat-box {
                    padding: 20px;
                    width: 100%;
                }

                .chat-box .desc-text {
                    color: #515365;
                    text-align: center;
                    line-height: 25px;
                    font-size: 17px;
                    font-weight: 500;
                }

                .chat-box form {
                    padding: 10px 15px;
                    margin: 20px 0;
                    border-radius: 25px;
                    border: 1px solid lightgrey;
                }

                .chat-box form .field {
                    height: 50px;
                    width: 100%;
                    margin-top: 20px;
                }

                .chat-box form .field:last-child {
                    margin-bottom: 15px;
                }

                form .field input,
                form .field button,
                form .textarea textarea {
                    width: 100%;
                    height: 100%;
                    padding-left: 20px;
                    border: 1px solid lightgrey;
                    outline: none;
                    border-radius: 25px;
                    font-size: 16px;
                    transition: all 0.3s ease;
                }

                form .field input:focus,
                form .textarea textarea:focus {
                    border-color: #fc83bb;
                }

                form .field input::placeholder,
                form .textarea textarea::placeholder {
                    color: silver;
                    transition: all 0.3s ease;
                }

                form .field input:focus::placeholder,
                form .textarea textarea:focus::placeholder {
                    color: lightgrey;
                }

                .chat-box form .textarea {
                    height: 70px;
                    width: 100%;
                }

                .chat-box form .textarea textarea {
                    height: 100%;
                    border-radius: 50px;
                    resize: none;
                    padding: 15px 20px;
                    font-size: 16px;
                }

                .chat-box form .field button {
                    border: none;
                    outline: none;
                    cursor: pointer;
                    color: #fff;
                    font-size: 18px;
                    font-weight: 500;
                    background: -webkit-linear-gradient(left, #a445b2, #fa4299);
                    transition: all 0.3s ease;
                }

                .chat-box form .field button:active {
                    transform: scale(0.97);
                }

                .chat-box .messages {
                    height: 200px;
                    /* 設置高度 */
                    overflow-y: scroll;
                    /* 允許滾動 */
                }

                .chat-box .messages div {
                    margin: 5px;
                    /* 設置訊息間距 */
                }
            </style>
        </head>

        <body>
            <input type="checkbox" id="click">
            <label for="click">
                <i class="fab fa-facebook-messenger"></i>
                <i class="fas fa-times"></i>
            </label>
            <div class="wrapper">
                <div class="head-text">
                    Let's chat? - Online
                </div>
                <div class="chat-box">

                    <div class="messages">
                        <span>asdfgdsfb</span><span class="timestamp">  12346</span>
                    </div>
                    <form>
                        <input type="text" placeholder="Type your message here" />
                        <button type="submit">Send</button>
                    </form>


                </div>
            </div>
            <script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
            <script>
                const chatBox = document.querySelector('.chat-box');
                const messages = chatBox.querySelector('.messages');
                const form = chatBox.querySelector('form');
                const input = chatBox.querySelector('input');

                form.addEventListener('submit', (e) => {
                    e.preventDefault();
                    const message = input.value;
                    input.value = '';
                
                    const timestamp = new Date().toLocaleString(); // 取得現在時間
                    console.log(message)
                    console.log(timestamp)
                    let newMessage = $(`<div><span>`+message+`</span><span class="timestamp">`+timestamp+`</span></div>`); // 新增時間戳記到訊息中
                    console.log(newMessage);
                    console.log(messages);
                    messages.appendChild(newMessage[0]);
                });
            </script>
        </body>

        </html>
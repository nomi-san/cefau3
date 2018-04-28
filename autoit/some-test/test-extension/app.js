var input = document.getElementById("myinput");
input.value = "insert title here";

function changewindowtitle()
{
    window.main.ChangeTitle(input.value);
}

function messagebox()
{
    var text = "I'm messagebox from main.MsgBox function.";
	main.MsgBox('Hello', text);
}

function mousemove()
{
    var x = Math.floor((Math.random() * 1200) + 1);
    var y = Math.floor((Math.random() * 600) + 1);
    au3.MouseMove(x, y);
    au3.ToolTip("Some Js code =))\nvar x = Math.floor((Math.random() * 2000) + 1)");
}

function callautoit()
{
    main.Call(myau3pointer, 'Hello, this text from JavaScript!'); 
}
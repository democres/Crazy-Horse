CSocketMaster 1.5 readme file
=============================

NOTE:
Before sending me a bug report you MUST try your code with the Winsock Control first to check if there is something wrong with YOUR code instead of CSocketMaster. If you don't explicitly mention that your code works fine with the Winsock Control your message will be ignored. I don't like to be rude but you can't imagine how many times people sent me buggy code blaming CSocketMaster.


*** What is CSocketMaster?
==========================

CSocketMaster class is a Winsock control substitute that attempts to mimic its behavior and interface to make it easy to implement.

*** How do you use it?
======================

1) Add CSocketMaster.cls and modSocketMaster.bas to your project.
2) In a Form, Class or UserControl add this line in the declaration area for each socket you want to use:
 
Dim WithEvents NameOfSocket As CSocketMaster

where 'NameOfSocket' is any name you want for the socket.

3) Finally you need to create the object before using it. Add this line in a sub or function:

Set NameOfSocket = New CSocketMaster

That's it.


*** Differences between CSocketMaster and Winsock control
=========================================================

A) Winsock Close function is CloseSck in CSocketMaster.
B) Winsock Close event is CloseSck in CSocketMaster.
C) WndProc function is used to deliver system messages and you should not call it under any circumstance.
D) There are some other differences I intentionally made in CSocketMaster that you shouldn't notice. If you find a major difference that you think shouldn't be there, please let me know.

*** Known issues
================

A) Msgbox
Due to a VB behavior by design running a project in the IDE that displays a message box created with Msgbox prevents events from occurring. If you really need to use message boxes then you can use the MessageBox API instead. Note that this only happens in the IDE, when you compile your project all events are fired no matter what. For more info check this site:
http://support.microsoft.com/default.aspx?scid=kb;en-us;178078


*** Why use a class instead of a control?
=========================================

Using a class instead of a control has some clear benefits. You have total encapsulation, and you could, for example, make a class (or control) that downloads files from the internet just by passing a URL without knowing how CSocketMaster works internally. You can modify CSocketMaster and add more fancy functions and events. Best of all: you don't have external dependencies.


*** Why use a control instead of a class?
=========================================

There's a Winsock control clone as part of the sample projects. With a control you can build arrays and create sockets at runtime easier.


*** What tha' heck is that subclassing stuff?
=============================================

When you work with winsock you need to subclass a window to receive events from the socket. If you are familiar with the concept of subclassing on VB you should know that if you subclass a window and press then End button while in the IDE you get a nice GPF and your system crashes. To solve this I use a code based on Paul Caton's WinSubHook2 that can be found at www.planet-source-code.com. If you want to understand how my subclassing code works you have to understand his first. The asm code for the WndProc is in the file Subclass.asm. This subclassing approach is not fully tested yet, so let me know if you get a GPF.


*** Do you need the Subclass.asm file?
======================================
No! This is just the source code for the WndProc used when subclassing. You can delete this file if you wish.


*** Why so many Debug logs?
===========================

That's for helping me (and you) find any possible bug. If you get annoyed you can always erase them or comment them.


*** Change Log
==============
1.5
* The message processor wasn't controlling if there was any data left on the queue after receiving a notification of closure
1.4
* The debug logs informing the buffer for send and receive were inverted
1.3
* Fixed the bug that wouldn't free listening socket when the end button is pressed 
* Now the use of breakpoints doesn't stop the socket messages
* Minor bugs.


*** Bug report
==============

If you have a question first check this site:

http://csocketmaster.com.ar/

I will post FAQs on this page so I don't have to answer a question twice.
If you don't find the answer there you can send me an email, but first read this:

A) If I consider that your question is answered on my page your email will be ignored.
B) Make sure it's a bug! Maybe what you think it's a bug is normal winsock behavior. Use the winsock control to check if the malfunction persists.
C) I suppose you know how to work with winsock because I will not teach you how to do it. So don't ask me something like 'how to make a connection?' or 'how can I make a chat prog?'.
D) If you could send me some sample code to illustrate the bug, that would be great.
E) Don't be a lamer, don't send spam or chain mails.

Emiliano Scavuzzo anshoku <at> yahoo.com
Rosario, Argentina


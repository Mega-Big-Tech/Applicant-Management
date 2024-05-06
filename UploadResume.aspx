<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UploadResume.aspx.cs" Inherits="UploadResume" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mega Big Tech - Upload Your Resume</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            width: 400px;
        }
        h1 {
            color: #333;
            margin-bottom: 24px;
        }
        label {
            margin-bottom: 8px;
            display: block;
            color: #666;
        }
        input[type="file"] {
            padding: 10px;
            margin-top: 8px;
            margin-bottom: 20px;
            border: 2px solid #ddd;
            display: block;
            width: 100%;
        }
        input[type="submit"] {
            background-color: #0056b3;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #00408d;
        }
        .footer {
            margin-top: 20px;
            font-size: 0.8em;
            text-align: center;
            color: #777;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Upload Your Resume</h1>
        <form id="form1" runat="server">
            <div>
                <label for="fileUpload">Please select your resume:</label>
                <asp:FileUpload ID="fileUpload" runat="server" />
                <input type="submit" value="Upload" onclick="btnUpload" />
                <asp:Label ID="lblMessage" runat="server" />
            </div>
        </form>
        <div class="footer">
            Thank you for your interest in joining Mega Big Tech.
        </div>
    </div>
</body>
</html>

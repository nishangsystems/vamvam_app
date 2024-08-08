<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from themes.pixelstrap.com/multikart/front-end/email-order-success.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 24 Feb 2021 05:41:29 GMT -->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta property="og:url" content="" />
    <meta name="description" content="">
    <meta name="twitter:image" content="">
    <meta property="og:title" content="">
    <meta name="image" property="og:image" content=""/>
    <meta property="og:description" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:type" content="website" />
    <link rel="icon" href="favicon/1.png" type="image/x-icon">
    <link rel="shortcut icon" href="{{ asset('website/assets/favicon/1.png') }}" type="image/x-icon">
    <title>OTP | Email template </title>
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">

    <style type="text/css">
        body {
            text-align: center;
            margin: 0 auto;
            width: 650px;
            font-family: 'Open Sans', sans-serif;
            background-color: #e2e2e2;
            display: block;
        }

        ul {
            margin: 0;
            padding: 0;
        }

        li {
            display: inline-block;
            text-decoration: unset;
        }

        a {
            text-decoration: none;
        }

        p {
            margin: 15px 0;
            text-align: left;
        }

        h5 {
            color: #444;
            text-align: left;
            font-weight: 400;
        }

        .text-center {
            text-align: center
        }

        .main-bg-light {
            background-color: #fafafa;
        }

        .title {
            color: #444444;
            font-size: 22px;
            font-weight: bold;
            margin-top: 10px;
            margin-bottom: 10px;
            padding-bottom: 0;
            text-transform: uppercase;
            display: inline-block;
            line-height: 1;
        }

        table {
            margin-top: 30px
        }

        table.top-0 {
            margin-top: 0;
        }

        table.order-detail,
        .order-detail th,
        .order-detail td {
            border: 1px solid #ddd;
            border-collapse: collapse;
        }

        .order-detail th {
            font-size: 16px;
            padding: 15px;
            text-align: center;
        }

        .footer-social-icon tr td img {
            margin-left: 5px;
            margin-right: 5px;
        }
    </style>
</head>

<body style="margin: 20px auto;">
    <table align="center" border="0" cellpadding="0" cellspacing="0"
        style="padding: 0 30px;background-color: #fff; -webkit-box-shadow: 0px 0px 14px -4px rgba(0, 0, 0, 0.2705882353);box-shadow: 0px 0px 14px -4px rgba(0, 0, 0, 0.2705882353);width: 100%;">
        <tbody>
            <tr>
                <td>
                    <table align="center" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <img src="{{ asset('website/assets/img/email_logo.png') }}" alt=""
                                    style="margin-bottom: 30px;width: 360px;">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>Hi,</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>Thank You for choosing Jan Samadhan. Use the following OTP to complete your Forget Password
                                    procedures. OTP is valid for 5 minutes.</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2 class="title">{{ $otp }}</h2>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p style="margin-bottom:0">Thanks & Regards,</p>
                                <p style="margin-top:7px">Jan Samadhan</p>
                            </td>
                        </tr>
                    </table>


                </td>
            </tr>
        </tbody>
    </table>
    <table class="main-bg-light text-center top-0" align="center" border="0" cellpadding="0" cellspacing="0"
        width="100%">
        <tr>
            <td style="padding: 30px;">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-top:0">
                    <tr>
                        <td>
                            <p style="font-size:13px; margin:0;text-align: center;">Copyright © {{date('Y')}} Jan Samadhan. All Rights
                                Reserved.</p>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
    </table>
</body>

</html>

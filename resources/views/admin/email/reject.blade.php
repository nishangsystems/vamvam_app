<!DOCTYPE html>
<html>
<head>
    <title>{{$title}}</title>
</head>
<body>
    <div style="font-family: Helvetica,Arial,sans-serif;min-width:1000px;overflow:auto;line-height:2">
        <div style="margin:50px auto;width:70%;padding:20px 0">
          <div style="border-bottom:1px solid #eee">
            <a href="javascript:void(0);" style="font-size:1.4em;color: #00466a;text-decoration:none;font-weight:600">{{env('APP_NAME')}}</a>
          </div>
          <p style="font-size:1.1em">Hi,{{$to_name}}</p>
          <p>Sorry! {{$comment}}</p>
          <h2 style="background: #00466a;margin: 0 auto;width: max-content;padding: 0 10px;color: #fff;border-radius: 4px;">Now your status is {{$status}}.</h2>
          <p style="font-size:0.9em;">Regards,<br />{{env('APP_NAME')}}</p>
          <hr style="border:none;border-top:1px solid #eee" />
          <div style="float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300">
            <p>{{env('APP_NAME')}}</p>
            {{-- <p>1600 Amphitheatre Parkway</p>
            <p>California</p> --}}
          </div>
        </div>
      </div>
</body>
</html>
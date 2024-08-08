<?php

namespace App\Http\Controllers\Api\Representative;

use Exception;
use App\Models\Executive; 
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth; 
use App\Http\Controllers\Controller; 

class NotifyRepresentative extends Controller
{
  # Variable to Bind Model
  protected $executive;

  # Variable to Bind title
  protected $title;

  # Variable to Bind message
  protected $message;

  /**
   * Create a new controller instance.
   *
   * @return void
   */
  public function __construct()
  {
  }

  /**
   * @method to send Push Notification for android
   * @param $fcmToken, $title, $message, $id
   * @return
   */
  public function notify($customer, $title = '', $message= '', $order_id= '', $type= '')
  {
    
    # Fetch The User Device Token
    $tokens = [$customer->device_token];

    //dd($tokens, $customer, $title, $message);
    # Set th Header
    $header = [ 
      'Authorization: Key=AAAAF8gYJeY:APA91bEShibi6Kuq4KrTSAlFeMVWoX4-Ze90TEsedeZIntN4QqZj7E09wNvVJfhIopcSRnc8Su7L4EE18Uw-Rjagl2DrUHx2viXVY6RWt1um0WKqjN2Rn0rzSzOBGOYZQ8au0tpH8O8_',
      'Content-Type: Application/json' 
    ];

    # Set the Message
     $msg = [
              'title'     => (string)$title,
              'body'      => (string)$message,
              'order_id'  => (string)$order_id,
              'type'      => (string)$type,
              'icon'      => asset('assets/img/logo.png'),
              'image'     => asset('assets/img/logo.png'),
            ];
    #dd($msg);
    # Set the Payload
    $payload = [
      'registration_ids'  => $tokens,
      'data'              => $msg,
    ];

    # initialize the Curl
    $curl = curl_init();

    curl_setopt_array($curl, array(
      CURLOPT_URL => "https://fcm.googleapis.com/fcm/send",
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_FOLLOWLOCATION => true,
      CURLOPT_CUSTOMREQUEST => "POST",
      CURLOPT_POSTFIELDS => json_encode($payload),
      CURLOPT_HTTPHEADER => $header
    ));

    $response = curl_exec($curl);

    //dd($response);

    curl_close($curl);
    return ;
  }


  

 /**
   * @method to send Push Notification for ios
   * @param $fcmToken, $title, $message, $id
   * @return
   */
  function iOS($customer, $title = '', $message= '', $order_id= '', $type= '')     
  {  
    # Set the Push Notification Url
    $url = "https://fcm.googleapis.com/fcm/send";  
   
  
    # Set the Header
    $headers = array(
        'Authorization:key = AAAAF8gYJeY:APA91bEShibi6Kuq4KrTSAlFeMVWoX4-Ze90TEsedeZIntN4QqZj7E09wNvVJfhIopcSRnc8Su7L4EE18Uw-Rjagl2DrUHx2viXVY6RWt1um0WKqjN2Rn0rzSzOBGOYZQ8au0tpH8O8_',
        'Content-Type: application/json'
        ); 

    $tokens = [$customer->device_token]; 
   
    #set Data
    $postData = [
                  "registration_ids" => $tokens,
                  "notification" => [
                                      'title' => (string)$title,
                                      'body'  => (string)$message,
                                      'order_id'  => (string)$order_id,
                                      'type'  => (string)$type,
                                      'icon'  => asset('assets/img/logo.png'),
                                      'image' => asset('assets/img/logo.png'),
                                      "sound" => "default"
                                    ],
                  "data" => [
                              //'click_action'          => "FLUTTER_NOTIFICATION_CLICK",
                              'title' => (string)$title,
                              'body'  => (string)$message,
                              'order_id'  => (string)$order_id,
                              'type'  => (string)$type,
                              'icon'  => asset('assets/img/logo.png'),
                              'image' => asset('assets/img/logo.png'),
                              'is_read'  => 0,
                            ]
                ];


    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt ($ch, CURLOPT_SSL_VERIFYHOST, 0);  
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postData, true));

    $result = curl_exec($ch);    
    curl_close($ch);
    $result = json_decode($result, true);
     //dd($result['success']);
    if($result['success'] == 1) {
        return true;   
    }
  }    









}

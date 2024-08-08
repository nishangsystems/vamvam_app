<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class SuperAdminForgotOtpVerification extends Mailable
{
    use Queueable, SerializesModels;

    public $user;

    public $url;

    public $subject;

    public $message;

    public $otp;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($user, $subject, $otp)
    {
        $this->user = $user;

        $this->subject = $subject;

        // $this->message  = $message;

        // $this->url      = $url;

        $this->otp = $otp;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject($this->subject)
            ->view('admin.email.admin_otp_verification')->with(['user' => $this->user, 'otp' => $this->otp]);
    }

}

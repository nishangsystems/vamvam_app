<?php
    #get start and end date from week.
    function getStartAndEndDate($week, $year) 
    {
      $dto = new DateTime();
      $dto->setISODate($year, $week);
      $ret['week_start'] = $dto->format('Y-m-d');
      $dto->modify('+6 days');
      $ret['week_end'] = $dto->format('Y-m-d');
      return $ret;
    }


    #Store notification.
    function storeNotification($table, $type, $title, $message, $complaint_id, $user_id) 
    {
      if($table == 'user')
      {
            $customer                = new App\Models\UserNotification;
            $customer->type          = $type;
            $customer->title         = $title;
            $customer->message       = $message;
            $customer->complaint_id  = $complaint_id ?? 0;
            $customer->user_id       = $user_id;
            $customer->save();
      }

      if($table == 'executive')
      {
            $executive                = new App\Models\RepresentativeNotification;
            $executive->type          = $type;
            $executive->title         = $title;
            $executive->message       = $message;
            $executive->complaint_id  = $complaint_id ?? 0;
            $executive->executive_id  = $user_id;
            $executive->save();
      }

      if($table == 'leader')
      {
            $executive                = new App\Models\LeaderNotification;
            $executive->type          = $type;
            $executive->title         = $title;
            $executive->message       = $message;
            $executive->complaint_id  = $complaint_id ?? 0;
            $executive->leader_id     = $user_id;
            $executive->save();
      }

      return true;
     
    }

<?php

namespace App\Http\Interfaces;

interface ComplaintFollowUpStatusInterface
{
	const Assigned 			= 1;
	const Inprogress		= 2;
	const Resolved		    = 3;
	const Cancelled 		= 4;
	const Transferred 		= 5;
	const Reopened 		    = 6;
}
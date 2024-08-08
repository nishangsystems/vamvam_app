<?php

namespace App\Http\Interfaces;

interface ComplaintStatusInterface
{
	const Pending 			= 1;
	const Inprogress        = 2;
	const Resolved		    = 3;
	const Cancelled 		= 4;
	const Reopened 		    = 5;
}
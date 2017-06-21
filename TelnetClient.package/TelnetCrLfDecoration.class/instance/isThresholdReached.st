testing
isThresholdReached
	^ (self handler stream peekLast: 2) = #[13 10]
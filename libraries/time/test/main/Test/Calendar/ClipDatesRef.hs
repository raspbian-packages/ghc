module Test.Calendar.ClipDatesRef where

clipDatesYearAndDayRef :: [String]
clipDatesYearAndDayRef =
    [ "1968--4 = 1968-001"
    , "1968-0 = 1968-001"
    , "1968-1 = 1968-001"
    , "1968-200 = 1968-200"
    , "1968-364 = 1968-364"
    , "1968-365 = 1968-365"
    , "1968-366 = 1968-366"
    , "1968-367 = 1968-366"
    , "1968-700 = 1968-366"
    , "1969--4 = 1969-001"
    , "1969-0 = 1969-001"
    , "1969-1 = 1969-001"
    , "1969-200 = 1969-200"
    , "1969-364 = 1969-364"
    , "1969-365 = 1969-365"
    , "1969-366 = 1969-365"
    , "1969-367 = 1969-365"
    , "1969-700 = 1969-365"
    , "1971--4 = 1971-001"
    , "1971-0 = 1971-001"
    , "1971-1 = 1971-001"
    , "1971-200 = 1971-200"
    , "1971-364 = 1971-364"
    , "1971-365 = 1971-365"
    , "1971-366 = 1971-365"
    , "1971-367 = 1971-365"
    , "1971-700 = 1971-365"
    ]

clipDatesGregorianDayRef :: [String]
clipDatesGregorianDayRef =
    [ "1968--20--7 = 1968-01-01"
    , "1968--20--1 = 1968-01-01"
    , "1968--20-0 = 1968-01-01"
    , "1968--20-1 = 1968-01-01"
    , "1968--20-2 = 1968-01-02"
    , "1968--20-27 = 1968-01-27"
    , "1968--20-28 = 1968-01-28"
    , "1968--20-29 = 1968-01-29"
    , "1968--20-30 = 1968-01-30"
    , "1968--20-31 = 1968-01-31"
    , "1968--20-32 = 1968-01-31"
    , "1968--20-40 = 1968-01-31"
    , "1968--1--7 = 1968-01-01"
    , "1968--1--1 = 1968-01-01"
    , "1968--1-0 = 1968-01-01"
    , "1968--1-1 = 1968-01-01"
    , "1968--1-2 = 1968-01-02"
    , "1968--1-27 = 1968-01-27"
    , "1968--1-28 = 1968-01-28"
    , "1968--1-29 = 1968-01-29"
    , "1968--1-30 = 1968-01-30"
    , "1968--1-31 = 1968-01-31"
    , "1968--1-32 = 1968-01-31"
    , "1968--1-40 = 1968-01-31"
    , "1968-0--7 = 1968-01-01"
    , "1968-0--1 = 1968-01-01"
    , "1968-0-0 = 1968-01-01"
    , "1968-0-1 = 1968-01-01"
    , "1968-0-2 = 1968-01-02"
    , "1968-0-27 = 1968-01-27"
    , "1968-0-28 = 1968-01-28"
    , "1968-0-29 = 1968-01-29"
    , "1968-0-30 = 1968-01-30"
    , "1968-0-31 = 1968-01-31"
    , "1968-0-32 = 1968-01-31"
    , "1968-0-40 = 1968-01-31"
    , "1968-1--7 = 1968-01-01"
    , "1968-1--1 = 1968-01-01"
    , "1968-1-0 = 1968-01-01"
    , "1968-1-1 = 1968-01-01"
    , "1968-1-2 = 1968-01-02"
    , "1968-1-27 = 1968-01-27"
    , "1968-1-28 = 1968-01-28"
    , "1968-1-29 = 1968-01-29"
    , "1968-1-30 = 1968-01-30"
    , "1968-1-31 = 1968-01-31"
    , "1968-1-32 = 1968-01-31"
    , "1968-1-40 = 1968-01-31"
    , "1968-2--7 = 1968-02-01"
    , "1968-2--1 = 1968-02-01"
    , "1968-2-0 = 1968-02-01"
    , "1968-2-1 = 1968-02-01"
    , "1968-2-2 = 1968-02-02"
    , "1968-2-27 = 1968-02-27"
    , "1968-2-28 = 1968-02-28"
    , "1968-2-29 = 1968-02-29"
    , "1968-2-30 = 1968-02-29"
    , "1968-2-31 = 1968-02-29"
    , "1968-2-32 = 1968-02-29"
    , "1968-2-40 = 1968-02-29"
    , "1968-12--7 = 1968-12-01"
    , "1968-12--1 = 1968-12-01"
    , "1968-12-0 = 1968-12-01"
    , "1968-12-1 = 1968-12-01"
    , "1968-12-2 = 1968-12-02"
    , "1968-12-27 = 1968-12-27"
    , "1968-12-28 = 1968-12-28"
    , "1968-12-29 = 1968-12-29"
    , "1968-12-30 = 1968-12-30"
    , "1968-12-31 = 1968-12-31"
    , "1968-12-32 = 1968-12-31"
    , "1968-12-40 = 1968-12-31"
    , "1968-13--7 = 1968-12-01"
    , "1968-13--1 = 1968-12-01"
    , "1968-13-0 = 1968-12-01"
    , "1968-13-1 = 1968-12-01"
    , "1968-13-2 = 1968-12-02"
    , "1968-13-27 = 1968-12-27"
    , "1968-13-28 = 1968-12-28"
    , "1968-13-29 = 1968-12-29"
    , "1968-13-30 = 1968-12-30"
    , "1968-13-31 = 1968-12-31"
    , "1968-13-32 = 1968-12-31"
    , "1968-13-40 = 1968-12-31"
    , "1968-17--7 = 1968-12-01"
    , "1968-17--1 = 1968-12-01"
    , "1968-17-0 = 1968-12-01"
    , "1968-17-1 = 1968-12-01"
    , "1968-17-2 = 1968-12-02"
    , "1968-17-27 = 1968-12-27"
    , "1968-17-28 = 1968-12-28"
    , "1968-17-29 = 1968-12-29"
    , "1968-17-30 = 1968-12-30"
    , "1968-17-31 = 1968-12-31"
    , "1968-17-32 = 1968-12-31"
    , "1968-17-40 = 1968-12-31"
    , "1969--20--7 = 1969-01-01"
    , "1969--20--1 = 1969-01-01"
    , "1969--20-0 = 1969-01-01"
    , "1969--20-1 = 1969-01-01"
    , "1969--20-2 = 1969-01-02"
    , "1969--20-27 = 1969-01-27"
    , "1969--20-28 = 1969-01-28"
    , "1969--20-29 = 1969-01-29"
    , "1969--20-30 = 1969-01-30"
    , "1969--20-31 = 1969-01-31"
    , "1969--20-32 = 1969-01-31"
    , "1969--20-40 = 1969-01-31"
    , "1969--1--7 = 1969-01-01"
    , "1969--1--1 = 1969-01-01"
    , "1969--1-0 = 1969-01-01"
    , "1969--1-1 = 1969-01-01"
    , "1969--1-2 = 1969-01-02"
    , "1969--1-27 = 1969-01-27"
    , "1969--1-28 = 1969-01-28"
    , "1969--1-29 = 1969-01-29"
    , "1969--1-30 = 1969-01-30"
    , "1969--1-31 = 1969-01-31"
    , "1969--1-32 = 1969-01-31"
    , "1969--1-40 = 1969-01-31"
    , "1969-0--7 = 1969-01-01"
    , "1969-0--1 = 1969-01-01"
    , "1969-0-0 = 1969-01-01"
    , "1969-0-1 = 1969-01-01"
    , "1969-0-2 = 1969-01-02"
    , "1969-0-27 = 1969-01-27"
    , "1969-0-28 = 1969-01-28"
    , "1969-0-29 = 1969-01-29"
    , "1969-0-30 = 1969-01-30"
    , "1969-0-31 = 1969-01-31"
    , "1969-0-32 = 1969-01-31"
    , "1969-0-40 = 1969-01-31"
    , "1969-1--7 = 1969-01-01"
    , "1969-1--1 = 1969-01-01"
    , "1969-1-0 = 1969-01-01"
    , "1969-1-1 = 1969-01-01"
    , "1969-1-2 = 1969-01-02"
    , "1969-1-27 = 1969-01-27"
    , "1969-1-28 = 1969-01-28"
    , "1969-1-29 = 1969-01-29"
    , "1969-1-30 = 1969-01-30"
    , "1969-1-31 = 1969-01-31"
    , "1969-1-32 = 1969-01-31"
    , "1969-1-40 = 1969-01-31"
    , "1969-2--7 = 1969-02-01"
    , "1969-2--1 = 1969-02-01"
    , "1969-2-0 = 1969-02-01"
    , "1969-2-1 = 1969-02-01"
    , "1969-2-2 = 1969-02-02"
    , "1969-2-27 = 1969-02-27"
    , "1969-2-28 = 1969-02-28"
    , "1969-2-29 = 1969-02-28"
    , "1969-2-30 = 1969-02-28"
    , "1969-2-31 = 1969-02-28"
    , "1969-2-32 = 1969-02-28"
    , "1969-2-40 = 1969-02-28"
    , "1969-12--7 = 1969-12-01"
    , "1969-12--1 = 1969-12-01"
    , "1969-12-0 = 1969-12-01"
    , "1969-12-1 = 1969-12-01"
    , "1969-12-2 = 1969-12-02"
    , "1969-12-27 = 1969-12-27"
    , "1969-12-28 = 1969-12-28"
    , "1969-12-29 = 1969-12-29"
    , "1969-12-30 = 1969-12-30"
    , "1969-12-31 = 1969-12-31"
    , "1969-12-32 = 1969-12-31"
    , "1969-12-40 = 1969-12-31"
    , "1969-13--7 = 1969-12-01"
    , "1969-13--1 = 1969-12-01"
    , "1969-13-0 = 1969-12-01"
    , "1969-13-1 = 1969-12-01"
    , "1969-13-2 = 1969-12-02"
    , "1969-13-27 = 1969-12-27"
    , "1969-13-28 = 1969-12-28"
    , "1969-13-29 = 1969-12-29"
    , "1969-13-30 = 1969-12-30"
    , "1969-13-31 = 1969-12-31"
    , "1969-13-32 = 1969-12-31"
    , "1969-13-40 = 1969-12-31"
    , "1969-17--7 = 1969-12-01"
    , "1969-17--1 = 1969-12-01"
    , "1969-17-0 = 1969-12-01"
    , "1969-17-1 = 1969-12-01"
    , "1969-17-2 = 1969-12-02"
    , "1969-17-27 = 1969-12-27"
    , "1969-17-28 = 1969-12-28"
    , "1969-17-29 = 1969-12-29"
    , "1969-17-30 = 1969-12-30"
    , "1969-17-31 = 1969-12-31"
    , "1969-17-32 = 1969-12-31"
    , "1969-17-40 = 1969-12-31"
    , "1971--20--7 = 1971-01-01"
    , "1971--20--1 = 1971-01-01"
    , "1971--20-0 = 1971-01-01"
    , "1971--20-1 = 1971-01-01"
    , "1971--20-2 = 1971-01-02"
    , "1971--20-27 = 1971-01-27"
    , "1971--20-28 = 1971-01-28"
    , "1971--20-29 = 1971-01-29"
    , "1971--20-30 = 1971-01-30"
    , "1971--20-31 = 1971-01-31"
    , "1971--20-32 = 1971-01-31"
    , "1971--20-40 = 1971-01-31"
    , "1971--1--7 = 1971-01-01"
    , "1971--1--1 = 1971-01-01"
    , "1971--1-0 = 1971-01-01"
    , "1971--1-1 = 1971-01-01"
    , "1971--1-2 = 1971-01-02"
    , "1971--1-27 = 1971-01-27"
    , "1971--1-28 = 1971-01-28"
    , "1971--1-29 = 1971-01-29"
    , "1971--1-30 = 1971-01-30"
    , "1971--1-31 = 1971-01-31"
    , "1971--1-32 = 1971-01-31"
    , "1971--1-40 = 1971-01-31"
    , "1971-0--7 = 1971-01-01"
    , "1971-0--1 = 1971-01-01"
    , "1971-0-0 = 1971-01-01"
    , "1971-0-1 = 1971-01-01"
    , "1971-0-2 = 1971-01-02"
    , "1971-0-27 = 1971-01-27"
    , "1971-0-28 = 1971-01-28"
    , "1971-0-29 = 1971-01-29"
    , "1971-0-30 = 1971-01-30"
    , "1971-0-31 = 1971-01-31"
    , "1971-0-32 = 1971-01-31"
    , "1971-0-40 = 1971-01-31"
    , "1971-1--7 = 1971-01-01"
    , "1971-1--1 = 1971-01-01"
    , "1971-1-0 = 1971-01-01"
    , "1971-1-1 = 1971-01-01"
    , "1971-1-2 = 1971-01-02"
    , "1971-1-27 = 1971-01-27"
    , "1971-1-28 = 1971-01-28"
    , "1971-1-29 = 1971-01-29"
    , "1971-1-30 = 1971-01-30"
    , "1971-1-31 = 1971-01-31"
    , "1971-1-32 = 1971-01-31"
    , "1971-1-40 = 1971-01-31"
    , "1971-2--7 = 1971-02-01"
    , "1971-2--1 = 1971-02-01"
    , "1971-2-0 = 1971-02-01"
    , "1971-2-1 = 1971-02-01"
    , "1971-2-2 = 1971-02-02"
    , "1971-2-27 = 1971-02-27"
    , "1971-2-28 = 1971-02-28"
    , "1971-2-29 = 1971-02-28"
    , "1971-2-30 = 1971-02-28"
    , "1971-2-31 = 1971-02-28"
    , "1971-2-32 = 1971-02-28"
    , "1971-2-40 = 1971-02-28"
    , "1971-12--7 = 1971-12-01"
    , "1971-12--1 = 1971-12-01"
    , "1971-12-0 = 1971-12-01"
    , "1971-12-1 = 1971-12-01"
    , "1971-12-2 = 1971-12-02"
    , "1971-12-27 = 1971-12-27"
    , "1971-12-28 = 1971-12-28"
    , "1971-12-29 = 1971-12-29"
    , "1971-12-30 = 1971-12-30"
    , "1971-12-31 = 1971-12-31"
    , "1971-12-32 = 1971-12-31"
    , "1971-12-40 = 1971-12-31"
    , "1971-13--7 = 1971-12-01"
    , "1971-13--1 = 1971-12-01"
    , "1971-13-0 = 1971-12-01"
    , "1971-13-1 = 1971-12-01"
    , "1971-13-2 = 1971-12-02"
    , "1971-13-27 = 1971-12-27"
    , "1971-13-28 = 1971-12-28"
    , "1971-13-29 = 1971-12-29"
    , "1971-13-30 = 1971-12-30"
    , "1971-13-31 = 1971-12-31"
    , "1971-13-32 = 1971-12-31"
    , "1971-13-40 = 1971-12-31"
    , "1971-17--7 = 1971-12-01"
    , "1971-17--1 = 1971-12-01"
    , "1971-17-0 = 1971-12-01"
    , "1971-17-1 = 1971-12-01"
    , "1971-17-2 = 1971-12-02"
    , "1971-17-27 = 1971-12-27"
    , "1971-17-28 = 1971-12-28"
    , "1971-17-29 = 1971-12-29"
    , "1971-17-30 = 1971-12-30"
    , "1971-17-31 = 1971-12-31"
    , "1971-17-32 = 1971-12-31"
    , "1971-17-40 = 1971-12-31"
    ]

clipDatesISOWeekDayRef :: [String]
clipDatesISOWeekDayRef =
    [ "1968-W-20--2 = 1968-W01-1"
    , "1968-W-20--1 = 1968-W01-1"
    , "1968-W-20-0 = 1968-W01-1"
    , "1968-W-20-1 = 1968-W01-1"
    , "1968-W-20-4 = 1968-W01-4"
    , "1968-W-20-6 = 1968-W01-6"
    , "1968-W-20-7 = 1968-W01-7"
    , "1968-W-20-8 = 1968-W01-7"
    , "1968-W-20-9 = 1968-W01-7"
    , "1968-W-1--2 = 1968-W01-1"
    , "1968-W-1--1 = 1968-W01-1"
    , "1968-W-1-0 = 1968-W01-1"
    , "1968-W-1-1 = 1968-W01-1"
    , "1968-W-1-4 = 1968-W01-4"
    , "1968-W-1-6 = 1968-W01-6"
    , "1968-W-1-7 = 1968-W01-7"
    , "1968-W-1-8 = 1968-W01-7"
    , "1968-W-1-9 = 1968-W01-7"
    , "1968-W0--2 = 1968-W01-1"
    , "1968-W0--1 = 1968-W01-1"
    , "1968-W0-0 = 1968-W01-1"
    , "1968-W0-1 = 1968-W01-1"
    , "1968-W0-4 = 1968-W01-4"
    , "1968-W0-6 = 1968-W01-6"
    , "1968-W0-7 = 1968-W01-7"
    , "1968-W0-8 = 1968-W01-7"
    , "1968-W0-9 = 1968-W01-7"
    , "1968-W1--2 = 1968-W01-1"
    , "1968-W1--1 = 1968-W01-1"
    , "1968-W1-0 = 1968-W01-1"
    , "1968-W1-1 = 1968-W01-1"
    , "1968-W1-4 = 1968-W01-4"
    , "1968-W1-6 = 1968-W01-6"
    , "1968-W1-7 = 1968-W01-7"
    , "1968-W1-8 = 1968-W01-7"
    , "1968-W1-9 = 1968-W01-7"
    , "1968-W20--2 = 1968-W20-1"
    , "1968-W20--1 = 1968-W20-1"
    , "1968-W20-0 = 1968-W20-1"
    , "1968-W20-1 = 1968-W20-1"
    , "1968-W20-4 = 1968-W20-4"
    , "1968-W20-6 = 1968-W20-6"
    , "1968-W20-7 = 1968-W20-7"
    , "1968-W20-8 = 1968-W20-7"
    , "1968-W20-9 = 1968-W20-7"
    , "1968-W51--2 = 1968-W51-1"
    , "1968-W51--1 = 1968-W51-1"
    , "1968-W51-0 = 1968-W51-1"
    , "1968-W51-1 = 1968-W51-1"
    , "1968-W51-4 = 1968-W51-4"
    , "1968-W51-6 = 1968-W51-6"
    , "1968-W51-7 = 1968-W51-7"
    , "1968-W51-8 = 1968-W51-7"
    , "1968-W51-9 = 1968-W51-7"
    , "1968-W52--2 = 1968-W52-1"
    , "1968-W52--1 = 1968-W52-1"
    , "1968-W52-0 = 1968-W52-1"
    , "1968-W52-1 = 1968-W52-1"
    , "1968-W52-4 = 1968-W52-4"
    , "1968-W52-6 = 1968-W52-6"
    , "1968-W52-7 = 1968-W52-7"
    , "1968-W52-8 = 1968-W52-7"
    , "1968-W52-9 = 1968-W52-7"
    , "1968-W53--2 = 1968-W52-1"
    , "1968-W53--1 = 1968-W52-1"
    , "1968-W53-0 = 1968-W52-1"
    , "1968-W53-1 = 1968-W52-1"
    , "1968-W53-4 = 1968-W52-4"
    , "1968-W53-6 = 1968-W52-6"
    , "1968-W53-7 = 1968-W52-7"
    , "1968-W53-8 = 1968-W52-7"
    , "1968-W53-9 = 1968-W52-7"
    , "1968-W54--2 = 1968-W52-1"
    , "1968-W54--1 = 1968-W52-1"
    , "1968-W54-0 = 1968-W52-1"
    , "1968-W54-1 = 1968-W52-1"
    , "1968-W54-4 = 1968-W52-4"
    , "1968-W54-6 = 1968-W52-6"
    , "1968-W54-7 = 1968-W52-7"
    , "1968-W54-8 = 1968-W52-7"
    , "1968-W54-9 = 1968-W52-7"
    , "1969-W-20--2 = 1969-W01-1"
    , "1969-W-20--1 = 1969-W01-1"
    , "1969-W-20-0 = 1969-W01-1"
    , "1969-W-20-1 = 1969-W01-1"
    , "1969-W-20-4 = 1969-W01-4"
    , "1969-W-20-6 = 1969-W01-6"
    , "1969-W-20-7 = 1969-W01-7"
    , "1969-W-20-8 = 1969-W01-7"
    , "1969-W-20-9 = 1969-W01-7"
    , "1969-W-1--2 = 1969-W01-1"
    , "1969-W-1--1 = 1969-W01-1"
    , "1969-W-1-0 = 1969-W01-1"
    , "1969-W-1-1 = 1969-W01-1"
    , "1969-W-1-4 = 1969-W01-4"
    , "1969-W-1-6 = 1969-W01-6"
    , "1969-W-1-7 = 1969-W01-7"
    , "1969-W-1-8 = 1969-W01-7"
    , "1969-W-1-9 = 1969-W01-7"
    , "1969-W0--2 = 1969-W01-1"
    , "1969-W0--1 = 1969-W01-1"
    , "1969-W0-0 = 1969-W01-1"
    , "1969-W0-1 = 1969-W01-1"
    , "1969-W0-4 = 1969-W01-4"
    , "1969-W0-6 = 1969-W01-6"
    , "1969-W0-7 = 1969-W01-7"
    , "1969-W0-8 = 1969-W01-7"
    , "1969-W0-9 = 1969-W01-7"
    , "1969-W1--2 = 1969-W01-1"
    , "1969-W1--1 = 1969-W01-1"
    , "1969-W1-0 = 1969-W01-1"
    , "1969-W1-1 = 1969-W01-1"
    , "1969-W1-4 = 1969-W01-4"
    , "1969-W1-6 = 1969-W01-6"
    , "1969-W1-7 = 1969-W01-7"
    , "1969-W1-8 = 1969-W01-7"
    , "1969-W1-9 = 1969-W01-7"
    , "1969-W20--2 = 1969-W20-1"
    , "1969-W20--1 = 1969-W20-1"
    , "1969-W20-0 = 1969-W20-1"
    , "1969-W20-1 = 1969-W20-1"
    , "1969-W20-4 = 1969-W20-4"
    , "1969-W20-6 = 1969-W20-6"
    , "1969-W20-7 = 1969-W20-7"
    , "1969-W20-8 = 1969-W20-7"
    , "1969-W20-9 = 1969-W20-7"
    , "1969-W51--2 = 1969-W51-1"
    , "1969-W51--1 = 1969-W51-1"
    , "1969-W51-0 = 1969-W51-1"
    , "1969-W51-1 = 1969-W51-1"
    , "1969-W51-4 = 1969-W51-4"
    , "1969-W51-6 = 1969-W51-6"
    , "1969-W51-7 = 1969-W51-7"
    , "1969-W51-8 = 1969-W51-7"
    , "1969-W51-9 = 1969-W51-7"
    , "1969-W52--2 = 1969-W52-1"
    , "1969-W52--1 = 1969-W52-1"
    , "1969-W52-0 = 1969-W52-1"
    , "1969-W52-1 = 1969-W52-1"
    , "1969-W52-4 = 1969-W52-4"
    , "1969-W52-6 = 1969-W52-6"
    , "1969-W52-7 = 1969-W52-7"
    , "1969-W52-8 = 1969-W52-7"
    , "1969-W52-9 = 1969-W52-7"
    , "1969-W53--2 = 1969-W52-1"
    , "1969-W53--1 = 1969-W52-1"
    , "1969-W53-0 = 1969-W52-1"
    , "1969-W53-1 = 1969-W52-1"
    , "1969-W53-4 = 1969-W52-4"
    , "1969-W53-6 = 1969-W52-6"
    , "1969-W53-7 = 1969-W52-7"
    , "1969-W53-8 = 1969-W52-7"
    , "1969-W53-9 = 1969-W52-7"
    , "1969-W54--2 = 1969-W52-1"
    , "1969-W54--1 = 1969-W52-1"
    , "1969-W54-0 = 1969-W52-1"
    , "1969-W54-1 = 1969-W52-1"
    , "1969-W54-4 = 1969-W52-4"
    , "1969-W54-6 = 1969-W52-6"
    , "1969-W54-7 = 1969-W52-7"
    , "1969-W54-8 = 1969-W52-7"
    , "1969-W54-9 = 1969-W52-7"
    , "2004-W-20--2 = 2004-W01-1"
    , "2004-W-20--1 = 2004-W01-1"
    , "2004-W-20-0 = 2004-W01-1"
    , "2004-W-20-1 = 2004-W01-1"
    , "2004-W-20-4 = 2004-W01-4"
    , "2004-W-20-6 = 2004-W01-6"
    , "2004-W-20-7 = 2004-W01-7"
    , "2004-W-20-8 = 2004-W01-7"
    , "2004-W-20-9 = 2004-W01-7"
    , "2004-W-1--2 = 2004-W01-1"
    , "2004-W-1--1 = 2004-W01-1"
    , "2004-W-1-0 = 2004-W01-1"
    , "2004-W-1-1 = 2004-W01-1"
    , "2004-W-1-4 = 2004-W01-4"
    , "2004-W-1-6 = 2004-W01-6"
    , "2004-W-1-7 = 2004-W01-7"
    , "2004-W-1-8 = 2004-W01-7"
    , "2004-W-1-9 = 2004-W01-7"
    , "2004-W0--2 = 2004-W01-1"
    , "2004-W0--1 = 2004-W01-1"
    , "2004-W0-0 = 2004-W01-1"
    , "2004-W0-1 = 2004-W01-1"
    , "2004-W0-4 = 2004-W01-4"
    , "2004-W0-6 = 2004-W01-6"
    , "2004-W0-7 = 2004-W01-7"
    , "2004-W0-8 = 2004-W01-7"
    , "2004-W0-9 = 2004-W01-7"
    , "2004-W1--2 = 2004-W01-1"
    , "2004-W1--1 = 2004-W01-1"
    , "2004-W1-0 = 2004-W01-1"
    , "2004-W1-1 = 2004-W01-1"
    , "2004-W1-4 = 2004-W01-4"
    , "2004-W1-6 = 2004-W01-6"
    , "2004-W1-7 = 2004-W01-7"
    , "2004-W1-8 = 2004-W01-7"
    , "2004-W1-9 = 2004-W01-7"
    , "2004-W20--2 = 2004-W20-1"
    , "2004-W20--1 = 2004-W20-1"
    , "2004-W20-0 = 2004-W20-1"
    , "2004-W20-1 = 2004-W20-1"
    , "2004-W20-4 = 2004-W20-4"
    , "2004-W20-6 = 2004-W20-6"
    , "2004-W20-7 = 2004-W20-7"
    , "2004-W20-8 = 2004-W20-7"
    , "2004-W20-9 = 2004-W20-7"
    , "2004-W51--2 = 2004-W51-1"
    , "2004-W51--1 = 2004-W51-1"
    , "2004-W51-0 = 2004-W51-1"
    , "2004-W51-1 = 2004-W51-1"
    , "2004-W51-4 = 2004-W51-4"
    , "2004-W51-6 = 2004-W51-6"
    , "2004-W51-7 = 2004-W51-7"
    , "2004-W51-8 = 2004-W51-7"
    , "2004-W51-9 = 2004-W51-7"
    , "2004-W52--2 = 2004-W52-1"
    , "2004-W52--1 = 2004-W52-1"
    , "2004-W52-0 = 2004-W52-1"
    , "2004-W52-1 = 2004-W52-1"
    , "2004-W52-4 = 2004-W52-4"
    , "2004-W52-6 = 2004-W52-6"
    , "2004-W52-7 = 2004-W52-7"
    , "2004-W52-8 = 2004-W52-7"
    , "2004-W52-9 = 2004-W52-7"
    , "2004-W53--2 = 2004-W53-1"
    , "2004-W53--1 = 2004-W53-1"
    , "2004-W53-0 = 2004-W53-1"
    , "2004-W53-1 = 2004-W53-1"
    , "2004-W53-4 = 2004-W53-4"
    , "2004-W53-6 = 2004-W53-6"
    , "2004-W53-7 = 2004-W53-7"
    , "2004-W53-8 = 2004-W53-7"
    , "2004-W53-9 = 2004-W53-7"
    , "2004-W54--2 = 2004-W53-1"
    , "2004-W54--1 = 2004-W53-1"
    , "2004-W54-0 = 2004-W53-1"
    , "2004-W54-1 = 2004-W53-1"
    , "2004-W54-4 = 2004-W53-4"
    , "2004-W54-6 = 2004-W53-6"
    , "2004-W54-7 = 2004-W53-7"
    , "2004-W54-8 = 2004-W53-7"
    , "2004-W54-9 = 2004-W53-7"
    ]

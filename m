Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4B1B6266
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Sep 2019 13:45:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C725BC36B3F
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Sep 2019 11:45:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAEC7C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 11:45:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8IBfFli008937; Wed, 18 Sep 2019 13:45:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=/qNdTQAJTS6ZqJQtSjfxFncu7IKqTjySvfLSTDFeSGk=;
 b=JjaoLnMGhUwFOr/0shtaZT1IhDptnzQzWZKCPsI3o++Mvnx2Qahg8A17J8nK+evxB3ON
 P7igbe2I/+VpDxe6a+7Nflgq9Etzzu0HZZrsnidow65p1nFCWb6fX7q5JTnxt+9XRILl
 M2TEuZBwry30jmREj8kO0IjfmlN3P72Ksd+fUhbbYyS0asEiQFUEuFz3UNRzJmj1STEI
 m7KpJItnTTv/1/l00jrn6PQUxH49swFYOsw5W+WS6tFsUw5xpINMB+z30F8K7rp//sMx
 Y8d6/o7S6ob4UTFPJ1k0EsAfpJZf5cO5r/lcHqBlyweUaPIhXyJ8gn+ukSiaKQArV+XC 4A== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v37kmbwhj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 18 Sep 2019 13:45:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9D10123;
 Wed, 18 Sep 2019 11:45:28 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ACCA02C2B79;
 Wed, 18 Sep 2019 13:45:27 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 13:45:27 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Sep 2019 13:45:27 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Lukasz Majewski <lukma@denx.de>
Thread-Topic: [PATCH 05/14] dfu: allow read with 0 data for EOF indication
Thread-Index: AQHVaj5HCZBGudwyo0aMu/KxN9YViKcvj2IAgABM/eA=
Date: Wed, 18 Sep 2019 11:45:27 +0000
Message-ID: <6b11595fc64b4e17a17ca8237603c689@SFHDAG6NODE3.st.com>
References: <20190913141930.15784-2-patrick.delaunay@st.com>
 <20190913141930.15784-6-patrick.delaunay@st.com>
 <20190917122852.10d8c0f0@jawa>
In-Reply-To: <20190917122852.10d8c0f0@jawa>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-18_07:2019-09-17,2019-09-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 05/14] dfu: allow read with 0 data for EOF
	indication
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Lukasz,

> From: Lukasz Majewski <lukma@denx.de>
> Sent: mardi 17 septembre 2019 12:29
> 
> Hi Patrick,
> 
> > This patch allows into the DFU backend to indicate that there is no
> > remaining data (for EOF for example). That allows users to read a
> > buffer greater than the device size; the dfu stack stops the read
> > request when the backend return a length=0 without error.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >  drivers/dfu/dfu.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c index
> > 8bd5216017..50919fcae9 100644
> > --- a/drivers/dfu/dfu.c
> > +++ b/drivers/dfu/dfu.c
> > @@ -396,6 +396,8 @@ static int dfu_read_buffer_fill(struct dfu_entity
> > *dfu, void *buf, int size) debug("%s: Read error!\n", __func__);
> >  				return ret;
> >  			}
> > +			if (dfu->b_left == 0)
> > +				break;
> 
> I guess that this is the use case for sending commands?

Yes,

The use-case is for virtual partition, also used for "command".

Command is requested by updload in the associated alternate 
And result is done by reading on the same alternate.

During enumeration I set the size of the alternate at the maximum size of the answer....
This test allow to read, without error, until the backend / callback read at the requested offset with a offset = 0.


> Could you provide a more descriptive use case for this change (the description in
> the above commit message is not enough for me to get it).

Yes, I will update the comment in V2.

The issue is the DFU read size is limited by get_medium_size = r_left and the stack expectes that read is allowed up to this size.

Today the DFU backend can't indicate to the DFU stack when the end of available data to read is reached, without and raising error.
Because in dfu_read_buffer_fill the loop is infinite until
- read_medium raised a error
- size = 0
- no more to read in DFU buffer (r_left = 0)

This patch allow the backend to indicate that that it can't provide no more data to fill the DFU buffer, by setting b_left =0 even is the available size id is lower of the total size indicated by get_medium_size.

For USB DFU stack point of view, it is acceptable (read lenght < requested size in DFU_UPLOAD and the transaction is stopped).

It is never a issue for flash device (where chunk are always completely read, b_left will be never 0) but it is usefulll for virtual partition when we only know the max size of this alternate.

Without this patch, I have a infinite loop, when for on backend the result of read_medium  is 0 (OK) but dfu->b_left = 0
=> r_left is not decreased and size is not updated
I try an other solution: raised a error when no more date is available but in this case the data read is not correctly managed in the loop.

PS: It is used in my example for stm32mp1

=> board/st/stm32mp1/stm32mp1.c

I force size to size = 1KB for all virtual partition , in dfu_get_medium_size_virt.

But in fucntio called dfu_read_medium_virt, I limit the size the each virtual partition in dfu_otp_read...

=> only 8 bytes for pmic  (in dfu_pmic_read, the second read at offset 8, misc_read return -EACCES)


dfu-util -d 0483:5720 -a 26 -U pmic.bin
dfu-util 0.9

Copyright 2005-2009 Weston Schmidt, Harald Welte and OpenMoko Inc.
Copyright 2010-2016 Tormod Volden and Stefan Schmidt
This program is Free Software and has ABSOLUTELY NO WARRANTY
Please report bugs to http://sourceforge.net/p/dfu-util/tickets/

Opening DFU capable USB device...
ID 0483:df11
Run-time device DFU version 0110
Claiming USB DFU Interface...
Setting Alternate Setting #26 ...
Determining device status: state = dfuIDLE, status = 0
dfuIDLE, continuing
DFU mode device DFU version 0110
Device returned transfer size 4096
Copying data from DFU device to PC
Upload	[=========================] 100%            8 bytes
Upload done.

===> but 1KB for otp

dfu-util -d 0483:5720 -a 25 -U otp.bin
dfu-util 0.9

Copyright 2005-2009 Weston Schmidt, Harald Welte and OpenMoko Inc.
Copyright 2010-2016 Tormod Volden and Stefan Schmidt
This program is Free Software and has ABSOLUTELY NO WARRANTY
Please report bugs to http://sourceforge.net/p/dfu-util/tickets/

Opening DFU capable USB device...
ID 0483:df11
Run-time device DFU version 0110
Claiming USB DFU Interface...
Setting Alternate Setting #25 ...
Determining device status: state = dfuIDLE, status = 0
dfuIDLE, continuing
DFU mode device DFU version 0110
Device returned transfer size 4096
Copying data from DFU device to PC
Upload	[=========================] 100%         1024 bytes
Upload done.


> 
> >  			dfu->offset += dfu->b_left;
> >  			dfu->r_left -= dfu->b_left;
> >
> 
> 
> 
> Best regards,
> 
> Lukasz Majewski
> 

Best regards

Patrick Delaunay
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

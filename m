Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2915230E35
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 17:42:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A54CAC36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 15:42:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3DDBC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 15:42:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SFW86d015308; Tue, 28 Jul 2020 17:42:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=9+x0a2cRpeFlVYziGpshO6badoSAHCFEliDqBZwf858=;
 b=KDWu7IkZJ7UhEbmXgXP55wff4f4VvZcEcNoydy2qL4wNTEmMrBaLzzsyZiXcCl67T/HV
 YI1bQye+k2qS4onSm61WxWUrzfGqYqLHDIWNy37jraxRV4WFZX/3lpALdZXnRmWLCCrH
 iTs2E9W6e+dTbDCVIWMv3QRQQLvYhaqoddu/eDMp0yRxrgo9mVdWxuzd9fXCFZR6Lrjd
 q4UcAE7l8yIwE6NwxsthVjm9rADes3QKEu+IZvItb5SgOAgLLkwHpDZv5MLvHxuFruqL
 VuHP6SetnMZrZlHWD3M/Izo7+lsQC5lOJblF4m7p8xpOpixktp54lO9gHhJRJoWyHkgF Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gbmg6x6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 17:42:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9060010002A;
 Tue, 28 Jul 2020 17:42:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 860EB222CB7;
 Tue, 28 Jul 2020 17:42:39 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 17:42:39 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 17:42:39 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] board: update test on misc_read result in
 board_late_init
Thread-Index: AQHWZOLVlgDC3zfDVEODBnrjnoLr46kdACOA
Date: Tue, 28 Jul 2020 15:42:39 +0000
Message-ID: <69da33c3-d30b-f599-9f31-77b08c12b549@st.com>
References: <20200703174457.1.Ibd755e6f03fcd167f10d9a9bfe98d2b928493e09@changeid>
 <19b8f8a0-6bd6-f9a6-70f9-435fd8de492f@st.com>
In-Reply-To: <19b8f8a0-6bd6-f9a6-70f9-435fd8de492f@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <C4095AB51197884F92491363139C3B76@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_13:2020-07-28,
 2020-07-28 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: update test on misc_read result in
 board_late_init
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


On 7/28/20 3:27 PM, Patrice CHOTARD wrote:
> On 7/3/20 5:45 PM, Patrick Delaunay wrote:
>> Update management of misc_read, which now return length of data
>> after the commit 8729b1ae2cbd ("misc: Update read() and write()
>> methods to return bytes xfered")
>>
>> Fixes: 8b8b3d6b55b9 ("stm32mp1: board: add environment variable for board id and board rev")
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  board/st/stm32mp1/stm32mp1.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
>> index 4553329b25..b51165a636 100644
>> --- a/board/st/stm32mp1/stm32mp1.c
>> +++ b/board/st/stm32mp1/stm32mp1.c
>> @@ -732,7 +732,7 @@ int board_late_init(void)
>>  	if (!ret)
>>  		ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
>>  				&otp, sizeof(otp));
>> -	if (!ret && otp) {
>> +	if (ret > 0 && otp) {
>>  		snprintf(buf, sizeof(buf), "0x%04x", otp >> 16);
>>  		env_set("board_id", buf);
>>  
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
>
> Thanks
>
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
Applied to u-boot-stm/master

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

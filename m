Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FBD230E9B
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 17:59:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7B51C36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 15:59:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D30D2C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 15:59:27 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SFqHWK000398; Tue, 28 Jul 2020 17:59:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=oHl6pGyE+BFvjv0VtJ6++Ch9RS9GBNK83O4HGZuRwu8=;
 b=o7X/XfL4JWx0J3ja0kO10AJYADuQzDlKYM5vn1iIe+XQO+/xGyIJ7+X3hjin8PdR8/ds
 qCWn6xwxubYZHouzZlirBibCKMQIrATHtkC9YFEHRUnpyiPewmMrWs/nL0/1Iw/mHP+P
 RL6vPQ+Z1mduHAmY+onZRiPkQnS/kdZ2pEbECNcpL55i2PR4t1Cy14B5fO1ZPVFOEsdo
 HA0W4hS37XaeW6TeSshiuxnp74KVx0AOVNBk0voNnAicnwrmNI34ZeiwqUfQ5AjLm8Z7
 nKL2/KU6gE+VpXuEaIRyFfMG0Cm0jT8kkTOsZs/s/s4Xvh2vf+1USI5LD4zqZdlIzAmT MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga71y28d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 17:59:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 636E810002A;
 Tue, 28 Jul 2020 17:59:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 589A921EB38;
 Tue, 28 Jul 2020 17:59:20 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 17:59:19 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 17:59:19 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] arm: stm32mp: stm32prog: check result of
 find_mmc_device
Thread-Index: AQHWU4eHB8eS85NBlk25M6MH63Nt36kc/biAgAApzIA=
Date: Tue, 28 Jul 2020 15:59:19 +0000
Message-ID: <ea1eb715-a58d-0517-60a6-384aaf7bd8e8@st.com>
References: <20200706132052.1.I28c26381b4f45a78d97ea917280479c10df92e76@changeid>
 <3b494ab6-7f00-f39c-3571-f1d19688e384@st.com>
In-Reply-To: <3b494ab6-7f00-f39c-3571-f1d19688e384@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <6F1E099479E24048AB944F7EDFB01355@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_13:2020-07-28,
 2020-07-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32mp: stm32prog: check result of
 find_mmc_device
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


On 7/28/20 3:29 PM, Patrice CHOTARD wrote:
> On 7/6/20 1:20 PM, Patrick Delaunay wrote:
>> Check result of find_mmc_device() before calling mmc_init().
>>
>> This patch avoid a data abort when the command try to acces
>> to sd/mmc device deactivated in device tree.
>>
>> Fixes: aff4c5dd8265 ("stm32mp: stm32prog: add MMC device")
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>> index c5b8841b23..e4199dbaa5 100644
>> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>> @@ -560,7 +560,7 @@ static int init_device(struct stm32prog_data *data,
>>  #ifdef CONFIG_MMC
>>  	case STM32PROG_MMC:
>>  		mmc = find_mmc_device(dev->dev_id);
>> -		if (mmc_init(mmc)) {
>> +		if (!mmc || mmc_init(mmc)) {
>>  			stm32prog_err("mmc device %d not found", dev->dev_id);
>>  			return -ENODEV;
>>  		}
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

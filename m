Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 464AC437B9E
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Oct 2021 19:13:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED6ACC5C85A;
	Fri, 22 Oct 2021 17:13:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A08A3C5C831
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Oct 2021 17:13:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19MF3uH1027698; 
 Fri, 22 Oct 2021 19:13:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+hUDciP2JfIyQKKfNj89m/ihLx+bAhFa0jZTJWCsc4M=;
 b=gLow4q2k9jizQkBAjAln/jJecdyFsO5w/1DXEcr/KXdHK8LRxCz62oZYT0PucUgWzPX7
 St8J1oYbhDgRsQxxXtRHLh8HwbWh+mQKH7J0c3VYZ0KACSW/bxzaHBMtTfOEZcmHiqjI
 t/sog8FAbfxH2PLfqDCH1mT1fLUgrXK4T1bQ8rL7PhP4ss7heO+v8gpmAF5mR90H1eVz
 s1BqKynwFTbTNmCTNPp6iwjcyMQASPdPH4XxvfbN8/UvzOw0NeRiod7Qa5gUj/mesg7n
 17h6NfPNIoLmOUft4+Cx/iur+8Frbrvtbqv/JUXmji6GCchqi0CHay++ee5zJjFf4HQL DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3butka2hx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Oct 2021 19:13:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 866D210002A;
 Fri, 22 Oct 2021 19:13:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7ECE6237D85;
 Fri, 22 Oct 2021 19:13:49 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 22 Oct
 2021 19:13:49 +0200
To: Simon Glass <sjg@chromium.org>
References: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
 <20211004115942.6.Ia3825658ff431b2f6ff143ee01c2d44d24219558@changeid>
 <CAPnjgZ1CEK4QUVTEZ9YP7wKs5RrdVLLmyhpkwFz=exvaaMUHKA@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <dedad256-8e72-6e70-f5ba-88fd7e27fa3a@foss.st.com>
Date: Fri, 22 Oct 2021 19:13:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ1CEK4QUVTEZ9YP7wKs5RrdVLLmyhpkwFz=exvaaMUHKA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-22_04,2021-10-22_01,2020-04-07_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Stefan Roese <sr@denx.de>,
 Priyanka Jain <priyanka.jain@nxp.com>
Subject: Re: [Uboot-stm32] [PATCH 6/6] scripts: remove CONFIG_IS_ENABLED in
 config_whitelist.txt
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Simon

On 10/14/21 5:09 PM, Simon Glass wrote:
> Hi Patrick,
>
> On Mon, 4 Oct 2021 at 04:00, Patrick Delaunay
> <patrick.delaunay@foss.st.com> wrote:
>> Redefine the macro CONFIG_IS_ENABLED is not allowed,
>> so this entry can be removed in whitelist file.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>   scripts/config_whitelist.txt | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
>> index b3ebd20c57..41a0952c97 100644
>> --- a/scripts/config_whitelist.txt
>> +++ b/scripts/config_whitelist.txt
>> @@ -649,7 +649,6 @@ CONFIG_IRAM_SIZE
>>   CONFIG_IRAM_STACK
>>   CONFIG_IRAM_TOP
>>   CONFIG_IRDA_BASE
>> -CONFIG_IS_ENABLED
>>   CONFIG_JFFS2_DEV
>>   CONFIG_JFFS2_LZO
>>   CONFIG_JFFS2_NAND
>> --
>> 2.25.1
>>
> For this to work you need to actually remove it from the source tree
> (which we can't), otherwise you get:
>
> Error: You must add new CONFIG options using Kconfig
> The following new ad-hoc CONFIG options were detected:
> CONFIG_IS_ENABLED
>
> I don't think this is worth it though, so I suggest dropping this patch.
>
> Regards,
> Simon


Yes ! sorry

CONFIG_IS_ENABLED is present in u-boot.cfg,

as CONFIG_VAL


even if it is strange for these macro defined in "linux/kconfig.h"

but agree to drop this tentative.


Do you think I can remove the CONFIG_IS_ENABLED and CONFIG_VAL

in u-boot.cfg when the file is generated ?


Patrick




_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

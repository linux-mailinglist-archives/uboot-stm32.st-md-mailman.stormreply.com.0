Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BE14630E9
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Nov 2021 11:21:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A242C597BA;
	Tue, 30 Nov 2021 10:21:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 769FFC57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Nov 2021 10:21:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AU8q7p7026770
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 30 Nov 2021 11:21:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jmcMXAOdr2MyUwk65TrZJ4iN2mlatPiJ3m+YiT4xY+4=;
 b=XZJ5JipVOLmrE6tJ7inEkZ1Evjxfeshx1BkH+18AWhmdvVoeZ25FhJGyQvWGTngwe5Ip
 c8CnydO2mRwwOYND4gobCBIHgFK0M7GN3Q37R4fR0BPyXX5w0anUL2/l5iT1wZu9Se+C
 wXvRzopfgyK91l0xTVkPFJaTuHo6HL2VhQzK75MScXGG8UZImI2kYS/mOJkhFsvtlz27
 W6kM5MmOzyiwLhfKGyOS9NGrFnOmSQfNVcRD8LV7XAVYJj3EgECDbAKKrKOJ3qmcDAkV
 LYAUvlNrWLRQOFTJHzHdIvWuM8jczYnr82Zgyj1LodDb99LZhM8YigW/DTKrlri7J6ka Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cna1yte8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 30 Nov 2021 11:21:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4CD8F10002A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Nov 2021 11:21:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4547A226FAD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Nov 2021 11:21:46 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 30 Nov
 2021 11:21:45 +0100
To: <uboot-stm32@st-md-mailman.stormreply.com>
References: <20211110181402.1.I2300405d8f776ab7d8c372b93b10bd39df4ed633@changeid>
 <1e4957ea-b0b4-6957-20a1-1f09b483a213@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <f8208454-fa64-a08a-200b-50d3785f9a6b@foss.st.com>
Date: Tue, 30 Nov 2021 11:21:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1e4957ea-b0b4-6957-20a1-1f09b483a213@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_06,2021-11-28_01,2020-04-07_01
Subject: Re: [Uboot-stm32] [PATCH] pinctrl: stmfx: define LOG_CATEGORY
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

Hi Patrick

On 11/15/21 9:20 AM, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 11/10/21 6:14 PM, Patrick Delaunay wrote:
>> Define LOG_CATEGORY to allow filtering with log command.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  drivers/pinctrl/pinctrl-stmfx.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
>> index fe7a59d431..509e2a80e9 100644
>> --- a/drivers/pinctrl/pinctrl-stmfx.c
>> +++ b/drivers/pinctrl/pinctrl-stmfx.c
>> @@ -5,8 +5,12 @@
>>   * Driver for STMicroelectronics Multi-Function eXpander (STMFX) GPIO expander
>>   * based on Linux driver : pinctrl/pinctrl-stmfx.c
>>   */
>> +
>> +#define LOG_CATEGORY UCLASS_PINCTRL
>> +
>>  #include <common.h>
>>  #include <dm.h>
>> +#include <log.h>
>>  #include <i2c.h>
>>  #include <asm/gpio.h>
>>  #include <dm/device.h>
>>
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
> 

applied to u-boot/next
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

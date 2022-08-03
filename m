Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B65588CBC
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 Aug 2022 15:12:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37BB1C640F8;
	Wed,  3 Aug 2022 13:12:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 787C8C640F1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Aug 2022 13:12:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 273901KN030991;
 Wed, 3 Aug 2022 15:12:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=P9xE81BDILdWea265Q9t5HZk0Qj4L1fXBLl65Nf/WGU=;
 b=YXheNMWPine69Ne16XQZW3rjTCJoIj1jbn5MmRTxge4xExnUu847S+6+IkA0WaSSF5vq
 e0/bTEEl+Bnkbs8jl+TDSR1FVNgE7XsBGablIxCptFAzaa04+KWYdudkZr15egp4qEAw
 h+syDxUdqGKIhol6uZ2eAJbW58fF8H1uok39f7hTQLGoyDBygSmFoj7LsmtNB4icd3jQ
 87FKTZRYlbLBuC2jsuwmBDTJVfiNJn7H22pZIrQFwQL3cIZBDqnmzV9OnGThBwSOh/b4
 iu3Xl01NSDDG9QmRPdPqGhdfdlzeFRjGdUwB6UP09iKWUFMlrEVyRvAQqap7FolYnhPN hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hq06kt1da-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Aug 2022 15:12:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DDAE710002A;
 Wed,  3 Aug 2022 15:12:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D751B21F0A1;
 Wed,  3 Aug 2022 15:12:34 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 3 Aug
 2022 15:12:34 +0200
Message-ID: <741c622f-b9ac-85dc-5882-982b76b94a2a@foss.st.com>
Date: Wed, 3 Aug 2022 15:12:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Simon Glass <sjg@chromium.org>
References: <20220802090910.277343-1-patrice.chotard@foss.st.com>
 <20220802090910.277343-2-patrice.chotard@foss.st.com>
 <CAPnjgZ0GGjA4RCB9dr8bLDSG=7RDCJTrXx7A93fjKdyhvo4+Lg@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CAPnjgZ0GGjA4RCB9dr8bLDSG=7RDCJTrXx7A93fjKdyhvo4+Lg@mail.gmail.com>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-03_03,2022-08-02_01,2022-06-22_01
Cc: Samuel Holland <samuel@sholland.org>, Andrew Jeffery <andrew@aj.id.au>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Eddie James <eajames@linux.ibm.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] gpio: Allow to print pin's label even
 for pin with GPIOF_FUNC function
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

Hi Simon

On 8/2/22 14:41, Simon Glass wrote:
> On Tue, 2 Aug 2022 at 03:09, Patrice Chotard
> <patrice.chotard@foss.st.com> wrote:
>>
>> Currently, if pin's function is GPIOF_FUNC, only "func" if displayed
>> without any other information. It would be interesting, if information is
>> available, to indicate which pinmuxing's name is used.
>>
>> For example, for STM32 SoC's based platform, "gpio status" command
>> output :
>>
>>    before
>>     Bank GPIOZ:
>>       GPIOZ0: unused : 0 [ ]
>>       GPIOZ1: unused : 0 [ ]
>>       GPIOZ2: unused : 0 [ ]
>>       GPIOZ3: unused : 0 [ ]
>>       GPIOZ4: func
>>       GPIOZ5: func
>>       GPIOZ6: unused : 0 [ ]
>>       GPIOZ7: unused : 0 [ ]
>>       GPIOZ8: unknown
>>       GPIOZ9: unknown
>>       GPIOZ10: unknown
>>       GPIOZ11: unknown
>>       GPIOZ12: unknown
>>       GPIOZ13: unknown
>>       GPIOZ14: unknown
>>       GPIOZ15: unknown
>>
>>    After
>>     Bank GPIOZ:
>>       GPIOZ0: unused : 0 [ ]
>>       GPIOZ1: unused : 0 [ ]
>>       GPIOZ2: unused : 0 [ ]
>>       GPIOZ3: unused : 0 [ ]
>>       GPIOZ4: func i2c4-0
>>       GPIOZ5: func i2c4-0
>>       GPIOZ6: unused : 0 [ ]
>>       GPIOZ7: unused : 0 [ ]
>>       GPIOZ8: unknown
>>       GPIOZ9: unknown
>>       GPIOZ10: unknown
>>       GPIOZ11: unknown
>>       GPIOZ12: unknown
>>       GPIOZ13: unknown
>>       GPIOZ14: unknown
>>       GPIOZ15: unknown
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>
>>  drivers/gpio/gpio-uclass.c | 16 +++++++++++-----
>>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> 
> Do you think you could create a basic test for the gpio command? See
> test/dm/acpi.c for an example.

OK i will send a v2 with a test

Thanks
Patrice

> 
> Regards,
> Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

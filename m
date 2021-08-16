Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 053F73ED33A
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Aug 2021 13:40:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C61EEC57B60;
	Mon, 16 Aug 2021 11:40:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC4D4C57B51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Aug 2021 11:40:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GBVhRu003497; Mon, 16 Aug 2021 13:40:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=wopdzVItNgkRXLK8C/sqQAlAUDnuClyEuHBN6Na4pHI=;
 b=hDupPwaz76I7iFc2MBmkvHQMKbNnlt90azXS2v1Ro+2fqe4DW1dYiQD85ejrr8fSWL0p
 huAN6JUgeCdKan6gb4SW56SJlIKw/psxarOEgc5ddXMWurU3I5/860s6IzTelWoGBpoo
 NNeV5p3mxc+v2OgvqF2zS1d7cAhsej5UDmPw7xnjcTC8h2MOqzSESpVPqQmT/3eTJ/w8
 MKCKt6Yk65UYsEOEsynB2R8MvgQ+oXFTe6NMZzSOQheH1uh3WOiXGqeCOVKyq1jYntRN
 a2GOl963549jRn/rBUo1l8PSOtKQKE/+E3I/MXnH910MX1MLN2Y7Xx7aVO2W63lOtosv 3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3afhp5j0f7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 13:40:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 77A1B10002A;
 Mon, 16 Aug 2021 13:40:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6E6B323144C;
 Mon, 16 Aug 2021 13:40:54 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 13:40:54 +0200
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210716100739.1.Icd6f4c4e6a28826d31b9339af544c41d7c31d73d@changeid>
 <414c817a-fb54-269e-5158-57fb93a31b63@foss.st.com>
Message-ID: <39e22575-bae1-4a45-75f1-0b5f368e7426@foss.st.com>
Date: Mon, 16 Aug 2021 13:40:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <414c817a-fb54-269e-5158-57fb93a31b63@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-16_04:2021-08-16,
 2021-08-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] clk: stm32mp1: add support of BSEC clock
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

On 8/2/21 1:42 PM, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 7/16/21 10:10 AM, Patrick Delaunay wrote:
>> Add the support of the BSEC clock used by the STM32MP misc driver
>> since the commit 622c956cada0 ("stm32mp: bsec: manage clock when present
>> in device tree") even if this clock is not yet defined in kernel device
>> tree stm32mp151.dtsi.
>>
>> This patch avoids issue for basic boot when this secure clock are not
>> provided by secure world with SCMI.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  drivers/clk/clk_stm32mp1.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
>> index 48c9514ba0..96e175f221 100644
>> --- a/drivers/clk/clk_stm32mp1.c
>> +++ b/drivers/clk/clk_stm32mp1.c
>> @@ -552,6 +552,7 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
>>  	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 2, I2C4_K, _I2C46_SEL),
>>  	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 3, I2C6_K, _I2C46_SEL),
>>  	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 8, RTCAPB, _PCLK5),
>> +	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 16, BSEC, _UNKNOWN_SEL),
>>  	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 20, STGEN_K, _STGEN_SEL),
>>  
>>  	STM32MP1_CLK_SET_CLR_F(RCC_MP_AHB2ENSETR, 5, ADC12, _HCLK2),
>>
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
> 
Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

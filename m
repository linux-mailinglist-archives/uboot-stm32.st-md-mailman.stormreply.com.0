Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79348520ECF
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 09:41:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECDEDC03FC1;
	Tue, 10 May 2022 07:32:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2554C03FC0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 07:32:55 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A6eFxb011337;
 Tue, 10 May 2022 09:32:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yRInnd5wvOP3c2xHgGBTDlnabcwam618TYd6T3H5a5Q=;
 b=eUMn491gPlBtpKI71zsr15IG9htlIbR+7u2xlHURCqU3HG6j9Q9lNdFHTHvt8UI+vFcE
 GzoUk6b89g/ATlRFg5FLOBjdG8JRKhyRZTh96ghxhQPPYagkvdQbiK8+3REtukj5+tFQ
 xhw6IKFOMw5g7TEiv9KOnLmzrfhplNMtqm0bHuYm1MkUAVNFMnZdwioYrPGK5H42ABtU
 juls20IaPFqUOk+vsfWDuCLHMMwpE5xa6XAGZIPdC8R3qpqr9GpFf/2bIHjPzl0qTJml
 5vMBRV/dVULROeAb2gqSK/i+vpC71FxfHWrDrfJlcoMuElEhGlQqOvTF0vmfBR/AVKwE YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwe6kphgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 09:32:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D447F100034;
 Tue, 10 May 2022 09:32:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA8022128AE;
 Tue, 10 May 2022 09:32:53 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 09:32:53 +0200
Message-ID: <0c8e9553-6b9c-284b-7133-564f271d5f5e@foss.st.com>
Date: Tue, 10 May 2022 09:32:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Yannick FERTRE <yannick.fertre@foss.st.com>, <u-boot@lists.denx.de>
References: <20220406083742.291491-1-yannick.fertre@foss.st.com>
 <48d0500a-b740-c1ac-07a6-2e7c8d9959a7@foss.st.com>
In-Reply-To: <48d0500a-b740-c1ac-07a6-2e7c8d9959a7@foss.st.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-09_06,2022-05-09_02,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] video: stm32: stm32_ltdc: fix data enable
	polarity
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



On 4/22/22 09:51, Patrice CHOTARD wrote:
> HI Yannick
> 
> On 4/6/22 10:37, Yannick FERTRE wrote:
>> Wrong DISPLAY_FLAGS used to set the data enable polarity.
>>
>> Signed-off-by: Yannick FERTRE <yannick.fertre@foss.st.com>
>> ---
>>
>>  drivers/video/stm32/stm32_ltdc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
>> index e741e74739..9269d4bfb4 100644
>> --- a/drivers/video/stm32/stm32_ltdc.c
>> +++ b/drivers/video/stm32/stm32_ltdc.c
>> @@ -255,7 +255,7 @@ static void stm32_ltdc_set_mode(struct stm32_ltdc_priv *priv,
>>  		val |= GCR_HSPOL;
>>  	if (timings->flags & DISPLAY_FLAGS_VSYNC_HIGH)
>>  		val |= GCR_VSPOL;
>> -	if (timings->flags & DISPLAY_FLAGS_DE_HIGH)
>> +	if (timings->flags & DISPLAY_FLAGS_DE_LOW)
>>  		val |= GCR_DEPOL;
>>  	if (timings->flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
>>  		val |= GCR_PCPOL;
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks 
> Patrice

Applied to u-boot-stm32

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

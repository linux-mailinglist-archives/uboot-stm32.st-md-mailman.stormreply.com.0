Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB814986635
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Sep 2024 20:21:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6050DC57194;
	Wed, 25 Sep 2024 18:21:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA66DCFAC50
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 18:21:38 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PG5BXm023019;
 Wed, 25 Sep 2024 20:21:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 CWkaB30DjYUXra+df4AJr5hl//RPOp5XjHfUcR+ZfzA=; b=pAgzBnSxJ4y1yaWl
 5wTc0DFv1emnX+47C1Q3MSy3ZATuu980obmR3TvH5xCEQsXIHXbLMjFseYo8Q5Ms
 RfdF6t3OlCyScquHSvwJYhERP3Tzu49bf4cgOwQhbCq86wyLtvFX++jVZ2cLPdfO
 GYJHvwJY135Q+COboKY62lxAl6W8+69sDVUgnY6ye+jMCr7hZI+EdXypSiD6/qx/
 woHdv9Tjog1HZ6Qj8/A3vKGkpUy56Fc9xyNDt+KVSEl7uYytK96Cm08Luh0cK7an
 w9OcrN97Kil0eIj2ujx3SfT8dVTer6vfR6P01tLrIZUT3bKqfywoAMJb4Q4/TWWf
 fPl7Sg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41t7q1ke5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 20:21:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2C80840088;
 Wed, 25 Sep 2024 20:20:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C64462AD77F;
 Wed, 25 Sep 2024 20:19:07 +0200 (CEST)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 25 Sep
 2024 20:19:07 +0200
Message-ID: <fb89cf75-705d-4baf-813c-1a39f8d5c079@foss.st.com>
Date: Wed, 25 Sep 2024 20:19:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, Marek Vasut
 <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240618225736.154959-1-marex@denx.de>
 <2fd69224-c299-4b43-9078-07e06cc345f5@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <2fd69224-c299-4b43-9078-07e06cc345f5@foss.st.com>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Fix TAMP_SMCR BKP..PROT
	fields on STM32MP15xx
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

Hi,

On 6/19/24 08:35, Patrice CHOTARD wrote:
>
> On 6/19/24 00:57, Marek Vasut wrote:
>> Update the TAMP_SMCR BKP..PROT fields to put first 10 registers
>> into protection zone 1 and next 5 into zone 2. This fixes use of
>> boot counter which is often in zone 3 and has to be updated from
>> Linux, which runs in NS.
>>
>> Fixes: 73f7fc944cf6 ("ARM: stm32: Initialize TAMP_SMCR BKP..PROT fields on STM32MP15xx")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>   arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
>> index f096fe538d8..ca202bec8ee 100644
>> --- a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
>> +++ b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
>> @@ -148,8 +148,8 @@ static void security_init(void)
>>   	 */
>>   	clrsetbits_le32(TAMP_SMCR,
>>   			TAMP_SMCR_BKPRWDPROT | TAMP_SMCR_BKPWDPROT,
>> -			FIELD_PREP(TAMP_SMCR_BKPRWDPROT, 0x20) |
>> -			FIELD_PREP(TAMP_SMCR_BKPWDPROT, 0x20));
>> +			FIELD_PREP(TAMP_SMCR_BKPRWDPROT, 0x0A) |
>> +			FIELD_PREP(TAMP_SMCR_BKPWDPROT, 0x0F));
>>   
>>   	/* GPIOZ: deactivate the security */
>>   	writel(BIT(0), RCC_MP_AHB5ENSETR);
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> Thanks
> Patrice



Applied to u-boot-stm/master, thanks!

Regards
Patrick



_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

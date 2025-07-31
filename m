Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B997CB16E53
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Jul 2025 11:18:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71C68C3F933;
	Thu, 31 Jul 2025 09:18:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAD44C36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Jul 2025 09:18:02 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V8ESSD020813;
 Thu, 31 Jul 2025 11:17:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 mJFWU+72EPlOmLmA6CFHVapORj3wY0JBkmdpFVXuPl0=; b=CZGVNKCCPuqU5cF5
 zi3tKDMNub0j+fEtgFfiSaXu/njkzLpvixNuKItwtBPSo/5X8tELuGDqthazlb2B
 2KULVnuofA5aMpxtqJhlFV4sbrvrUGHKLIQUz51QrKZdYaIoDhbRbhHFR/ioIJ0x
 lng5pBYUVu8zqAw5O9/1DyLVJTCpGJJHuf+Xxi40oe9MHBq1zOYwAHr/XQOi/cGB
 pc/SiI8VvC2tR3UlYpkgW/DKY8ZTAOckbVPmySCpmXEXkcHAAMe/G3O9mYGGR3pk
 8erv9YUnLRDXj1s7Qhox/m3hyjLr/qHkmzcn4rsm40oh//v5OykoSzWWicHaOr5e
 91SOvw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484pc2pdq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Jul 2025 11:17:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A2FE340045;
 Thu, 31 Jul 2025 11:16:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AAF626BAF16;
 Thu, 31 Jul 2025 11:16:22 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 11:16:22 +0200
Message-ID: <e51bd141-06c6-4634-b6a4-bd1b2fa52e8e@foss.st.com>
Date: Thu, 31 Jul 2025 11:16:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Cheick Traore <cheick.traore@foss.st.com>, <u-boot@lists.denx.de>
References: <20250620155000.1258718-1-cheick.traore@foss.st.com>
 <20250620155000.1258718-4-cheick.traore@foss.st.com>
 <94295163-40c6-4429-858d-f9e36446b71f@foss.st.com>
Content-Language: en-US
In-Reply-To: <94295163-40c6-4429-858d-f9e36446b71f@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] configs: stm32mp25: Enable MFD timer
 and PWM for stm32mp25_defconfig
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



On 7/28/25 11:04, Patrice CHOTARD wrote:
> 
> 
> On 6/20/25 17:50, Cheick Traore wrote:
>> Enable the following configs:
>>
>> - CONFIG_MFD_STM32_TIMERS: enables support for the STM32 multifunction
>>                            timer
>> - CONFIG_DM_PWM: enables support for pulse-width modulation devices
>> - CONFIG_CMD_PWM: enables 'pwm' command to control PWM channels
>> - CONFIG_PWM_STM32: enables support for the STM32 PWM devices
>>
>> Signed-off-by: Cheick Traore <cheick.traore@foss.st.com>
>> ---
>>
>>  configs/stm32mp25_defconfig | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
>> index acb48f4ec72..3be00c6201e 100644
>> --- a/configs/stm32mp25_defconfig
>> +++ b/configs/stm32mp25_defconfig
>> @@ -24,11 +24,15 @@ CONFIG_SYS_PROMPT="STM32MP> "
>>  CONFIG_CMD_BOOTZ=y
>>  CONFIG_CMD_ADTIMG=y
>>  # CONFIG_CMD_ELF is not set
>> +CONFIG_MFD_STM32_TIMERS=y
>>  CONFIG_CMD_MEMINFO=y
>>  CONFIG_CMD_MEMTEST=y
>> +CONFIG_DM_PWM=y
>> +CONFIG_PWM_STM32=y
>>  CONFIG_CMD_CLK=y
>>  CONFIG_CMD_FUSE=y
>>  CONFIG_CMD_GPIO=y
>> +CONFIG_CMD_PWM=y
>>  # CONFIG_CMD_LOADB is not set
>>  CONFIG_CMD_MMC=y
>>  CONFIG_CMD_CACHE=y
> Hi Cheick
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks

Applied to u-boot-stm32/master

Thanks
Patrice

> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

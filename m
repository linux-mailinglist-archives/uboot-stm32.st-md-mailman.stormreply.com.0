Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF489A590AA
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Mar 2025 11:03:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92A82C78F9B;
	Mon, 10 Mar 2025 10:03:41 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 117BDC78F96
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 10:03:41 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9xX41006776;
 Mon, 10 Mar 2025 11:03:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 M9TUFBIUJ31yS4pZA00dpeMcWmbperRFqIFswm3qyE0=; b=xWTGkfOIx23A5BRh
 EwH8zurSBjUlYR2tCIsQU4XSMUyaqngYRXaKhFPnhuNxU+b5E17l+okZVM/jg0wC
 6JLA8d0xtt5MkoEjVZ7gRwau5yPd8X0WolCvt8sxpvxTDOsiGAQyByP4WKqCMHFO
 QVWBT51JY1O04xk32ai1sa7ZXTkdloaSgCFc9PWlETgt18Hdeu466v0DR2+IRm5B
 txHuVn5Z5tYAYenD3F5aCqUVG//UNhN5b4rVqdBR17qiL/pgtE0f/f+hJhmHhM6E
 rfUmVjgDrBaEa8fKdK2bA43QAvXSvcOjswhMsoMcrGy94jqLSc8rQgBuIdM+UDcL
 kTbSLg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4591qru0xf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Mar 2025 11:03:38 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4EE1B40088;
 Mon, 10 Mar 2025 11:02:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4BB3A57C3A1;
 Mon, 10 Mar 2025 11:00:16 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 11:00:15 +0100
Message-ID: <0770170e-6184-4e03-89b9-30c5a4b01736@foss.st.com>
Date: Mon, 10 Mar 2025 11:00:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Cheick Traore <cheick.traore@foss.st.com>, <u-boot@lists.denx.de>
References: <20250306105620.624760-1-cheick.traore@foss.st.com>
 <20250306115558.4.Ia1fceae36361c33b1ad9e8b92f55e74aafa4078b@changeid>
 <2f0d8af4-a91a-4676-bcf0-f59fcebf9f09@foss.st.com>
Content-Language: en-US
In-Reply-To: <2f0d8af4-a91a-4676-bcf0-f59fcebf9f09@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
Cc: Tom Rini <trini@konsulko.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 4/5] configs: stm32mp13: Enable MFD timer
 and PWM for stm32mp13_defconfig
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



On 3/6/25 15:14, Patrice CHOTARD wrote:
> 
> 
> On 3/6/25 11:56, Cheick Traore wrote:
>> Enable the following configs:
>>
>> * CONFIG_MFD_STM32_TIMERS: enables support for the STM32 multifunction
>>                            timer
>> * CONFIG_DM_PWM: enables support for pulse-width modulation devices
>> * CONFIG_CMD_PWM: enables 'pwm' command to control PWM channels
>> * CONFIG_PWM_STM32: enables support for the STM32 PWM devices
>>
>> Signed-off-by: Cheick Traore <cheick.traore@foss.st.com>
>> ---
>>
>>  configs/stm32mp13_defconfig | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
>> index 0acd1487c9a..4c6a7f82fe5 100644
>> --- a/configs/stm32mp13_defconfig
>> +++ b/configs/stm32mp13_defconfig
>> @@ -10,6 +10,7 @@ CONFIG_SYS_LOAD_ADDR=0xc2000000
>>  CONFIG_STM32MP13X=y
>>  CONFIG_DDR_CACHEABLE_SIZE=0x8000000
>>  CONFIG_CMD_STM32KEY=y
>> +CONFIG_MFD_STM32_TIMERS=y
>>  CONFIG_TARGET_ST_STM32MP13X=y
>>  CONFIG_ENV_OFFSET_REDUND=0x940000
>>  CONFIG_CMD_STM32PROG=y
>> @@ -31,6 +32,7 @@ CONFIG_CMD_UNZIP=y
>>  CONFIG_CMD_CLK=y
>>  CONFIG_CMD_FUSE=y
>>  CONFIG_CMD_GPIO=y
>> +CONFIG_CMD_PWM=y
>>  CONFIG_CMD_I2C=y
>>  CONFIG_CMD_LSBLK=y
>>  CONFIG_CMD_MMC=y
>> @@ -80,6 +82,8 @@ CONFIG_DM_REGULATOR=y
>>  CONFIG_DM_REGULATOR_FIXED=y
>>  CONFIG_DM_REGULATOR_GPIO=y
>>  CONFIG_DM_REGULATOR_SCMI=y
>> +CONFIG_DM_PWM=y
>> +CONFIG_PWM_STM32=y
>>  CONFIG_RESET_SCMI=y
>>  CONFIG_DM_RNG=y
>>  CONFIG_RNG_STM32=y
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
Applied to u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE3CA590FB
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Mar 2025 11:21:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84C47C7A821;
	Mon, 10 Mar 2025 10:21:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92605C7A820
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 10:21:02 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9tjmg030002;
 Mon, 10 Mar 2025 11:20:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 c3Zc/3KVM6atJ5vFavY4bzxRDIr2P2P0tEI2CPGo8vc=; b=rofxaZljdDah0Yuz
 49eLpr2JRjxuT7m7E0PduPEUu76dFDtipeJNXLV4d1TjZc/evmYPEGAeDBLqDpyb
 0nq9wYPHiRUx9VflFj2un7hiY+iJzjxxz9Hi4RZVEO0ohPcnSKlbhCTzF9m233o1
 8t344/Hexc38ZphJ6JTIVTPjwi0tF1qhYNw7czJqtQ/PjnNBz1DpjzRcNlwPnWhK
 STELQdR0TTj1dyPgW9rT/dW3I2+AZvFJMsvNsh90YgK6N+jVmoYfmbmiP7C7/Nfx
 pKtd7OZxzSxkta3ibsULo3QlmchshOyJ4m8pgOl/PdaBWfC0DIYHds8a8cm1ZYJS
 d7S90Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 458ev628fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Mar 2025 11:20:49 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B451040097;
 Mon, 10 Mar 2025 11:19:11 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C87F85810F1;
 Mon, 10 Mar 2025 11:16:28 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 11:16:28 +0100
Message-ID: <41996473-4b3c-4b44-add5-4c20bc550269@foss.st.com>
Date: Mon, 10 Mar 2025 11:16:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20250210013322.350477-1-marex@denx.de>
 <9fb72715-9f68-47a7-9b52-f6ff0e40ca6d@foss.st.com>
Content-Language: en-US
In-Reply-To: <9fb72715-9f68-47a7-9b52-f6ff0e40ca6d@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Add support for
 environment in eMMC on STM32MP13xx DHCOR SoM
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



On 3/6/25 09:35, Patrice CHOTARD wrote:
> 
> 
> On 2/10/25 02:32, Marek Vasut wrote:
>> Enable support for environment in eMMC on STM32MP13xx DHCOR SoM,
>> in addition to existing support for environment in SPI NOR. The
>> environment size is the same, except in case the environment is
>> placed in eMMC, it is stored at the end of eMMC BOOT partitions
>> in the last 32 sectors of each eMMC HW BOOT partition.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Igor Opaniuk <igor.opaniuk@gmail.com>
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi | 2 ++
>>  configs/stm32mp13_dhcor_defconfig          | 4 ++++
>>  2 files changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
>> index 9233f315ebc..3acf5138940 100644
>> --- a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
>> @@ -14,6 +14,8 @@
>>  	config {
>>  		dh,ddr3-coding-gpios = <&gpiod 5 0>, <&gpiod 9 0>;
>>  		dh,som-coding-gpios = <&gpioa 13 0>, <&gpioi 1 0>;
>> +		u-boot,mmc-env-offset = <0x3fc000>;
>> +		u-boot,mmc-env-offset-redundant = <0x3fc000>;
>>  	};
>>  };
>>  
>> diff --git a/configs/stm32mp13_dhcor_defconfig b/configs/stm32mp13_dhcor_defconfig
>> index ff948b904be..2da9287ea7b 100644
>> --- a/configs/stm32mp13_dhcor_defconfig
>> +++ b/configs/stm32mp13_dhcor_defconfig
>> @@ -28,10 +28,14 @@ CONFIG_CMD_RNG=y
>>  CONFIG_CMD_LOG=y
>>  CONFIG_CMD_UBI=y
>>  CONFIG_ENV_IS_NOWHERE=y
>> +CONFIG_ENV_IS_IN_MMC=y
>> +CONFIG_ENV_MMC_USE_DT=y
>>  CONFIG_ENV_SPI_MAX_HZ=50000000
>>  CONFIG_CLK_SCMI=y
>>  CONFIG_SET_DFU_ALT_INFO=y
>>  CONFIG_SYS_I2C_EEPROM_ADDR=0x50
>> +CONFIG_SYS_MMC_ENV_DEV=0
>> +CONFIG_SYS_MMC_ENV_PART=1
>>  CONFIG_PHY_REALTEK=y
>>  CONFIG_DM_REGULATOR_SCMI=y
>>  CONFIG_RESET_SCMI=y
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> PAtrice
Applied to u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

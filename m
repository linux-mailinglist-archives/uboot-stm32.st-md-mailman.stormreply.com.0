Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDA19F63A6
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2024 11:45:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29945C7801F;
	Wed, 18 Dec 2024 10:45:27 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11ABCC7801C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 10:45:21 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI6mXWb021743;
 Wed, 18 Dec 2024 11:45:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 IhAGSz0kON5KPMRIAxMBme/2hJ/CgUx2py+b42Y0/nU=; b=gQvvAIADndWJnh0+
 BvPFyh4LIWnkhiL9tnKvUUM7eG5RiG5h0qvxEAyq78En0oYP/YxHs7sY7DvywyRm
 SFG2k5J/KtHu4liK8dhKn1Hzj3xwgiW7NxIsDtGPi7YEsRcNYFLzr7V08N8THFci
 Hp8aZRlfuuGPwgB5JFTBbUaXGTATqBEN4Fczfqqwyg+UylI7p8EV8Y71OoZGrxJT
 g9S4Os8QUd3/uLRYs8QVe5KfQRJcZjaR/Se/MGJtqFJNgpnUciG0zwZ5N/GLgoYu
 4JAiDvr3MD2IMGlhhDapDYFE7wJL01Vim4WHFCx+8kDtzlgsKkWj6AkU+7V7OFEV
 hfmzRg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43kfu8am85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 11:45:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DF37140072;
 Wed, 18 Dec 2024 11:43:48 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 338B526990E;
 Wed, 18 Dec 2024 11:42:07 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 11:42:06 +0100
Message-ID: <7cb95664-2aaf-4a42-8d33-f382ed2b9dbf@foss.st.com>
Date: Wed, 18 Dec 2024 11:42:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241215233011.569287-1-marex@denx.de>
 <20241215233011.569287-4-marex@denx.de>
 <bd611a96-194c-4522-ac12-08b87e89344b@foss.st.com>
 <9eaf7a79-a690-45dd-8d33-483292bd07a4@foss.st.com>
Content-Language: en-US
In-Reply-To: <9eaf7a79-a690-45dd-8d33-483292bd07a4@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 4/4] ARM: dts: stm32: Deduplicate
 CONFIG_OF_SPL_REMOVE_PROPS on DH STM32MP15xx DHSOM
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



On 12/18/24 11:33, Patrice CHOTARD wrote:
> 
> 
> On 12/16/24 09:53, Patrice CHOTARD wrote:
>>
>>
>> On 12/16/24 00:29, Marek Vasut wrote:
>>> The content of CONFIG_OF_SPL_REMOVE_PROPS is the same in both
>>> STM32MP15xx DHCOM and DHCOR defconfigs, deduplicate the content
>>> into stm32mp15_dhsom.config .
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> ---
>>> NOTE: For 2025.01
>>> ---
>>> Cc: Igor Opaniuk <igor.opaniuk@gmail.com>
>>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>> Cc: Simon Glass <sjg@chromium.org>
>>> Cc: Tom Rini <trini@konsulko.com>
>>> Cc: u-boot@dh-electronics.com
>>> Cc: u-boot@lists.denx.de
>>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>>> ---
>>>  configs/stm32mp15_dhcom_basic_defconfig | 1 -
>>>  configs/stm32mp15_dhcor_basic_defconfig | 1 -
>>>  configs/stm32mp15_dhsom.config          | 1 +
>>>  3 files changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
>>> index 5add66fb2f4..a28f2862048 100644
>>> --- a/configs/stm32mp15_dhcom_basic_defconfig
>>> +++ b/configs/stm32mp15_dhcom_basic_defconfig
>>> @@ -7,5 +7,4 @@ CONFIG_SYS_MEMTEST_START=0xc0000000
>>>  CONFIG_SYS_MEMTEST_END=0xc4000000
>>>  CONFIG_SYS_I2C_EEPROM_BUS=3
>>>  CONFIG_OF_LIST="st/stm32mp157c-dhcom-pdk2 st/stm32mp153c-dhcom-drc02 st/stm32mp157c-dhcom-picoitx"
>>> -CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks access-controllers"
>>>  CONFIG_SYS_I2C_EEPROM_ADDR=0x50
>>> diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
>>> index dd14db3b4c5..f6f2af6e7a2 100644
>>> --- a/configs/stm32mp15_dhcor_basic_defconfig
>>> +++ b/configs/stm32mp15_dhcor_basic_defconfig
>>> @@ -5,7 +5,6 @@ CONFIG_ARCH_STM32MP=y
>>>  CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp157a-dhcor-avenger96"
>>>  CONFIG_SYS_I2C_EEPROM_BUS=2
>>>  CONFIG_OF_LIST="st/stm32mp157a-dhcor-avenger96 st/stm32mp151a-dhcor-testbench st/stm32mp153c-dhcor-drc-compact"
>>> -CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks access-controllers"
>>>  CONFIG_SYS_I2C_EEPROM_ADDR=0x53
>>>  CONFIG_PHY_MICREL=y
>>>  CONFIG_PHY_MICREL_KSZ90X1=y
>>> diff --git a/configs/stm32mp15_dhsom.config b/configs/stm32mp15_dhsom.config
>>> index 04ee9bfc444..ac3ae82cda9 100644
>>> --- a/configs/stm32mp15_dhsom.config
>>> +++ b/configs/stm32mp15_dhsom.config
>>> @@ -22,6 +22,7 @@ CONFIG_HAS_BOARD_SIZE_LIMIT=y
>>>  CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
>>>  CONFIG_HWSPINLOCK_STM32=y
>>>  CONFIG_KS8851_MLL=y
>>> +CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks access-controllers"
>>>  CONFIG_PHY_ANEG_TIMEOUT=20000
>>>  CONFIG_PINCTRL_STMFX=y
>>>  CONFIG_REMOTEPROC_STM32_COPRO=y
>>
>> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Applied to u-boot-stm32/next
> 
> Thanks
> Patrice

Sorry, applied to u-boot-stm32/master

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

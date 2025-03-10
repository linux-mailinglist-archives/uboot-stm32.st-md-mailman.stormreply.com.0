Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FEEA590D7
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Mar 2025 11:15:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 794CEC78F96;
	Mon, 10 Mar 2025 10:15:05 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E00C9C7802E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 10:15:04 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9xXAM006776;
 Mon, 10 Mar 2025 11:14:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 FcCDje1gpcJmkQxoRqT5HqWhdZTshj/U6fDoo24M+Qc=; b=6Y/HAyt0Aafujd4V
 zxvT/JZJ8XlC0eUhOyT6WqlfM2CSagCN8o4l2YjHjf6nr0YZ1QeECPyhaMKwEGFn
 F0O3Mdbim4z8tZBpTQK4ovxivOmpqSy90S5XarKPpQns1+LP9YYQpF3ZbTmtelip
 00SBeEoo1f10aN5HhTQkPXX9fOTbYeePCIKxL6E6zRsj8NYke/pNfAQXSLZxgh7M
 UnAO/cqnHZ5P0Nv1HM3L5gVV20ASsG96XgmRePEeMEoQB9xqy3FWWqfPJ/0F5oWN
 Il3ah9/4iyjhtdKZXqumYXYmRHgFPNpAvfXmqCTlLA/28VU249oqCHCPY8FEEDvG
 NPORRw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4591qru4p2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Mar 2025 11:14:54 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 611C14005B;
 Mon, 10 Mar 2025 11:13:55 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 67ACE592182;
 Mon, 10 Mar 2025 11:12:44 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 11:12:43 +0100
Message-ID: <320e0827-846e-46d4-979c-a50853001855@foss.st.com>
Date: Mon, 10 Mar 2025 11:12:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20250222171438.90953-1-marex@denx.de>
 <f3e5fa17-20fe-4041-b781-05e5c73300bf@foss.st.com>
Content-Language: en-US
In-Reply-To: <f3e5fa17-20fe-4041-b781-05e5c73300bf@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Introduce DH STM32MP15xx
 DHSOM board specific defconfigs
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



On 3/6/25 09:28, Patrice CHOTARD wrote:
> 
> 
> On 2/22/25 18:13, Marek Vasut wrote:
>> Move stm32mp15_dhcom_basic_defconfig into stm32mp15_dhcom_basic.config.
>> Retain legacy stm32mp15_dhcom_basic_defconfig as multi-config for all
>> DH STM32MP15xx DHCOM based boards. Move stm32mp15_dhsor_basic_defconfig
>> into stm32mp15_dhsor_basic.config. Retain stm32mp15_dhsor_basic_defconfig
>> as multi-config for all DH STM32MP15xx DHCOR based boards.
>>
>> Introduce separate stm32mp15_dhcom_drc02_basic_defconfig,
>> stm32mp15_dhcom_pdk2_basic_defconfig, stm32mp15_dhcom_picoitx_basic_defconfig
>> for each STM32MP15xx DHCOM based board and separate
>> stm32mp15_dhcor_avenger96_basic_defconfig,
>> stm32mp15_dhcor_drc_compact_basic_defconfig,
>> stm32mp15_dhcor_testbench_basic_defconfig for each
>> STM32MP15xx DHCOR based board, to make build for those boards easier.
>> No functional change.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  configs/stm32mp15_dhcom_basic.config                | 8 ++++++++
>>  configs/stm32mp15_dhcom_basic_defconfig             | 8 +-------
>>  configs/stm32mp15_dhcom_drc02_basic_defconfig       | 4 ++++
>>  configs/stm32mp15_dhcom_pdk2_basic_defconfig        | 4 ++++
>>  configs/stm32mp15_dhcom_picoitx_basic_defconfig     | 4 ++++
>>  configs/stm32mp15_dhcor_avenger96_basic_defconfig   | 4 ++++
>>  configs/stm32mp15_dhcor_basic.config                | 8 ++++++++
>>  configs/stm32mp15_dhcor_basic_defconfig             | 8 +-------
>>  configs/stm32mp15_dhcor_drc_compact_basic_defconfig | 4 ++++
>>  configs/stm32mp15_dhcor_testbench_basic_defconfig   | 4 ++++
>>  10 files changed, 42 insertions(+), 14 deletions(-)
>>  create mode 100644 configs/stm32mp15_dhcom_basic.config
>>  create mode 100644 configs/stm32mp15_dhcom_drc02_basic_defconfig
>>  create mode 100644 configs/stm32mp15_dhcom_pdk2_basic_defconfig
>>  create mode 100644 configs/stm32mp15_dhcom_picoitx_basic_defconfig
>>  create mode 100644 configs/stm32mp15_dhcor_avenger96_basic_defconfig
>>  create mode 100644 configs/stm32mp15_dhcor_basic.config
>>  create mode 100644 configs/stm32mp15_dhcor_drc_compact_basic_defconfig
>>  create mode 100644 configs/stm32mp15_dhcor_testbench_basic_defconfig
>>
>> diff --git a/configs/stm32mp15_dhcom_basic.config b/configs/stm32mp15_dhcom_basic.config
>> new file mode 100644
>> index 00000000000..d78916bb5b2
>> --- /dev/null
>> +++ b/configs/stm32mp15_dhcom_basic.config
>> @@ -0,0 +1,8 @@
>> +#include <configs/stm32mp15_dhsom.config>
>> +
>> +CONFIG_ARM=y
>> +CONFIG_ARCH_STM32MP=y
>> +CONFIG_SYS_MEMTEST_START=0xc0000000
>> +CONFIG_SYS_MEMTEST_END=0xc4000000
>> +CONFIG_SYS_I2C_EEPROM_BUS=3
>> +CONFIG_SYS_I2C_EEPROM_ADDR=0x50
>> diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
>> index a28f2862048..297092bd746 100644
>> --- a/configs/stm32mp15_dhcom_basic_defconfig
>> +++ b/configs/stm32mp15_dhcom_basic_defconfig
>> @@ -1,10 +1,4 @@
>> -#include <configs/stm32mp15_dhsom.config>
>> +#include <configs/stm32mp15_dhcom_basic.config>
>>  
>> -CONFIG_ARM=y
>> -CONFIG_ARCH_STM32MP=y
>>  CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp157c-dhcom-pdk2"
>> -CONFIG_SYS_MEMTEST_START=0xc0000000
>> -CONFIG_SYS_MEMTEST_END=0xc4000000
>> -CONFIG_SYS_I2C_EEPROM_BUS=3
>>  CONFIG_OF_LIST="st/stm32mp157c-dhcom-pdk2 st/stm32mp153c-dhcom-drc02 st/stm32mp157c-dhcom-picoitx"
>> -CONFIG_SYS_I2C_EEPROM_ADDR=0x50
>> diff --git a/configs/stm32mp15_dhcom_drc02_basic_defconfig b/configs/stm32mp15_dhcom_drc02_basic_defconfig
>> new file mode 100644
>> index 00000000000..838c3db253d
>> --- /dev/null
>> +++ b/configs/stm32mp15_dhcom_drc02_basic_defconfig
>> @@ -0,0 +1,4 @@
>> +#include <configs/stm32mp15_dhcom_basic.config>
>> +
>> +CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp153c-dhcom-drc02"
>> +CONFIG_OF_LIST="st/stm32mp153c-dhcom-drc02"
>> diff --git a/configs/stm32mp15_dhcom_pdk2_basic_defconfig b/configs/stm32mp15_dhcom_pdk2_basic_defconfig
>> new file mode 100644
>> index 00000000000..c6996233c9f
>> --- /dev/null
>> +++ b/configs/stm32mp15_dhcom_pdk2_basic_defconfig
>> @@ -0,0 +1,4 @@
>> +#include <configs/stm32mp15_dhcom_basic.config>
>> +
>> +CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp157c-dhcom-pdk2"
>> +CONFIG_OF_LIST="st/stm32mp157c-dhcom-pdk2"
>> diff --git a/configs/stm32mp15_dhcom_picoitx_basic_defconfig b/configs/stm32mp15_dhcom_picoitx_basic_defconfig
>> new file mode 100644
>> index 00000000000..5682edbfcbf
>> --- /dev/null
>> +++ b/configs/stm32mp15_dhcom_picoitx_basic_defconfig
>> @@ -0,0 +1,4 @@
>> +#include <configs/stm32mp15_dhcom_basic.config>
>> +
>> +CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp157c-dhcom-picoitx"
>> +CONFIG_OF_LIST="st/stm32mp157c-dhcom-picoitx"
>> diff --git a/configs/stm32mp15_dhcor_avenger96_basic_defconfig b/configs/stm32mp15_dhcor_avenger96_basic_defconfig
>> new file mode 100644
>> index 00000000000..5d27cd5ed7e
>> --- /dev/null
>> +++ b/configs/stm32mp15_dhcor_avenger96_basic_defconfig
>> @@ -0,0 +1,4 @@
>> +#include <configs/stm32mp15_dhcor_basic.config>
>> +
>> +CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp157a-dhcor-avenger96"
>> +CONFIG_OF_LIST="st/stm32mp157a-dhcor-avenger96"
>> diff --git a/configs/stm32mp15_dhcor_basic.config b/configs/stm32mp15_dhcor_basic.config
>> new file mode 100644
>> index 00000000000..e9c0cb9f95a
>> --- /dev/null
>> +++ b/configs/stm32mp15_dhcor_basic.config
>> @@ -0,0 +1,8 @@
>> +#include <configs/stm32mp15_dhsom.config>
>> +
>> +CONFIG_ARM=y
>> +CONFIG_ARCH_STM32MP=y
>> +CONFIG_SYS_I2C_EEPROM_BUS=2
>> +CONFIG_SYS_I2C_EEPROM_ADDR=0x53
>> +CONFIG_PHY_MICREL=y
>> +CONFIG_PHY_MICREL_KSZ90X1=y
>> diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
>> index f6f2af6e7a2..beb6d1d5a9a 100644
>> --- a/configs/stm32mp15_dhcor_basic_defconfig
>> +++ b/configs/stm32mp15_dhcor_basic_defconfig
>> @@ -1,10 +1,4 @@
>> -#include <configs/stm32mp15_dhsom.config>
>> +#include <configs/stm32mp15_dhcor_basic.config>
>>  
>> -CONFIG_ARM=y
>> -CONFIG_ARCH_STM32MP=y
>>  CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp157a-dhcor-avenger96"
>> -CONFIG_SYS_I2C_EEPROM_BUS=2
>>  CONFIG_OF_LIST="st/stm32mp157a-dhcor-avenger96 st/stm32mp151a-dhcor-testbench st/stm32mp153c-dhcor-drc-compact"
>> -CONFIG_SYS_I2C_EEPROM_ADDR=0x53
>> -CONFIG_PHY_MICREL=y
>> -CONFIG_PHY_MICREL_KSZ90X1=y
>> diff --git a/configs/stm32mp15_dhcor_drc_compact_basic_defconfig b/configs/stm32mp15_dhcor_drc_compact_basic_defconfig
>> new file mode 100644
>> index 00000000000..7b1d73a33b5
>> --- /dev/null
>> +++ b/configs/stm32mp15_dhcor_drc_compact_basic_defconfig
>> @@ -0,0 +1,4 @@
>> +#include <configs/stm32mp15_dhcor_basic.config>
>> +
>> +CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp153c-dhcor-drc-compact"
>> +CONFIG_OF_LIST="st/stm32mp153c-dhcor-drc-compact"
>> diff --git a/configs/stm32mp15_dhcor_testbench_basic_defconfig b/configs/stm32mp15_dhcor_testbench_basic_defconfig
>> new file mode 100644
>> index 00000000000..7ba327cbd82
>> --- /dev/null
>> +++ b/configs/stm32mp15_dhcor_testbench_basic_defconfig
>> @@ -0,0 +1,4 @@
>> +#include <configs/stm32mp15_dhcor_basic.config>
>> +
>> +CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp151a-dhcor-testbench"
>> +CONFIG_OF_LIST="st/stm32mp151a-dhcor-testbench"
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

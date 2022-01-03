Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B493483786
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Jan 2022 20:24:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48E62C5F1F3;
	Mon,  3 Jan 2022 19:24:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FF82C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jan 2022 19:24:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 203J0GPm006398;
 Mon, 3 Jan 2022 20:23:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=f61el9pWEavxoNwWslyZx7aED4oKGC05virqeIoSCWg=;
 b=n/f2DRpgvbJFbJ0aHkGO6qo7S0tP8B1QQ9UttAuLNGMXeyl3MCE84m4BJJ4L/I1EKQK0
 vRgxIXlXHQej+TGU1i8ey5UO1t2fCq4WxErS7+H4KcDm4C3zag4SflMwI3gqXzFGamOL
 QU72vr7dKfC06Im2xeaJxW5heg3Sm8UX2Cw5lHZeB1kGAd5A2cv5RrZh1EcTDxTFUxvY
 /yEsQtLMPpvN7ITGHRrpUbO4sGM/GQqbrS2QK+H3+Y+9GqMzVahMMqWaSdOViQkRVodN
 poBCY6UDrbDanax1Ub3zAvyES0FTnn8G9G17QJx4oljWbp+MsyHeQ+GggZScZ14pBkgw KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dbp33uhsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 20:23:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2E0CA10002A;
 Mon,  3 Jan 2022 20:23:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8F9A22122F2;
 Mon,  3 Jan 2022 20:23:41 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 3 Jan
 2022 20:23:40 +0100
To: Simon Glass <sjg@chromium.org>
References: <20211214165704.479015-1-patrick.delaunay@foss.st.com>
 <20211214175652.RFC.5.I5fc8065d06afb12c358588f9078ba15b1cbbe94c@changeid>
 <CAPnjgZ3hrh4S7XC3xKEHaCmC67-FZe9BwP7H0M80Zqz+S+pPug@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <470d4868-d0b7-4047-d9f9-2a0f5aec3565@foss.st.com>
Date: Mon, 3 Jan 2022 20:23:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ3hrh4S7XC3xKEHaCmC67-FZe9BwP7H0M80Zqz+S+pPug@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_07,2022-01-01_01,2021-12-02_01
Cc: Marek Vasut <marex@denx.de>, Priyanka Jain <priyanka.jain@nxp.com>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
 U-Boot Mailing List <u-boot@lists.denx.de>, egnite GmbH <info@egnite.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [RFC PATCH 5/5] Convert CONFIG_AT91_EFLASH to
	Kconfig
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

Hi Simon,

On 12/28/21 9:32 AM, Simon Glass wrote:
> On Tue, 14 Dec 2021 at 09:57, Patrick Delaunay
> <patrick.delaunay@foss.st.com> wrote:
>> This converts the following to Kconfig:
>>     CONFIG_AT91_EFLASH
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>   arch/arm/mach-at91/Kconfig   | 8 ++++++++
>>   configs/ethernut5_defconfig  | 2 +-
>>   include/configs/ethernut5.h  | 1 -
>>   scripts/config_whitelist.txt | 1 -
>>   4 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
>> index 4448ca1592..5267a7d15d 100644
>> --- a/arch/arm/mach-at91/Kconfig
>> +++ b/arch/arm/mach-at91/Kconfig
>> @@ -302,6 +302,14 @@ config ATMEL_SFR
>>   config SYS_SOC
>>          default "at91"
>>
>> +config AT91_EFLASH
>> +       bool "Support AT91 flash driver"
>> +       depends on AT91SAM9XE
>> +       select USE_SYS_MAX_FLASH_BANKS
>> +       help
>> +         Enable the driver for the enhanced embedded flash in the Atmel
>> +         AT91SAM9XE devices.
> Reviewed-by: Simon Glass <sjg@chromium.org>
>
> Please describe what it actually means. Enhanced in what way?

I will dropped the "enhanced" word, copied for header
of arch/arm/mach-at91/arm926ejs/eflash.c


/*
  * this driver supports the enhanced embedded flash in the Atmel
  * AT91SAM9XE devices with the following geometry:
  *
  * AT91SAM9XE128: 1 plane of  8 regions of 32 pages (total  256 pages)
  * AT91SAM9XE256: 1 plane of 16 regions of 32 pages (total  512 pages)
  * AT91SAM9XE512: 1 plane of 32 regions of 32 pages (total 1024 pages)
  * (the exact geometry is read from the flash at runtime, so any
  *  future devices should already be covered)

....


but not present in commit header

d88bebe16d81 ("AT91SAM9XE: add embedded flash support")


It is more clear

>
> Regards,
> Simon


Thanks

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

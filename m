Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D00315BCFBD
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Sep 2022 16:59:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82F50C0D2C0;
	Mon, 19 Sep 2022 14:59:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E027C01577
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 14:59:15 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28JEECiA008297;
 Mon, 19 Sep 2022 16:59:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=29UZ1Xns3oYYRm38oz6u24CYrr6+gGJJR3DF8cthxzA=;
 b=d+5H0qvJQZOmQ4jHgyQ/UkkFVVukSiHLCPPh8/oXaHgyIddQZKKkHlnlJ7zu+211Y7TX
 HyokGKsXQ8MSQ8YRKaKng62wghhV8a2H5EF5e7htmTw/ILpkXDQuT1VAkBhvyUz8GOr7
 UuJOLmLM914uqz5nnetK+WTN4R18M44SYl7m8AIDgpZxMOx+botkEs4oobKHK7NjFa4N
 d6wCG1a/MYwxV5e+6kqdvpF2hSRYzp7o4E9tv1BxpRdugVZAK8Yhi8sdMit3daWR2r4R
 MVRSQhSJtRultqNA0Qs2J+Gw7spygML8pqanXbNB4AeY/SFIjwMpth2jzXwqp72pF7Ph Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jn6g53hq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Sep 2022 16:59:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C801810002A;
 Mon, 19 Sep 2022 16:59:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D3D8237D7C;
 Mon, 19 Sep 2022 16:59:12 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.118) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 16:59:08 +0200
Message-ID: <cf68a746-41ad-1b94-1ad7-d4b462bb45d1@foss.st.com>
Date: Mon, 19 Sep 2022 16:59:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Oleksandr Suvorov <cryosay@gmail.com>, "Jorge Ramirez-Ortiz, Foundries"
 <jorge@foundries.io>
References: <20220830195049.1068973-1-jorge@foundries.io>
 <20220905163212.GA2219123@trex>
 <CAGgjyvEQNdKvEuxg3qh3i6Ykyx9=fZdwq-Tf0JPhJ7zeLtqaZw@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <CAGgjyvEQNdKvEuxg3qh3i6Ykyx9=fZdwq-Tf0JPhJ7zeLtqaZw@mail.gmail.com>
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_05,2022-09-16_01,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 mike@foundries.io
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp*: reset via
	CONFIG_RESET_SCMI
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

On 9/5/22 19:01, Oleksandr Suvorov wrote:
> Jorge,
>
> I think, renaming the patch to "fix" and adding a field "Fixes:"
> should help accept it faster.
>
> On Mon, Sep 5, 2022 at 7:32 PM Jorge Ramirez-Ortiz, Foundries
> <jorge@foundries.io> wrote:
>> On 30/08/22, Jorge Ramirez-Ortiz wrote:
>>> Enabling CONFIG_SYSRESET_PSCI prevents CONFIG_RESET_SCMI
>>> from executing.
>>>
>>> The side effect observed are I2C devices no longer being
>>> accessible from U-boot after a soft reset.
>> I think this PR should get a bit more of attention.
>>
>> The current reset configuration is broken, this is a fix.
>> Do I need to rename the PR?
>>
>> TIA
>> jorge
>>
>>
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
>>> ---
>>>   configs/stm32mp13_defconfig         | 1 -
>>>   configs/stm32mp15_defconfig         | 1 -
>>>   configs/stm32mp15_trusted_defconfig | 1 -
>>>   3 files changed, 3 deletions(-)
>>>
>>> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
>>> index 673b468d31..44cee2e656 100644
>>> --- a/configs/stm32mp13_defconfig
>>> +++ b/configs/stm32mp13_defconfig
>>> @@ -69,7 +69,6 @@ CONFIG_RNG_OPTEE=y
>>>   CONFIG_DM_RTC=y
>>>   CONFIG_RTC_STM32=y
>>>   CONFIG_SERIAL_RX_BUFFER=y
>>> -CONFIG_SYSRESET_PSCI=y
>>>   CONFIG_TEE=y
>>>   CONFIG_OPTEE=y
>>>   # CONFIG_OPTEE_TA_AVB is not set
>>> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
>>> index e5a2996c2c..2ad02f3652 100644
>>> --- a/configs/stm32mp15_defconfig
>>> +++ b/configs/stm32mp15_defconfig
>>> @@ -133,7 +133,6 @@ CONFIG_SPI=y
>>>   CONFIG_DM_SPI=y
>>>   CONFIG_STM32_QSPI=y
>>>   CONFIG_STM32_SPI=y
>>> -CONFIG_SYSRESET_PSCI=y
>>>   CONFIG_TEE=y
>>>   CONFIG_OPTEE=y
>>>   # CONFIG_OPTEE_TA_AVB is not set
>>> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
>>> index e14668042f..9e24e82920 100644
>>> --- a/configs/stm32mp15_trusted_defconfig
>>> +++ b/configs/stm32mp15_trusted_defconfig
>>> @@ -134,7 +134,6 @@ CONFIG_SPI=y
>>>   CONFIG_DM_SPI=y
>>>   CONFIG_STM32_QSPI=y
>>>   CONFIG_STM32_SPI=y
>>> -CONFIG_SYSRESET_PSCI=y
>>>   CONFIG_TEE=y
>>>   CONFIG_OPTEE=y
>>>   # CONFIG_OPTEE_TA_AVB is not set
>>> --
>>> 2.34.1
>>>
>
>

This patch it is superseded by "configs: stm32mp*: fix system reset"

http://patchwork.ozlabs.org/project/uboot/list/?series=316914&state=*

http://patchwork.ozlabs.org/project/uboot/patch/20220905173357.2231466-1-jorge@foundries.io/


with the added "Fixes:"


Regards


Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F31E126A
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 08:47:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6745C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 06:47:49 +0000 (UTC)
Received: from skedge03.snt-world.com (skedge03.snt-world.com [91.208.41.68])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C0F0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 06:47:47 +0000 (UTC)
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id 98ADD76C3EE;
 Wed, 23 Oct 2019 08:47:44 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail11s.snt-is.com
 (10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 23 Oct
 2019 08:47:44 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Wed, 23 Oct 2019 08:47:44 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Jagan Teki <jagan@amarulasolutions.com>
Thread-Topic: [U-Boot] [PATCH 2/3] stm32mp1: configs: Add
 CONFIG_SPL_SPI_FLASH_MTD
Thread-Index: AQHVaoSy12LfEaTQNUKdlZQmpgzfaKddiHeAgADs/ICACEN7gIAAWF2AgADTroA=
Date: Wed, 23 Oct 2019 06:47:44 +0000
Message-ID: <971009ea-9a8f-248f-df07-28c52f760cf2@kontron.de>
References: <20190913224242.21054-1-frieder.schrempf@kontron.de>
 <20190913224242.21054-2-frieder.schrempf@kontron.de>
 <CAMty3ZCZgL4wrZpwXcPLZAaGzG2uMHs2zftoPkjSV8b2geNw8g@mail.gmail.com>
 <7dc4a580-c49f-7371-56f2-a2d56198a060@kontron.de>
 <fc9cb551-87ab-a8ce-c719-c7fc498c13da@kontron.de>
 <CAMty3ZCiKYYozP60mVVDNtih6WXVC7tFv6Pp75gRDMQD+jqGCA@mail.gmail.com>
In-Reply-To: <CAMty3ZCiKYYozP60mVVDNtih6WXVC7tFv6Pp75gRDMQD+jqGCA@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <3502FE14B54C774AB75E1F3C98483E0F@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 98ADD76C3EE.AFBDB
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: jagan@amarulasolutions.com, lukma@denx.de,
 patrick.delaunay@st.com, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com
X-Spam-Status: No
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, "lukma@denx.de" <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH 2/3] stm32mp1: configs: Add
 CONFIG_SPL_SPI_FLASH_MTD
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

Hi Jagan,

On 22.10.19 20:10, Jagan Teki wrote:
> On Tue, Oct 22, 2019 at 6:23 PM Schrempf Frieder
> <frieder.schrempf@kontron.de> wrote:
>>
>> Hi Jagan,
>>
>> On 17.10.19 08:42, Frieder Schrempf wrote:
>>> Hi Jagan,
>>>
>>> On 16.10.19 18:34, Jagan Teki wrote:
>>>> On Sat, Sep 14, 2019 at 4:18 AM Schrempf Frieder
>>>> <frieder.schrempf@kontron.de> wrote:
>>>>>
>>>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>>>
>>>>> As SPI_FLASH_MTD is used in SPL and U-Boot proper, we enable both,
>>>>> now that a separate option for SPL was introduced.
>>>>>
>>>>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>>> ---
>>>>>    configs/stm32mp15_basic_defconfig | 3 ++-
>>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/configs/stm32mp15_basic_defconfig
>>>>> b/configs/stm32mp15_basic_defconfig
>>>>> index 09785b5dc1..390319657f 100644
>>>>> --- a/configs/stm32mp15_basic_defconfig
>>>>> +++ b/configs/stm32mp15_basic_defconfig
>>>>> @@ -7,10 +7,10 @@ CONFIG_TARGET_STM32MP1=y
>>>>>    CONFIG_SPL_SPI_FLASH_SUPPORT=y
>>>>>    CONFIG_SPL_SPI_SUPPORT=y
>>>>>    # CONFIG_ARMV7_VIRT is not set
>>>>> +CONFIG_SPL_TEXT_BASE=0x2FFC2500
>>>>>    CONFIG_DISTRO_DEFAULTS=y
>>>>>    CONFIG_FIT=y
>>>>>    CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
>>>>> -CONFIG_SPL_TEXT_BASE=0x2FFC2500
>>>>
>>>> Unrelated change wrt to commit message?
>>>
>>> Yes, this is unrelated, but that's what 'menuconfig' and 'savedefconfig'
>>> gave me as output. So I would think it's ok. If you don't think so, feel
>>> free to remove this change or let me know if I should remove it.
>>
>> In patchwork all three patches of this series are marked with "Changes
>> Requested". Can you please let me know what needs to be fixed?
> 
> Thought you might drop that unrelated change and send next version,
> but anyway I have changed and

I have asked you to "let me know if I should remove it" above and you 
didn't do so. Therefore I assumed you do it yourself, or you apply it as is.

> 
> Applied to u-boot-spi/master
> 

Anyway, thanks a lot!

Regards,
Frieder
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B03352F04E
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 18:13:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A8A5C03FD1;
	Fri, 20 May 2022 16:13:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44884C03FCD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 16:13:47 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24KFFgPH004615;
 Fri, 20 May 2022 18:13:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=41vTopALHridy+4sQG4xdY89dkH7cRvGaIggJeByxL0=;
 b=xg4wE3mtc+IyWyNL2ARN5DDAcWSQ3oIlryUvefDaZPCyAPZ6ro1QSfO0EuzoJFKSB8WK
 ea2pSdI0YKgbnEfoKgEF9c3fH6rFO7hPwhOJ1qTzOFeRRPFB2+sEBtIC9yqrZ0n2PvUG
 TotFY/z6T+vHfSC8rKN6OLczL7RJcPoEzoNp3f4dNclfAOoA334Yj7E/XVdjg0I5IGzQ
 EL3aeX/OPBGPNkjzEscipvswDN8yBrQRmf+1tbBY7xHyJppEM4yiTaZt30F2VnrbFpof
 GT6LniR+A1h/IcV57U0YCWFd2CbezfiwoexArwXpym0HI0+U6IW1pHkx/NRY0XNwpI5D Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23s256cq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 18:13:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E901B100034;
 Fri, 20 May 2022 18:13:44 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BCE5125E500;
 Fri, 20 May 2022 18:13:44 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.49) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 18:13:41 +0200
Message-ID: <3ec2a96f-deb7-2d16-0571-25665b4a659f@foss.st.com>
Date: Fri, 20 May 2022 18:13:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
 <20220506160540.16.Ia54d641fbe9119451443b79f0db8cb80453ab3f3@changeid>
 <28e62cb3-955d-1631-add1-f99c1e34b7e4@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <28e62cb3-955d-1631-add1-f99c1e34b7e4@foss.st.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_04,2022-05-20_02,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 16/16] doc: st: stm32mp1: add STM32MP13x
	support
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

On 5/20/22 09:21, Patrice CHOTARD wrote:
> Hi PAtrick
>
> typos below
>
> On 5/6/22 16:06, Patrick Delaunay wrote:
>> Add in U-Boot documentation the quick instruction for
> s/for/to
ok
>
>> setup the STMicroelectronics STM32MP13x boards.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>   doc/board/st/stm32mp1.rst | 181 ++++++++++++++++++++++++++------------
>>   1 file changed, 125 insertions(+), 56 deletions(-)
>>
>> diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
>> index 0c5d3a90f0..25d38d337a 100644
>> --- a/doc/board/st/stm32mp1.rst
>> +++ b/doc/board/st/stm32mp1.rst
>> @@ -1,41 +1,31 @@
>>   .. SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
>>   .. sectionauthor:: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>   
>> -STM32MP15x boards
>> +STM32MP1xx boards
>>   =================
>>   
>> -This is a quick instruction for setup STM32MP15x boards.
>> +This is a quick instruction for setup STMicroelectronics STM32MP1xx boards.
>>   
>>   Futher information can be found in STMicrolectronics STM32 WIKI_.
> s/Futher/Further
ok
>
>>   
>>   Supported devices
>>   -----------------
>>   
>> -U-Boot supports STMP32MP15x SoCs:
>> +U-Boot supports all the STMicroelectronics MPU with the associated boards
>>   
>> - - STM32MP157
>> - - STM32MP153
>> - - STM32MP151

[...]

>>
>> +
>> +STM32MP15x
>> +``````````
>> +
>> +The STM32MP15x is a Cortex-A7 MPU aimed at various applications.
>> +
>> +It features:
>> +
>> + - Dual core Cortex-A7 application core (Single on STM32MP151)
>> + - 2D/3D image composition with GPU (only on STM32MP157)
>> + - Standard memories interface support
>> + - Standard connectivity, widely inherited from the STM32 MCU family
>> + - Comprehensive security support
>> + - Cortex M4 coprocessor
> s/coprocessor/co-processor

coprocessor is good for me:

https://en.wikipedia.org/wiki/Coprocessor

it is also used in ST Wiki

https://wiki.st.com/stm32mpu/wiki/Category:Coprocessor_management_Linux


>
>> +
>> +Each line comes with a security option (cryptography & secure boot) and
>> +a Cortex-A frequency option:
>> +
>> + - A : Cortex-A7 @ 650 MHz
>> + - C : Secure Boot + HW Crypto + Cortex-A7 @ 650 MHz
>> + - D : Cortex-A7 @ 800 MHz
>> + - F : Secure Boot + HW Crypto + Cortex-A7 @ 800 MHz
>>   
>>   Currently the following boards are supported:
>>   
>> @@ -59,6 +77,16 @@ Currently the following boards are supported:
>>    + stm32mp157c-ev1.dts
>>    + stm32mp15xx-dhcor-avenger96.dts

[...]

>>   
>>        # export KBUILD_OUTPUT=stm32mp15_basic
>>        # make stm32mp15_basic_defconfig
>> @@ -235,6 +292,7 @@ Build Procedure
>>      So in the output directory (selected by KBUILD_OUTPUT),
>>      you can found the needed U-Boot files:
>>   
>> +     - stm32mp13_defconfig = **u-boot-nodtb.bin** and **u-boot.dtb**
>>        - stm32mp15_defconfig = **u-boot-nodtb.bin** and **u-boot.dtb**
>>   
>>        - stm32mp15_trusted_defconfig = u-boot.stm32
>> @@ -325,9 +383,9 @@ the boot pin values = BOOT0, BOOT1, BOOT2
>>     | SPI-NAND    |  1      |  1      |  1      |
>>     +-------------+---------+---------+---------+
>>   
>> -- on the **daugther board ed1 = MB1263** with the switch SW1
>> -- on **Avenger96** with switch S3 (NOR and SPI-NAND are not applicable)
>> -- on board **DK1/DK2** with the switch SW1 = BOOT0, BOOT2
>> +- on the STM32MP15x **daugther board ed1 = MB1263** with the switch SW1
> s/daugther/daughter
ok
>
>> +- on STM32MP15x **Avenger96** with switch S3 (NOR and SPI-NAND are not applicable)
>> +- on board STM32MP15x **DK1/DK2** with the switch SW1 = BOOT0, BOOT2
>>     with only 2 pins available (BOOT1 is forced to 0 and NOR not supported),
>>     the possible value becomes:
>>   
>> @@ -355,7 +413,7 @@ The communication between HOST and board is based on
>>   Prepare an SD card
>>   ------------------
>>   
>> -The minimal requirements for STMP32MP15x boot up to U-Boot are:
>> +The minimal requirements for STMP32MP15x and STM32MP13x boot up to U-Boot are:
>>   
>>   - GPT partitioning (with gdisk or with sgdisk)
>>   - 2 fsbl partitions, named "fsbl1" and "fsbl2", size at least 256KiB
>> @@ -511,14 +569,25 @@ MAC Address
>>   Please read doc/README.enetaddr for the implementation guidelines for mac id
>>   usage. Basically, environment has precedence over board specific storage.
>>   
>> -For STMicroelectonics board, it is retrieved in STM32MP15x OTP :
>> +For STMicroelectonics board, it is retrieved in:
> s/STMicroelectonics/STMicroelectronics
OK
>
>> +
>> + - STM32MP15x OTP:
>>   
>> - - OTP_57[31:0] = MAC_ADDR[31:0]
>> - - OTP_58[15:0] = MAC_ADDR[47:32]
>> +   - OTP_57[31:0] = MAC_ADDR[31:0]
>> +   - OTP_58[15:0] = MAC_ADDR[47:32]
>>   
>> -To program a MAC address on virgin OTP words above, you can use the fuse command
>> + - STM32MP13x OTP:
>> +
>> +  - OTP_57[31:0]  = MAC_ADDR0[31:0]
>> +  - OTP_58[15:0]  = MAC_ADDR0[47:32]
>> +  - OTP_58[31:16] = MAC_ADDR1[15:0]
>> +  - OTP_59[31:0]  = MAC_ADDR1[47:16]
>> +
>> +To program a MAC address on virgin STM32MP15x OTP words above, you can use the fuse command
>>   on bank 0 to access to internal OTP and lock them:
>>   
>> +In the next example we are using the 2 OTPs used on STM32MP15x.
>> +
>>   Prerequisite: check if a MAC address isn't yet programmed in OTP
>>   
>>   1) check OTP: their value must be equal to 0::
>> @@ -571,8 +640,8 @@ Example to set mac address "12:34:56:78:9a:bc"
>>                OTP are protected. It is already done for the board
>>                provided by STMicroelectronics.
>>   
>> -Coprocessor firmware
>> ---------------------
>> +Coprocessor firmware on STM32MP15x
> s/Coprocessor/Co-processor
Same
>
>> +----------------------------------
>>   
>>   U-Boot can boot the coprocessor before the kernel (coprocessor early boot).
> s/coprocessor/co-processor
Same
>
>>   
>> @@ -678,7 +747,7 @@ All the supported device are exported for dfu-util tool::
>>   
>>   You can update the boot device:
>>   
>> -- SD card (mmc0) ::
>> +- SD card (mmc0)::
>>   
>>     $> dfu-util -d 0483:5720 -a 3 -D tf-a-stm32mp157c-ev1.stm32
>>     $> dfu-util -d 0483:5720 -a 4 -D tf-a-stm32mp157c-ev1.stm32


Regards


Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

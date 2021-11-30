Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6745D4635A1
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Nov 2021 14:38:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3263AC5A4D4;
	Tue, 30 Nov 2021 13:38:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17374C597BA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Nov 2021 13:38:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AU8q7Oq026770;
 Tue, 30 Nov 2021 14:38:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=j2oECgV6ROW1U3TU0c8upuzZ6XoEiSY4FwtGk/W0iP4=;
 b=P52ihKBGGmB6qXElhLDwssnWmFBCi95sDbzqoS8p9jboLpJpEiFheIo820EpaxIYx9eb
 ojhpcDlKKhuuXLTgioIVYh2aQcBZgEe5ufx9R9Oq4a/vqgGaqLflJ4O43BcgUtPwKEWg
 kW650Df2CY2Xt9pBZkTo55T1mkp8Ry70vtTE7QCETfq/DzWXBQKB9/uv7l6gsVyDdKP0
 k6L7FDnyvDMGamNXYF1+0bStoMf0s4AepE19YyaqUEpLbYrFzmAkg+cupMOhriht2TSU
 29xCcBv1AiHX82IoFROGzKVIGw4YE3j1sNo3XJMuAnsEXtvyOmb3ULWnlGP0/G8e+LeW RA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cna1yuef2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 14:38:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 885BC10002A;
 Tue, 30 Nov 2021 14:38:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 806E42C420A;
 Tue, 30 Nov 2021 14:38:51 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 30 Nov
 2021 14:38:51 +0100
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211125115446.1.Ic1fdd2e3e93f46712542022a2e40d0321f27bf04@changeid>
 <3b691a60-fa85-06a1-f399-9289e80a3d7d@foss.st.com>
Message-ID: <3f0deb2a-4a03-de58-c490-4254ce29ecd6@foss.st.com>
Date: Tue, 30 Nov 2021 14:38:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <3b691a60-fa85-06a1-f399-9289e80a3d7d@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_08,2021-11-28_01,2020-04-07_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stm32mp1: add support of nor1
 device in dfu command
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

Hi Patrick

On 11/30/21 10:57 AM, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 11/25/21 11:54 AM, Patrick Delaunay wrote:
>> Add support of mtd backend for nor1 when this device is present on the
>> board, on STM32MP157C-EV1 for example, as the support of several MTD
>> spi-nor instance are now supported with commit b7f060565e31 ("mtd:
>> spi-nor: allow registering multiple MTDs when DM is enabled").
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  board/st/common/stm32mp_dfu.c |  4 ++++
>>  doc/board/st/stm32mp1.rst     | 18 ++++++++++--------
>>  2 files changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
>> index 00d1fb8f59..a3f0da5b5b 100644
>> --- a/board/st/common/stm32mp_dfu.c
>> +++ b/board/st/common/stm32mp_dfu.c
>> @@ -132,6 +132,10 @@ void set_dfu_alt_info(char *interface, char *devstr)
>>  			mtd = get_mtd_device_nm("nor0");
>>  			if (!IS_ERR_OR_NULL(mtd))
>>  				board_get_alt_info_mtd(mtd, buf);
>> +
>> +			mtd = get_mtd_device_nm("nor1");
>> +			if (!IS_ERR_OR_NULL(mtd))
>> +				board_get_alt_info_mtd(mtd, buf);
>>  		}
>>  
>>  		mtd = get_mtd_device_nm("nand0");
>> diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
>> index 42bb94148d..0c5d3a90f0 100644
>> --- a/doc/board/st/stm32mp1.rst
>> +++ b/doc/board/st/stm32mp1.rst
>> @@ -645,16 +645,18 @@ On EV1 board, booting from SD card, without OP-TEE_::
>>    dev: eMMC alt: 15 name: mmc1_rootfs layout: RAW_ADDR
>>    dev: eMMC alt: 16 name: mmc1_userfs layout: RAW_ADDR
>>    dev: MTD alt: 17 name: nor0 layout: RAW_ADDR
>> -  dev: MTD alt: 18 name: nand0 layout: RAW_ADDR
>> -  dev: VIRT alt: 19 name: OTP layout: RAW_ADDR
>> -  dev: VIRT alt: 20 name: PMIC layout: RAW_ADDR
>> +  dev: MTD alt: 18 name: nor1 layout: RAW_ADDR
>> +  dev: MTD alt: 19 name: nand0 layout: RAW_ADDR
>> +  dev: VIRT alt: 20 name: OTP layout: RAW_ADDR
>> +  dev: VIRT alt: 21 name: PMIC layout: RAW_ADDR
>>  
>>  All the supported device are exported for dfu-util tool::
>>  
>>    $> dfu-util -l
>> -  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=20, name="PMIC", serial="002700333338511934383330"
>> -  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=19, name="OTP", serial="002700333338511934383330"
>> -  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=18, name="nand0", serial="002700333338511934383330"
>> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=21, name="PMIC", serial="002700333338511934383330"
>> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=20, name="OTP", serial="002700333338511934383330"
>> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=19, name="nand0", serial="002700333338511934383330"
>> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=18, name="nor1", serial="002700333338511934383330"
>>    Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=17, name="nor0", serial="002700333338511934383330"
>>    Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=16, name="mmc1_userfs", serial="002700333338511934383330"
>>    Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=15, name="mmc1_rootfs", serial="002700333338511934383330"
>> @@ -705,12 +707,12 @@ You can update the boot device:
>>  When the board is booting for nor0 or nand0,
>>  only the MTD partition on the boot devices are available, for example:
>>  
>> -- NOR (nor0 = alt 20) & NAND (nand0 = alt 26) ::
>> +- NOR (nor0 = alt 20, nor1 = alt 26) & NAND (nand0 = alt 27) :
>>  
>>    $> dfu-util -d 0483:5720 -a 21 -D tf-a-stm32mp157c-ev1.stm32
>>    $> dfu-util -d 0483:5720 -a 22 -D tf-a-stm32mp157c-ev1.stm32
>>    $> dfu-util -d 0483:5720 -a 23 -D fip-stm32mp157c-ev1.bin
>> -  $> dfu-util -d 0483:5720 -a 27 -D st-image-weston-openstlinux-weston-stm32mp1_nand_4_256_multivolume.ubi
>> +  $> dfu-util -d 0483:5720 -a 28 -D st-image-weston-openstlinux-weston-stm32mp1_nand_4_256_multivolume.ubi
>>  
>>  - NAND (nand0 = alt 21)::
>>  
>>
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
> 

Applied to u-boot-stm32/next
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

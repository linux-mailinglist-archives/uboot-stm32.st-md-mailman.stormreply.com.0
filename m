Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 483441A776E
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 11:34:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 112C0C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 09:34:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE0DAC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 09:34:20 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03E9SsvD005288; Tue, 14 Apr 2020 11:34:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=yz0u3Cg1NzP4FLkaHwTqr85X5mzGr4WPGiI4+mW8OLw=;
 b=ty6N6snC2TrElC2axm09I3nsF5TkQDaozyNsVJQC0fTOcaox+2GpsJ3emqc6N4J9Y2A2
 dHbdqdLsa4QDYf/odle/+7SjEnfEDtc8Ku/ahzmADTZkTxnS4TvNCEZMQb/2Wb+YpYqt
 3dw6+YJ7HNPJxctx92cA22Q1AZlMlL+A78FDgy1eDTjWCqiKNNxQCrU8ByK4H8EBg2Gw
 3/egeJQ/pL0x6RG0VZCtbfB9ORG80txgO/GpLN78ONJ+rwX4fN0CnkPDN7L2Jf2zOqQL
 EjR5s/OOBYGwduOD5wRHcW9GK1jRTimrY7ECR5lwiS9pPsAZnz9HGlxVg7tEtBfKF3OH 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b66a4p71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 11:34:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1DA910002A;
 Tue, 14 Apr 2020 11:34:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C66022AC2FF;
 Tue, 14 Apr 2020 11:34:19 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 14 Apr
 2020 11:34:19 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 11:34:19 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 11/11] doc: stm32mp1: update DFU support example
Thread-Index: AQHV/P50qn/DvSoJEkSHWqNW8jLD/ah4ZDkA
Date: Tue, 14 Apr 2020 09:34:19 +0000
Message-ID: <bfcb64fc-c518-4926-0b37-6cf8a5423c3d@st.com>
References: <20200318082254.7522-1-patrick.delaunay@st.com>
 <20200318082254.7522-9-patrick.delaunay@st.com>
In-Reply-To: <20200318082254.7522-9-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <BA37681ED7ADFD43A0DEE40F4FAA73C9@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_02:2020-04-13,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 11/11] doc: stm32mp1: update DFU support
	example
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

Hi

On 3/18/20 9:22 AM, Patrick Delaunay wrote:
> Update stm32mp1 board documentation with new management of MMC and
> MTD partitions and new PID df11.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  doc/board/st/stm32mp1.rst | 115 ++++++++++++++++++--------------------
>  1 file changed, 54 insertions(+), 61 deletions(-)
>
> diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
> index 7fccdfbb94..41d0206d34 100644
> --- a/doc/board/st/stm32mp1.rst
> +++ b/doc/board/st/stm32mp1.rst
> @@ -518,61 +518,49 @@ On EV1 board, booting from SD card, without OP-TEE::
>    dev: RAM alt: 0 name: uImage layout: RAM_ADDR
>    dev: RAM alt: 1 name: devicetree.dtb layout: RAM_ADDR
>    dev: RAM alt: 2 name: uramdisk.image.gz layout: RAM_ADDR
> -  dev: eMMC alt: 3 name: sdcard_fsbl1 layout: RAW_ADDR
> -  dev: eMMC alt: 4 name: sdcard_fsbl2 layout: RAW_ADDR
> -  dev: eMMC alt: 5 name: sdcard_ssbl layout: RAW_ADDR
> -  dev: eMMC alt: 6 name: sdcard_bootfs layout: RAW_ADDR
> -  dev: eMMC alt: 7 name: sdcard_vendorfs layout: RAW_ADDR
> -  dev: eMMC alt: 8 name: sdcard_rootfs layout: RAW_ADDR
> -  dev: eMMC alt: 9 name: sdcard_userfs layout: RAW_ADDR
> -  dev: eMMC alt: 10 name: emmc_fsbl1 layout: RAW_ADDR
> -  dev: eMMC alt: 11 name: emmc_fsbl2 layout: RAW_ADDR
> -  dev: eMMC alt: 12 name: emmc_ssbl layout: RAW_ADDR
> -  dev: eMMC alt: 13 name: emmc_bootfs layout: RAW_ADDR
> -  dev: eMMC alt: 14 name: emmc_vendorfs layout: RAW_ADDR
> -  dev: eMMC alt: 15 name: emmc_rootfs layout: RAW_ADDR
> -  dev: eMMC alt: 16 name: emmc_userfs layout: RAW_ADDR
> -  dev: MTD alt: 17 name: nor_fsbl1 layout: RAW_ADDR
> -  dev: MTD alt: 18 name: nor_fsbl2 layout: RAW_ADDR
> -  dev: MTD alt: 19 name: nor_ssbl layout: RAW_ADDR
> -  dev: MTD alt: 20 name: nor_env layout: RAW_ADDR
> -  dev: MTD alt: 21 name: nand_fsbl layout: RAW_ADDR
> -  dev: MTD alt: 22 name: nand_ssbl1 layout: RAW_ADDR
> -  dev: MTD alt: 23 name: nand_ssbl2 layout: RAW_ADDR
> -  dev: MTD alt: 24 name: nand_UBI layout: RAW_ADDR
> -  dev: VIRT alt: 25 name: OTP layout: RAW_ADDR
> -  dev: VIRT alt: 26 name: PMIC layout: RAW_ADDR
> +  dev: eMMC alt: 3 name: mmc0_fsbl1 layout: RAW_ADDR
> +  dev: eMMC alt: 4 name: mmc0_fsbl2 layout: RAW_ADDR
> +  dev: eMMC alt: 5 name: mmc0_ssbl layout: RAW_ADDR
> +  dev: eMMC alt: 6 name: mmc0_bootfs layout: RAW_ADDR
> +  dev: eMMC alt: 7 name: mmc0_vendorfs layout: RAW_ADDR
> +  dev: eMMC alt: 8 name: mmc0_rootfs layout: RAW_ADDR
> +  dev: eMMC alt: 9 name: mmc0_userfs layout: RAW_ADDR
> +  dev: eMMC alt: 10 name: mmc1_boot1 layout: RAW_ADDR
> +  dev: eMMC alt: 11 name: mmc1_boot2 layout: RAW_ADDR
> +  dev: eMMC alt: 12 name: mmc1_ssbl layout: RAW_ADDR
> +  dev: eMMC alt: 13 name: mmc1_bootfs layout: RAW_ADDR
> +  dev: eMMC alt: 14 name: mmc1_vendorfs layout: RAW_ADDR
> +  dev: eMMC alt: 15 name: mmc1_rootfs layout: RAW_ADDR
> +  dev: eMMC alt: 16 name: mmc1_userfs layout: RAW_ADDR
> +  dev: MTD alt: 17 name: nor0 layout: RAW_ADDR
> +  dev: MTD alt: 18 name: nand0 layout: RAW_ADDR
> +  dev: VIRT alt: 19 name: OTP layout: RAW_ADDR
> +  dev: VIRT alt: 20 name: PMIC layout: RAW_ADDR
>  
>  All the supported device are exported for dfu-util tool::
>  
>    $> dfu-util -l
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=26, name="PMIC", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=25, name="OTP", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=24, name="nand_UBI", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=23, name="nand_ssbl2", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=22, name="nand_ssbl1", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=21, name="nand_fsbl", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=20, name="nor_env", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=19, name="nor_ssbl", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=18, name="nor_fsbl2", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=17, name="nor_fsbl1", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=16, name="emmc_userfs", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=15, name="emmc_rootfs", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=14, name="emmc_vendorfs", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=13, name="emmc_bootfs", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=12, name="emmc_ssbl", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=11, name="emmc_fsbl2", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=10, name="emmc_fsbl1", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=9, name="sdcard_userfs", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=8, name="sdcard_rootfs", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=7, name="sdcard_vendorfs", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=6, name="sdcard_bootfs", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=5, name="sdcard_ssbl", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=4, name="sdcard_fsbl2", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=3, name="sdcard_fsbl1", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=2, name="uramdisk.image.gz", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=1, name="devicetree.dtb", serial="002700333338511934383330"
> -  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=0, name="uImage", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=20, name="PMIC", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=19, name="OTP", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=18, name="nand0", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=17, name="nor0", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=16, name="mmc1_userfs", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=15, name="mmc1_rootfs", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=14, name="mmc1_vendorfs", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=13, name="mmc1_bootfs", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=12, name="mmc1_ssbl", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=11, name="mmc1_boot2", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=10, name="mmc1_boot1", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=9, name="mmc0_userfs", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=8, name="mmc0_rootfs", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=7, name="mmc0_vendorfs", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=6, name="mmc0_bootfs", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=5, name="mmc0_ssbl", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=4, name="mmc0_fsbl2", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=3, name="mmc0_fsbl1", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=2, name="uramdisk.image.gz", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=1, name="devicetree.dtb", serial="002700333338511934383330"
> +  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=0, name="uImage", serial="002700333338511934383330"
>  
>  You can update the boot device:
>  
> @@ -596,20 +584,25 @@ You can update the boot device:
>    $> dfu-util -d 0483:5720 -a 15 -D st-image-weston-openstlinux-weston-stm32mp1.ext4
>    $> dfu-util -d 0483:5720 -a 16 -D st-image-userfs-openstlinux-weston-stm32mp1.ext4
>  
> -- NOR::
> +- you can also dump the OTP and the PMIC NVM with::
> +
> +  $> dfu-util -d 0483:5720 -a 19 -U otp.bin
> +  $> dfu-util -d 0483:5720 -a 20 -U pmic.bin
> +
>  
> -  $> dfu-util -d 0483:5720 -a 17 -D tf-a-stm32mp157c-ev1-trusted.stm32
> -  $> dfu-util -d 0483:5720 -a 18 -D tf-a-stm32mp157c-ev1-trusted.stm32
> -  $> dfu-util -d 0483:5720 -a 19 -D u-boot-stm32mp157c-ev1-trusted.img
> +When the board is booting for nor0 or nand0,
> +only the MTD partition on the boot devices are available, for example:
>  
> -- NAND (UBI partition used for NAND only boot or NOR + NAND boot)::
> +- NOR (nor0 = alt 20) & NAND (nand0 = alt 26) ::
>  
>    $> dfu-util -d 0483:5720 -a 21 -D tf-a-stm32mp157c-ev1-trusted.stm32
> -  $> dfu-util -d 0483:5720 -a 22 -D u-boot-stm32mp157c-ev1-trusted.img
> +  $> dfu-util -d 0483:5720 -a 22 -D tf-a-stm32mp157c-ev1-trusted.stm32
>    $> dfu-util -d 0483:5720 -a 23 -D u-boot-stm32mp157c-ev1-trusted.img
> -  $> dfu-util -d 0483:5720 -a 24 -D st-image-weston-openstlinux-weston-stm32mp1_nand_4_256_multivolume.ubi
> +  $> dfu-util -d 0483:5720 -a 27 -D st-image-weston-openstlinux-weston-stm32mp1_nand_4_256_multivolume.ubi
>  
> -- you can also dump the OTP and the PMIC NVM with::
> +- NAND (nand0 = alt 21)::
>  
> -  $> dfu-util -d 0483:5720 -a 25 -U otp.bin
> -  $> dfu-util -d 0483:5720 -a 26 -U pmic.bin
> +  $> dfu-util -d 0483:5720 -a 22 -D tf-a-stm32mp157c-ev1-trusted.stm32
> +  $> dfu-util -d 0483:5720 -a 23 -D u-boot-stm32mp157c-ev1-trusted.img
> +  $> dfu-util -d 0483:5720 -a 24 -D u-boot-stm32mp157c-ev1-trusted.img
> +  $> dfu-util -d 0483:5720 -a 25 -D st-image-weston-openstlinux-weston-stm32mp1_nand_4_256_multivolume.ubi


Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

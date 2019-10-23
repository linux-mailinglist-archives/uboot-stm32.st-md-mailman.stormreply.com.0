Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA2DE1589
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 11:16:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C42BFC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 09:15:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06DABC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 09:15:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9N9BY5e006503; Wed, 23 Oct 2019 11:15:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=59MghsmacTVoYvDjJyEDElWTC3WZvoV55DlhjmAD+C0=;
 b=GMHFpmP4qjdjyeSuSlEXy6Gn5wK5vvbOJXwB0vQYHgccJ5dOakNf7xyD5FKM8f6HYqPW
 EqJIdQ7FhAssSzHtepQLT0oGHAZth26SAjL8w5IpPcNmcjaTYYBT6QyiiemkxlCGL0WP
 59IRp0gDE/2KciSfrIh1iiQnjmUlv+FuLT+wIIumMqeiwzDBd/t17CUPlk1+S+1oLbCB
 jcXgAmO92CdLKDjcROb906JK3FfThYbk81xoTyHXQ2CZQ6ZvywXh3NXLZlRAsLk5rHrr
 aFQLIlpshR/eFK+RmKsbNEycjZaiDVwwxJNOw54vCJUhSg0i55RUtGJpbbFytEnuiTgQ cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s72p78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 11:15:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 767AF10003D;
 Wed, 23 Oct 2019 11:15:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6538C2B3582;
 Wed, 23 Oct 2019 11:15:52 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 23 Oct
 2019 11:15:51 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 23 Oct 2019 11:15:51 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH v3 12/15] stm32mp1: activate
 SET_DFU_ALT_INFO
Thread-Index: AQHVgmEA0WJ7O6ReoEm3yTICS/4jfqdn3qSA
Date: Wed, 23 Oct 2019 09:15:51 +0000
Message-ID: <ba05a25a-254f-f62f-ec1d-7a01839b5483@st.com>
References: <20191014072812.21843-1-patrick.delaunay@st.com>
 <20191014072812.21843-13-patrick.delaunay@st.com>
In-Reply-To: <20191014072812.21843-13-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <1E27CF55BCEAC24AAA97B738851F6429@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_02:2019-10-22,2019-10-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3 12/15] stm32mp1: activate
 SET_DFU_ALT_INFO
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

On 10/14/19 9:28 AM, Patrick Delaunay wrote:
> Generate automatically dfu_alt_info for the supported device.
> The simple command "dfu 0" allows to start the dfu stack on usb 0
> for the supported devices:
> - dfu mtd for nand0
> - dfu mtd for nor0
> - dfu mmc for SDCard
> - dfu mmc for eMMC
> - dfu ram for images in DDR
>
> The DUF alternate use the "part", "partubi" and "mmcpart" options
> to select the correct MTD or GPT partition or the eMMC hw boot partition.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v3: None
> Changes in v2: None
>
>  board/st/stm32mp1/README     | 111 +++++++++++++++++++++++++++++++++++
>  board/st/stm32mp1/stm32mp1.c |  51 ++++++++++++++++
>  include/configs/stm32mp1.h   |  32 ++++++++++
>  3 files changed, 194 insertions(+)
>
> diff --git a/board/st/stm32mp1/README b/board/st/stm32mp1/README
> index c807e0842e..f2069bcefa 100644
> --- a/board/st/stm32mp1/README
> +++ b/board/st/stm32mp1/README
> @@ -390,3 +390,114 @@ B/ Automatically by using FIT feature and generic DISTRO bootcmd
>      the correct configuration
>  	=> stm32mp157c-ev1-m4
>  	=> stm32mp157c-dk2-m4
> +
> +11. DFU support
> +===============
> +
> +The DFU is supported on ST board.
> +The env variable dfu_alt_info is automatically build, and all
> +the memory present on the ST boards are exported.
> +
> +The mode is started by
> +
> +STM32MP> dfu 0
> +
> +On EV1 board:
> +
> +STM32MP> dfu 0 list
> +
> +DFU alt settings list:
> +dev: RAM alt: 0 name: uImage layout: RAM_ADDR
> +dev: RAM alt: 1 name: devicetree.dtb layout: RAM_ADDR
> +dev: RAM alt: 2 name: uramdisk.image.gz layout: RAM_ADDR
> +dev: eMMC alt: 3 name: sdcard_fsbl1 layout: RAW_ADDR
> +dev: eMMC alt: 4 name: sdcard_fsbl2 layout: RAW_ADDR
> +dev: eMMC alt: 5 name: sdcard_ssbl layout: RAW_ADDR
> +dev: eMMC alt: 6 name: sdcard_bootfs layout: RAW_ADDR
> +dev: eMMC alt: 7 name: sdcard_vendorfs layout: RAW_ADDR
> +dev: eMMC alt: 8 name: sdcard_rootfs layout: RAW_ADDR
> +dev: eMMC alt: 9 name: sdcard_userfs layout: RAW_ADDR
> +dev: eMMC alt: 10 name: emmc_fsbl1 layout: RAW_ADDR
> +dev: eMMC alt: 11 name: emmc_fsbl2 layout: RAW_ADDR
> +dev: eMMC alt: 12 name: emmc_ssbl layout: RAW_ADDR
> +dev: eMMC alt: 13 name: emmc_bootfs layout: RAW_ADDR
> +dev: eMMC alt: 14 name: emmc_vendorfs layout: RAW_ADDR
> +dev: eMMC alt: 15 name: emmc_rootfs layout: RAW_ADDR
> +dev: eMMC alt: 16 name: emmc_userfs layout: RAW_ADDR
> +dev: MTD alt: 17 name: nor_fsbl1 layout: RAW_ADDR
> +dev: MTD alt: 18 name: nor_fsbl2 layout: RAW_ADDR
> +dev: MTD alt: 19 name: nor_ssbl layout: RAW_ADDR
> +dev: MTD alt: 20 name: nor_env layout: RAW_ADDR
> +dev: MTD alt: 21 name: nand_fsbl layout: RAW_ADDR
> +dev: MTD alt: 22 name: nand_ssbl1 layout: RAW_ADDR
> +dev: MTD alt: 23 name: nand_ssbl2 layout: RAW_ADDR
> +dev: MTD alt: 24 name: nand_UBI layout: RAW_ADDR
> +dev: VIRT alt: 25 name: OTP layout: RAW_ADDR
> +dev: VIRT alt: 26 name: PMIC layout: RAW_ADDR
> +
> +All the supported device are exported for dfu-util tool:
> +
> +$> dfu-util -l
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=26, name="PMIC", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=25, name="OTP", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=24, name="nand_UBI", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=23, name="nand_ssbl2", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=22, name="nand_ssbl1", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=21, name="nand_fsbl", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=20, name="nor_env", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=19, name="nor_ssbl", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=18, name="nor_fsbl2", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=17, name="nor_fsbl1", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=16, name="emmc_userfs", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=15, name="emmc_rootfs", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=14, name="emmc_vendorfs", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=13, name="emmc_bootfs", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=12, name="emmc_ssbl", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=11, name="emmc_fsbl2", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=10, name="emmc_fsbl1", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=9, name="sdcard_userfs", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=8, name="sdcard_rootfs", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=7, name="sdcard_vendorfs", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=6, name="sdcard_bootfs", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=5, name="sdcard_ssbl", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=4, name="sdcard_fsbl2", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=3, name="sdcard_fsbl1", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=2, name="uramdisk.image.gz", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=1, name="devicetree.dtb", serial="002700333338511934383330"
> +Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=0, name="uImage", serial="002700333338511934383330"
> +
> +You can update the boot device:
> +
> +#SDCARD
> +$> dfu-util -d 0483:5720 -a 3 -D tf-a-stm32mp157c-ev1-trusted.stm32
> +$> dfu-util -d 0483:5720 -a 4 -D tf-a-stm32mp157c-ev1-trusted.stm32
> +$> dfu-util -d 0483:5720 -a 5 -D u-boot-stm32mp157c-ev1-trusted.img
> +$> dfu-util -d 0483:5720 -a 6 -D st-image-bootfs-openstlinux-weston-stm32mp1.ext4
> +$> dfu-util -d 0483:5720 -a 7 -D st-image-vendorfs-openstlinux-weston-stm32mp1.ext4
> +$> dfu-util -d 0483:5720 -a 8 -D st-image-weston-openstlinux-weston-stm32mp1.ext4
> +$> dfu-util -d 0483:5720 -a 9 -D st-image-userfs-openstlinux-weston-stm32mp1.ext4
> +
> +#EMMC
> +$> dfu-util -d 0483:5720 -a 10 -D tf-a-stm32mp157c-ev1-trusted.stm32
> +$> dfu-util -d 0483:5720 -a 11 -D tf-a-stm32mp157c-ev1-trusted.stm32
> +$> dfu-util -d 0483:5720 -a 12 -D u-boot-stm32mp157c-ev1-trusted.img
> +$> dfu-util -d 0483:5720 -a 13 -D st-image-bootfs-openstlinux-weston-stm32mp1.ext4
> +$> dfu-util -d 0483:5720 -a 14 -D st-image-vendorfs-openstlinux-weston-stm32mp1.ext4
> +$> dfu-util -d 0483:5720 -a 15 -D st-image-weston-openstlinux-weston-stm32mp1.ext4
> +$> dfu-util -d 0483:5720 -a 16 -D st-image-userfs-openstlinux-weston-stm32mp1.ext4
> +
> +#NOR
> +$> dfu-util -d 0483:5720 -a 17 -D tf-a-stm32mp157c-ev1-trusted.stm32
> +$> dfu-util -d 0483:5720 -a 18 -D tf-a-stm32mp157c-ev1-trusted.stm32
> +$> dfu-util -d 0483:5720 -a 19 -D u-boot-stm32mp157c-ev1-trusted.img
> +
> +#NAND (UBI partition used for NAND only boot or NOR + NAND boot)
> +$> dfu-util -d 0483:5720 -a 21 -D tf-a-stm32mp157c-ev1-trusted.stm32
> +$> dfu-util -d 0483:5720 -a 22 -D u-boot-stm32mp157c-ev1-trusted.img
> +$> dfu-util -d 0483:5720 -a 23 -D u-boot-stm32mp157c-ev1-trusted.img
> +$> dfu-util -d 0483:5720 -a 24 -D st-image-weston-openstlinux-weston-stm32mp1_nand_4_256_multivolume.ubi
> +
> +And you can also dump the OTP and the PMIC NVM with:
> +
> +$> dfu-util -d 0483:5720 -a 25 -U otp.bin
> +$> dfu-util -d 0483:5720 -a 26 -U pmic.bin
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 18f9b84876..62855988e9 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -14,6 +14,7 @@
>  #include <generic-phy.h>
>  #include <i2c.h>
>  #include <led.h>
> +#include <memalign.h>
>  #include <misc.h>
>  #include <mtd.h>
>  #include <mtd_node.h>
> @@ -903,6 +904,56 @@ int ft_board_setup(void *blob, bd_t *bd)
>  }
>  #endif
>  
> +#ifdef CONFIG_SET_DFU_ALT_INFO
> +#define DFU_ALT_BUF_LEN SZ_1K
> +
> +static void board_get_alt_info(const char *dev, char *buff)
> +{
> +	char var_name[32] = "dfu_alt_info_";
> +	int ret;
> +
> +	ALLOC_CACHE_ALIGN_BUFFER(char, tmp_alt, DFU_ALT_BUF_LEN);
> +
> +	/* name of env variable to read = dfu_alt_info_<dev> */
> +	strcat(var_name, dev);
> +	ret = env_get_f(var_name, tmp_alt, DFU_ALT_BUF_LEN);
> +	if (ret) {
> +		if (buff[0] != '\0')
> +			strcat(buff, "&");
> +		strncat(buff, tmp_alt, DFU_ALT_BUF_LEN);
> +	}
> +}
> +
> +void set_dfu_alt_info(char *interface, char *devstr)
> +{
> +	struct udevice *dev;
> +
> +	ALLOC_CACHE_ALIGN_BUFFER(char, buf, DFU_ALT_BUF_LEN);
> +
> +	if (env_get("dfu_alt_info"))
> +		return;
> +
> +	memset(buf, 0, sizeof(buf));
> +
> +	board_get_alt_info("ram", buf);
> +
> +	if (!uclass_get_device(UCLASS_MMC, 0, &dev))
> +		board_get_alt_info("mmc0", buf);
> +
> +	if (!uclass_get_device(UCLASS_MMC, 1, &dev))
> +		board_get_alt_info("mmc1", buf);
> +
> +	if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev))
> +		board_get_alt_info("nor0", buf);
> +
> +	if (!uclass_get_device(UCLASS_MTD, 0, &dev))
> +		board_get_alt_info("nand0", buf);
> +
> +	env_set("dfu_alt_info", buf);
> +	puts("DFU alt info setting: done\n");
> +}
> +#endif
> +
>  static void board_copro_image_process(ulong fw_image, size_t fw_size)
>  {
>  	int ret, id = 0; /* Copro id fixed to 0 as only one coproc on mp1 */
> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> index 92660fe2a0..4f9024229e 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -83,6 +83,8 @@
>  #define CONFIG_SYS_MTDPARTS_RUNTIME
>  #endif
>  
> +#define CONFIG_SET_DFU_ALT_INFO
> +
>  /*****************************************************************************/
>  #ifdef CONFIG_DISTRO_DEFAULTS
>  /*****************************************************************************/
> @@ -136,6 +138,34 @@
>  #define STM32MP_MTDPARTS
>  #endif
>  
> +#define STM32MP_DFU_ALT_RAM \
> +	"dfu_alt_info_ram=ram 0=" \
> +		"uImage ram ${kernel_addr_r} 0x2000000;" \
> +		"devicetree.dtb ram ${fdt_addr_r} 0x100000;" \
> +		"uramdisk.image.gz ram ${ramdisk_addr_r} 0x10000000\0"
> +
> +#ifdef CONFIG_SET_DFU_ALT_INFO
> +#define STM32MP_DFU_ALT_INFO \
> +	"dfu_alt_info_nor0=mtd nor0=" \
> +		"nor_fsbl1 part 1;nor_fsbl2 part 2;" \
> +		"nor_ssbl part 3;nor_env part 4\0" \
> +	"dfu_alt_info_nand0=mtd nand0="\
> +		"nand_fsbl part 1;nand_ssbl1 part 2;" \
> +		"nand_ssbl2 part 3;nand_UBI partubi 4\0" \
> +	"dfu_alt_info_mmc0=mmc 0=" \
> +		"sdcard_fsbl1 part 0 1;sdcard_fsbl2 part 0 2;" \
> +		"sdcard_ssbl part 0 3;sdcard_bootfs part 0 4;" \
> +		"sdcard_vendorfs part 0 5;sdcard_rootfs part 0 6;" \
> +		"sdcard_userfs part 0 7\0" \
> +	"dfu_alt_info_mmc1=mmc 1=" \
> +		"emmc_fsbl1 raw 0x0 0x200 mmcpart 1;" \
> +		"emmc_fsbl2 raw 0x0 0x200 mmcpart 2;emmc_ssbl part 1 1;" \
> +		"emmc_bootfs part 1 2;emmc_vendorfs part 1 3;" \
> +		"emmc_rootfs part 1 4;emmc_userfs part 1 5\0"
> +#else
> +#define STM32MP_DFU_ALT_INFO
> +#endif
> +
>  /*
>   * memory layout for 32M uncompressed/compressed kernel,
>   * 1M fdt, 1M script, 1M pxe and 1M for splashimage
> @@ -157,6 +187,8 @@
>  		" then env set env_default 0;env save;fi\0" \
>  	STM32MP_BOOTCMD \
>  	STM32MP_MTDPARTS \
> +	STM32MP_DFU_ALT_RAM \
> +	STM32MP_DFU_ALT_INFO \
>  	BOOTENV \
>  	"boot_net_usb_start=true\0"
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

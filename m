Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 333D01A7BC6
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 15:07:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2F39C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 13:06:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C26B7C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 13:06:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ED3A92030564; Tue, 14 Apr 2020 15:06:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=WRbp1Q7CYWqE3kPSrhd7Y5jkp2ncqcAB0led7/UeVIY=;
 b=IfZIHBWL9W2P1ISxMwWTO2yBoh6DqbtUkfNyezHHEcTc5dPTTKoz4hQmQGTA9/cpZb8O
 appt1hsch41HMg0ZnTMc/v/X8zk0l+LRzvLfVKvcsGysq6d7pt40nYFy5Z7MPb7/bWZ7
 GryhqmQIC1zBhTy9CzGA8L5s5rebZ0qxUkixx1RXa5n/NAPrltJtLqxlpTdSnajNQTym
 LPR9FQqxTGMMiFGP3Upav+IJz5TSo4pubaKucSe1WqTOWjIOUtvcWeyqetXqwV/xG0fm
 1VSjUd26ZxsyHK9xUbhlsk276KwT0aQ5mKigGMsEY+noKqMy3rFk4Sm0nz3nSYKy2Ky2 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b5stdthr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 15:06:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0EACF100034;
 Tue, 14 Apr 2020 15:06:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0415F2B5C5D;
 Tue, 14 Apr 2020 15:06:55 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Apr
 2020 15:06:54 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 15:06:54 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 09/18] stm32mp: stm32prog: add MTD devices support
Thread-Index: AQHV/P6/balDCGI77EiJ1lWxp4wuLKh4n54A
Date: Tue, 14 Apr 2020 13:06:54 +0000
Message-ID: <bd3fe8c9-6b58-3432-c948-9e59f471c0f5@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
 <20200318082503.8025-10-patrick.delaunay@st.com>
In-Reply-To: <20200318082503.8025-10-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <438D0A6392E48541BDAD9E8C0B4EEED0@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 09/18] stm32mp: stm32prog: add MTD devices
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi

On 3/18/20 9:24 AM, Patrick Delaunay wrote:
> Add support of MTD device (DFU_MTD backend) for
> NOR, NAND or SPI-NAND target.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/Kconfig                 |   2 +
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 114 +++++++++++++++++-
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |   4 +
>  configs/stm32mp15_basic_defconfig             |   2 -
>  configs/stm32mp15_trusted_defconfig           |   2 -
>  5 files changed, 117 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index 39504e8540..af16393152 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -121,7 +121,9 @@ config CMD_STM32PROG
>  	select DFU_VIRT
>  	select PARTITION_TYPE_GUID
>  	imply CMD_GPT if MMC
> +	imply CMD_MTD if MTD
>  	imply DFU_MMC if MMC
> +	imply DFU_MTD if MTD
>  	help
>  		activate a specific command stm32prog for STM32MP soc family
>  		witch update the device with the tools STM32CubeProgrammer,
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 787bcdef7d..93ee6a55a1 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -8,9 +8,12 @@
>  #include <dfu.h>
>  #include <malloc.h>
>  #include <mmc.h>
> +#include <part.h>
>  #include <dm/uclass.h>
> +#include <jffs2/load_kernel.h>
>  #include <linux/list.h>
>  #include <linux/list_sort.h>
> +#include <linux/mtd/mtd.h>
>  #include <linux/sizes.h>
>  
>  #include "stm32prog.h"
> @@ -65,6 +68,11 @@ enum stm32prog_col_t {
>  	COL_NB_STM32
>  };
>  
> +/* partition handling routines : CONFIG_CMD_MTDPARTS */
> +int mtdparts_init(void);
> +int find_dev_and_part(const char *id, struct mtd_device **dev,
> +		      u8 *part_num, struct part_info **part);
> +
>  char *stm32prog_get_error(struct stm32prog_data *data)
>  {
>  	static const char error_msg[] = "Unspecified";
> @@ -233,6 +241,15 @@ static int parse_ip(struct stm32prog_data *data,
>  	} else if (!strncmp(p, "mmc", 3)) {
>  		part->target = STM32PROG_MMC;
>  		len = 3;
> +	} else if (!strncmp(p, "nor", 3)) {
> +		part->target = STM32PROG_NOR;
> +		len = 3;
> +	} else if (!strncmp(p, "nand", 4)) {
> +		part->target = STM32PROG_NAND;
> +		len = 4;
> +	} else if (!strncmp(p, "spi-nand", 8)) {
> +		part->target = STM32PROG_SPI_NAND;
> +		len = 8;
>  	} else {
>  		result = -EINVAL;
>  	}
> @@ -475,11 +492,37 @@ static int __init part_cmp(void *priv, struct list_head *a, struct list_head *b)
>  		return parta->addr > partb->addr ? 1 : -1;
>  }
>  
> +static void get_mtd_by_target(char *string, enum stm32prog_target target,
> +			      int dev_id)
> +{
> +	const char *dev_str;
> +
> +	switch (target) {
> +	case STM32PROG_NOR:
> +		dev_str = "nor";
> +		break;
> +	case STM32PROG_NAND:
> +		dev_str = "nand";
> +		break;
> +	case STM32PROG_SPI_NAND:
> +		dev_str = "spi-nand";
> +		break;
> +	default:
> +		dev_str = "invalid";
> +		break;
> +	}
> +	sprintf(string, "%s%d", dev_str, dev_id);
> +}
> +
>  static int init_device(struct stm32prog_data *data,
>  		       struct stm32prog_dev_t *dev)
>  {
>  	struct mmc *mmc = NULL;
>  	struct blk_desc *block_dev = NULL;
> +#ifdef CONFIG_MTD
> +	struct mtd_info *mtd = NULL;
> +	char mtd_id[16];
> +#endif
>  	int part_id;
>  	int ret;
>  	u64 first_addr = 0, last_addr = 0;
> @@ -521,6 +564,29 @@ static int init_device(struct stm32prog_data *data,
>  			 first_addr, last_addr);
>  		pr_debug(" full_update = %d\n", dev->full_update);
>  		break;
> +#endif
> +#ifdef CONFIG_MTD
> +	case STM32PROG_NOR:
> +	case STM32PROG_NAND:
> +	case STM32PROG_SPI_NAND:
> +		get_mtd_by_target(mtd_id, dev->target, dev->dev_id);
> +		pr_debug("%s\n", mtd_id);
> +
> +		mtdparts_init();
> +		mtd = get_mtd_device_nm(mtd_id);
> +		if (IS_ERR(mtd)) {
> +			stm32prog_err("MTD device %s not found", mtd_id);
> +			return -ENODEV;
> +		}
> +		first_addr = 0;
> +		last_addr = mtd->size;
> +		dev->erase_size = mtd->erasesize;
> +		pr_debug("MTD device %s: size=%lld erasesize=%d\n",
> +			 mtd_id, mtd->size, mtd->erasesize);
> +		pr_debug(" available address = 0x%llx..0x%llx\n",
> +			 first_addr, last_addr);
> +		dev->mtd = mtd;
> +		break;
>  #endif
>  	default:
>  		stm32prog_err("unknown device type = %d", dev->target);
> @@ -637,6 +703,29 @@ static int init_device(struct stm32prog_data *data,
>  			part_found = true;
>  		}
>  
> +#ifdef CONFIG_MTD
> +		if (mtd) {
> +			char mtd_part_id[32];
> +			struct part_info *mtd_part;
> +			struct mtd_device *mtd_dev;
> +			u8 part_num;
> +
> +			sprintf(mtd_part_id, "%s,%d", mtd_id,
> +				part->part_id - 1);
> +			ret = find_dev_and_part(mtd_part_id, &mtd_dev,
> +						&part_num, &mtd_part);
> +			if (ret != 0) {
> +				stm32prog_err("%s (0x%x): Invalid MTD partition %s",
> +					      part->name, part->id,
> +					      mtd_part_id);
> +				return -ENODEV;
> +			}
> +			part_addr = mtd_part->offset;
> +			part_size = mtd_part->size;
> +			part_name = mtd_part->name;
> +			part_found = true;
> +		}
> +#endif
>  		if (!part_found) {
>  			stm32prog_err("%s (0x%x): Invalid partition",
>  				      part->name, part->id);
> @@ -840,6 +929,9 @@ static int create_partitions(struct stm32prog_data *data)
>  	}
>  	puts("done\n");
>  
> +#ifdef DEBUG
> +	run_command("mtd list", 0);
> +#endif
>  	free(buf);
>  #endif
>  
> @@ -898,9 +990,17 @@ static int stm32prog_alt_add(struct stm32prog_data *data,
>  		offset += snprintf(buf + offset, ALT_BUF_LEN - offset,
>  				   " mmcpart %d;", -(part->part_id));
>  	} else {
> -		offset += snprintf(buf + offset,
> -				   ALT_BUF_LEN - offset,
> -				   "part");
> +		if (part->part_type == PART_SYSTEM &&
> +		    (part->target == STM32PROG_NAND ||
> +		     part->target == STM32PROG_NOR ||
> +		     part->target == STM32PROG_SPI_NAND))
> +			offset += snprintf(buf + offset,
> +					   ALT_BUF_LEN - offset,
> +					   "partubi");
> +		else
> +			offset += snprintf(buf + offset,
> +					   ALT_BUF_LEN - offset,
> +					   "part");
>  		/* dev_id requested by DFU MMC */
>  		if (part->target == STM32PROG_MMC)
>  			offset += snprintf(buf + offset, ALT_BUF_LEN - offset,
> @@ -914,6 +1014,14 @@ static int stm32prog_alt_add(struct stm32prog_data *data,
>  		sprintf(dfustr, "mmc");
>  		sprintf(devstr, "%d", part->dev_id);
>  		break;
> +#endif
> +#ifdef CONFIG_MTD
> +	case STM32PROG_NAND:
> +	case STM32PROG_NOR:
> +	case STM32PROG_SPI_NAND:
> +		sprintf(dfustr, "mtd");
> +		get_mtd_by_target(devstr, part->target, part->dev_id);
> +		break;
>  #endif
>  	default:
>  		stm32prog_err("invalid target: %d", part->target);
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index ea88459896..8e635da3a4 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -20,6 +20,9 @@
>  enum stm32prog_target {
>  	STM32PROG_NONE,
>  	STM32PROG_MMC,
> +	STM32PROG_NAND,
> +	STM32PROG_NOR,
> +	STM32PROG_SPI_NAND
>  };
>  
>  enum stm32prog_link_t {
> @@ -67,6 +70,7 @@ struct stm32prog_dev_t {
>  	char			dev_id;
>  	u32			erase_size;
>  	struct mmc		*mmc;
> +	struct mtd_info		*mtd;
>  	/* list of partition for this device / ordered in offset */
>  	struct list_head	part_list;
>  	bool			full_update;
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 2e7d8bc990..7837cbe9c7 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -37,7 +37,6 @@ CONFIG_CMD_FUSE=y
>  CONFIG_CMD_GPIO=y
>  CONFIG_CMD_I2C=y
>  CONFIG_CMD_MMC=y
> -CONFIG_CMD_MTD=y
>  CONFIG_CMD_REMOTEPROC=y
>  CONFIG_CMD_SPI=y
>  CONFIG_CMD_USB=y
> @@ -67,7 +66,6 @@ CONFIG_ENV_UBI_VOLUME="uboot_config"
>  CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
>  CONFIG_SYS_RELOC_GD_ENV_ADDR=y
>  CONFIG_STM32_ADC=y
> -CONFIG_DFU_MTD=y
>  CONFIG_SET_DFU_ALT_INFO=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y
>  CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 6f6c909da0..e5b1ab5d04 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -25,7 +25,6 @@ CONFIG_CMD_FUSE=y
>  CONFIG_CMD_GPIO=y
>  CONFIG_CMD_I2C=y
>  CONFIG_CMD_MMC=y
> -CONFIG_CMD_MTD=y
>  CONFIG_CMD_REMOTEPROC=y
>  CONFIG_CMD_SPI=y
>  CONFIG_CMD_USB=y
> @@ -53,7 +52,6 @@ CONFIG_ENV_UBI_VOLUME="uboot_config"
>  CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
>  CONFIG_SYS_RELOC_GD_ENV_ADDR=y
>  CONFIG_STM32_ADC=y
> -CONFIG_DFU_MTD=y
>  CONFIG_SET_DFU_ALT_INFO=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y
>  CONFIG_FASTBOOT_BUF_ADDR=0xC0000000

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

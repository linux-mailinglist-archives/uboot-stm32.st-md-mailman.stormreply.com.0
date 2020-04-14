Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B105D1A7BAC
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 15:04:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9593C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 13:04:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FB4DC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 13:04:26 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ED2t3C023881; Tue, 14 Apr 2020 15:04:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=3zZ1otiJelOOBxyn1lqtbd4aacr8UpBDDuOFvzEmczQ=;
 b=UfrtiXSdkp6Fjy+V0rlu5dyI31DLY11fXxGiHY0vpuvpfjvholug+ir8YXD01Hv/VgoL
 Uw11zUaJ33pIjkgm5dmnxtDNn3F6fCSiIZ8z7dREtBnuR5VhPv5cu8qQpzE4AxVRwZLq
 GLW1glpCYftnoUfXO6PKObRppaiAYgtS6Gzjyr9c6aIMgo0jVYc/JWbPrbJHAzpGWyhs
 +onGnbiHj2mu7f37XeT7rY0n8MkKewy01ykJylQdDaZQKxycC3wrZDus3Z0UxE7gUHqK
 3uZlJqpdpREV6/ENQ1tP9KlbNrpovkOzDcoZ2cUR6UUoZPkUP3BiEBvYo/FuwRrlCu5C zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b66a5nxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 15:04:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C06CE10002A;
 Tue, 14 Apr 2020 15:04:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B6E2F2B5C46;
 Tue, 14 Apr 2020 15:04:20 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Apr
 2020 15:04:20 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 15:04:20 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 06/18] stm32mp: stm32prog: add MMC device
Thread-Index: AQHV/P69yZBiiNM1lkKBd2OpekJgd6h4nuaA
Date: Tue, 14 Apr 2020 13:04:20 +0000
Message-ID: <72924f4a-046a-9ccf-9558-9ff18b5ab58b@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
 <20200318082503.8025-7-patrick.delaunay@st.com>
In-Reply-To: <20200318082503.8025-7-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <B42ADB198739AA4C8A3BD705CC82E883@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 06/18] stm32mp: stm32prog: add MMC device
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
> Add support of MMC device (based on DFU_MMC backend)
> for SD card and eMMC update.
>
> Create a GPT partitioning on the device.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/Kconfig                 |   3 +
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 204 +++++++++++++++++-
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |   3 +
>  configs/stm32mp15_basic_defconfig             |   2 -
>  configs/stm32mp15_trusted_defconfig           |   2 -
>  5 files changed, 209 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index 61466f6125..39504e8540 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -119,6 +119,9 @@ config CMD_STM32PROG
>  	select DFU
>  	select DFU_RAM
>  	select DFU_VIRT
> +	select PARTITION_TYPE_GUID
> +	imply CMD_GPT if MMC
> +	imply DFU_MMC if MMC
>  	help
>  		activate a specific command stm32prog for STM32MP soc family
>  		witch update the device with the tools STM32CubeProgrammer,
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 11fe479072..feb83670b5 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -7,6 +7,7 @@
>  #include <console.h>
>  #include <dfu.h>
>  #include <malloc.h>
> +#include <mmc.h>
>  #include <dm/uclass.h>
>  #include <linux/list.h>
>  #include <linux/list_sort.h>
> @@ -14,6 +15,9 @@
>  
>  #include "stm32prog.h"
>  
> +/* Primary GPT header size for 128 entries : 17kB = 34 LBA of 512B */
> +#define GPT_HEADER_SZ	34
> +
>  #define OPT_SELECT	BIT(0)
>  #define OPT_EMPTY	BIT(1)
>  
> @@ -22,6 +26,32 @@
>  
>  #define ALT_BUF_LEN			SZ_1K
>  
> +#define ROOTFS_MMC0_UUID \
> +	EFI_GUID(0xE91C4E10, 0x16E6, 0x4C0E, \
> +		 0xBD, 0x0E, 0x77, 0xBE, 0xCF, 0x4A, 0x35, 0x82)
> +
> +#define ROOTFS_MMC1_UUID \
> +	EFI_GUID(0x491F6117, 0x415D, 0x4F53, \
> +		 0x88, 0xC9, 0x6E, 0x0D, 0xE5, 0x4D, 0xEA, 0xC6)
> +
> +#define ROOTFS_MMC2_UUID \
> +	EFI_GUID(0xFD58F1C7, 0xBE0D, 0x4338, \
> +		 0x88, 0xE9, 0xAD, 0x8F, 0x05, 0x0A, 0xEB, 0x18)
> +
> +/* RAW parttion (binary / bootloader) used Linux - reserved UUID */
> +#define LINUX_RESERVED_UUID "8DA63339-0007-60C0-C436-083AC8230908"
> +
> +/*
> + * unique partition guid (uuid) for partition named "rootfs"
> + * on each MMC instance = SD Card or eMMC
> + * allow fixed kernel bootcmd: "rootf=PARTUID=e91c4e10-..."
> + */
> +static const efi_guid_t uuid_mmc[3] = {
> +	ROOTFS_MMC0_UUID,
> +	ROOTFS_MMC1_UUID,
> +	ROOTFS_MMC2_UUID
> +};
> +
>  DECLARE_GLOBAL_DATA_PTR;
>  
>  /* order of column in flash layout file */
> @@ -200,6 +230,9 @@ static int parse_ip(struct stm32prog_data *data,
>  	part->dev_id = 0;
>  	if (!strcmp(p, "none")) {
>  		part->target = STM32PROG_NONE;
> +	} else if (!strncmp(p, "mmc", 3)) {
> +		part->target = STM32PROG_MMC;
> +		len = 3;
>  	} else {
>  		result = -EINVAL;
>  	}
> @@ -424,16 +457,50 @@ static int __init part_cmp(void *priv, struct list_head *a, struct list_head *b)
>  static int init_device(struct stm32prog_data *data,
>  		       struct stm32prog_dev_t *dev)
>  {
> +	struct mmc *mmc = NULL;
>  	struct blk_desc *block_dev = NULL;
>  	int part_id;
>  	u64 first_addr = 0, last_addr = 0;
>  	struct stm32prog_part_t *part, *next_part;
>  
>  	switch (dev->target) {
> +#ifdef CONFIG_MMC
> +	case STM32PROG_MMC:
> +		mmc = find_mmc_device(dev->dev_id);
> +		if (mmc_init(mmc)) {
> +			stm32prog_err("mmc device %d not found", dev->dev_id);
> +			return -ENODEV;
> +		}
> +		block_dev = mmc_get_blk_desc(mmc);
> +		if (!block_dev) {
> +			stm32prog_err("mmc device %d not probed", dev->dev_id);
> +			return -ENODEV;
> +		}
> +		dev->erase_size = mmc->erase_grp_size * block_dev->blksz;
> +		dev->mmc = mmc;
> +
> +		/* reserve a full erase group for each GTP headers */
> +		if (mmc->erase_grp_size > GPT_HEADER_SZ) {
> +			first_addr = dev->erase_size;
> +			last_addr = (u64)(block_dev->lba -
> +					  mmc->erase_grp_size) *
> +				    block_dev->blksz;
> +		} else {
> +			first_addr = (u64)GPT_HEADER_SZ * block_dev->blksz;
> +			last_addr = (u64)(block_dev->lba - GPT_HEADER_SZ - 1) *
> +				    block_dev->blksz;
> +		}
> +		pr_debug("MMC %d: lba=%ld blksz=%ld\n", dev->dev_id,
> +			 block_dev->lba, block_dev->blksz);
> +		pr_debug(" available address = 0x%llx..0x%llx\n",
> +			 first_addr, last_addr);
> +		break;
> +#endif
>  	default:
>  		stm32prog_err("unknown device type = %d", dev->target);
>  		return -ENODEV;
>  	}
> +	pr_debug(" erase size = 0x%x\n", dev->erase_size);
>  
>  	/* order partition list in offset order */
>  	list_sort(NULL, &dev->part_list, &part_cmp);
> @@ -491,6 +558,12 @@ static int init_device(struct stm32prog_data *data,
>  			return -EINVAL;
>  		}
>  
> +		if ((part->addr & ((u64)part->dev->erase_size - 1)) != 0) {
> +			stm32prog_err("%s (0x%x): not aligned address : 0x%llx on erase size 0x%x",
> +				      part->name, part->id, part->addr,
> +				      part->dev->erase_size);
> +			return -EINVAL;
> +		}
>  		pr_debug("%02d : %1d %02x %14s %02d %02d.%02d %08llx %08llx",
>  			 part->part_id, part->option, part->id, part->name,
>  			 part->part_type, part->target,
> @@ -559,6 +632,118 @@ static int treat_partition_list(struct stm32prog_data *data)
>  	return 0;
>  }
>  
> +static int create_partitions(struct stm32prog_data *data)
> +{
> +#ifdef CONFIG_MMC
> +	int offset = 0;
> +	const int buflen = SZ_8K;
> +	char *buf;
> +	char uuid[UUID_STR_LEN + 1];
> +	unsigned char *uuid_bin;
> +	unsigned int mmc_id;
> +	int i;
> +	bool rootfs_found;
> +	struct stm32prog_part_t *part;
> +
> +	buf = malloc(buflen);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	puts("partitions : ");
> +	/* initialize the selected device */
> +	for (i = 0; i < data->dev_nb; i++) {
> +		offset = 0;
> +		rootfs_found = false;
> +		memset(buf, 0, buflen);
> +
> +		list_for_each_entry(part, &data->dev[i].part_list, list) {
> +			/* skip Raw Image */
> +			if (part->part_type == RAW_IMAGE)
> +				continue;
> +
> +			if (offset + 100 > buflen) {
> +				pr_debug("\n%s: buffer too small, %s skippped",
> +					 __func__, part->name);
> +				continue;
> +			}
> +
> +			if (!offset)
> +				offset += sprintf(buf, "gpt write mmc %d \"",
> +						  data->dev[i].dev_id);
> +
> +			offset += snprintf(buf + offset, buflen - offset,
> +					   "name=%s,start=0x%llx,size=0x%llx",
> +					   part->name,
> +					   part->addr,
> +					   part->size);
> +
> +			if (part->part_type == PART_BINARY)
> +				offset += snprintf(buf + offset,
> +						   buflen - offset,
> +						   ",type="
> +						   LINUX_RESERVED_UUID);
> +			else
> +				offset += snprintf(buf + offset,
> +						   buflen - offset,
> +						   ",type=linux");
> +
> +			if (part->part_type == PART_SYSTEM)
> +				offset += snprintf(buf + offset,
> +						   buflen - offset,
> +						   ",bootable");
> +
> +			if (!rootfs_found && !strcmp(part->name, "rootfs")) {
> +				mmc_id = part->dev_id;
> +				rootfs_found = true;
> +				if (mmc_id < ARRAY_SIZE(uuid_mmc)) {
> +					uuid_bin =
> +					  (unsigned char *)uuid_mmc[mmc_id].b;
> +					uuid_bin_to_str(uuid_bin, uuid,
> +							UUID_STR_FORMAT_GUID);
> +					offset += snprintf(buf + offset,
> +							   buflen - offset,
> +							   ",uuid=%s", uuid);
> +				}
> +			}
> +
> +			offset += snprintf(buf + offset, buflen - offset, ";");
> +		}
> +
> +		if (offset) {
> +			offset += snprintf(buf + offset, buflen - offset, "\"");
> +			pr_debug("\ncmd: %s\n", buf);
> +			if (run_command(buf, 0)) {
> +				stm32prog_err("GPT partitionning fail: %s",
> +					      buf);
> +				free(buf);
> +
> +				return -1;
> +			}
> +		}
> +
> +		if (data->dev[i].mmc)
> +			part_init(mmc_get_blk_desc(data->dev[i].mmc));
> +
> +#ifdef DEBUG
> +		sprintf(buf, "gpt verify mmc %d", data->dev[i].dev_id);
> +		pr_debug("\ncmd: %s", buf);
> +		if (run_command(buf, 0))
> +			printf("fail !\n");
> +		else
> +			printf("OK\n");
> +
> +		sprintf(buf, "part list mmc %d", data->dev[i].dev_id);
> +		run_command(buf, 0);
> +#endif
> +	}
> +	puts("done\n");
> +
> +	free(buf);
> +#endif
> +
> +	return 0;
> +}
> +
>  static int stm32prog_alt_add(struct stm32prog_data *data,
>  			     struct dfu_entity *dfu,
>  			     struct stm32prog_part_t *part)
> @@ -596,17 +781,30 @@ static int stm32prog_alt_add(struct stm32prog_data *data,
>  	if (part->part_type == RAW_IMAGE) {
>  		u64 dfu_size;
>  
> -		dfu_size = part->size;
> +		if (part->dev->target == STM32PROG_MMC)
> +			dfu_size = part->size / part->dev->mmc->read_bl_len;
> +		else
> +			dfu_size = part->size;
>  		offset += snprintf(buf + offset, ALT_BUF_LEN - offset,
>  				   "raw 0x0 0x%llx", dfu_size);
>  	} else {
>  		offset += snprintf(buf + offset,
>  				   ALT_BUF_LEN - offset,
>  				   "part");
> +		/* dev_id requested by DFU MMC */
> +		if (part->target == STM32PROG_MMC)
> +			offset += snprintf(buf + offset, ALT_BUF_LEN - offset,
> +					   " %d", part->dev_id);
>  		offset += snprintf(buf + offset, ALT_BUF_LEN - offset,
>  				   " %d;", part->part_id);
>  	}
>  	switch (part->target) {
> +#ifdef CONFIG_MMC
> +	case STM32PROG_MMC:
> +		sprintf(dfustr, "mmc");
> +		sprintf(devstr, "%d", part->dev_id);
> +		break;
> +#endif
>  	default:
>  		stm32prog_err("invalid target: %d", part->target);
>  		return -ENODEV;
> @@ -775,6 +973,10 @@ static void stm32prog_devices_init(struct stm32prog_data *data)
>  			goto error;
>  	}
>  
> +	ret = create_partitions(data);
> +	if (ret)
> +		goto error;
> +
>  	return;
>  
>  error:
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index b44b6f89af..228a25d37f 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -19,6 +19,7 @@
>  
>  enum stm32prog_target {
>  	STM32PROG_NONE,
> +	STM32PROG_MMC,
>  };
>  
>  enum stm32prog_link_t {
> @@ -64,6 +65,8 @@ enum stm32prog_part_type {
>  struct stm32prog_dev_t {
>  	enum stm32prog_target	target;
>  	char			dev_id;
> +	u32			erase_size;
> +	struct mmc		*mmc;
>  	/* list of partition for this device / ordered in offset */
>  	struct list_head	part_list;
>  };
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index baed3d92f5..2e7d8bc990 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -35,7 +35,6 @@ CONFIG_CMD_CLK=y
>  CONFIG_CMD_DFU=y
>  CONFIG_CMD_FUSE=y
>  CONFIG_CMD_GPIO=y
> -CONFIG_CMD_GPT=y
>  CONFIG_CMD_I2C=y
>  CONFIG_CMD_MMC=y
>  CONFIG_CMD_MTD=y
> @@ -68,7 +67,6 @@ CONFIG_ENV_UBI_VOLUME="uboot_config"
>  CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
>  CONFIG_SYS_RELOC_GD_ENV_ADDR=y
>  CONFIG_STM32_ADC=y
> -CONFIG_DFU_MMC=y
>  CONFIG_DFU_MTD=y
>  CONFIG_SET_DFU_ALT_INFO=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index adbe304902..6f6c909da0 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -23,7 +23,6 @@ CONFIG_CMD_CLK=y
>  CONFIG_CMD_DFU=y
>  CONFIG_CMD_FUSE=y
>  CONFIG_CMD_GPIO=y
> -CONFIG_CMD_GPT=y
>  CONFIG_CMD_I2C=y
>  CONFIG_CMD_MMC=y
>  CONFIG_CMD_MTD=y
> @@ -54,7 +53,6 @@ CONFIG_ENV_UBI_VOLUME="uboot_config"
>  CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
>  CONFIG_SYS_RELOC_GD_ENV_ADDR=y
>  CONFIG_STM32_ADC=y
> -CONFIG_DFU_MMC=y
>  CONFIG_DFU_MTD=y
>  CONFIG_SET_DFU_ALT_INFO=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1215D1A7BA4
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 15:03:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA5F4C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 13:03:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C70CC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 13:03:11 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ED39bI030554; Tue, 14 Apr 2020 15:03:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=USk09E/He3tl9g1yVDFnTFMfe7K0Gf08RjW5URNuBz0=;
 b=QMHx2derx9Oliu04HzDA3+759j8DIbkC6A8YCkLe2a5VatUSmmMThwq7ZKllO9v+/HfV
 jndpog+Bkc2k7uiUHiPl1xsBx1dO+LesGOc7ifgi+gh+hjp9sa7e/AZWhBlDysEd6VZt
 ff6acwzMdrxrARV3L+iyXIJrj3DYbOFL+N4vnduRkAduYMIMflS3pS8DxA6Z+ucc1xai
 n9f/q4Y524GhaBoZNcifkJ+qrbyYWNoW6mD7G1jGxpNKZZxk0HAlhxny7euEBMJ45Nxc
 A7lnyECkxxfroXcNsU7Lfg+gnH2QDMXOD805bIZaFaEVBMSgzRqtsF5Utebt2Ui0QHgk ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b5stdsv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 15:03:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 38F0A100034;
 Tue, 14 Apr 2020 15:03:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2EB342B5C40;
 Tue, 14 Apr 2020 15:03:08 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Apr
 2020 15:03:07 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 15:03:07 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 04/18] stm32mp: add the command stm32prog
Thread-Index: AQHV/P68UZ/zKCkQdU+Jg9CpDHrhPqh4no8A
Date: Tue, 14 Apr 2020 13:03:07 +0000
Message-ID: <aecca15d-eab6-4692-582a-a503aeb037d7@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
 <20200318082503.8025-5-patrick.delaunay@st.com>
In-Reply-To: <20200318082503.8025-5-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <EFC32C38EE674947ADDC9E42EDD34716@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 04/18] stm32mp: add the command stm32prog
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
> Add a specific command stm32prog for STM32MP soc family
> witch allows to program the boot devices with the tool
> STM32CubeProgrammer (http://www.st.com/STM32CubeProg).
>
> This command uses the same UART STM32 protocol than MCU
> STM32 with or USB with DFU protocol v1.1 (ithe MCU ST
> extension are no supported).
>
> The executed actions are based on a tab separated value file
> with a stm32 header, the FlashLayout file
> (https://wiki.st.com/stm32mpu/wiki/STM32CubeProgrammer_flashlayout).
>
> This file is parsed by the U-Boot command to:
> - initialize the devices
> - create the partition table on each device
> - initialize the DFU backend to access to not volatile memory
>   (NOR/NAND/SD/eMMC) or to virtual device (OTP/PMIC)
>
> Up to STM32PROG_MAX_DEV (5) devices can be updated with a FlashLayout.
>
> The communication between U-Boot and STM32CubeProgrammer is done with
> the specific alternate configuration (see "AN5275: USB DFU/USART protocols
> used in STM32MP1 Series bootloaders" for details).
>
> The command stm32prog is executed when a boot from USB is detected
> (selected with bootpins) and we can program the boot devices with
> a simple command (on Windows or Linux):
>
> PC $>  STM32_Programmer_CLI -c port=usb1 -w flaslayout.tsv
>
> 1/ the ROM code loads TF-A in embedded RAM (DFU or uart)
> 2/ TF-A loads flashlayout file and U-Boot in DDR (DFU or uart)
> 3/ U-Boot executes the stm32prog command (DFU or uart)
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/Kconfig                 |  12 +
>  arch/arm/mach-stm32mp/Makefile                |   1 +
>  arch/arm/mach-stm32mp/cmd_stm32prog/Makefile  |   8 +
>  .../cmd_stm32prog/cmd_stm32prog.c             |  96 ++++
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 480 ++++++++++++++++++
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.h    | 137 +++++
>  .../cmd_stm32prog/stm32prog_usb.c             | 206 ++++++++
>  .../arm/mach-stm32mp/include/mach/stm32prog.h |  12 +
>  board/st/common/stm32mp_dfu.c                 |  20 +
>  configs/stm32mp15_basic_defconfig             |   3 +-
>  configs/stm32mp15_trusted_defconfig           |   3 +-
>  11 files changed, 974 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/Makefile
>  create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
>  create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>  create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
>  create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
>  create mode 100644 arch/arm/mach-stm32mp/include/mach/stm32prog.h
>
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index 1a5545b98d..61466f6125 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -114,6 +114,18 @@ config STM32_ETZPC
>  	help
>  	  Say y to enable STM32 Extended TrustZone Protection
>  
> +config CMD_STM32PROG
> +	bool "command stm32prog for STM32CudeProgrammer"
> +	select DFU
> +	select DFU_RAM
> +	select DFU_VIRT
> +	help
> +		activate a specific command stm32prog for STM32MP soc family
> +		witch update the device with the tools STM32CubeProgrammer,
> +		using UART with STM32 protocol or USB with DFU protocol
> +		NB: access to not volatile memory (NOR/NAND/SD/eMMC) is based
> +		    on U-Boot DFU framework
> +
>  config CMD_STM32KEY
>  	bool "command stm32key to fuse public key hash"
>  	default y
> diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
> index 19ca3b08a5..c6ab3cecf0 100644
> --- a/arch/arm/mach-stm32mp/Makefile
> +++ b/arch/arm/mach-stm32mp/Makefile
> @@ -10,6 +10,7 @@ obj-y += syscon.o
>  ifdef CONFIG_SPL_BUILD
>  obj-y += spl.o
>  else
> +obj-$(CONFIG_CMD_STM32PROG) += cmd_stm32prog/
>  obj-y += bsec.o
>  obj-$(CONFIG_CMD_STM32KEY) += cmd_stm32key.o
>  obj-$(CONFIG_ARMV7_PSCI) += psci.o
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/Makefile b/arch/arm/mach-stm32mp/cmd_stm32prog/Makefile
> new file mode 100644
> index 0000000000..14f722759c
> --- /dev/null
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +#
> +# Copyright (C) 2020, STMicroelectronics - All Rights Reserved
> +#
> +
> +obj-y += cmd_stm32prog.o
> +obj-y += stm32prog.o
> +obj-y += stm32prog_usb.o
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> new file mode 100644
> index 0000000000..3e8b426444
> --- /dev/null
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
> + */
> +
> +#include <common.h>
> +#include <command.h>
> +#include <dfu.h>
> +#include "stm32prog.h"
> +
> +struct stm32prog_data *stm32prog_data;
> +
> +static int do_stm32prog(cmd_tbl_t *cmdtp, int flag, int argc,
> +			char * const argv[])
> +{
> +	ulong	addr, size;
> +	int dev, ret;
> +	enum stm32prog_link_t link = LINK_UNDEFINED;
> +	bool reset = false;
> +	struct stm32prog_data *data;
> +
> +	if (argc < 3 ||  argc > 5)
> +		return CMD_RET_USAGE;
> +
> +	if (!strcmp(argv[1], "usb"))
> +		link = LINK_USB;
> +
> +	if (link == LINK_UNDEFINED) {
> +		pr_err("not supported link=%s\n", argv[1]);
> +		return CMD_RET_USAGE;
> +	}
> +	dev = (int)simple_strtoul(argv[2], NULL, 10);
> +
> +	addr = STM32_DDR_BASE;
> +	size = 0;
> +	if (argc > 3) {
> +		addr = simple_strtoul(argv[3], NULL, 16);
> +		if (!addr)
> +			return CMD_RET_FAILURE;
> +	}
> +	if (argc > 4)
> +		size = simple_strtoul(argv[4], NULL, 16);
> +
> +	data = (struct stm32prog_data *)malloc(sizeof(*data));
> +
> +	if (!data) {
> +		pr_err("Alloc failed.");
> +		return CMD_RET_FAILURE;
> +	}
> +	stm32prog_data = data;
> +
> +	ret = stm32prog_init(data, addr, size);
> +	if (ret)
> +		printf("Invalid or missing layout file.");
> +
> +	/* prepare DFU for device read/write */
> +	ret = stm32prog_dfu_init(data);
> +	if (ret)
> +		goto cleanup;
> +
> +	switch (link) {
> +	case LINK_USB:
> +		reset = stm32prog_usb_loop(data, dev);
> +		break;
> +	default:
> +		goto cleanup;
> +	}
> +
> +	stm32prog_clean(data);
> +	free(stm32prog_data);
> +	stm32prog_data = NULL;
> +
> +	puts("Download done\n");
> +	if (reset) {
> +		puts("Reset...\n");
> +		run_command("reset", 0);
> +	}
> +
> +	return CMD_RET_SUCCESS;
> +
> +cleanup:
> +	stm32prog_clean(data);
> +	free(stm32prog_data);
> +	stm32prog_data = NULL;
> +
> +	return CMD_RET_FAILURE;
> +}
> +
> +U_BOOT_CMD(stm32prog, 5, 0, do_stm32prog,
> +	   "<link> <dev> [<addr>] [<size>]\n"
> +	   "start communication with tools STM32Cubeprogrammer on <link> with Flashlayout at <addr>",
> +	   "<link> = usb\n"
> +	   "<dev>  = device instance\n"
> +	   "<addr> = address of flashlayout\n"
> +	   "<size> = size of flashlayout\n"
> +);
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> new file mode 100644
> index 0000000000..e2c6c43d88
> --- /dev/null
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -0,0 +1,480 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
> + */
> +
> +#include <common.h>
> +#include <console.h>
> +#include <dfu.h>
> +#include <malloc.h>
> +#include <dm/uclass.h>
> +#include <linux/list.h>
> +#include <linux/list_sort.h>
> +#include <linux/sizes.h>
> +
> +#include "stm32prog.h"
> +
> +#define OPT_SELECT	BIT(0)
> +#define OPT_EMPTY	BIT(1)
> +
> +#define IS_SELECT(part)	((part)->option & OPT_SELECT)
> +#define IS_EMPTY(part)	((part)->option & OPT_EMPTY)
> +
> +#define ALT_BUF_LEN			SZ_1K
> +
> +DECLARE_GLOBAL_DATA_PTR;
> +
> +char *stm32prog_get_error(struct stm32prog_data *data)
> +{
> +	static const char error_msg[] = "Unspecified";
> +
> +	if (strlen(data->error) == 0)
> +		strcpy(data->error, error_msg);
> +
> +	return data->error;
> +}
> +
> +static int parse_flash_layout(struct stm32prog_data *data,
> +			      ulong addr,
> +			      ulong size)
> +{
> +	return -ENODEV;
> +}
> +
> +static int __init part_cmp(void *priv, struct list_head *a, struct list_head *b)
> +{
> +	struct stm32prog_part_t *parta, *partb;
> +
> +	parta = container_of(a, struct stm32prog_part_t, list);
> +	partb = container_of(b, struct stm32prog_part_t, list);
> +
> +	return parta->addr > partb->addr ? 1 : -1;
> +}
> +
> +static int init_device(struct stm32prog_data *data,
> +		       struct stm32prog_dev_t *dev)
> +{
> +	struct blk_desc *block_dev = NULL;
> +	int part_id;
> +	u64 first_addr = 0, last_addr = 0;
> +	struct stm32prog_part_t *part, *next_part;
> +
> +	switch (dev->target) {
> +	default:
> +		stm32prog_err("unknown device type = %d", dev->target);
> +		return -ENODEV;
> +	}
> +
> +	/* order partition list in offset order */
> +	list_sort(NULL, &dev->part_list, &part_cmp);
> +	part_id = 1;
> +	pr_debug("id : Opt Phase     Name target.n dev.n addr     size     part_off part_size\n");
> +	list_for_each_entry(part, &dev->part_list, list) {
> +		if (part->part_type == RAW_IMAGE) {
> +			part->part_id = 0x0;
> +			part->addr = 0x0;
> +			if (block_dev)
> +				part->size = block_dev->lba * block_dev->blksz;
> +			else
> +				part->size = last_addr;
> +			pr_debug("-- : %1d %02x %14s %02d %02d.%02d %08llx %08llx\n",
> +				 part->option, part->id, part->name,
> +				 part->part_type, part->target,
> +				 part->dev_id, part->addr, part->size);
> +			continue;
> +		}
> +
> +		part->part_id = part_id++;
> +
> +		/* last partition : size to the end of the device */
> +		if (part->list.next != &dev->part_list) {
> +			next_part =
> +				container_of(part->list.next,
> +					     struct stm32prog_part_t,
> +					     list);
> +			if (part->addr < next_part->addr) {
> +				part->size = next_part->addr -
> +					     part->addr;
> +			} else {
> +				stm32prog_err("%s (0x%x): same address : 0x%llx == %s (0x%x): 0x%llx",
> +					      part->name, part->id,
> +					      part->addr,
> +					      next_part->name,
> +					      next_part->id,
> +					      next_part->addr);
> +				return -EINVAL;
> +			}
> +		} else {
> +			if (part->addr <= last_addr) {
> +				part->size = last_addr - part->addr;
> +			} else {
> +				stm32prog_err("%s (0x%x): invalid address 0x%llx (max=0x%llx)",
> +					      part->name, part->id,
> +					      part->addr, last_addr);
> +				return -EINVAL;
> +			}
> +		}
> +		if (part->addr < first_addr) {
> +			stm32prog_err("%s (0x%x): invalid address 0x%llx (min=0x%llx)",
> +				      part->name, part->id,
> +				      part->addr, first_addr);
> +			return -EINVAL;
> +		}
> +
> +		pr_debug("%02d : %1d %02x %14s %02d %02d.%02d %08llx %08llx",
> +			 part->part_id, part->option, part->id, part->name,
> +			 part->part_type, part->target,
> +			 part->dev_id, part->addr, part->size);
> +	}
> +	return 0;
> +}
> +
> +static int treat_partition_list(struct stm32prog_data *data)
> +{
> +	int i, j;
> +	struct stm32prog_part_t *part;
> +
> +	for (j = 0; j < STM32PROG_MAX_DEV; j++) {
> +		data->dev[j].target = STM32PROG_NONE;
> +		INIT_LIST_HEAD(&data->dev[j].part_list);
> +	}
> +
> +	for (i = 0; i < data->part_nb; i++) {
> +		part = &data->part_array[i];
> +		part->alt_id = -1;
> +
> +		/* skip partition with IP="none" */
> +		if (part->target == STM32PROG_NONE) {
> +			if (IS_SELECT(part)) {
> +				stm32prog_err("Layout: selected none phase = 0x%x",
> +					      part->id);
> +				return -EINVAL;
> +			}
> +			continue;
> +		}
> +
> +		if (part->id == PHASE_FLASHLAYOUT ||
> +		    part->id > PHASE_LAST_USER) {
> +			stm32prog_err("Layout: invalid phase = 0x%x",
> +				      part->id);
> +			return -EINVAL;
> +		}
> +		for (j = i + 1; j < data->part_nb; j++) {
> +			if (part->id == data->part_array[j].id) {
> +				stm32prog_err("Layout: duplicated phase 0x%x at line %d and %d",
> +					      part->id, i, j);
> +				return -EINVAL;
> +			}
> +		}
> +		for (j = 0; j < STM32PROG_MAX_DEV; j++) {
> +			if (data->dev[j].target == STM32PROG_NONE) {
> +				/* new device found */
> +				data->dev[j].target = part->target;
> +				data->dev[j].dev_id = part->dev_id;
> +				data->dev_nb++;
> +				break;
> +			} else if ((part->target == data->dev[j].target) &&
> +				   (part->dev_id == data->dev[j].dev_id)) {
> +				break;
> +			}
> +		}
> +		if (j == STM32PROG_MAX_DEV) {
> +			stm32prog_err("Layout: too many device");
> +			return -EINVAL;
> +		}
> +		part->dev = &data->dev[j];
> +		list_add_tail(&part->list, &data->dev[j].part_list);
> +	}
> +
> +	return 0;
> +}
> +
> +static int stm32prog_alt_add(struct stm32prog_data *data,
> +			     struct dfu_entity *dfu,
> +			     struct stm32prog_part_t *part)
> +{
> +	int ret = 0;
> +	int offset = 0;
> +	char devstr[10];
> +	char dfustr[10];
> +	char buf[ALT_BUF_LEN];
> +	u32 size;
> +	char multiplier,  type;
> +
> +	/* max 3 digit for sector size */
> +	if (part->size > SZ_1M) {
> +		size = (u32)(part->size / SZ_1M);
> +		multiplier = 'M';
> +	} else if (part->size > SZ_1K) {
> +		size = (u32)(part->size / SZ_1K);
> +		multiplier = 'K';
> +	} else {
> +		size = (u32)part->size;
> +		multiplier = 'B';
> +	}
> +	if (IS_SELECT(part) && !IS_EMPTY(part))
> +		type = 'e'; /*Readable and Writeable*/
> +	else
> +		type = 'a';/*Readable*/
> +
> +	memset(buf, 0, sizeof(buf));
> +	offset = snprintf(buf, ALT_BUF_LEN - offset,
> +			  "@%s/0x%02x/1*%d%c%c ",
> +			  part->name, part->id,
> +			  size, multiplier, type);
> +
> +	if (part->part_type == RAW_IMAGE) {
> +		u64 dfu_size;
> +
> +		dfu_size = part->size;
> +		offset += snprintf(buf + offset, ALT_BUF_LEN - offset,
> +				   "raw 0x0 0x%llx", dfu_size);
> +	} else {
> +		offset += snprintf(buf + offset,
> +				   ALT_BUF_LEN - offset,
> +				   "part");
> +		offset += snprintf(buf + offset, ALT_BUF_LEN - offset,
> +				   " %d;", part->part_id);
> +	}
> +	switch (part->target) {
> +	default:
> +		stm32prog_err("invalid target: %d", part->target);
> +		return -ENODEV;
> +	}
> +	pr_debug("dfu_alt_add(%s,%s,%s)\n", dfustr, devstr, buf);
> +	ret = dfu_alt_add(dfu, dfustr, devstr, buf);
> +	pr_debug("dfu_alt_add(%s,%s,%s) result %d\n",
> +		 dfustr, devstr, buf, ret);
> +
> +	return ret;
> +}
> +
> +static int stm32prog_alt_add_virt(struct dfu_entity *dfu,
> +				  char *name, int phase, int size)
> +{
> +	int ret = 0;
> +	char devstr[4];
> +	char buf[ALT_BUF_LEN];
> +
> +	sprintf(devstr, "%d", phase);
> +	sprintf(buf, "@%s/0x%02x/1*%dBe", name, phase, size);
> +	ret = dfu_alt_add(dfu, "virt", devstr, buf);
> +	pr_debug("dfu_alt_add(virt,%s,%s) result %d\n", devstr, buf, ret);
> +
> +	return ret;
> +}
> +
> +static int dfu_init_entities(struct stm32prog_data *data)
> +{
> +	int ret = 0;
> +	int phase, i, alt_id;
> +	struct stm32prog_part_t *part;
> +	struct dfu_entity *dfu;
> +	int alt_nb;
> +
> +	alt_nb = 1; /* number of virtual = CMD */
> +	if (data->part_nb == 0)
> +		alt_nb++;  /* +1 for FlashLayout */
> +	else
> +		for (i = 0; i < data->part_nb; i++) {
> +			if (data->part_array[i].target != STM32PROG_NONE)
> +				alt_nb++;
> +		}
> +
> +	if (dfu_alt_init(alt_nb, &dfu))
> +		return -ENODEV;
> +
> +	puts("DFU alt info setting: ");
> +	if (data->part_nb) {
> +		alt_id = 0;
> +		for (phase = 1;
> +		     (phase <= PHASE_LAST_USER) &&
> +		     (alt_id < alt_nb) && !ret;
> +		     phase++) {
> +			/* ordering alt setting by phase id */
> +			part = NULL;
> +			for (i = 0; i < data->part_nb; i++) {
> +				if (phase == data->part_array[i].id) {
> +					part = &data->part_array[i];
> +					break;
> +				}
> +			}
> +			if (!part)
> +				continue;
> +			if (part->target == STM32PROG_NONE)
> +				continue;
> +			part->alt_id = alt_id;
> +			alt_id++;
> +
> +			ret = stm32prog_alt_add(data, dfu, part);
> +		}
> +	} else {
> +		char buf[ALT_BUF_LEN];
> +
> +		sprintf(buf, "@FlashLayout/0x%02x/1*256Ke ram %x 40000",
> +			PHASE_FLASHLAYOUT, STM32_DDR_BASE);
> +		ret = dfu_alt_add(dfu, "ram", NULL, buf);
> +		pr_debug("dfu_alt_add(ram, NULL,%s) result %d\n", buf, ret);
> +	}
> +
> +	if (!ret)
> +		ret = stm32prog_alt_add_virt(dfu, "virtual", PHASE_CMD, 512);
> +
> +	if (ret)
> +		stm32prog_err("dfu init failed: %d", ret);
> +	puts("done\n");
> +
> +#ifdef DEBUG
> +	dfu_show_entities();
> +#endif
> +	return ret;
> +}
> +
> +static void stm32prog_end_phase(struct stm32prog_data *data)
> +{
> +	if (data->phase == PHASE_FLASHLAYOUT) {
> +		if (parse_flash_layout(data, STM32_DDR_BASE, 0))
> +			stm32prog_err("Layout: invalid FlashLayout");
> +		return;
> +	}
> +
> +	if (!data->cur_part)
> +		return;
> +}
> +
> +void stm32prog_do_reset(struct stm32prog_data *data)
> +{
> +	if (data->phase == PHASE_RESET) {
> +		data->phase = PHASE_DO_RESET;
> +		puts("Reset requested\n");
> +	}
> +}
> +
> +void stm32prog_next_phase(struct stm32prog_data *data)
> +{
> +	int phase, i;
> +	struct stm32prog_part_t *part;
> +	bool found;
> +
> +	phase = data->phase;
> +	switch (phase) {
> +	case PHASE_RESET:
> +	case PHASE_END:
> +	case PHASE_DO_RESET:
> +		return;
> +	}
> +
> +	/* found next selected partition */
> +	data->cur_part = NULL;
> +	data->phase = PHASE_END;
> +	found = false;
> +	do {
> +		phase++;
> +		if (phase > PHASE_LAST_USER)
> +			break;
> +		for (i = 0; i < data->part_nb; i++) {
> +			part = &data->part_array[i];
> +			if (part->id == phase) {
> +				if (IS_SELECT(part) && !IS_EMPTY(part)) {
> +					data->cur_part = part;
> +					data->phase = phase;
> +					found = true;
> +				}
> +				break;
> +			}
> +		}
> +	} while (!found);
> +
> +	if (data->phase == PHASE_END)
> +		puts("Phase=END\n");
> +}
> +
> +static void stm32prog_devices_init(struct stm32prog_data *data)
> +{
> +	int i;
> +	int ret;
> +
> +	ret = treat_partition_list(data);
> +	if (ret)
> +		goto error;
> +
> +	/* initialize the selected device */
> +	for (i = 0; i < data->dev_nb; i++) {
> +		ret = init_device(data, &data->dev[i]);
> +		if (ret)
> +			goto error;
> +	}
> +
> +	return;
> +
> +error:
> +	data->part_nb = 0;
> +}
> +
> +int stm32prog_dfu_init(struct stm32prog_data *data)
> +{
> +	/* init device if no error */
> +	if (data->part_nb)
> +		stm32prog_devices_init(data);
> +
> +	if (data->part_nb)
> +		stm32prog_next_phase(data);
> +
> +	/* prepare DFU for device read/write */
> +	dfu_free_entities();
> +	return dfu_init_entities(data);
> +}
> +
> +int stm32prog_init(struct stm32prog_data *data, ulong addr, ulong size)
> +{
> +	memset(data, 0x0, sizeof(*data));
> +	data->phase = PHASE_FLASHLAYOUT;
> +
> +	return parse_flash_layout(data, addr, size);
> +}
> +
> +void stm32prog_clean(struct stm32prog_data *data)
> +{
> +	/* clean */
> +	dfu_free_entities();
> +	free(data->part_array);
> +	free(data->header_data);
> +}
> +
> +/* DFU callback: used after serial and direct DFU USB access */
> +void dfu_flush_callback(struct dfu_entity *dfu)
> +{
> +	if (!stm32prog_data)
> +		return;
> +
> +	if (dfu->dev_type == DFU_DEV_RAM) {
> +		if (dfu->alt == 0 &&
> +		    stm32prog_data->phase == PHASE_FLASHLAYOUT) {
> +			stm32prog_end_phase(stm32prog_data);
> +			/* waiting DFU DETACH for reenumeration */
> +		}
> +	}
> +
> +	if (!stm32prog_data->cur_part)
> +		return;
> +
> +	if (dfu->alt == stm32prog_data->cur_part->alt_id) {
> +		stm32prog_end_phase(stm32prog_data);
> +		stm32prog_next_phase(stm32prog_data);
> +	}
> +}
> +
> +void dfu_initiated_callback(struct dfu_entity *dfu)
> +{
> +	if (!stm32prog_data)
> +		return;
> +
> +	if (!stm32prog_data->cur_part)
> +		return;
> +
> +	/* force the saved offset for the current partition */
> +	if (dfu->alt == stm32prog_data->cur_part->alt_id) {
> +		dfu->offset = stm32prog_data->offset;
> +		pr_debug("dfu offset = 0x%llx\n", dfu->offset);
> +	}
> +}
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> new file mode 100644
> index 0000000000..b44b6f89af
> --- /dev/null
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -0,0 +1,137 @@
> +/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */
> +/*
> + * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
> + */
> +
> +#ifndef _STM32PROG_H_
> +#define _STM32PROG_H_
> +
> +/* - phase defines ------------------------------------------------*/
> +#define PHASE_FLASHLAYOUT	0x00
> +#define PHASE_FIRST_USER	0x10
> +#define PHASE_LAST_USER		0xF0
> +#define PHASE_CMD		0xF1
> +#define PHASE_END		0xFE
> +#define PHASE_RESET		0xFF
> +#define PHASE_DO_RESET		0x1FF
> +
> +#define DEFAULT_ADDRESS		0xFFFFFFFF
> +
> +enum stm32prog_target {
> +	STM32PROG_NONE,
> +};
> +
> +enum stm32prog_link_t {
> +	LINK_USB,
> +	LINK_UNDEFINED,
> +};
> +
> +struct image_header_s {
> +	bool	present;
> +	u32	image_checksum;
> +	u32	image_length;
> +};
> +
> +struct raw_header_s {
> +	u32 magic_number;
> +	u32 image_signature[64 / 4];
> +	u32 image_checksum;
> +	u32 header_version;
> +	u32 image_length;
> +	u32 image_entry_point;
> +	u32 reserved1;
> +	u32 load_address;
> +	u32 reserved2;
> +	u32 version_number;
> +	u32 option_flags;
> +	u32 ecdsa_algorithm;
> +	u32 ecdsa_public_key[64 / 4];
> +	u32 padding[83 / 4];
> +	u32 binary_type;
> +};
> +
> +#define BL_HEADER_SIZE	sizeof(struct raw_header_s)
> +
> +/* partition type in flashlayout file */
> +enum stm32prog_part_type {
> +	PART_BINARY,
> +	PART_SYSTEM,
> +	PART_FILESYSTEM,
> +	RAW_IMAGE
> +};
> +
> +/* device information */
> +struct stm32prog_dev_t {
> +	enum stm32prog_target	target;
> +	char			dev_id;
> +	/* list of partition for this device / ordered in offset */
> +	struct list_head	part_list;
> +};
> +
> +/* partition information build from FlashLayout and device */
> +struct stm32prog_part_t {
> +	/* FlashLayout information */
> +	int			option;
> +	int			id;
> +	enum stm32prog_part_type part_type;
> +	enum stm32prog_target	target;
> +	char			dev_id;
> +
> +	/* partition name
> +	 * (16 char in gpt, + 1 for null terminated string
> +	 */
> +	char			name[16 + 1];
> +	u64			addr;
> +	u64			size;
> +
> +	/* information on associated device */
> +	struct stm32prog_dev_t	*dev;		/* pointer to device */
> +	u16			part_id;	/* partition id in device */
> +	int			alt_id;		/* alt id in usb/dfu */
> +
> +	struct list_head	list;
> +};
> +
> +#define STM32PROG_MAX_DEV 5
> +struct stm32prog_data {
> +	/* Layout information */
> +	int			dev_nb;		/* device number*/
> +	struct stm32prog_dev_t	dev[STM32PROG_MAX_DEV];	/* array of device */
> +	int			part_nb;	/* nb of partition */
> +	struct stm32prog_part_t	*part_array;	/* array of partition */
> +
> +	/* command internal information */
> +	unsigned int		phase;
> +	u32			offset;
> +	char			error[255];
> +	struct stm32prog_part_t	*cur_part;
> +
> +	/* STM32 header information */
> +	struct raw_header_s	*header_data;
> +	struct image_header_s	header;
> +};
> +
> +extern struct stm32prog_data *stm32prog_data;
> +
> +/* generic part*/
> +u8 stm32prog_header_check(struct raw_header_s *raw_header,
> +			  struct image_header_s *header);
> +int stm32prog_dfu_init(struct stm32prog_data *data);
> +void stm32prog_next_phase(struct stm32prog_data *data);
> +void stm32prog_do_reset(struct stm32prog_data *data);
> +
> +char *stm32prog_get_error(struct stm32prog_data *data);
> +
> +#define stm32prog_err(args...) {\
> +	if (data->phase != PHASE_RESET) { \
> +		sprintf(data->error, args); \
> +		data->phase = PHASE_RESET; \
> +		pr_err("Error: %s\n", data->error); } \
> +	}
> +
> +/* Main function */
> +int stm32prog_init(struct stm32prog_data *data, ulong addr, ulong size);
> +bool stm32prog_usb_loop(struct stm32prog_data *data, int dev);
> +void stm32prog_clean(struct stm32prog_data *data);
> +
> +#endif
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> new file mode 100644
> index 0000000000..ed2cdbc66f
> --- /dev/null
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> @@ -0,0 +1,206 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
> + */
> +
> +#include <common.h>
> +#include <dfu.h>
> +#include <g_dnl.h>
> +#include <usb.h>
> +#include <asm/arch/stm32prog.h>
> +#include <asm/arch/sys_proto.h>
> +#include "stm32prog.h"
> +
> +static int stm32prog_set_phase(struct stm32prog_data *data, u8 phase,
> +			       u32 offset)
> +{
> +	struct stm32prog_part_t *part;
> +	int i;
> +
> +	if (phase == data->phase) {
> +		data->offset = offset;
> +		return 0;
> +	}
> +
> +	/* found partition for phase */
> +	for (i = 0; i < data->part_nb; i++) {
> +		part = &data->part_array[i];
> +		if (part->id == phase) {
> +			data->cur_part = part;
> +			data->phase = phase;
> +			data->offset = offset;
> +			return 0;
> +		}
> +	}
> +
> +	return  -EINVAL;
> +}
> +
> +static int stm32prog_cmd_write(u64 offset, void *buf, long *len)
> +{
> +	u8 phase;
> +	u32 address;
> +	u8 *pt = buf;
> +	void (*entry)(void);
> +	int ret;
> +
> +	if (*len < 5) {
> +		pr_err("size not allowed\n");
> +		return  -EINVAL;
> +	}
> +	if (offset) {
> +		pr_err("invalid offset\n");
> +		return  -EINVAL;
> +	}
> +	phase = pt[0];
> +	address = (pt[1] << 24) | (pt[2] << 16) | (pt[3] << 8) | pt[4];
> +	if (phase == PHASE_RESET) {
> +		entry = (void *)address;
> +		printf("## Starting application at 0x%x ...\n", address);
> +		(*entry)();
> +		printf("## Application terminated\n");
> +		return 0;
> +	}
> +	/* set phase and offset */
> +	ret = stm32prog_set_phase(stm32prog_data, phase, address);
> +	if (ret)
> +		pr_err("failed: %d\n", ret);
> +	return ret;
> +}
> +
> +#define PHASE_MIN_SIZE	9
> +static int stm32prog_cmd_read(u64 offset, void *buf, long *len)
> +{
> +	u32 destination = DEFAULT_ADDRESS; /* destination address */
> +	u32 dfu_offset;
> +	u8 *pt_buf = buf;
> +	int phase;
> +	char *err_msg;
> +	int length;
> +
> +	if (*len < PHASE_MIN_SIZE) {
> +		pr_err("request exceeds allowed area\n");
> +		return  -EINVAL;
> +	}
> +	if (offset) {
> +		*len = 0; /* EOF for second request */
> +		return 0;
> +	}
> +	phase = stm32prog_data->phase;
> +	if (phase == PHASE_FLASHLAYOUT)
> +		destination = STM32_DDR_BASE;
> +	dfu_offset = stm32prog_data->offset;
> +
> +	/* mandatory header, size = PHASE_MIN_SIZE */
> +	*pt_buf++ = (u8)(phase & 0xFF);
> +	*pt_buf++ = (u8)(destination);
> +	*pt_buf++ = (u8)(destination >> 8);
> +	*pt_buf++ = (u8)(destination >> 16);
> +	*pt_buf++ = (u8)(destination >> 24);
> +	*pt_buf++ = (u8)(dfu_offset);
> +	*pt_buf++ = (u8)(dfu_offset >> 8);
> +	*pt_buf++ = (u8)(dfu_offset >> 16);
> +	*pt_buf++ = (u8)(dfu_offset >> 24);
> +
> +	if (phase == PHASE_RESET || phase == PHASE_DO_RESET) {
> +		err_msg = stm32prog_get_error(stm32prog_data);
> +		length = strlen(err_msg);
> +		if (length + PHASE_MIN_SIZE > *len)
> +			length = *len - PHASE_MIN_SIZE;
> +
> +		memcpy(pt_buf, err_msg, length);
> +		*len = PHASE_MIN_SIZE + length;
> +		stm32prog_do_reset(stm32prog_data);
> +	} else if (phase == PHASE_FLASHLAYOUT) {
> +		*pt_buf++ = stm32prog_data->part_nb ? 1 : 0;
> +		*len = PHASE_MIN_SIZE + 1;
> +	} else {
> +		*len = PHASE_MIN_SIZE;
> +	}
> +
> +	return 0;
> +}
> +
> +int stm32prog_write_medium_virt(struct dfu_entity *dfu, u64 offset,
> +				void *buf, long *len)
> +{
> +	if (dfu->dev_type != DFU_DEV_VIRT)
> +		return -EINVAL;
> +
> +	switch (dfu->data.virt.dev_num) {
> +	case PHASE_CMD:
> +		return stm32prog_cmd_write(offset, buf, len);
> +	}
> +	*len = 0;
> +	return 0;
> +}
> +
> +int stm32prog_read_medium_virt(struct dfu_entity *dfu, u64 offset,
> +			       void *buf, long *len)
> +{
> +	if (dfu->dev_type != DFU_DEV_VIRT)
> +		return -EINVAL;
> +
> +	switch (dfu->data.virt.dev_num) {
> +	case PHASE_CMD:
> +		return stm32prog_cmd_read(offset, buf, len);
> +	}
> +	*len = 0;
> +	return 0;
> +}
> +
> +int stm32prog_get_medium_size_virt(struct dfu_entity *dfu, u64 *size)
> +{
> +	if (dfu->dev_type != DFU_DEV_VIRT) {
> +		*size = 0;
> +		pr_debug("%s, invalid dev_type = %d\n",
> +			 __func__, dfu->dev_type);
> +		return -EINVAL;
> +	}
> +
> +	switch (dfu->data.virt.dev_num) {
> +	case PHASE_CMD:
> +		*size = 512;
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +bool stm32prog_usb_loop(struct stm32prog_data *data, int dev)
> +{
> +	int ret;
> +	bool result;
> +	/* USB download gadget for STM32 Programmer */
> +	char product[128];
> +
> +	snprintf(product, sizeof(product),
> +		 "USB download gadget@Device ID /0x%03X, @Revision ID /0x%04X",
> +		 get_cpu_dev(), get_cpu_rev());
> +	g_dnl_set_product(product);
> +
> +	if (stm32prog_data->phase == PHASE_FLASHLAYOUT) {
> +		ret = run_usb_dnl_gadget(dev, "usb_dnl_dfu");
> +		if (ret || stm32prog_data->phase == PHASE_DO_RESET)
> +			return ret;
> +		/* prepare the second enumeration with the FlashLayout */
> +		if (stm32prog_data->phase == PHASE_FLASHLAYOUT)
> +			stm32prog_dfu_init(data);
> +		/* found next selected partition */
> +		stm32prog_next_phase(data);
> +	}
> +
> +	ret = run_usb_dnl_gadget(dev, "usb_dnl_dfu");
> +
> +	result = !!(ret) || (stm32prog_data->phase == PHASE_DO_RESET);
> +
> +	g_dnl_set_product(NULL);
> +
> +	return result;
> +}
> +
> +int g_dnl_get_board_bcd_device_number(int gcnum)
> +{
> +	pr_debug("%s\n", __func__);
> +	return 0x200;
> +}
> diff --git a/arch/arm/mach-stm32mp/include/mach/stm32prog.h b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
> new file mode 100644
> index 0000000000..c10bff09c8
> --- /dev/null
> +++ b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */
> +/*
> + * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
> + */
> +
> +#define STM32PROG_VIRT_FIRST_DEV_NUM		0xF1
> +
> +int stm32prog_write_medium_virt(struct dfu_entity *dfu, u64 offset,
> +				void *buf, long *len);
> +int stm32prog_read_medium_virt(struct dfu_entity *dfu, u64 offset,
> +			       void *buf, long *len);
> +int stm32prog_get_medium_size_virt(struct dfu_entity *dfu, u64 *size);
> diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
> index e129f8c8b5..3bd005bb04 100644
> --- a/board/st/common/stm32mp_dfu.c
> +++ b/board/st/common/stm32mp_dfu.c
> @@ -11,6 +11,7 @@
>  #include <misc.h>
>  #include <mtd.h>
>  #include <mtd_node.h>
> +#include <asm/arch/stm32prog.h>
>  
>  #define DFU_ALT_BUF_LEN SZ_1K
>  
> @@ -211,12 +212,31 @@ int dfu_read_medium_virt(struct dfu_entity *dfu, u64 offset,
>  	case 0x1:
>  		return dfu_pmic_read(offset, buf, len);
>  	}
> +
> +	if (CONFIG_IS_ENABLED(CMD_STM32PROG) &&
> +	    dfu->data.virt.dev_num >= STM32PROG_VIRT_FIRST_DEV_NUM)
> +		return stm32prog_read_medium_virt(dfu, offset, buf, len);
> +
>  	*len = 0;
>  	return 0;
>  }
>  
> +int dfu_write_medium_virt(struct dfu_entity *dfu, u64 offset,
> +			  void *buf, long *len)
> +{
> +	if (CONFIG_IS_ENABLED(CMD_STM32PROG) &&
> +	    dfu->data.virt.dev_num >= STM32PROG_VIRT_FIRST_DEV_NUM)
> +		return stm32prog_write_medium_virt(dfu, offset, buf, len);
> +
> +	return -EOPNOTSUPP;
> +}
> +
>  int __weak dfu_get_medium_size_virt(struct dfu_entity *dfu, u64 *size)
>  {
> +	if (CONFIG_IS_ENABLED(CMD_STM32PROG) &&
> +	    dfu->data.virt.dev_num >= STM32PROG_VIRT_FIRST_DEV_NUM)
> +		return stm32prog_get_medium_size_virt(dfu, size);
> +
>  	*size = SZ_1K;
>  
>  	return 0;
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index f9bc5b6086..baed3d92f5 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -6,6 +6,7 @@ CONFIG_ENV_OFFSET=0x280000
>  CONFIG_SPL_MMC_SUPPORT=y
>  CONFIG_SPL=y
>  CONFIG_TARGET_ST_STM32MP15x=y
> +CONFIG_CMD_STM32PROG=y
>  CONFIG_ENV_OFFSET_REDUND=0x2C0000
>  CONFIG_SPL_SPI_FLASH_SUPPORT=y
>  CONFIG_SPL_SPI_SUPPORT=y
> @@ -68,9 +69,7 @@ CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
>  CONFIG_SYS_RELOC_GD_ENV_ADDR=y
>  CONFIG_STM32_ADC=y
>  CONFIG_DFU_MMC=y
> -CONFIG_DFU_RAM=y
>  CONFIG_DFU_MTD=y
> -CONFIG_DFU_VIRT=y
>  CONFIG_SET_DFU_ALT_INFO=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y
>  CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index f0d524d344..adbe304902 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -4,6 +4,7 @@ CONFIG_SYS_MALLOC_F_LEN=0x3000
>  CONFIG_ENV_SECT_SIZE=0x40000
>  CONFIG_ENV_OFFSET=0x280000
>  CONFIG_TARGET_ST_STM32MP15x=y
> +CONFIG_CMD_STM32PROG=y
>  CONFIG_ENV_OFFSET_REDUND=0x2C0000
>  CONFIG_DISTRO_DEFAULTS=y
>  CONFIG_FIT=y
> @@ -54,9 +55,7 @@ CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
>  CONFIG_SYS_RELOC_GD_ENV_ADDR=y
>  CONFIG_STM32_ADC=y
>  CONFIG_DFU_MMC=y
> -CONFIG_DFU_RAM=y
>  CONFIG_DFU_MTD=y
> -CONFIG_DFU_VIRT=y
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

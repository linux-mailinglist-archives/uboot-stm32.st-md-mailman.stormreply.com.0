Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CAE1A7BC8
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 15:07:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E856C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 13:07:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3E2DC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 13:07:20 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ED3u1Z011468; Tue, 14 Apr 2020 15:07:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=laUAAiQ1bVBe4ZgIXhhbu5JPDIb+Aqd9vOy5pQWn6C4=;
 b=AC3flqsAUVIMyMoR/b0scouIKnv466NQZs5fRabh7pPelrUClV+CI1qBRv54qjfUQEbH
 1QoG1LYQYS4E1PGGOGxBXW9eRViQPFV+xKiX50YwL1YZhNt6YHYH+ZoEDYviF2RMJdgI
 qHmX51HanvOt0vNoBcTet4jHeN4gOjwKdGnUKaPTKwIWN6+3GM9+jfXYFumwBjSTJsV8
 A3jdOZwxSzDfVjilZjIWXYCb3dj38Lo6BcRrjbUVCeBwacpQSgIjP58X3+omNALIIwKh
 E5qjvZvL8szUfpNh+Q1cQLY/S2QqKIbUrfGq8qcd0NDYP5BYJKiKcL6mn7oCQ4m/iSKf DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b668dpb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 15:07:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A650D100034;
 Tue, 14 Apr 2020 15:07:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D35E2B5C5F;
 Tue, 14 Apr 2020 15:07:15 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Apr
 2020 15:07:15 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 15:07:15 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 10/18] stm32mp: stm32prog: adapt the MTD partitions
Thread-Index: AQHV/P6/0zjBXeEvl0ujRij/yz7mAqh4n7YA
Date: Tue, 14 Apr 2020 13:07:15 +0000
Message-ID: <18158cd8-1616-1bfd-ff28-68ed16db79bb@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
 <20200318082503.8025-11-patrick.delaunay@st.com>
In-Reply-To: <20200318082503.8025-11-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <E7F3F064B4590F4D971720D34E2D8942@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 10/18] stm32mp: stm32prog: adapt the MTD
	partitions
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
> Dynamically adapt the MTD partitions in NOR/NAND/SPI-NAND when stm32prog
> command detects in the parsed flash layout files:
> - a fsbl partition in NOR.
> - a tee partition in NOR/NAND/SPI-NAND
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  .../mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c  | 17 +++++++++++++++++
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 17 +++++++++++++++++
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h |  2 ++
>  arch/arm/mach-stm32mp/include/mach/stm32prog.h  |  4 ++++
>  board/st/common/stm32mp_mtdparts.c              | 14 ++++++++++++--
>  5 files changed, 52 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> index 3e8b426444..581f97e0b5 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> @@ -6,6 +6,7 @@
>  #include <common.h>
>  #include <command.h>
>  #include <dfu.h>
> +#include <asm/arch/stm32prog.h>
>  #include "stm32prog.h"
>  
>  struct stm32prog_data *stm32prog_data;
> @@ -94,3 +95,19 @@ U_BOOT_CMD(stm32prog, 5, 0, do_stm32prog,
>  	   "<addr> = address of flashlayout\n"
>  	   "<size> = size of flashlayout\n"
>  );
> +
> +bool stm32prog_get_tee_partitions(void)
> +{
> +	if (stm32prog_data)
> +		return stm32prog_data->tee_detected;
> +
> +	return false;
> +}
> +
> +bool stm32prog_get_fsbl_nor(void)
> +{
> +	if (stm32prog_data)
> +		return stm32prog_data->fsbl_nor_detected;
> +
> +	return false;
> +}
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 93ee6a55a1..0140fd479d 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -762,6 +762,8 @@ static int treat_partition_list(struct stm32prog_data *data)
>  		INIT_LIST_HEAD(&data->dev[j].part_list);
>  	}
>  
> +	data->tee_detected = false;
> +	data->fsbl_nor_detected = false;
>  	for (i = 0; i < data->part_nb; i++) {
>  		part = &data->part_array[i];
>  		part->alt_id = -1;
> @@ -806,6 +808,21 @@ static int treat_partition_list(struct stm32prog_data *data)
>  			stm32prog_err("Layout: too many device");
>  			return -EINVAL;
>  		}
> +		switch (part->target)  {
> +		case STM32PROG_NOR:
> +			if (!data->fsbl_nor_detected &&
> +			    !strncmp(part->name, "fsbl", 4))
> +				data->fsbl_nor_detected = true;
> +			/* fallthrough */
> +		case STM32PROG_NAND:
> +		case STM32PROG_SPI_NAND:
> +			if (!data->tee_detected &&
> +			    !strncmp(part->name, "tee", 3))
> +				data->tee_detected = true;
> +			break;
> +		default:
> +			break;
> +		}
>  		part->dev = &data->dev[j];
>  		if (!IS_SELECT(part))
>  			part->dev->full_update = false;
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index 8e635da3a4..7f06627ebc 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -107,6 +107,8 @@ struct stm32prog_data {
>  	struct stm32prog_dev_t	dev[STM32PROG_MAX_DEV];	/* array of device */
>  	int			part_nb;	/* nb of partition */
>  	struct stm32prog_part_t	*part_array;	/* array of partition */
> +	bool			tee_detected;
> +	bool			fsbl_nor_detected;
>  
>  	/* command internal information */
>  	unsigned int		phase;
> diff --git a/arch/arm/mach-stm32mp/include/mach/stm32prog.h b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
> index c10bff09c8..c080b9cc42 100644
> --- a/arch/arm/mach-stm32mp/include/mach/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
> @@ -10,3 +10,7 @@ int stm32prog_write_medium_virt(struct dfu_entity *dfu, u64 offset,
>  int stm32prog_read_medium_virt(struct dfu_entity *dfu, u64 offset,
>  			       void *buf, long *len);
>  int stm32prog_get_medium_size_virt(struct dfu_entity *dfu, u64 *size);
> +
> +bool stm32prog_get_tee_partitions(void);
> +
> +bool stm32prog_get_fsbl_nor(void);
> diff --git a/board/st/common/stm32mp_mtdparts.c b/board/st/common/stm32mp_mtdparts.c
> index 5028511077..9f5897f8c8 100644
> --- a/board/st/common/stm32mp_mtdparts.c
> +++ b/board/st/common/stm32mp_mtdparts.c
> @@ -4,12 +4,14 @@
>   */
>  
>  #include <common.h>
> +#include <dfu.h>
>  #include <dm.h>
>  #include <env.h>
>  #include <env_internal.h>
>  #include <mtd.h>
>  #include <mtd_node.h>
>  #include <tee.h>
> +#include <asm/arch/stm32prog.h>
>  #include <asm/arch/sys_proto.h>
>  
>  #define MTDPARTS_LEN		256
> @@ -66,7 +68,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
>  	static char parts[3 * MTDPARTS_LEN + 1];
>  	static char ids[MTDIDS_LEN + 1];
>  	static bool mtd_initialized;
> -	bool tee, nor, nand, spinand;
> +	bool tee, nor, nand, spinand, serial;
>  
>  	if (mtd_initialized) {
>  		*mtdids = ids;
> @@ -78,10 +80,18 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
>  	nor = false;
>  	nand = false;
>  	spinand = false;
> +	serial = false;
>  
>  	switch (get_bootmode() & TAMP_BOOT_DEVICE_MASK) {
>  	case BOOT_SERIAL_UART:
>  	case BOOT_SERIAL_USB:
> +		serial = true;
> +		if (CONFIG_IS_ENABLED(CMD_STM32PROG)) {
> +			tee = stm32prog_get_tee_partitions();
> +			nor = stm32prog_get_fsbl_nor();
> +		}
> +		nand = true;
> +		spinand = true;
>  		break;
>  	case BOOT_FLASH_NAND:
>  		nand = true;
> @@ -96,7 +106,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
>  		break;
>  	}
>  
> -	if (CONFIG_IS_ENABLED(OPTEE) &&
> +	if (!serial && CONFIG_IS_ENABLED(OPTEE) &&
>  	    tee_find_device(NULL, NULL, NULL, NULL))
>  		tee = true;
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

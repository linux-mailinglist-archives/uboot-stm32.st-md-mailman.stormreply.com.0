Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F34651A7C01
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 15:11:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC57DC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 13:11:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B3A5C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 13:11:53 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ED3voL011479; Tue, 14 Apr 2020 15:11:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=z5p2XSexg/fzmVvjM1PHXVm/Se9snmZPkqdO9QGlDSI=;
 b=bwwXASdNctUCN5ydvVoKDT+eVIuV+XLmXyYIB2nx5QSHZm7N2HvSESpJjshVscXH2qtq
 5t3toMfRrYW0UwMFYp3mXkKVVb/MVDm5oiXt79G8TbuD/6IWcIaiqfKHOYq/wK76zpsd
 pKcfBCtMtudvvrDt3OMZ1TC3hb8Qvd0tm8NZXAHPQuP1q9tFvVN1RI84qi/ronqCEODx
 bB5Cwb6g2fmXDiyLJQPryK5H7Ct5+KdmnQLNw9k/lebveOHt5nB0LA/gpyKmI7Mlnwod
 ZGVH3rYriogTTR2tXnpoOWkeU5iiYshKSmcV+N2Ru5Vc7y/h3Hc+vTHXVa9f5NBrxtJu NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b668dq3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 15:11:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 00D6F100034;
 Tue, 14 Apr 2020 15:11:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC1D92BC7A7;
 Tue, 14 Apr 2020 15:11:47 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Apr
 2020 15:11:47 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 15:11:47 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 18/18] stm32mp: stm32prog: add support of RAM target
Thread-Index: AQHV/P7FfnAnEDVuY0aH22ohJwX1C6h4oPyA
Date: Tue, 14 Apr 2020 13:11:47 +0000
Message-ID: <06bda29d-6d3f-454e-7459-6dbb3c0f50af@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
 <20200318082503.8025-19-patrick.delaunay@st.com>
In-Reply-To: <20200318082503.8025-19-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <E3DBCAC3A2A0ED449091A858DE075920@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 18/18] stm32mp: stm32prog: add support of
	RAM target
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

On 3/18/20 9:25 AM, Patrick Delaunay wrote:
> Add support of RAM target in flashlayout to load kernel image
> ("system") and device tree ("filesystem") in DDR with DFU and
> start these images.
>
> The flashlayout.tsv is:
>
> -	0x01	fsbl		Binary		none	0x00000000	tf-a.stm32
> -	0x03	ssbl		Binary		none	0x00000000	u-boot.stm32
> P	0x10	kernel		System		ram0	0xC2000000	uImage.bin
> P	0x11	dtb		FileSystem	ram0	0xC4000000	dtb.bin
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  .../cmd_stm32prog/cmd_stm32prog.c             | 28 ++++++++++++++++++
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 29 ++++++++++++++++++-
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  7 ++++-
>  3 files changed, 62 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> index baf9b6bd1e..6bebea7ad5 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> @@ -47,6 +47,7 @@ static int do_stm32prog(cmd_tbl_t *cmdtp, int flag, int argc,
>  	bool reset = false;
>  	struct image_header_s header;
>  	struct stm32prog_data *data;
> +	u32 uimage, dtb;
>  
>  	if (argc < 3 ||  argc > 5)
>  		return CMD_RET_USAGE;
> @@ -118,11 +119,38 @@ static int do_stm32prog(cmd_tbl_t *cmdtp, int flag, int argc,
>  		goto cleanup;
>  	}
>  
> +	uimage = data->uimage;
> +	dtb = data->dtb;
> +
>  	stm32prog_clean(data);
>  	free(stm32prog_data);
>  	stm32prog_data = NULL;
>  
>  	puts("Download done\n");
> +
> +	if (uimage) {
> +		char boot_addr_start[20];
> +		char dtb_addr[20];
> +		char *bootm_argv[5] = {
> +			"bootm", boot_addr_start, "-", dtb_addr, NULL
> +		};
> +		if (!dtb)
> +			bootm_argv[3] = env_get("fdtcontroladdr");
> +		else
> +			snprintf(dtb_addr, sizeof(dtb_addr) - 1,
> +				 "0x%x", dtb);
> +
> +		snprintf(boot_addr_start, sizeof(boot_addr_start) - 1,
> +			 "0x%x", uimage);
> +		printf("Booting kernel at %s - %s...\n\n\n",
> +		       boot_addr_start, bootm_argv[3]);
> +		/* Try bootm for legacy and FIT format image */
> +		if (genimg_get_format((void *)uimage) != IMAGE_FORMAT_INVALID)
> +			do_bootm(cmdtp, 0, 4, bootm_argv);
> +		else if CONFIG_IS_ENABLED(CMD_BOOTZ)
> +			do_bootz(cmdtp, 0, 4, bootm_argv);
> +	}
> +
>  	if (reset) {
>  		puts("Reset...\n");
>  		run_command("reset", 0);
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 0967bbc11a..cc303214cf 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -272,6 +272,9 @@ static int parse_ip(struct stm32prog_data *data,
>  	} else if (!strncmp(p, "spi-nand", 8)) {
>  		part->target = STM32PROG_SPI_NAND;
>  		len = 8;
> +	} else if (!strncmp(p, "ram", 3)) {
> +		part->target = STM32PROG_RAM;
> +		len = 0;
>  	} else {
>  		result = -EINVAL;
>  	}
> @@ -610,6 +613,11 @@ static int init_device(struct stm32prog_data *data,
>  		dev->mtd = mtd;
>  		break;
>  #endif
> +	case STM32PROG_RAM:
> +		first_addr = gd->bd->bi_dram[0].start;
> +		last_addr = first_addr + gd->bd->bi_dram[0].size;
> +		dev->erase_size = 1;
> +		break;
>  	default:
>  		stm32prog_err("unknown device type = %d", dev->target);
>  		return -ENODEV;
> @@ -1022,7 +1030,11 @@ static int stm32prog_alt_add(struct stm32prog_data *data,
>  			  part->name, part->id,
>  			  size, multiplier, type);
>  
> -	if (part->part_type == RAW_IMAGE) {
> +	if (part->target == STM32PROG_RAM) {
> +		offset += snprintf(buf + offset, ALT_BUF_LEN - offset,
> +				   "ram 0x%llx 0x%llx",
> +				   part->addr, part->size);
> +	} else if (part->part_type == RAW_IMAGE) {
>  		u64 dfu_size;
>  
>  		if (part->dev->target == STM32PROG_MMC)
> @@ -1073,6 +1085,10 @@ static int stm32prog_alt_add(struct stm32prog_data *data,
>  		get_mtd_by_target(devstr, part->target, part->dev_id);
>  		break;
>  #endif
> +	case STM32PROG_RAM:
> +		sprintf(dfustr, "ram");
> +		sprintf(devstr, "0");
> +		break;
>  	default:
>  		stm32prog_err("invalid target: %d", part->target);
>  		return -ENODEV;
> @@ -1440,6 +1456,13 @@ static void stm32prog_end_phase(struct stm32prog_data *data)
>  	if (!data->cur_part)
>  		return;
>  
> +	if (data->cur_part->target == STM32PROG_RAM) {
> +		if (data->cur_part->part_type == PART_SYSTEM)
> +			data->uimage = data->cur_part->addr;
> +		if (data->cur_part->part_type == PART_FILESYSTEM)
> +			data->dtb = data->cur_part->addr;
> +	}
> +
>  	if (CONFIG_IS_ENABLED(MMC) &&
>  	    data->cur_part->part_id < 0) {
>  		char cmdbuf[60];
> @@ -1569,6 +1592,10 @@ static int part_delete(struct stm32prog_data *data,
>  		}
>  		break;
>  #endif
> +	case STM32PROG_RAM:
> +		printf("on ram: ");
> +		memset((void *)(uintptr_t)part->addr, 0, (size_t)part->size);
> +		break;
>  	default:
>  		ret = -1;
>  		stm32prog_err("%s (0x%x): erase invalid", part->name, part->id);
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index c4fdb5b8c3..bae4e91c01 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -27,7 +27,8 @@ enum stm32prog_target {
>  	STM32PROG_MMC,
>  	STM32PROG_NAND,
>  	STM32PROG_NOR,
> -	STM32PROG_SPI_NAND
> +	STM32PROG_SPI_NAND,
> +	STM32PROG_RAM
>  };
>  
>  enum stm32prog_link_t {
> @@ -136,6 +137,10 @@ struct stm32prog_data {
>  	u8	*buffer; /* size = USART_RAM_BUFFER_SIZE*/
>  	int	dfu_seq;
>  	u8	read_phase;
> +
> +	/* bootm information */
> +	u32	uimage;
> +	u32	dtb;
>  };
>  
>  extern struct stm32prog_data *stm32prog_data;

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

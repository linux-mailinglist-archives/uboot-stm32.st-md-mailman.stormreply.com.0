Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B1D1A7BD1
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 15:08:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FC66C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 13:08:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E28EC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 13:08:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ED39cf030554; Tue, 14 Apr 2020 15:08:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ebFshqsYpybDKp4PYkGMNt9oWe5/NabAkDfMBibMukA=;
 b=UkqwDQ2QPpUU3aFiL87i6BGfnWqTj8HcK3QX6MZoicY1pZNH81Fj8nl/10UMNvPMX4Kz
 g6Y3JEvCuhgeIQmFirEqC2QWbQQipWsmTkbXPWyeFL+ru6rjWadyii5jSg9pxhHnJrnt
 Ujjnir6NUru6qALVLi5O3xD7aSvrmOmyEfBzqvr41AhvTdZGf9xnUffylXE5UbXuYuqq
 4nC6oIxdaEfnGcSRwQjpmBJb0VVUOSiXZA2dyM6sUAQz1N7llUhDwUWLZnNjG3JR+NS3
 yUjE+Tb61JVoTh5x5Cs5sQugh0oO8BxnGrRs/IllvSysnH7rnsboep7Mu4ow2joQr7Z3 vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b5stdtsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 15:08:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 01CB7100034;
 Tue, 14 Apr 2020 15:08:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC9D22BC7A9;
 Tue, 14 Apr 2020 15:08:28 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Apr
 2020 15:08:28 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 15:08:28 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 12/18] stm32mp: stm32prog: add support for delete option
 in flashlayout
Thread-Index: AQHV/P7BEs1zoDmU6EOKzrLqtrviRah4oA4A
Date: Tue, 14 Apr 2020 13:08:28 +0000
Message-ID: <614a9003-40a7-570a-138e-883b33bc9dfa@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
 <20200318082503.8025-13-patrick.delaunay@st.com>
In-Reply-To: <20200318082503.8025-13-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <6BFD46D4B5488D45BCEEA23809160A2C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 12/18] stm32mp: stm32prog: add support for
 delete option in flashlayout
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
> Add support for delete option 'D' in flashlayout for
> full device or for partitions
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 3e521d42f2..3573c04d16 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -23,9 +23,11 @@
>  
>  #define OPT_SELECT	BIT(0)
>  #define OPT_EMPTY	BIT(1)
> +#define OPT_DELETE	BIT(2)
>  
>  #define IS_SELECT(part)	((part)->option & OPT_SELECT)
>  #define IS_EMPTY(part)	((part)->option & OPT_EMPTY)
> +#define IS_DELETE(part)	((part)->option & OPT_DELETE)
>  
>  #define ALT_BUF_LEN			SZ_1K
>  
> @@ -158,6 +160,9 @@ static int parse_option(struct stm32prog_data *data,
>  		case 'E':
>  			part->option |= OPT_EMPTY;
>  			break;
> +		case 'D':
> +			part->option |= OPT_DELETE;
> +			break;
>  		default:
>  			result = -EINVAL;
>  			stm32prog_err("Layout line %d: invalid option '%c' in %s)",
> @@ -1293,10 +1298,80 @@ void stm32prog_next_phase(struct stm32prog_data *data)
>  		puts("Phase=END\n");
>  }
>  
> +static int part_delete(struct stm32prog_data *data,
> +		       struct stm32prog_part_t *part)
> +{
> +	int ret = 0;
> +#ifdef CONFIG_MMC
> +	unsigned long blks, blks_offset, blks_size;
> +	struct blk_desc *block_dev = NULL;
> + #endif
> +#ifdef CONFIG_MTD
> +	char cmdbuf[40];
> +	char devstr[10];
> +#endif
> +
> +	printf("Erasing %s ", part->name);
> +	switch (part->target) {
> +#ifdef CONFIG_MMC
> +	case STM32PROG_MMC:
> +		printf("on mmc %d: ", part->dev->dev_id);
> +		block_dev = mmc_get_blk_desc(part->dev->mmc);
> +		blks_offset = lldiv(part->addr, part->dev->mmc->read_bl_len);
> +		blks_size = lldiv(part->size, part->dev->mmc->read_bl_len);
> +		/* -1 or -2 : delete boot partition of MMC
> +		 * need to switch to associated hwpart 1 or 2
> +		 */
> +		if (part->part_id < 0)
> +			if (blk_select_hwpart_devnum(IF_TYPE_MMC,
> +						     part->dev->dev_id,
> +						     -part->part_id))
> +				return -1;
> +
> +		blks = blk_derase(block_dev, blks_offset, blks_size);
> +
> +		/* return to user partition */
> +		if (part->part_id < 0)
> +			blk_select_hwpart_devnum(IF_TYPE_MMC,
> +						 part->dev->dev_id, 0);
> +		if (blks != blks_size) {
> +			ret = -1;
> +			stm32prog_err("%s (0x%x): MMC erase failed",
> +				      part->name, part->id);
> +		}
> +		break;
> +#endif
> +#ifdef CONFIG_MTD
> +	case STM32PROG_NOR:
> +	case STM32PROG_NAND:
> +	case STM32PROG_SPI_NAND:
> +		get_mtd_by_target(devstr, part->target, part->dev->dev_id);
> +		printf("on %s: ", devstr);
> +		sprintf(cmdbuf, "mtd erase %s 0x%llx 0x%llx",
> +			devstr, part->addr, part->size);
> +		if (run_command(cmdbuf, 0)) {
> +			ret = -1;
> +			stm32prog_err("%s (0x%x): MTD erase commands failed (%s)",
> +				      part->name, part->id, cmdbuf);
> +		}
> +		break;
> +#endif
> +	default:
> +		ret = -1;
> +		stm32prog_err("%s (0x%x): erase invalid", part->name, part->id);
> +		break;
> +	}
> +	if (!ret)
> +		printf("done\n");
> +
> +	return ret;
> +}
> +
>  static void stm32prog_devices_init(struct stm32prog_data *data)
>  {
>  	int i;
>  	int ret;
> +	struct stm32prog_part_t *part;
>  
>  	ret = treat_partition_list(data);
>  	if (ret)
> @@ -1309,10 +1384,40 @@ static void stm32prog_devices_init(struct stm32prog_data *data)
>  			goto error;
>  	}
>  
> +	/* delete RAW partition before create partition */
> +	for (i = 0; i < data->part_nb; i++) {
> +		part = &data->part_array[i];
> +
> +		if (part->part_type != RAW_IMAGE)
> +			continue;
> +
> +		if (!IS_SELECT(part) || !IS_DELETE(part))
> +			continue;
> +
> +		ret = part_delete(data, part);
> +		if (ret)
> +			goto error;
> +	}
> +
>  	ret = create_partitions(data);
>  	if (ret)
>  		goto error;
>  
> +	/* delete partition GPT or MTD */
> +	for (i = 0; i < data->part_nb; i++) {
> +		part = &data->part_array[i];
> +
> +		if (part->part_type == RAW_IMAGE)
> +			continue;
> +
> +		if (!IS_SELECT(part) || !IS_DELETE(part))
> +			continue;
> +
> +		ret = part_delete(data, part);
> +		if (ret)
> +			goto error;
> +	}
> +
>  	return;
>  
>  error:

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CA31A7BBE
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 15:06:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E111CC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 13:06:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B81C7C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 13:06:05 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ED307S023937; Tue, 14 Apr 2020 15:06:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=kzsLfh6p6Gd9utIiW3fnCq7kT8CwJk6shisk++pUlDE=;
 b=cjYZV7oqOQ0OgW+2YWG15DcQqJorSAVWKZuodnaG3kfXSHyDzFkMZLo+vNd6eW9qx/Mc
 qyY5kskXYqbHi/7pq/cQdR27vrq3Xb/hGRm2APeyPEzeEZ9jNuXjRa3s7JMKz65ogzqE
 4muQVefhJXjNLZPte88oLUroRtj1lzsVAouBjD/t8KCb8Ld8Pew3IPHVWHTm3ql14e+9
 DbRuaV5NbnsbKrhepxXZaEThPnqMyg7gNSrk+qa6SAx0dWa7sOI4y6VnVl6A+d8isUqm
 3hAS08/dwPda6ijpbaHv0MdLJnfLeJuLsc8CdcWJWcgcAP1zZk19xXhCyas/Lu667iNj tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b66a5p7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 15:06:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1A1A100039;
 Tue, 14 Apr 2020 15:05:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E922B2B5C50;
 Tue, 14 Apr 2020 15:05:59 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 14 Apr
 2020 15:05:59 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 15:05:59 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 08/18] stm32mp: stm32prog: add upport of partial update
Thread-Index: AQHV/P6+t3oif4rZOE+8eILZJKeoNqh4n1wA
Date: Tue, 14 Apr 2020 13:05:59 +0000
Message-ID: <ca2c9798-1e2e-163e-53a0-594a9c4cb9a9@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
 <20200318082503.8025-9-patrick.delaunay@st.com>
In-Reply-To: <20200318082503.8025-9-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <30D2A81BE5CF024680C49F06E6A68842@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 08/18] stm32mp: stm32prog: add upport of
	partial update
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
> Add support of partial update, update only some partitions,
> and check the coherence of the layout with the existing GPT
> partitions (offset and size).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 69 +++++++++++++++++++
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  1 +
>  2 files changed, 70 insertions(+)
>
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index f63036606e..787bcdef7d 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -481,8 +481,12 @@ static int init_device(struct stm32prog_data *data,
>  	struct mmc *mmc = NULL;
>  	struct blk_desc *block_dev = NULL;
>  	int part_id;
> +	int ret;
>  	u64 first_addr = 0, last_addr = 0;
>  	struct stm32prog_part_t *part, *next_part;
> +	u64 part_addr, part_size;
> +	bool part_found;
> +	const char *part_name;
>  
>  	switch (dev->target) {
>  #ifdef CONFIG_MMC
> @@ -515,6 +519,7 @@ static int init_device(struct stm32prog_data *data,
>  			 block_dev->lba, block_dev->blksz);
>  		pr_debug(" available address = 0x%llx..0x%llx\n",
>  			 first_addr, last_addr);
> +		pr_debug(" full_update = %d\n", dev->full_update);
>  		break;
>  #endif
>  	default:
> @@ -522,6 +527,7 @@ static int init_device(struct stm32prog_data *data,
>  		return -ENODEV;
>  	}
>  	pr_debug(" erase size = 0x%x\n", dev->erase_size);
> +	pr_debug(" full_update = %d\n", dev->full_update);
>  
>  	/* order partition list in offset order */
>  	list_sort(NULL, &dev->part_list, &part_cmp);
> @@ -598,6 +604,61 @@ static int init_device(struct stm32prog_data *data,
>  			 part->part_id, part->option, part->id, part->name,
>  			 part->part_type, part->target,
>  			 part->dev_id, part->addr, part->size);
> +
> +		part_addr = 0;
> +		part_size = 0;
> +		part_found = false;
> +
> +		/* check coherency with existing partition */
> +		if (block_dev) {
> +			/*
> +			 * block devices with GPT: check user partition size
> +			 * only for partial update, the GPT partions are be
> +			 * created for full update
> +			 */
> +			if (dev->full_update || part->part_id < 0) {
> +				pr_debug("\n");
> +				continue;
> +			}
> +			disk_partition_t partinfo;
> +
> +			ret = part_get_info(block_dev, part->part_id,
> +					    &partinfo);
> +
> +			if (ret) {
> +				stm32prog_err("%s (0x%x):Couldn't find part %d on device mmc %d",
> +					      part->name, part->id,
> +					      part_id, part->dev_id);
> +				return -ENODEV;
> +			}
> +			part_addr = (u64)partinfo.start * partinfo.blksz;
> +			part_size = (u64)partinfo.size * partinfo.blksz;
> +			part_name = (char *)partinfo.name;
> +			part_found = true;
> +		}
> +
> +		if (!part_found) {
> +			stm32prog_err("%s (0x%x): Invalid partition",
> +				      part->name, part->id);
> +			pr_debug("\n");
> +			continue;
> +		}
> +
> +		pr_debug(" %08llx %08llx\n", part_addr, part_size);
> +
> +		if (part->addr != part_addr) {
> +			stm32prog_err("%s (0x%x): Bad address for partition %d (%s) = 0x%llx <> 0x%llx expected",
> +				      part->name, part->id, part->part_id,
> +				      part_name, part->addr, part_addr);
> +			return -ENODEV;
> +		}
> +		if (part->size != part_size) {
> +			stm32prog_err("%s (0x%x): Bad size for partition %d (%s) at 0x%llx = 0x%llx <> 0x%llx expected",
> +				      part->name, part->id, part->part_id,
> +				      part_name, part->addr, part->size,
> +				      part_size);
> +			return -ENODEV;
> +		}
>  	}
>  	return 0;
>  }
> @@ -644,6 +705,7 @@ static int treat_partition_list(struct stm32prog_data *data)
>  				/* new device found */
>  				data->dev[j].target = part->target;
>  				data->dev[j].dev_id = part->dev_id;
> +				data->dev[j].full_update = true;
>  				data->dev_nb++;
>  				break;
>  			} else if ((part->target == data->dev[j].target) &&
> @@ -656,6 +718,8 @@ static int treat_partition_list(struct stm32prog_data *data)
>  			return -EINVAL;
>  		}
>  		part->dev = &data->dev[j];
> +		if (!IS_SELECT(part))
> +			part->dev->full_update = false;
>  		list_add_tail(&part->list, &data->dev[j].part_list);
>  	}
>  
> @@ -682,6 +746,11 @@ static int create_partitions(struct stm32prog_data *data)
>  	puts("partitions : ");
>  	/* initialize the selected device */
>  	for (i = 0; i < data->dev_nb; i++) {
> +		/* create gpt partition support only for full update on MMC */
> +		if (data->dev[i].target != STM32PROG_MMC ||
> +		    !data->dev[i].full_update)
> +			continue;
> +
>  		offset = 0;
>  		rootfs_found = false;
>  		memset(buf, 0, buflen);
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index 6c3ad56a38..ea88459896 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -69,6 +69,7 @@ struct stm32prog_dev_t {
>  	struct mmc		*mmc;
>  	/* list of partition for this device / ordered in offset */
>  	struct list_head	part_list;
> +	bool			full_update;
>  };
>  
>  /* partition information build from FlashLayout and device */

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

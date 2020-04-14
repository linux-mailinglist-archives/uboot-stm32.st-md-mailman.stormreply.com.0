Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 596E01A7BCC
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 15:08:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21C2EC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 13:08:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A715FC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 13:08:05 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ED2t4D023881; Tue, 14 Apr 2020 15:08:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=rZiBXpX+eXUu2GKtx0Cq3q6/cLIIebcpKD7DAgyJfuo=;
 b=aGCYMn4ruY5rfuGmK6Iv6h2y7AqCTbgYmRCRhfXvZy6EoSk9+5iqxLORrzw3kSsIQ0aA
 5wYi976mbNLDYBlJKU+kHDUcdnzuTQH+2FxwXM7VW6dL3JOtVSDzMnJubsxdfzFwcDiB
 Asj3gpBdHaiEtlCbwo2OQipmHBq/VmDFkzTj0hzhUbiYw3AiNgNmUxOr8vHfZ5nZLITj
 C2fEwvsgbtCEHa6Lo2ktbFXN/6ULbVDVI6goFXP/aAZEbW0++wRS0KJE8GCQRID0Q3//
 5pyPaUXw6SrdAVXo2tLeljfQJ8/TcL2PdmQrYYwvs4Ra2bRALqgdpSNtvEceJv+O4jPN ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b66a5pk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 15:08:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3FAE510002A;
 Tue, 14 Apr 2020 15:08:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 366F42BC7A1;
 Tue, 14 Apr 2020 15:08:00 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 14 Apr
 2020 15:07:59 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 15:07:59 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 11/18] stm32mp: stm32prog: add support of ssbl copy
Thread-Index: AQHV/P7A++TU9xyEfkKNiZhj8/TVgqh4n+yA
Date: Tue, 14 Apr 2020 13:07:59 +0000
Message-ID: <afdbf527-1c45-70c2-f66b-64bde3485a74@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
 <20200318082503.8025-12-patrick.delaunay@st.com>
In-Reply-To: <20200318082503.8025-12-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <09416D6B921A8148859472FFC7B994A9@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 11/18] stm32mp: stm32prog: add support of
	ssbl copy
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
> For reliability of boot from NAND/SPI-NAND (with read-disturb issue)
> the SSBL can be present several time, when it is indicated in the
> flashlayout with "Binary(X)".
> The received binary is copied X times by U-Boot on the target.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 98 ++++++++++++++++++-
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  1 +
>  2 files changed, 94 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 0140fd479d..3e521d42f2 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -210,9 +210,24 @@ static int parse_type(struct stm32prog_data *data,
>  		      int i, char *p, struct stm32prog_part_t *part)
>  {
>  	int result = 0;
> +	int len = 0;
>  
> -	if (!strcmp(p, "Binary")) {
> +	part->bin_nb = 0;
> +	if (!strncmp(p, "Binary", 6)) {
>  		part->part_type = PART_BINARY;
> +
> +		/* search for Binary(X) case */
> +		len = strlen(p);
> +		part->bin_nb = 1;
> +		if (len > 6) {
> +			if (len < 8 ||
> +			    (p[6] != '(') ||
> +			    (p[len - 1] != ')'))
> +				result = -EINVAL;
> +			else
> +				part->bin_nb =
> +					simple_strtoul(&p[7], NULL, 10);
> +		}
>  	} else if (!strcmp(p, "System")) {
>  		part->part_type = PART_SYSTEM;
>  	} else if (!strcmp(p, "FileSystem")) {
> @@ -600,6 +615,17 @@ static int init_device(struct stm32prog_data *data,
>  	part_id = 1;
>  	pr_debug("id : Opt Phase     Name target.n dev.n addr     size     part_off part_size\n");
>  	list_for_each_entry(part, &dev->part_list, list) {
> +		if (part->bin_nb > 1) {
> +			if ((dev->target != STM32PROG_NAND &&
> +			     dev->target != STM32PROG_SPI_NAND) ||
> +			    part->id >= PHASE_FIRST_USER ||
> +			    strncmp(part->name, "fsbl", 4)) {
> +				stm32prog_err("%s (0x%x): multiple binary %d not supported",
> +					      part->name, part->id,
> +					      part->bin_nb);
> +				return -EINVAL;
> +			}
> +		}
>  		if (part->part_type == RAW_IMAGE) {
>  			part->part_id = 0x0;
>  			part->addr = 0x0;
> @@ -607,9 +633,9 @@ static int init_device(struct stm32prog_data *data,
>  				part->size = block_dev->lba * block_dev->blksz;
>  			else
>  				part->size = last_addr;
> -			pr_debug("-- : %1d %02x %14s %02d %02d.%02d %08llx %08llx\n",
> +			pr_debug("-- : %1d %02x %14s %02d.%d %02d.%02d %08llx %08llx\n",
>  				 part->option, part->id, part->name,
> -				 part->part_type, part->target,
> +				 part->part_type, part->bin_nb, part->target,
>  				 part->dev_id, part->addr, part->size);
>  			continue;
>  		}
> @@ -666,9 +692,9 @@ static int init_device(struct stm32prog_data *data,
>  				      part->dev->erase_size);
>  			return -EINVAL;
>  		}
> -		pr_debug("%02d : %1d %02x %14s %02d %02d.%02d %08llx %08llx",
> +		pr_debug("%02d : %1d %02x %14s %02d.%d %02d.%02d %08llx %08llx",
>  			 part->part_id, part->option, part->id, part->name,
> -			 part->part_type, part->target,
> +			 part->part_type, part->bin_nb, part->target,
>  			 part->dev_id, part->addr, part->size);
>  
>  		part_addr = 0;
> @@ -1133,6 +1159,59 @@ static int dfu_init_entities(struct stm32prog_data *data)
>  	return ret;
>  }
>  
> +/* copy FSBL on NAND to improve reliability on NAND */
> +static int stm32prog_copy_fsbl(struct stm32prog_part_t *part)
> +{
> +	int ret, i;
> +	void *fsbl;
> +	struct image_header_s header;
> +	struct raw_header_s raw_header;
> +	struct dfu_entity *dfu;
> +	long size, offset;
> +
> +	if (part->target != STM32PROG_NAND &&
> +	    part->target != STM32PROG_SPI_NAND)
> +		return -1;
> +
> +	dfu = dfu_get_entity(part->alt_id);
> +
> +	/* read header */
> +	dfu_transaction_cleanup(dfu);
> +	size = BL_HEADER_SIZE;
> +	ret = dfu->read_medium(dfu, 0, (void *)&raw_header, &size);
> +	if (ret)
> +		return ret;
> +	if (stm32prog_header_check(&raw_header, &header))
> +		return -1;
> +
> +	/* read header + payload */
> +	size = header.image_length + BL_HEADER_SIZE;
> +	size = round_up(size, part->dev->mtd->erasesize);
> +	fsbl = calloc(1, size);
> +	if (!fsbl)
> +		return -ENOMEM;
> +	ret = dfu->read_medium(dfu, 0, fsbl, &size);
> +	pr_debug("%s read size=%lx ret=%d\n", __func__, size, ret);
> +	if (ret)
> +		goto error;
> +
> +	dfu_transaction_cleanup(dfu);
> +	offset = 0;
> +	for (i = part->bin_nb - 1; i > 0; i--) {
> +		offset += size;
> +		/* write to the next erase block */
> +		ret = dfu->write_medium(dfu, offset, fsbl, &size);
> +		pr_debug("%s copy at ofset=%lx size=%lx ret=%d",
> +			 __func__, offset, size, ret);
> +		if (ret)
> +			goto error;
> +	}
> +
> +error:
> +	free(fsbl);
> +	return ret;
> +}
> +
>  static void stm32prog_end_phase(struct stm32prog_data *data)
>  {
>  	if (data->phase == PHASE_FLASHLAYOUT) {
> @@ -1156,6 +1235,15 @@ static void stm32prog_end_phase(struct stm32prog_data *data)
>  			return;
>  		}
>  	}
> +
> +	if (CONFIG_IS_ENABLED(MTD) &&
> +	    data->cur_part->bin_nb > 1) {
> +		if (stm32prog_copy_fsbl(data->cur_part)) {
> +			stm32prog_err("%s (0x%x): copy of fsbl failed",
> +				      data->cur_part->name, data->cur_part->id);
> +			return;
> +		}
> +	}
>  }
>  
>  void stm32prog_do_reset(struct stm32prog_data *data)
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index 7f06627ebc..1880b163d7 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -91,6 +91,7 @@ struct stm32prog_part_t {
>  	char			name[16 + 1];
>  	u64			addr;
>  	u64			size;
> +	enum stm32prog_part_type bin_nb;	/* SSBL repeatition */
>  
>  	/* information on associated device */
>  	struct stm32prog_dev_t	*dev;		/* pointer to device */

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

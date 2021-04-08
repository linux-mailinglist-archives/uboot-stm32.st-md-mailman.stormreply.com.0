Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CAB358554
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Apr 2021 15:55:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F460C5719D;
	Thu,  8 Apr 2021 13:55:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F39A7C5718B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Apr 2021 13:55:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 138DpX8D023777; Thu, 8 Apr 2021 15:55:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=JHcqP/FTnLYEtOO5JduKG0NLF3RwgrLcaYviDvqR4Ec=;
 b=vp/ca2/pjGVY6mRTGZ5VoCjqtxJZjXvX7NO6RtsCKH5QYTHAgtptXdMdD38ZHAR1PfYI
 /WtrfATlukie1oEYUN6zyxrU4KxgEfC0ZlaMkLifRNKUgpPYqX5NhXnlBac8TlKsuLSb
 MyEWe9GneHnz0aX9taXWa4Zm65Pa521Gq19w1v1vgLQP3xFCSVcoXgmfgxuFeR8EUCPf
 o33O7Ejb+Al9o4UAIJfHqPuzCm7sOWjELAewAhy8hfSrTdFnhbNSCF3/dEW4DFtox4r6
 W02kSlHNCVxq3S0pFcnktzuXuOgCEfpE7HNReOSV2kV/w9KiCD3K2NAnjCOqxFxZMu77 jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37ssm3k4y5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 15:55:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4D2EB10002A;
 Thu,  8 Apr 2021 15:55:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3E56B22B9A1;
 Thu,  8 Apr 2021 15:55:12 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Apr
 2021 15:55:11 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210402140511.1.I81e79d4b32305a46b797f1ce405c200185a0647e@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <6368d7f6-ef86-5be1-8a33-7ff5320e8b1b@foss.st.com>
Date: Thu, 8 Apr 2021 15:55:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210402140511.1.I81e79d4b32305a46b797f1ce405c200185a0647e@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_03:2021-04-08,
 2021-04-08 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Bin Meng <bmeng.cn@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: stm32prog: add FIP header support
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

On 4/2/21 2:05 PM, Patrick Delaunay wrote:
> Add support of TF-A FIP header in command stm32prog for all the boot
> partition and not only the STM32IMAGE.
> 
> This patch is a preliminary patch to support FIP as second boot stage
> after TF-A BL2 when CONFIG_TFABOOT is activated for trusted boot chain.
> 
> The FIP is archive binary loaded by TF-A BL2, which contains the secure OS
> = OP-TEE and the non secure firmware and device tree = U-Boot.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  .../cmd_stm32prog/cmd_stm32prog.c             | 19 +++---
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 59 +++++++++++++------
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.h    | 12 +++-
>  .../cmd_stm32prog/stm32prog_serial.c          | 11 ++--
>  4 files changed, 64 insertions(+), 37 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> index a7e2861764..e36501a86b 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> @@ -73,15 +73,16 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
>  		size = simple_strtoul(argv[4], NULL, 16);
>  
>  	/* check STM32IMAGE presence */
> -	if (size == 0 &&
> -	    !stm32prog_header_check((struct raw_header_s *)addr, &header)) {
> -		size = header.image_length + BL_HEADER_SIZE;
> -
> -		/* uImage detected in STM32IMAGE, execute the script */
> -		if (IMAGE_FORMAT_LEGACY ==
> -		    genimg_get_format((void *)(addr + BL_HEADER_SIZE)))
> -			return image_source_script(addr + BL_HEADER_SIZE,
> -						   "script@1");
> +	if (size == 0) {
> +		stm32prog_header_check((struct raw_header_s *)addr, &header);
> +		if (header.type == HEADER_STM32IMAGE) {
> +			size = header.image_length + BL_HEADER_SIZE;
> +
> +			/* uImage detected in STM32IMAGE, execute the script */
> +			if (IMAGE_FORMAT_LEGACY ==
> +			    genimg_get_format((void *)(addr + BL_HEADER_SIZE)))
> +				return image_source_script(addr + BL_HEADER_SIZE, "script@1");
> +		}
>  	}
>  
>  	if (IS_ENABLED(CONFIG_DM_VIDEO))
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index d0518d1223..4c4d8a7a69 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -60,8 +60,6 @@ static const efi_guid_t uuid_mmc[3] = {
>  	ROOTFS_MMC2_UUID
>  };
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* order of column in flash layout file */
>  enum stm32prog_col_t {
>  	COL_OPTION,
> @@ -73,6 +71,16 @@ enum stm32prog_col_t {
>  	COL_NB_STM32
>  };
>  
> +#define FIP_TOC_HEADER_NAME	0xAA640001
> +
> +struct fip_toc_header {
> +	u32	name;
> +	u32	serial_number;
> +	u64	flags;
> +};
> +
> +DECLARE_GLOBAL_DATA_PTR;
> +
>  /* partition handling routines : CONFIG_CMD_MTDPARTS */
>  int mtdparts_init(void);
>  int find_dev_and_part(const char *id, struct mtd_device **dev,
> @@ -88,46 +96,57 @@ char *stm32prog_get_error(struct stm32prog_data *data)
>  	return data->error;
>  }
>  
> -u8 stm32prog_header_check(struct raw_header_s *raw_header,
> -			  struct image_header_s *header)
> +static bool stm32prog_is_fip_header(struct fip_toc_header *header)
> +{
> +	return (header->name == FIP_TOC_HEADER_NAME) && header->serial_number;
> +}
> +
> +void stm32prog_header_check(struct raw_header_s *raw_header,
> +			    struct image_header_s *header)
>  {
>  	unsigned int i;
>  
> -	header->present = 0;
> +	if (!raw_header || !header) {
> +		log_debug("%s:no header data\n", __func__);
> +		return;
> +	}
> +
> +	header->type = HEADER_NONE;
>  	header->image_checksum = 0x0;
>  	header->image_length = 0x0;
>  
> -	if (!raw_header || !header) {
> -		log_debug("%s:no header data\n", __func__);
> -		return -1;
> +	if (stm32prog_is_fip_header((struct fip_toc_header *)raw_header)) {
> +		header->type = HEADER_FIP;
> +		return;
>  	}
> +
>  	if (raw_header->magic_number !=
>  		(('S' << 0) | ('T' << 8) | ('M' << 16) | (0x32 << 24))) {
>  		log_debug("%s:invalid magic number : 0x%x\n",
>  			  __func__, raw_header->magic_number);
> -		return -2;
> +		return;
>  	}
>  	/* only header v1.0 supported */
>  	if (raw_header->header_version != 0x00010000) {
>  		log_debug("%s:invalid header version : 0x%x\n",
>  			  __func__, raw_header->header_version);
> -		return -3;
> +		return;
>  	}
>  	if (raw_header->reserved1 != 0x0 || raw_header->reserved2) {
>  		log_debug("%s:invalid reserved field\n", __func__);
> -		return -4;
> +		return;
>  	}
>  	for (i = 0; i < (sizeof(raw_header->padding) / 4); i++) {
>  		if (raw_header->padding[i] != 0) {
>  			log_debug("%s:invalid padding field\n", __func__);
> -			return -5;
> +			return;
>  		}
>  	}
> -	header->present = 1;
> +	header->type = HEADER_STM32IMAGE;
>  	header->image_checksum = le32_to_cpu(raw_header->image_checksum);
>  	header->image_length = le32_to_cpu(raw_header->image_length);
>  
> -	return 0;
> +	return;
>  }
>  
>  static u32 stm32prog_header_checksum(u32 addr, struct image_header_s *header)
> @@ -356,8 +375,8 @@ static int parse_flash_layout(struct stm32prog_data *data,
>  	data->part_nb = 0;
>  
>  	/* check if STM32image is detected */
> -	if (!stm32prog_header_check((struct raw_header_s *)addr,
> -				    &data->header)) {
> +	stm32prog_header_check((struct raw_header_s *)addr, &data->header);
> +	if (data->header.type == HEADER_STM32IMAGE) {
>  		u32 checksum;
>  
>  		addr = addr + BL_HEADER_SIZE;
> @@ -1410,7 +1429,7 @@ static int stm32prog_copy_fsbl(struct stm32prog_part_t *part)
>  
>  	if (part->target != STM32PROG_NAND &&
>  	    part->target != STM32PROG_SPI_NAND)
> -		return -1;
> +		return -EINVAL;
>  
>  	dfu = dfu_get_entity(part->alt_id);
>  
> @@ -1420,8 +1439,10 @@ static int stm32prog_copy_fsbl(struct stm32prog_part_t *part)
>  	ret = dfu->read_medium(dfu, 0, (void *)&raw_header, &size);
>  	if (ret)
>  		return ret;
> -	if (stm32prog_header_check(&raw_header, &header))
> -		return -1;
> +
> +	stm32prog_header_check(&raw_header, &header);
> +	if (header.type != HEADER_STM32IMAGE)
> +		return -ENOENT;
>  
>  	/* read header + payload */
>  	size = header.image_length + BL_HEADER_SIZE;
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index 18af99c78b..581b10d0ac 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -37,8 +37,14 @@ enum stm32prog_link_t {
>  	LINK_UNDEFINED,
>  };
>  
> +enum stm32prog_header_t {
> +	HEADER_NONE,
> +	HEADER_STM32IMAGE,
> +	HEADER_FIP,
> +};
> +
>  struct image_header_s {
> -	bool	present;
> +	enum stm32prog_header_t type;
>  	u32	image_checksum;
>  	u32	image_length;
>  };
> @@ -160,8 +166,8 @@ int stm32prog_pmic_read(struct stm32prog_data *data, u32 offset,
>  int stm32prog_pmic_start(struct stm32prog_data *data);
>  
>  /* generic part*/
> -u8 stm32prog_header_check(struct raw_header_s *raw_header,
> -			  struct image_header_s *header);
> +void stm32prog_header_check(struct raw_header_s *raw_header,
> +			    struct image_header_s *header);
>  int stm32prog_dfu_init(struct stm32prog_data *data);
>  void stm32prog_next_phase(struct stm32prog_data *data);
>  void stm32prog_do_reset(struct stm32prog_data *data);
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> index a51e5e3ec8..2b92e3b149 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> @@ -309,11 +309,10 @@ static u8 stm32prog_header(struct stm32prog_data *data)
>  	/* force cleanup to avoid issue with previous read */
>  	dfu_transaction_cleanup(dfu_entity);
>  
> -	ret = stm32prog_header_check(data->header_data,
> -				     &data->header);
> +	stm32prog_header_check(data->header_data, &data->header);
>  
> -	/* no header : max size is partition size */
> -	if (ret) {
> +	/* no stm32 image header : max size is partition size */
> +	if (data->header.type != HEADER_STM32IMAGE) {
>  		dfu_entity->get_medium_size(dfu_entity, &size);
>  		data->header.image_length = size;
>  	}
> @@ -389,7 +388,7 @@ static u8 stm32prog_start(struct stm32prog_data *data, u32 address)
>  		data->dfu_seq = 0;
>  
>  		printf("\n  received length = 0x%x\n", data->cursor);
> -		if (data->header.present) {
> +		if (data->header.type == HEADER_STM32IMAGE) {
>  			if (data->cursor !=
>  			    (data->header.image_length + BL_HEADER_SIZE)) {
>  				stm32prog_err("transmission interrupted (length=0x%x expected=0x%x)",
> @@ -789,7 +788,7 @@ static void download_command(struct stm32prog_data *data)
>  		}
>  	}
>  
> -	if (image_header->present) {
> +	if (data->header.type == HEADER_STM32IMAGE) {
>  		if (data->cursor <= BL_HEADER_SIZE)
>  			goto end;
>  		/* compute checksum on payload */
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks 
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

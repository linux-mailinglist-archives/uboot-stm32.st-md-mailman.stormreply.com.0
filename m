Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E67750B1DF
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Apr 2022 09:42:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16DADC60496;
	Fri, 22 Apr 2022 07:42:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2795C60492
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 07:42:24 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M5etC8028323;
 Fri, 22 Apr 2022 09:42:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=mBXqFOFG2SvqjGUMzG5aOSaX3ywoxZT0vfMqcRmCo3w=;
 b=gyEDX7/opJ+q6/kRRjn7b9W6Myyb7AE1O43kc54IbOG4j+53V+eulfsPManH8wdnmrqY
 4CmqrEj48HsrK0CbLszVWvOZSoGkLrJdyAyBQL55J1l/BbEx10Th8B3ubmHvdWxZ5srC
 PC2dHIJC6wwQEVD0XGSWlCUkpGH/NCfHfDBn92JXkGuQXJPkANm1dSVVjRoH8XClhjcN
 49gbCTVMp9iMfeexe/fEeSLe7frHA7pTr0epwBucaiyr0PPAS6hH8/3BeW+MFza1c5Zc
 9z+muyspjMn6nD2sNYjc1FLY71+xCtcbtMqIiM7voqAxXF/4fHQKMxEGMpkOmdsOGgSg Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqh797c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 09:42:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 67A3310002A;
 Fri, 22 Apr 2022 09:42:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5FFDF21683B;
 Fri, 22 Apr 2022 09:42:19 +0200 (CEST)
Received: from [10.201.21.201] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 09:42:18 +0200
Message-ID: <008e6a3e-0008-cba9-c218-3a719760c9be@foss.st.com>
Date: Fri, 22 Apr 2022 09:42:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220328172534.1196119-1-patrick.delaunay@foss.st.com>
 <20220328192520.4.I23385079e2fd8a2cab3b25e5883b94a25898736d@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220328192520.4.I23385079e2fd8a2cab3b25e5883b94a25898736d@changeid>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-21_01,2022-02-23_01
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 4/8] stm32mp: stm32prog: add support of
 STM32IMAGE version 2
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

HI Patrick

On 3/28/22 19:25, Patrick Delaunay wrote:
> Add support of new header for the STM32IMAGE version V2
> in command stm32prog command for STM32MP13x family.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  .../cmd_stm32prog/cmd_stm32prog.c             |   8 +-
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 119 ++++++++++++------
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  35 ++++--
>  3 files changed, 114 insertions(+), 48 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> index 41452b5a29..3957e06e5d 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> @@ -73,15 +73,15 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
>  
>  	/* check STM32IMAGE presence */
>  	if (size == 0) {
> -		stm32prog_header_check((struct raw_header_s *)addr, &header);
> +		stm32prog_header_check(addr, &header);
>  		if (header.type == HEADER_STM32IMAGE) {
> -			size = header.image_length + BL_HEADER_SIZE;
> +			size = header.image_length + header.length;
>  
>  #if defined(CONFIG_LEGACY_IMAGE_FORMAT)
>  			/* uImage detected in STM32IMAGE, execute the script */
>  			if (IMAGE_FORMAT_LEGACY ==
> -			    genimg_get_format((void *)(addr + BL_HEADER_SIZE)))
> -				return image_source_script(addr + BL_HEADER_SIZE, "script@1");
> +			    genimg_get_format((void *)(addr + header.length)))
> +				return image_source_script(addr + header.length, "script@1");
>  #endif
>  		}
>  	}
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 5d53e6146f..3e1fdee5b3 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -205,52 +205,98 @@ static bool stm32prog_is_fip_header(struct fip_toc_header *header)
>  	return (header->name == FIP_TOC_HEADER_NAME) && header->serial_number;
>  }
>  
> -void stm32prog_header_check(struct raw_header_s *raw_header,
> -			    struct image_header_s *header)
> +static bool stm32prog_is_stm32_header_v1(struct stm32_header_v1 *header)
>  {
>  	unsigned int i;
>  
> -	if (!raw_header || !header) {
> -		log_debug("%s:no header data\n", __func__);
> -		return;
> +	if (header->magic_number !=
> +		(('S' << 0) | ('T' << 8) | ('M' << 16) | (0x32 << 24))) {
> +		log_debug("%s:invalid magic number : 0x%x\n",
> +			  __func__, header->magic_number);
> +		return false;
> +	}
> +	if (header->header_version != 0x00010000) {
> +		log_debug("%s:invalid header version : 0x%x\n",
> +			  __func__, header->header_version);
> +		return false;
>  	}
>  
> -	header->type = HEADER_NONE;
> -	header->image_checksum = 0x0;
> -	header->image_length = 0x0;
> -
> -	if (stm32prog_is_fip_header((struct fip_toc_header *)raw_header)) {
> -		header->type = HEADER_FIP;
> -		return;
> +	if (header->reserved1 || header->reserved2) {
> +		log_debug("%s:invalid reserved field\n", __func__);
> +		return false;
> +	}
> +	for (i = 0; i < sizeof(header->padding); i++) {
> +		if (header->padding[i] != 0) {
> +			log_debug("%s:invalid padding field\n", __func__);
> +			return false;
> +		}
>  	}
>  
> -	if (raw_header->magic_number !=
> +	return true;
> +}
> +
> +static bool stm32prog_is_stm32_header_v2(struct stm32_header_v2 *header)
> +{
> +	unsigned int i;
> +
> +	if (header->magic_number !=
>  		(('S' << 0) | ('T' << 8) | ('M' << 16) | (0x32 << 24))) {
>  		log_debug("%s:invalid magic number : 0x%x\n",
> -			  __func__, raw_header->magic_number);
> -		return;
> +			  __func__, header->magic_number);
> +		return false;
>  	}
> -	/* only header v1.0 supported */
> -	if (raw_header->header_version != 0x00010000) {
> +	if (header->header_version != 0x00020000) {
>  		log_debug("%s:invalid header version : 0x%x\n",
> -			  __func__, raw_header->header_version);
> +			  __func__, header->header_version);
> +		return false;
> +	}
> +	if (header->reserved1 || header->reserved2)
> +		return false;
> +
> +	for (i = 0; i < sizeof(header->padding); i++) {
> +		if (header->padding[i] != 0) {
> +			log_debug("%s:invalid padding field\n", __func__);
> +			return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
> +void stm32prog_header_check(uintptr_t raw_header, struct image_header_s *header)
> +{
> +	struct stm32_header_v1 *v1_header = (struct stm32_header_v1 *)raw_header;
> +	struct stm32_header_v2 *v2_header = (struct stm32_header_v2 *)raw_header;
> +
> +	if (!raw_header || !header) {
> +		log_debug("%s:no header data\n", __func__);
>  		return;
>  	}
> -	if (raw_header->reserved1 != 0x0 || raw_header->reserved2) {
> -		log_debug("%s:invalid reserved field\n", __func__);
> +
> +	if (stm32prog_is_fip_header((struct fip_toc_header *)raw_header)) {
> +		header->type = HEADER_FIP;
> +		header->length = 0;
>  		return;
>  	}
> -	for (i = 0; i < (sizeof(raw_header->padding) / 4); i++) {
> -		if (raw_header->padding[i] != 0) {
> -			log_debug("%s:invalid padding field\n", __func__);
> -			return;
> -		}
> +	if (stm32prog_is_stm32_header_v1(v1_header)) {
> +		header->type = HEADER_STM32IMAGE;
> +		header->image_checksum = le32_to_cpu(v1_header->image_checksum);
> +		header->image_length = le32_to_cpu(v1_header->image_length);
> +		header->length = sizeof(struct stm32_header_v1);
> +		return;
> +	}
> +	if (stm32prog_is_stm32_header_v2(v2_header)) {
> +		header->type = HEADER_STM32IMAGE_V2;
> +		header->image_checksum = le32_to_cpu(v2_header->image_checksum);
> +		header->image_length = le32_to_cpu(v2_header->image_length);
> +		header->length = sizeof(struct stm32_header_v1) +
> +				 v2_header->extension_headers_length;
> +		return;
>  	}
> -	header->type = HEADER_STM32IMAGE;
> -	header->image_checksum = le32_to_cpu(raw_header->image_checksum);
> -	header->image_length = le32_to_cpu(raw_header->image_length);
>  
> -	return;
> +	header->type = HEADER_NONE;
> +	header->image_checksum = 0x0;
> +	header->image_length = 0x0;
>  }
>  
>  static u32 stm32prog_header_checksum(u32 addr, struct image_header_s *header)
> @@ -480,11 +526,11 @@ static int parse_flash_layout(struct stm32prog_data *data,
>  	data->part_nb = 0;
>  
>  	/* check if STM32image is detected */
> -	stm32prog_header_check((struct raw_header_s *)addr, &header);
> +	stm32prog_header_check(addr, &header);
>  	if (header.type == HEADER_STM32IMAGE) {
>  		u32 checksum;
>  
> -		addr = addr + BL_HEADER_SIZE;
> +		addr = addr + header.length;
>  		size = header.image_length;
>  
>  		checksum = stm32prog_header_checksum(addr, &header);
> @@ -1560,7 +1606,7 @@ static int stm32prog_copy_fsbl(struct stm32prog_part_t *part)
>  	int ret, i;
>  	void *fsbl;
>  	struct image_header_s header;
> -	struct raw_header_s raw_header;
> +	struct stm32_header_v2 raw_header; /* V2 size > v1 size */
>  	struct dfu_entity *dfu;
>  	long size, offset;
>  
> @@ -1572,17 +1618,18 @@ static int stm32prog_copy_fsbl(struct stm32prog_part_t *part)
>  
>  	/* read header */
>  	dfu_transaction_cleanup(dfu);
> -	size = BL_HEADER_SIZE;
> +	size = sizeof(raw_header);
>  	ret = dfu->read_medium(dfu, 0, (void *)&raw_header, &size);
>  	if (ret)
>  		return ret;
>  
> -	stm32prog_header_check(&raw_header, &header);
> -	if (header.type != HEADER_STM32IMAGE)
> +	stm32prog_header_check((ulong)&raw_header, &header);
> +	if (header.type != HEADER_STM32IMAGE &&
> +	    header.type != HEADER_STM32IMAGE_V2)
>  		return -ENOENT;
>  
>  	/* read header + payload */
> -	size = header.image_length + BL_HEADER_SIZE;
> +	size = header.image_length + header.length;
>  	size = round_up(size, part->dev->mtd->erasesize);
>  	fsbl = calloc(1, size);
>  	if (!fsbl)
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index 928b7b3a0e..90cdc2ba47 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -42,6 +42,7 @@ enum stm32prog_link_t {
>  enum stm32prog_header_t {
>  	HEADER_NONE,
>  	HEADER_STM32IMAGE,
> +	HEADER_STM32IMAGE_V2,
>  	HEADER_FIP,
>  };
>  
> @@ -49,11 +50,12 @@ struct image_header_s {
>  	enum stm32prog_header_t type;
>  	u32	image_checksum;
>  	u32	image_length;
> +	u32	length;
>  };
>  
> -struct raw_header_s {
> +struct stm32_header_v1 {
>  	u32 magic_number;
> -	u32 image_signature[64 / 4];
> +	u8 image_signature[64];
>  	u32 image_checksum;
>  	u32 header_version;
>  	u32 image_length;
> @@ -64,12 +66,30 @@ struct raw_header_s {
>  	u32 version_number;
>  	u32 option_flags;
>  	u32 ecdsa_algorithm;
> -	u32 ecdsa_public_key[64 / 4];
> -	u32 padding[83 / 4];
> -	u32 binary_type;
> +	u8 ecdsa_public_key[64];
> +	u8 padding[83];
> +	u8 binary_type;
>  };
>  
> -#define BL_HEADER_SIZE	sizeof(struct raw_header_s)
> +struct stm32_header_v2 {
> +	u32 magic_number;
> +	u8 image_signature[64];
> +	u32 image_checksum;
> +	u32 header_version;
> +	u32 image_length;
> +	u32 image_entry_point;
> +	u32 reserved1;
> +	u32 load_address;
> +	u32 reserved2;
> +	u32 version_number;
> +	u32 extension_flags;
> +	u32 extension_headers_length;
> +	u32 binary_type;
> +	u8 padding[16];
> +	u32 extension_header_type;
> +	u32 extension_header_length;
> +	u8 extension_padding[376];
> +};
>  
>  /* partition type in flashlayout file */
>  enum stm32prog_part_type {
> @@ -171,8 +191,7 @@ int stm32prog_pmic_read(struct stm32prog_data *data, u32 offset,
>  int stm32prog_pmic_start(struct stm32prog_data *data);
>  
>  /* generic part*/
> -void stm32prog_header_check(struct raw_header_s *raw_header,
> -			    struct image_header_s *header);
> +void stm32prog_header_check(uintptr_t raw_header, struct image_header_s *header);
>  int stm32prog_dfu_init(struct stm32prog_data *data);
>  void stm32prog_next_phase(struct stm32prog_data *data);
>  void stm32prog_do_reset(struct stm32prog_data *data);
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

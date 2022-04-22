Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3FF50B1E0
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Apr 2022 09:42:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21D6EC60496;
	Fri, 22 Apr 2022 07:42:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBFF2C60492
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 07:42:39 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M1eZBA015687;
 Fri, 22 Apr 2022 09:42:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=UktlFo3ZPOExVtIU3wHwQnAeyWl7kl9+fw48pBh5VDE=;
 b=aPN8vYeUtULwCYHRvUmqlokdMiVnVAxSz+Vzkmi3Y2fD45xXYasOxJre4M6nfqCfrk7F
 He7niK1nyIYkscMtfKAptIXUeXKpyMFGMTtbHDMsvghzNsMss6s748VbEgOz0kLxQJtT
 UZNJwpy7dD2qFJH+RqeFZWOcwtJOylrLecCZGl4omx26LxiryGX5AcsgEPLGx3LL3fJH
 eAmfqi9GqrZmOcQ5ucG7sGRVSDSgGbFm57Lx+8fxlCWu5BN5jLPuSF8VL54TGAEjyFvi
 5y5PmWwNby/M5oVVKl9HzRKzAUITEhf6BFdOedVZVQNdqnX64lWmLM+Wo0Uvuh2nHyE9 qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqe7gxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 09:42:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AA15710002A;
 Fri, 22 Apr 2022 09:42:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A100C21683B;
 Fri, 22 Apr 2022 09:42:34 +0200 (CEST)
Received: from [10.201.21.201] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 09:42:33 +0200
Message-ID: <96607d26-b6da-6662-4f98-dfc464c3a526@foss.st.com>
Date: Fri, 22 Apr 2022 09:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220328172534.1196119-1-patrick.delaunay@foss.st.com>
 <20220328192520.5.I94e74b521fd55dcc68ab8d000cb93ef48fc12f14@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220328192520.5.I94e74b521fd55dcc68ab8d000cb93ef48fc12f14@changeid>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-21_01,2022-02-23_01
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 5/8] stm32mp: stm32prog: add support of
 UUID for FIP partition
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

On 3/28/22 19:25, Patrick Delaunay wrote:
> Add support of UUID for FIP parttion, required by Firmware update
> support in TF-A:
> - UUID TYPE for FIP partition: 19d5df83-11b0-457b-be2c-7559c13142a5
> - "fip-a" partition UUID: 4fd84c93-54ef-463f-a7ef-ae25ff887087
> - "fip-b" partition UUID: 09c54952-d5bf-45af-acee-335303766fb3
> 
> This check is done with a new partition type "FIP" associated
> at the FIP UUID.
> 
> The A/B partition UUID is detected by the partition name:
> "fip-a", "fip-b".
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 76 ++++++++++++++-----
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  3 +-
>  2 files changed, 59 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 3e1fdee5b3..d3b3e1ed72 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -62,6 +62,28 @@ static const efi_guid_t uuid_mmc[3] = {
>  	ROOTFS_MMC2_UUID
>  };
>  
> +/* FIP type partition UUID used by TF-A*/
> +#define FIP_TYPE_UUID "19D5DF83-11B0-457B-BE2C-7559C13142A5"
> +
> +/* unique partition guid (uuid) for FIP partitions A/B */
> +#define FIP_A_UUID \
> +	EFI_GUID(0x4FD84C93, 0x54EF, 0x463F, \
> +		 0xA7, 0xEF, 0xAE, 0x25, 0xFF, 0x88, 0x70, 0x87)
> +
> +#define FIP_B_UUID \
> +	EFI_GUID(0x09C54952, 0xD5BF, 0x45AF, \
> +		 0xAC, 0xEE, 0x33, 0x53, 0x03, 0x76, 0x6F, 0xB3)
> +
> +static const char * const fip_part_name[] = {
> +	"fip-a",
> +	"fip-b"
> +};
> +
> +static const efi_guid_t fip_part_uuid[] = {
> +	FIP_A_UUID,
> +	FIP_B_UUID
> +};
> +
>  /* order of column in flash layout file */
>  enum stm32prog_col_t {
>  	COL_OPTION,
> @@ -405,6 +427,8 @@ static int parse_type(struct stm32prog_data *data,
>  				part->bin_nb =
>  					dectoul(&p[7], NULL);
>  		}
> +	} else if (!strcmp(p, "FIP")) {
> +		part->part_type = PART_FIP;
>  	} else if (!strcmp(p, "System")) {
>  		part->part_type = PART_SYSTEM;
>  	} else if (!strcmp(p, "FileSystem")) {
> @@ -1056,9 +1080,10 @@ static int create_gpt_partitions(struct stm32prog_data *data)
>  	char uuid[UUID_STR_LEN + 1];
>  	unsigned char *uuid_bin;
>  	unsigned int mmc_id;
> -	int i;
> +	int i, j;
>  	bool rootfs_found;
>  	struct stm32prog_part_t *part;
> +	const char *type_str;
>  
>  	buf = malloc(buflen);
>  	if (!buf)
> @@ -1100,33 +1125,46 @@ static int create_gpt_partitions(struct stm32prog_data *data)
>  					   part->addr,
>  					   part->size);
>  
> -			if (part->part_type == PART_BINARY)
> -				offset += snprintf(buf + offset,
> -						   buflen - offset,
> -						   ",type="
> -						   LINUX_RESERVED_UUID);
> -			else
> -				offset += snprintf(buf + offset,
> -						   buflen - offset,
> -						   ",type=linux");
> +			switch (part->part_type) {
> +			case PART_BINARY:
> +				type_str = LINUX_RESERVED_UUID;
> +				break;
> +			case PART_FIP:
> +				type_str = FIP_TYPE_UUID;
> +				break;
> +			default:
> +				type_str = "linux";
> +				break;
> +			}
> +			offset += snprintf(buf + offset,
> +					   buflen - offset,
> +					   ",type=%s", type_str);
>  
>  			if (part->part_type == PART_SYSTEM)
>  				offset += snprintf(buf + offset,
>  						   buflen - offset,
>  						   ",bootable");
>  
> +			/* partition UUID */
> +			uuid_bin = NULL;
>  			if (!rootfs_found && !strcmp(part->name, "rootfs")) {
>  				mmc_id = part->dev_id;
>  				rootfs_found = true;
> -				if (mmc_id < ARRAY_SIZE(uuid_mmc)) {
> -					uuid_bin =
> -					  (unsigned char *)uuid_mmc[mmc_id].b;
> -					uuid_bin_to_str(uuid_bin, uuid,
> -							UUID_STR_FORMAT_GUID);
> -					offset += snprintf(buf + offset,
> -							   buflen - offset,
> -							   ",uuid=%s", uuid);
> -				}
> +				if (mmc_id < ARRAY_SIZE(uuid_mmc))
> +					uuid_bin = (unsigned char *)uuid_mmc[mmc_id].b;
> +			}
> +			if (part->part_type == PART_FIP) {
> +				for (j = 0; j < ARRAY_SIZE(fip_part_name); j++)
> +					if (!strcmp(part->name, fip_part_name[j])) {
> +						uuid_bin = (unsigned char *)fip_part_uuid[j].b;
> +						break;
> +					}
> +			}
> +			if (uuid_bin) {
> +				uuid_bin_to_str(uuid_bin, uuid, UUID_STR_FORMAT_GUID);
> +				offset += snprintf(buf + offset,
> +						   buflen - offset,
> +						   ",uuid=%s", uuid);
>  			}
>  
>  			offset += snprintf(buf + offset, buflen - offset, ";");
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index 90cdc2ba47..b3e5c74810 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -94,9 +94,10 @@ struct stm32_header_v2 {
>  /* partition type in flashlayout file */
>  enum stm32prog_part_type {
>  	PART_BINARY,
> +	PART_FIP,
>  	PART_SYSTEM,
>  	PART_FILESYSTEM,
> -	RAW_IMAGE
> +	RAW_IMAGE,
>  };
>  
>  /* device information */
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BC772D9C6
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Jun 2023 08:21:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED69EC6A615;
	Tue, 13 Jun 2023 06:21:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93FA1C6A60F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 06:21:29 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35D6G9r5014684; Tue, 13 Jun 2023 08:21:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=kI68pZj4z6RVC3uh2RFxQDMW2XylSC8xrirWB0gfZnU=;
 b=I2LRxxXGcm35t58t+6AA+5ng6qOKkhtdQhYuqGKB/MiA6MuuwP/fBMmNbBB9d1D/dqZx
 LUs6dlpkxYsyAWMWPqwVNU+EQnKYNvzoM/feM68HJcovofPn9T63zjWeWfdYKQ6E3Ak6
 KjMFU29wHmmmaKeMlT0/IxhcvBT/AFipfq0wDKfLkwCA9aysJqBJRIm+Gevg0hzOrUCE
 Rtm9SWhKdJZ149tPH4EUxhavQyqhLoMOxTiyVy0M6aRR3u22JlWbBkA7AA6lk+aqEMfK
 7itpaqSe7f/l1cex9S41CWmHbd6t3dWilKM+GIUQDa6tBqPtIDHyaPhsdJDKEcSYi8MQ uA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r6k1sg0vp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 08:21:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0871C100045;
 Tue, 13 Jun 2023 08:21:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3D7A2128CE;
 Tue, 13 Jun 2023 08:21:27 +0200 (CEST)
Received: from [10.201.20.56] (10.201.20.56) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 13 Jun
 2023 08:21:27 +0200
Message-ID: <d3635d51-019d-9b39-9f71-32f9109ea8ce@foss.st.com>
Date: Tue, 13 Jun 2023 08:21:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230608170941.1.I0c3b7963b669b6c03e5a3bdf7e9e736e767aafd1@changeid>
 <20230608170941.3.I2c67e801f791e9b397c7a39c6f9ac503930f1203@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230608170941.3.I2c67e801f791e9b397c7a39c6f9ac503930f1203@changeid>
X-Originating-IP: [10.201.20.56]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_03,2023-06-12_02,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 3/3] stm32mp: stm32prog: Add support of
 FWU_MDATA partition type
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



On 6/8/23 17:09, Patrick Delaunay wrote:
> Add support of "FWU_MDATA" partition type in flashlayout to select
> the TF-A firmware update metadata partition type guid, associated to
> U-Boot "system" partition type guid, FWU_MDATA_GUID introduced by
> commit 2eaedc95164f ("FWU: Add FWU metadata structure and driver for
> accessing metadata") and used in gpt_get_mdata_partitions() for
> commit 554b38f7a532 ("FWU: Add FWU metadata access driver for GPT
> partitioned block devices")
> 
> See also recommendation in FWU-PSA-A_DEN0118_1.0ALP3.pdf
>   4.1.2 Metadata integration with GPT
>   When embedded in a GPT, each metadata replica occupies a single
>   partition with PartitionTypeGUID = metadata_uuid.
>   UUID = 8a7a84a0-8387-40f6-ab41-a8b9a5a60d23
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 11 +++++++++++
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h |  1 +
>  2 files changed, 12 insertions(+)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 07369919620e..a2ff5558a519 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -63,6 +63,12 @@ static const efi_guid_t uuid_mmc[3] = {
>  	ROOTFS_MMC2_UUID
>  };
>  
> +/*
> + * GUID value defined in the FWU specification for identification
> + * of the FWU metadata partition.
> + */
> +#define FWU_MDATA_UUID "8a7a84a0-8387-40f6-ab41-a8b9a5a60d23"
> +
>  /* FIP type partition UUID used by TF-A*/
>  #define FIP_TYPE_UUID "19D5DF83-11B0-457B-BE2C-7559C13142A5"
>  
> @@ -430,6 +436,8 @@ static int parse_type(struct stm32prog_data *data,
>  		}
>  	} else if (!strcmp(p, "FIP")) {
>  		part->part_type = PART_FIP;
> +	} else if (!strcmp(p, "FWU_MDATA")) {
> +		part->part_type = PART_FWU_MDATA;
>  	} else if (!strcmp(p, "ENV")) {
>  		part->part_type = PART_ENV;
>  	} else if (!strcmp(p, "System")) {
> @@ -1140,6 +1148,9 @@ static int create_gpt_partitions(struct stm32prog_data *data)
>  			case PART_FIP:
>  				type_str = FIP_TYPE_UUID;
>  				break;
> +			case PART_FWU_MDATA:
> +				type_str = FWU_MDATA_UUID;
> +				break;
>  			case PART_ESP:
>  				/* EFI System Partition */
>  				type_str = "system";
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index a6fb9d5e9cc5..02b286be8182 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -105,6 +105,7 @@ struct stm32_header_v2 {
>  enum stm32prog_part_type {
>  	PART_BINARY,
>  	PART_FIP,
> +	PART_FWU_MDATA,
>  	PART_ENV,
>  	PART_SYSTEM,
>  	PART_FILESYSTEM,
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E2672D9C4
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Jun 2023 08:21:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1DD7C6A615;
	Tue, 13 Jun 2023 06:21:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC826C6A60F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 06:21:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35D65Y3P004627; Tue, 13 Jun 2023 08:21:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=lDF88yC5iSSdPSlUNSiqo3K7lypZKuU4FVtzAp+fgG0=;
 b=M1CLnVbnG5v5YU8XeBBlITyMB24ys9hIjhxFajJaS8TxbJiekEKw6DV6MSv995YrSbTC
 +NBBiMueCD0GFcJi//YSrrhf8DeN4vFvDKdbAGL5jVXiir6eL+24QBvgd75EmJ9pYyIQ
 MOIU3SkBbpSTMagMUxKxHit7kOGgicsqPvTFkbLxfSLoo3yKBk10PA87mg/MHAaOWmQu
 +Z9kZIbKeXEFDS5jTHbQJamcUxgemyCUwItByNKG9UahOcRJq8HAIHQPPPbzbjeE/hCn
 +k/ad17dQLTecyHeLBH7PcwYrr8jhAwTFA801T1LdIO2+v2oB3Vhu671hCD+Fi7NRb0N RA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r6jvjg2un-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 08:21:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 77B3710002A;
 Tue, 13 Jun 2023 08:21:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 701DE2128C5;
 Tue, 13 Jun 2023 08:21:21 +0200 (CEST)
Received: from [10.201.20.56] (10.201.20.56) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 13 Jun
 2023 08:21:21 +0200
Message-ID: <227bc444-05b6-dd7c-6b04-c6f7924bbbb4@foss.st.com>
Date: Tue, 13 Jun 2023 08:21:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230608170941.1.I0c3b7963b669b6c03e5a3bdf7e9e736e767aafd1@changeid>
 <20230608170941.2.I046fa722833caf4e9c5b0d0b95fb591b1cfb8ab1@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230608170941.2.I046fa722833caf4e9c5b0d0b95fb591b1cfb8ab1@changeid>
X-Originating-IP: [10.201.20.56]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_03,2023-06-12_02,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 2/3] stm32mp: stm32prog: Add support of
	ESP partition type
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
> Add support of "ESP" partition type in flashlayout to select
> the "EFI System Partition", associated to U-Boot "system"
> partition type  guid, PARTITION_SYSTEM_GUID =
> C12A7328-F81F-11d2-BA4B-00A0C93EC93B.
> 
> This partition is the bootable partition for efi boot.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 8 +++++++-
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h | 8 +++++++-
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 1bd86b5187da..07369919620e 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -434,6 +434,8 @@ static int parse_type(struct stm32prog_data *data,
>  		part->part_type = PART_ENV;
>  	} else if (!strcmp(p, "System")) {
>  		part->part_type = PART_SYSTEM;
> +	} else if (!strcmp(p, "ESP")) {
> +		part->part_type = PART_ESP;
>  	} else if (!strcmp(p, "FileSystem")) {
>  		part->part_type = PART_FILESYSTEM;
>  	} else if (!strcmp(p, "RawImage")) {
> @@ -1138,7 +1140,11 @@ static int create_gpt_partitions(struct stm32prog_data *data)
>  			case PART_FIP:
>  				type_str = FIP_TYPE_UUID;
>  				break;
> -			default:
> +			case PART_ESP:
> +				/* EFI System Partition */
> +				type_str = "system";
> +				break;
> +			default: /* PART_FILESYSTEM or PART_SYSTEM for distro */
>  				type_str = "linux";
>  				break;
>  			}
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index 4c2c1314d990..a6fb9d5e9cc5 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -96,13 +96,19 @@ struct stm32_header_v2 {
>  	u8 extension_padding[376];
>  };
>  
> -/* partition type in flashlayout file */
> +/*
> + * partition type in flashlayout file
> + * SYSTEM = linux partition, bootable
> + * FILESYSTEM = linux partition
> + * ESP = EFI system partition
> + */
>  enum stm32prog_part_type {
>  	PART_BINARY,
>  	PART_FIP,
>  	PART_ENV,
>  	PART_SYSTEM,
>  	PART_FILESYSTEM,
> +	PART_ESP,
>  	RAW_IMAGE,
>  };
>  
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

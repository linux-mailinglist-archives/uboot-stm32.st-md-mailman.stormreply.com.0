Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0910F732FFF
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jun 2023 13:39:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B61DDC65E58;
	Fri, 16 Jun 2023 11:38:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FE51C64110
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 11:38:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35G85oQK021502; Fri, 16 Jun 2023 13:38:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ONegtS3PaCSP3Werb9PEXRaWYQa0OpkWk71YO7y7vTU=;
 b=HypKS7YAiXrrE1wgXAZEdhaFGbaKOz0mZ+ZZ11HBfLQad0Xs3EnZ7wi7tlJjIMHXlNkk
 +oRMRIHukf3f8BoMbPpGMq0LRa9oHwXYMVpHb78uret9KDGCVa46qaMoVhrRGgkwg3p8
 UPE1a74bnMPyVzaYGC4hrEDPLXqxJ2/IvoXthLOA00NNk5hxvbZpL7OOC2zqzPM8LeEh
 gGz+4CQSM45IkZtE0x1K+Qo8sUclvEPp1HOcNhWJHUEC+DwGptvN4GlcIYX40K4Oc1lN
 m3nSmK/P1FUf8cXQ8ifsqFariVedM0O8RxvpNPy51pwm9SeqdzIM2uKYG0mBxXkbUWov MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r8kx2he7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 13:38:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5AFEC10002A;
 Fri, 16 Jun 2023 13:38:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 53F1123152A;
 Fri, 16 Jun 2023 13:38:56 +0200 (CEST)
Received: from [10.252.4.57] (10.252.4.57) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 16 Jun
 2023 13:38:55 +0200
Message-ID: <36c8d08b-7b4c-8b9a-38bf-71b514628bc1@foss.st.com>
Date: Fri, 16 Jun 2023 13:38:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230608170941.1.I0c3b7963b669b6c03e5a3bdf7e9e736e767aafd1@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230608170941.1.I0c3b7963b669b6c03e5a3bdf7e9e736e767aafd1@changeid>
X-Originating-IP: [10.252.4.57]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_08,2023-06-16_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 1/3] stm32mp: stm32prog: Add support of
	ENV partition type
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
> Add support of "ENV" partition type in flashlayout to select
> the "u-boot-env" GUID, with PARTITION_U_BOOT_ENVIRONMENT =
> 3de21764-95bd-54bd-a5c3-4abe786f38a8, that mean a partition
> holding a U-Boot environment introduced by
> commit c0364ce1c695 ("doc/README.gpt: define partition type
> GUID for U-Boot environment")'
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 5 +++++
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 6f3641ccf57b..1bd86b5187da 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -430,6 +430,8 @@ static int parse_type(struct stm32prog_data *data,
>  		}
>  	} else if (!strcmp(p, "FIP")) {
>  		part->part_type = PART_FIP;
> +	} else if (!strcmp(p, "ENV")) {
> +		part->part_type = PART_ENV;
>  	} else if (!strcmp(p, "System")) {
>  		part->part_type = PART_SYSTEM;
>  	} else if (!strcmp(p, "FileSystem")) {
> @@ -1130,6 +1132,9 @@ static int create_gpt_partitions(struct stm32prog_data *data)
>  			case PART_BINARY:
>  				type_str = LINUX_RESERVED_UUID;
>  				break;
> +			case PART_ENV:
> +				type_str = "u-boot-env";
> +				break;
>  			case PART_FIP:
>  				type_str = FIP_TYPE_UUID;
>  				break;
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index 58f4b96fa752..4c2c1314d990 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -100,6 +100,7 @@ struct stm32_header_v2 {
>  enum stm32prog_part_type {
>  	PART_BINARY,
>  	PART_FIP,
> +	PART_ENV,
>  	PART_SYSTEM,
>  	PART_FILESYSTEM,
>  	RAW_IMAGE,
Applied to u-boot-stm/next

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

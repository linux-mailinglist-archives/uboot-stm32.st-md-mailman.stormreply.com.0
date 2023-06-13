Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDFE72D9E3
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Jun 2023 08:26:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7228C6A615;
	Tue, 13 Jun 2023 06:26:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88FE5C6A60F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 06:26:24 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35D6G8qE014652; Tue, 13 Jun 2023 08:26:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sNhroiJlCJI1PNsZ0+3blNTEivYduYK3G+8rwGz87ZY=;
 b=Jz0F6XuPUdBELA5dAHP4u66/P0Rn9XYVpOZgM10St1CWFhTIK2vGMaGn7apiP0MIGbVZ
 nAbzWY9PRpJK7+c8WnKnA6JhquPwA4o7SpHWU9AQg/uOyoXm9tI2ElS1oihogiovmilx
 UR+wH6L+653ZnR9PavIQ8TWN+8U8/3iInd+Z8jC6UWv5Dvfca3w+yQYOtgpPRFCnMGmw
 flY/HOBEPDmCYmeRDhW6MN6Ty/6Vg1mW+8AiN5W1nGyFesxlx8arLO7aXLIvIVayNuY6
 K2KN4/j1Nr7onfRe0LcbAtvUjIHhMJwVxSIVbIWzEKFEtyqVvPC3SMSFI431lP3Tp5wK 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r6k1sg1t7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 08:26:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D89810002A;
 Tue, 13 Jun 2023 08:26:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 163AE2128DA;
 Tue, 13 Jun 2023 08:26:23 +0200 (CEST)
Received: from [10.201.20.56] (10.201.20.56) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 13 Jun
 2023 08:26:22 +0200
Message-ID: <19b8a25e-9082-f17f-605b-be0212027788@foss.st.com>
Date: Tue, 13 Jun 2023 08:26:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
 <20230608171614.3.I620daeba9c6dbeed0f0164229d65403d36291bb1@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230608171614.3.I620daeba9c6dbeed0f0164229d65403d36291bb1@changeid>
X-Originating-IP: [10.201.20.56]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_03,2023-06-12_02,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 03/12] dfu: mtd: remove direct call of
 mtdparts_init function
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



On 6/8/23 17:16, Patrick Delaunay wrote:
> With MTD support in driver model, the direct call of mtdparts_init
> should be avoided and replaced by mtd_probe_devices.
> 
> With the modificaton when MTDIDS/MTDPARTS are empty the OF fallback
> with partition describe in device tree is correctly performed,
> introduced by commit dc339bf784f0 ("mtd: add support for parsing
> partitions defined in OF").
> With this patch the dependency with CONFIG_CMD_MTDPARTS is removed.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/dfu/Kconfig   |  1 -
>  drivers/dfu/dfu_mtd.c | 34 +++++++++++++++++++---------------
>  2 files changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/dfu/Kconfig b/drivers/dfu/Kconfig
> index 8d7f13dcb0b5..c3a0b93b25e0 100644
> --- a/drivers/dfu/Kconfig
> +++ b/drivers/dfu/Kconfig
> @@ -41,7 +41,6 @@ config DFU_MMC
>  config DFU_MTD
>  	bool "MTD back end for DFU"
>  	depends on DM_MTD
> -	depends on CMD_MTDPARTS
>  	help
>  	  This option enables using DFU to read and write to on any MTD device.
>  
> diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c
> index c7075f12eca9..75e2f6a42151 100644
> --- a/drivers/dfu/dfu_mtd.c
> +++ b/drivers/dfu/dfu_mtd.c
> @@ -10,7 +10,6 @@
>  #include <common.h>
>  #include <dfu.h>
>  #include <mtd.h>
> -#include <jffs2/load_kernel.h>
>  #include <linux/err.h>
>  #include <linux/ctype.h>
>  
> @@ -275,7 +274,7 @@ int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr, char **argv, int a
>  {
>  	char *s;
>  	struct mtd_info *mtd;
> -	int ret, part;
> +	int part;
>  
>  	mtd = get_mtd_device_nm(devstr);
>  	if (IS_ERR_OR_NULL(mtd))
> @@ -299,10 +298,9 @@ int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr, char **argv, int a
>  		if (*s)
>  			return -EINVAL;
>  	} else if ((!strcmp(argv[0], "part")) || (!strcmp(argv[0], "partubi"))) {
> -		char mtd_id[32];
> -		struct mtd_device *mtd_dev;
> -		u8 part_num;
> -		struct part_info *pi;
> +		struct mtd_info *partition;
> +		int partnum = 0;
> +		bool part_found = false;
>  
>  		if (argc != 2)
>  			return -EINVAL;
> @@ -313,19 +311,25 @@ int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr, char **argv, int a
>  		if (*s)
>  			return -EINVAL;
>  
> -		sprintf(mtd_id, "%s,%d", devstr, part - 1);
> -		printf("using id '%s'\n", mtd_id);
> +		/* register partitions with MTDIDS/MTDPARTS or OF fallback */
> +		mtd_probe_devices();
>  
> -		mtdparts_init();
> -
> -		ret = find_dev_and_part(mtd_id, &mtd_dev, &part_num, &pi);
> -		if (ret != 0) {
> -			printf("Could not locate '%s'\n", mtd_id);
> +		partnum = 0;
> +		list_for_each_entry(partition, &mtd->partitions, node) {
> +			partnum++;
> +			if (partnum == part) {
> +				part_found = true;
> +				break;
> +			}
> +		}
> +		if (!part_found) {
> +			printf("No partition %d in %s\n", part, mtd->name);
>  			return -1;
>  		}
> +		log_debug("partition %d:%s in %s\n", partnum, partition->name, mtd->name);
>  
> -		dfu->data.mtd.start = pi->offset;
> -		dfu->data.mtd.size = pi->size;
> +		dfu->data.mtd.start = partition->offset;
> +		dfu->data.mtd.size = partition->size;
>  		if (!strcmp(argv[0], "partubi"))
>  			dfu->data.mtd.ubi = 1;
>  	} else {
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

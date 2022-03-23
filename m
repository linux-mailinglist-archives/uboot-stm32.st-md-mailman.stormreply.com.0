Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C3B4E4E8A
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Mar 2022 09:49:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7B3CC5F1EF;
	Wed, 23 Mar 2022 08:49:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 838C8C5F1D6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Mar 2022 08:49:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22N2FFRp029260;
 Wed, 23 Mar 2022 09:49:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=fSmHL41hPD3SPujfSQb6DIczaO0CzcakpqyvBWBocqA=;
 b=3rqsOKQTby4IHJqwPljiH7qVXUgzCe+NOZRv2TkpV0AKx1PzKUa3AOdbqjgreTLhUmE0
 jlEL6jxEuTfOwU4N73FoL+vHPVPnnE/XHZSMlZNKU/6lholGt43oVy+oAPnx5JZb14JR
 pCSMXoGAxN4v34cWUb5emAEw0nsQvSyYrV6Vly5KgQ2K6KrcY9TUkfHl6e4NrUfwDBmQ
 Zv6fukqI52quFPsai0kG0ey6q2zE6YaGMak6bWlC5wBtAFx7Npl1Bn9aojX+msqOOTQI
 pew2fm0RVm5dTFtaFBwlTnaYMncfIfNWKAy4ij79CMQHtGHVF90kemEHP1/I33CoyjhS 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ew7d4ejh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 09:49:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 929D2100034;
 Wed, 23 Mar 2022 09:49:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 81BE521A238;
 Wed, 23 Mar 2022 09:49:36 +0100 (CET)
Received: from [10.201.21.201] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 23 Mar
 2022 09:49:35 +0100
Message-ID: <91b38538-5d0f-5a39-a256-6955f540a2e5@foss.st.com>
Date: Wed, 23 Mar 2022 09:49:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220215162301.1.I5f92544259c3d1dad2df30c9d7762ec7860f07cf@changeid>
 <20220215162301.2.I26fa615c6898db0d17024664b17b20412638bfd7@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220215162301.2.I26fa615c6898db0d17024664b17b20412638bfd7@changeid>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_04,2022-03-22_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/2] env: mmc : align erase address and
 size on erase_grp_size
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

On 2/15/22 16:23, Patrick Delaunay wrote:
> On eMMC device, the erase_grp_size > 1 so the address and size for the
> erase block command in env/mmc.c can be unaligned on erase group size and
> some strange trace occurs and the result is not guarantee by MMC devices.
> 
> The SD-Card behavior doesn't change as erase_grp_size = 1 for SD-Card.
> 
> For example, on eMMC present on STM32MP15C-EV1 and before the patch:
> 
>   STM32MP> env erase
> 
>   Erasing Environment on MMC...
> 
>   Caution! Your devices Erase group is 0x400
>   The erase range would be change to 0x2000~0x27ff
> 
>   16 blocks erased: OK
> 
>   Caution! Your devices Erase group is 0x400
>   The erase range would be change to 0x2000~0x23ff
> 
>   16 blocks erased: OK
>   OK
> 
> After this patch:
>   STM32MP> env erase
>   Erasing Environment on MMC...
>   1024 blocks erased at 0x2000: OK
>   1024 blocks erased at 0x2000: OK
>   OK
> 
> Here the 2 copies of U-Boot environment are in the same devices Erase
> group: it is erased twice.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  env/mmc.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/env/mmc.c b/env/mmc.c
> index 465b104559..0c498d9a46 100644
> --- a/env/mmc.c
> +++ b/env/mmc.c
> @@ -257,12 +257,15 @@ static inline int erase_env(struct mmc *mmc, unsigned long size,
>  {
>  	uint blk_start, blk_cnt, n;
>  	struct blk_desc *desc = mmc_get_blk_desc(mmc);
> +	u32 erase_size;
>  
> -	blk_start	= ALIGN(offset, mmc->write_bl_len) / mmc->write_bl_len;
> -	blk_cnt		= ALIGN(size, mmc->write_bl_len) / mmc->write_bl_len;
> +	erase_size = mmc->erase_grp_size * desc->blksz;
> +	blk_start = ALIGN_DOWN(offset, erase_size) / desc->blksz;
> +	blk_cnt = ALIGN(size, erase_size) / desc->blksz;
>  
>  	n = blk_derase(desc, blk_start, blk_cnt);
> -	printf("%d blocks erased: %s\n", n, (n == blk_cnt) ? "OK" : "ERROR");
> +	printf("%d blocks erased at 0x%x: %s\n", n, blk_start,
> +	       (n == blk_cnt) ? "OK" : "ERROR");
>  
>  	return (n == blk_cnt) ? 0 : 1;
>  }
> @@ -286,6 +289,7 @@ static int env_mmc_erase(void)
>  		goto fini;
>  	}
>  
> +	printf("\n");
>  	ret = erase_env(mmc, CONFIG_ENV_SIZE, offset);
>  
>  #ifdef CONFIG_ENV_OFFSET_REDUND

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

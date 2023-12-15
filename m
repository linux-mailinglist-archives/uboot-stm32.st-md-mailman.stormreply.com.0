Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A473081475B
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Dec 2023 12:53:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A18AC6B45B;
	Fri, 15 Dec 2023 11:53:23 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2894C65E42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 11:53:21 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BF9WxgJ016099; Fri, 15 Dec 2023 12:53:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=QLqK4YgDGBqX7A29+HOxX5p3YJL5BTFLCWZfinvIE6s=; b=kb
 w55/UucEHMYPbYAqXV3H3qtmDZlthzJm1rLhdY3zbxYKI3T59Mh1E6L12rI601TU
 czsa3DrjNWuLAc4w1zjOfZhMiv533Wu9ZKBsi9wze3eR4CX4G3L22ZhkcVHDTZA6
 dlG7VWHNRibNQrlM73RJEfk0ZIPXb9eInGgQPGNHdTgJAi4esaccBiDC598i+02I
 04jeHf7YK18hI1Vlih4QFibnPhbY7JPWq1kAxYd4i34rn0TdYeiEMTSkix1p2sYC
 azVdWeKYIDAs00VR2dk0w5o0cCZASZP+y28bff0eDjzMtWvjx5cSD8kjaM7TpDIz
 iXWx8n0+l5UenpQfB4rQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uw42ny9um-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Dec 2023 12:53:20 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A2786100052;
 Fri, 15 Dec 2023 12:53:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A458215BE7;
 Fri, 15 Dec 2023 12:53:19 +0100 (CET)
Received: from [10.201.22.165] (10.201.22.165) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 12:53:19 +0100
Message-ID: <7137cd11-03ee-4a3c-8ff6-4e5c9268981d@foss.st.com>
Date: Fri, 15 Dec 2023 12:53:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20231117170107.1147598-1-patrice.chotard@foss.st.com>
 <20231117170107.1147598-2-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20231117170107.1147598-2-patrice.chotard@foss.st.com>
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_06,2023-12-14_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] board: st: common: simplify MTD
	device parsing
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 11/17/23 18:01, Patrice Chotard wrote:
> Simplify the way all MTD devices are parsed.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   board/st/common/stm32mp_dfu.c | 19 ++-----------------
>   1 file changed, 2 insertions(+), 17 deletions(-)
>
> diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
> index ded3bf81961..77edb86e78c 100644
> --- a/board/st/common/stm32mp_dfu.c
> +++ b/board/st/common/stm32mp_dfu.c
> @@ -123,24 +123,9 @@ void set_dfu_alt_info(char *interface, char *devstr)
>   		/* probe all MTD devices */
>   		mtd_probe_devices();
>   
> -		/* probe SPI flash device on a bus */
> -		if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev)) {
> -			mtd = get_mtd_device_nm("nor0");
> -			if (!IS_ERR_OR_NULL(mtd))
> +		mtd_for_each_device(mtd)
> +			if (!mtd_is_partition(mtd))
>   				board_get_alt_info_mtd(mtd, buf);
> -
> -			mtd = get_mtd_device_nm("nor1");
> -			if (!IS_ERR_OR_NULL(mtd))
> -				board_get_alt_info_mtd(mtd, buf);
> -		}
> -
> -		mtd = get_mtd_device_nm("nand0");
> -		if (!IS_ERR_OR_NULL(mtd))
> -			board_get_alt_info_mtd(mtd, buf);
> -
> -		mtd = get_mtd_device_nm("spi-nand0");
> -		if (!IS_ERR_OR_NULL(mtd))
> -			board_get_alt_info_mtd(mtd, buf);
>   	}
>   
>   	if (IS_ENABLED(CONFIG_DFU_VIRT)) {



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

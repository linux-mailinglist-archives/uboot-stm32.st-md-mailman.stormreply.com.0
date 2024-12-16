Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B505F9F2C66
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Dec 2024 09:56:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B264C7129D;
	Mon, 16 Dec 2024 08:56:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C31F9C6DD6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2024 08:56:11 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG72pPE007771;
 Mon, 16 Dec 2024 09:56:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 MdCVTExvIAI0ZstDLN5WhqtLy8udUTZqZU1ZQVzt8pQ=; b=UI6eLto82YGh3a37
 zIqBMDymgDcCs6jLZykjyIbwZ0BcDkHmIeUfmMj5GjUUWrAuIpztE3UrV/09w7F4
 aKZYEdA1/T6u5iX5PHuifIYisgbbF+wXM5B1rkCyxoKCTR6h8ln7ss0DBDMrfcbu
 q3qbyCG/TQWpLYU59/xOMBMibcYRPLcjvAfn7/BhAPZmgaVMm1+Sra0iKPTwOVwU
 ykSKCqRgH2ke727Y3mJLSIFxOikw0C3g8GF8JEC1+GEthYMxv/rOaut7JmlUQLJt
 I9zL9xX31Uc5E2fEZL4KBiRLJ4m1jEBC+wf+q7z7ABU7ZUT7682PKKRXjEY3+EMp
 3gngxw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43jccws1xq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 09:56:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E984E4004B;
 Mon, 16 Dec 2024 09:54:54 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A60F259A37;
 Mon, 16 Dec 2024 09:54:26 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 16 Dec
 2024 09:54:26 +0100
Message-ID: <c78cd5dd-1e98-4c63-ba6a-dc97d4a91c7a@foss.st.com>
Date: Mon, 16 Dec 2024 09:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241215233011.569287-1-marex@denx.de>
 <20241215233011.569287-2-marex@denx.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20241215233011.569287-2-marex@denx.de>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/4] ARM: dts: stm32: Reinstate
 SPL_SYS_MMCSD_RAW_MODE on DH STM32MP15xx DHSOM
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



On 12/16/24 00:29, Marek Vasut wrote:
> Commit 2a00d73d081a ("spl: mmc: Try to clean up raw-mode options")
> broke booting from SD card on STM32MP15xx , reinstate raw mode SD
> boot configuration options and select the correct raw mode partition
> for STM32MP15xx to fix SD boot on STM32MP15xx DHSOM.
> 
> Fixes: 2a00d73d081a ("spl: mmc: Try to clean up raw-mode options")
> Reported-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> NOTE: For 2025.01
> ---
> Cc: Igor Opaniuk <igor.opaniuk@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  configs/stm32mp15_dhsom.config | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/configs/stm32mp15_dhsom.config b/configs/stm32mp15_dhsom.config
> index efc149577ea..04ee9bfc444 100644
> --- a/configs/stm32mp15_dhsom.config
> +++ b/configs/stm32mp15_dhsom.config
> @@ -57,11 +57,14 @@ CONFIG_SPL_SPI_FLASH_SUPPORT=y
>  CONFIG_SPL_STACK=0x30000000
>  CONFIG_SPL_SYS_MALLOC=y
>  CONFIG_SPL_SYS_MALLOC_SIZE=0x1d00000
> +CONFIG_SPL_SYS_MMCSD_RAW_MODE=y
>  CONFIG_SPL_TEXT_BASE=0x2FFC2500
>  CONFIG_SPL_USB_GADGET=y
>  CONFIG_STM32_ADC=y
>  CONFIG_SYSRESET_SYSCON=y
>  CONFIG_SYS_BOOTCOUNT_ADDR=0x5C00A14C
> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=0x3
> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
>  CONFIG_SYS_MALLOC_F_LEN=0x3000
>  CONFIG_SYS_PBSIZE=1050
>  CONFIG_PREBOOT="run dh_preboot"

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

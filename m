Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9965A9F258
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Apr 2025 15:29:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F66DC78F67;
	Mon, 28 Apr 2025 13:29:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB1B7C78F63
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 13:29:20 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9Qdtn021410;
 Mon, 28 Apr 2025 15:29:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 TJR97h0ZaGxEucy0hcZde7JtiaLsD5nuDX0GUoh8ehI=; b=NtNA1dh1wgJcMgQp
 twEJIIhg7TnsdbpGqKucIyCf+Y9MgD0XMjJ9D3Avsmr0eBHh2I0/Kis4fElW95nH
 p3MZcNl5UV6Qx8m90MIXswHtnjiriMalxM5VXQnIeTbmaiVb8wnlHSD9pI2tZf1U
 3dkE+/ab6K14GTqj7hyPm5j/TygrHa49Bhu5I9zBSMGm99UmwkZ5FOFzoce/nMST
 lfRpk1bhfSs0IiX5Wb+qLekJv6X0ZWWju5WICsuidXvbB/04D9HLXCjlUCfHvEoB
 aKgmChuwhRH38lGAe9H/4Qvb8by/U2/YtU7y0rebn9qLSkrjli0wO2nLPl9JkGOt
 omVkBg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468mm9exq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Apr 2025 15:29:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 22D1140067;
 Mon, 28 Apr 2025 15:27:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF7F8A47ADB;
 Mon, 28 Apr 2025 15:24:28 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 15:24:28 +0200
Message-ID: <ca7fb705-66da-488e-9306-dd17aa15668e@foss.st.com>
Date: Mon, 28 Apr 2025 15:24:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20250425131533.392747-1-patrice.chotard@foss.st.com>
 <20250425131533.392747-23-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250425131533.392747-23-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_05,2025-04-24_02,2025-02-21_01
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 22/22] configs: stm32mp25: enable
 DISTRO_DEFAULT and BOOTCOMMAND
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



On 4/25/25 15:15, Patrice Chotard wrote:
> Enable DISTRO_DEFAULT and BOOTCOMMAND flags for stm32mp25
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> ---
> 
> Changes in v2:
>   - Enable DISTRO_DEFAULT and BOOTCOMMAND flags
> 
>  configs/stm32mp25_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
> index 0e515e4af65..317a6d5ecd6 100644
> --- a/configs/stm32mp25_defconfig
> +++ b/configs/stm32mp25_defconfig
> @@ -16,7 +16,9 @@ CONFIG_SYS_MEMTEST_END=0x88000000
>  CONFIG_API=y
>  CONFIG_SYS_MMC_MAX_DEVICE=3
>  CONFIG_FIT=y
> +CONFIG_DISTRO_DEFAULTS=y
>  CONFIG_BOOTDELAY=1
> +CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
>  CONFIG_SYS_PROMPT="STM32MP> "
>  # CONFIG_CMD_BDI is not set
>  CONFIG_CMD_BOOTZ=y
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

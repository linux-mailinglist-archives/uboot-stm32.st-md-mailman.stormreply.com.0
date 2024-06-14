Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF81A9087B3
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jun 2024 11:40:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60F0FC6C83A;
	Fri, 14 Jun 2024 09:40:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22719C5E2CD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:40:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E6IoPg010033;
 Fri, 14 Jun 2024 11:39:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 zWfTjPZseeHvFhTzLtyiqf9pGCoGPd3saR5Mkh5TfSI=; b=4kYxOJf7Vjbx/G22
 Zbs9T/e4kSwlBRwhzu0BnwLYL9lotiOtQuY1TOp7AGrkEa/jLM3qDIW8HTmNC3VU
 Tkq87A3gi19LU8GoHABYmx1ek1TlyjkbcIsnueaHQxUiJ2A2ZXouZxO/xZ0ZX6zD
 x8buOnmNmllFHlTWbrcYfqBZuiPkBvhnUC/MyGaogi+BExLe7yFw5VPwUiWTBkyI
 AnKDkgOYQPnsvtFNHD8L1T7U4AA/Af8VfyKEzUSsT0w9zZsxyrp61ZoNGcIwGJsZ
 U4k0Uvjggv/V813ZMiQie3xvUD1tqmxVEaUbc5/Iu0Je2RreZVg63zDhoRA1PzEx
 0s7Z2A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp4fug1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jun 2024 11:39:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 92BE840044;
 Fri, 14 Jun 2024 11:39:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D1B432115F9;
 Fri, 14 Jun 2024 11:39:26 +0200 (CEST)
Received: from [10.252.18.60] (10.252.18.60) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 14 Jun
 2024 11:39:26 +0200
Message-ID: <52616208-fb42-479c-a9c5-4164c11d6d2c@foss.st.com>
Date: Fri, 14 Jun 2024 11:39:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240606130305.24563-1-marex@denx.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240606130305.24563-1-marex@denx.de>
X-Originating-IP: [10.252.18.60]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Fix livetree conversion on
	STM32MP15xx DHSOM
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



On 6/6/24 15:02, Marek Vasut wrote:
> Unlike fdt_node_check_compatible() which returns 0 if node is compatible,
> ofnode_device_is_compatible() return true which is non-zero if node is
> compatible. The intention of the code is to exit from the function in
> case the node is not compatible with "micrel,ks8851-mll". Add the missing
> invert into the conditional to reinstate original behavior.
> 
> This exposes a follow up problem caused by conversion to DM based FMC2 EBI
> driver, where the FMC2 EBI is not configured when accessed by this code.
> Probe the KS8851 MAC, which also configures the FMC2 EBI as a dependency,
> so that the KS8851 MAC CCR register can be accessed over the FMC2 EBI bus
> and checked for EEPROM present bit.
> 
> Fixes: 5a605b7c8615 ("board: dhelectronics: stm32mp1: convert to livetree")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  board/dhelectronics/dh_stm32mp1/board.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
> index ebd45f9053f..4f4f537fee5 100644
> --- a/board/dhelectronics/dh_stm32mp1/board.c
> +++ b/board/dhelectronics/dh_stm32mp1/board.c
> @@ -76,14 +76,25 @@
>  
>  static bool dh_stm32_mac_is_in_ks8851(void)
>  {
> -	ofnode node;
> +	struct udevice *udev;
>  	u32 reg, cider, ccr;
> +	char path[256];
> +	ofnode node;
> +	int ret;
>  
>  	node = ofnode_path("ethernet1");
>  	if (!ofnode_valid(node))
>  		return false;
>  
> -	if (ofnode_device_is_compatible(node, "micrel,ks8851-mll"))
> +	ret = ofnode_get_path(node, path, sizeof(path));
> +	if (ret)
> +		return false;
> +
> +	ret = uclass_get_device_by_of_path(UCLASS_ETH, path, &udev);
> +	if (ret)
> +		return false;
> +
> +	if (!ofnode_device_is_compatible(node, "micrel,ks8851-mll"))
>  		return false;
>  
>  	/*
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

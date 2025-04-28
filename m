Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F16A9F224
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Apr 2025 15:24:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F8EBC78F94;
	Mon, 28 Apr 2025 13:24:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EFFFC78F63
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 13:24:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9eUiX010502;
 Mon, 28 Apr 2025 15:23:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 kxVmnBrZeYauH9RgBt0yV0VzGs7FP+XHZef78YPGYZE=; b=K7ZFbCillw6qhNdB
 7vgYJ+azOR4kWnpCOchjThXktY/hIxeqEirZ3FBpi0CSzQfXI1R6/y2V6ktkANzg
 G7pWakJtH3RlDHlTwjFVBpndJkoZrsU8eSB/PRvY39i5nG2m601l5fNf7X7INfNT
 uiqDKCJSQ1agTGBp1xs0kE3DnCaaZXeD7sZ0N4sFpij32ZQLgjHTfKWZNnDbzSLv
 HoMVE3sfkzobQsNAOYrZiyBc/EeDrJHVGSn+SjCsfnrDYmWTtM0TUGc5IoIglzUb
 rtfJAEgPta0oW73UABtXfg1EQskeAkKGRcC7JS1j86ymODBMfE7MSD+EtVMHJoYw
 98Pn/w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468pcg6qjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Apr 2025 15:23:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 15DAB40079;
 Mon, 28 Apr 2025 15:22:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0F44CA805AC;
 Mon, 28 Apr 2025 15:21:49 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 15:21:48 +0200
Message-ID: <55c3609a-909f-4f42-8d6d-2ebaaf0f6714@foss.st.com>
Date: Mon, 28 Apr 2025 15:21:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20250422131229.415020-1-patrice.chotard@foss.st.com>
 <20250422131229.415020-11-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250422131229.415020-11-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_05,2025-04-24_02,2025-02-21_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 10/13] ARM: dts: stm32: add ETZPC as a
 system bus for STM32MP1x boards
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



On 4/22/25 15:12, Patrice Chotard wrote:
> From: Lionel Debieve <lionel.debieve@foss.st.com>
> 
> The STM32 System Bus is an internal bus on which devices are connected.
> ETZPC is a peripheral overseeing the firewall bus that configures
> and control access to the peripherals connected on it.
> 
> For more information on which peripheral is securable, please read
> the STM32MP13 or STM32MP15 reference manual.
> 
> Signed-off-by: Lionel Debieve <lionel.debieve@foss.st.com>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  arch/arm/dts/stm32mp13-u-boot.dtsi | 4 ++++
>  arch/arm/dts/stm32mp15-u-boot.dtsi | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp13-u-boot.dtsi b/arch/arm/dts/stm32mp13-u-boot.dtsi
> index af7edc7e2b2..1fe6966781c 100644
> --- a/arch/arm/dts/stm32mp13-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp13-u-boot.dtsi
> @@ -48,6 +48,10 @@
>  	bootph-all;
>  };
>  
> +&etzpc {
> +	bootph-all;
> +};
> +
>  &gpioa {
>  	bootph-all;
>  };
> diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
> index 3f57bd5fe0f..327d7760436 100644
> --- a/arch/arm/dts/stm32mp15-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
> @@ -106,6 +106,10 @@
>  	operating-points-v2 = <&cpu0_opp_table>;
>  };
>  
> +&etzpc {
> +	bootph-all;
> +};
> +
>  &gpioa {
>  	bootph-all;
>  };
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

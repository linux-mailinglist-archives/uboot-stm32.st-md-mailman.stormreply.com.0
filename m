Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1158AAE43
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:15:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8E92C6DD72;
	Fri, 19 Apr 2024 12:15:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB5BFC69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:15:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J9drMG009597; Fri, 19 Apr 2024 14:15:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=cHq6RZTCsw4wg88cF6+/hrfPtCSc+8WQZfGJwkEbLVQ=; b=z0
 f9GxDstdZZyahpRsO5fl3EFZkF40HALbVICeJ3+qXNA2n0nWjQVG2N7kSao7cjnK
 X65l7FShdoD+X0wRUxcuey6/+C0C9LuiIeHRyu1eQc7o+snGbwax2wy2HsKgq4Bj
 nRFbFaaScAVT7W4E8GEJRWVK//kfWzpWOvhSG2m8bbl+kT8com1v0R1h17SG34Fl
 DSTRHdCRw/aqlJOtEXbkhqU/1OoRQd36jv9ZwUrHE+NHpBGPfVCaPUwWNxQ+2faU
 LA4bJ12lBtiplEsIVe8cXzWJHvYPjoRqcOfj/4QwBtFFQcT/wAUXiXrqaqE+FAAr
 2gD1B2a4wDNnviOgtfeg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xff64ut54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:15:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E6B3B40047;
 Fri, 19 Apr 2024 14:15:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 974B02194F5;
 Fri, 19 Apr 2024 14:15:00 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:15:00 +0200
Message-ID: <9c6cc1d7-d019-4635-8b03-5d93fe305157@foss.st.com>
Date: Fri, 19 Apr 2024 14:15:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240304182553.106321-1-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240304182553.106321-1-marex@denx.de>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32: Enable OHCI HCD support on
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



On 3/4/24 19:25, Marek Vasut wrote:
> The OHCI HCD is mandatory for USB 1.1 FS/LS device support, enable it.
> This used to be enabled implicitly before, now that implicit dependency
> disappeared and this got disabled. Enable it manually.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: u-boot@dh-electronics.com
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  configs/stm32mp15_dhcom_basic_defconfig | 2 ++
>  configs/stm32mp15_dhcor_basic_defconfig | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
> index 1d241529be7..0bfd3b76d6a 100644
> --- a/configs/stm32mp15_dhcom_basic_defconfig
> +++ b/configs/stm32mp15_dhcom_basic_defconfig
> @@ -164,6 +164,8 @@ CONFIG_DM_USB_GADGET=y
>  CONFIG_SPL_DM_USB_GADGET=y
>  CONFIG_USB_EHCI_HCD=y
>  CONFIG_USB_EHCI_GENERIC=y
> +CONFIG_USB_OHCI_HCD=y
> +CONFIG_USB_OHCI_GENERIC=y
>  CONFIG_USB_DWC2=y
>  CONFIG_USB_HOST_ETHER=y
>  CONFIG_USB_ETHER_ASIX=y
> diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
> index 6e0c4a8cf9f..1c1fbc5c7db 100644
> --- a/configs/stm32mp15_dhcor_basic_defconfig
> +++ b/configs/stm32mp15_dhcor_basic_defconfig
> @@ -164,6 +164,8 @@ CONFIG_DM_USB_GADGET=y
>  CONFIG_SPL_DM_USB_GADGET=y
>  CONFIG_USB_EHCI_HCD=y
>  CONFIG_USB_EHCI_GENERIC=y
> +CONFIG_USB_OHCI_HCD=y
> +CONFIG_USB_OHCI_GENERIC=y
>  CONFIG_USB_DWC2=y
>  CONFIG_USB_HOST_ETHER=y
>  CONFIG_USB_ETHER_ASIX=y

Applied on u-boot-stm32/master 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

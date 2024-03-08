Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0B18761EC
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Mar 2024 11:23:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9321CC6C83D;
	Fri,  8 Mar 2024 10:23:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 264FEC6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Mar 2024 10:23:32 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4288iql1022305; Fri, 8 Mar 2024 11:23:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=gn0GYiaINOi35h2Pd8CbX/2hxz+FSVbpx6rr2mvue9o=; b=7N
 QXmeojetjA+ZXfootDfDzCMjrhJYMYW28IhJt6avzJS/JRRCX8q91ifP+18b8Hnk
 SB309XrEgBFmPEreys35bweHvavnqMd6EO5GzbYchjlgpEnoXkqc4GQHHAhXyhP+
 mvmdNxKsYNPu+2cpo2g6Bwb93G2c278Fd5akkg+955WzvUW355kuy35KGZRtZfIa
 XmV5Z4voG/fVoL+yAE1GFvTfpMrcPwtTo98bQLIe+785A2cWI9mEW8E5DkuTwtgH
 K4mJ7s1NWrKKjAk+ILq+WSQvQQiFQTp6hceS27pvxoafEMhPjlUyrkI/upDLlCJ5
 S4+kajKmisjlhngj822Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wn87txb6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Mar 2024 11:23:20 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1A39040045;
 Fri,  8 Mar 2024 11:23:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 111B725F7C8;
 Fri,  8 Mar 2024 11:23:02 +0100 (CET)
Received: from [10.252.7.115] (10.252.7.115) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Mar
 2024 11:23:01 +0100
Message-ID: <365fd907-655f-4860-9e2b-dfdb338353f3@foss.st.com>
Date: Fri, 8 Mar 2024 11:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240304182553.106321-1-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240304182553.106321-1-marex@denx.de>
X-Originating-IP: [10.252.7.115]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_07,2024-03-06_01,2023-05-22_02
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


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

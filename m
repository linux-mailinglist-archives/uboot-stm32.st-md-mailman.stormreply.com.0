Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A94EA22D21
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2025 13:59:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAA39C71289;
	Thu, 30 Jan 2025 12:59:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D568C6C841
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2025 12:59:10 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UCfFX9029988;
 Thu, 30 Jan 2025 13:59:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 YRMcJ2yiOC1lRh2ptmhHc/DjcsqxSEXYkMogzrKAEeE=; b=AjIwKycFNHneIakR
 TWLP3ZWfCgoXDjWZ8smTKsktlNm7prwJ52YKc8hs431xnfGV9iDyiBj7ngCSuf3p
 WuRiiH+P+b1n4nAuVAtROdvIyMyedIj6sRKYVUMg9JnGHs3iExBD6XspmUfpkEez
 hMsKr/hPX7X/dleGzK7bEoaNc5e9oWBbZFzt2kHHgRj6/n0hfIzdyy+exAFNDRcm
 ilc62Ke/AuqQv7bbnLaqK6WwAPtAULuJaj6zGJO8zJFZIby9IpvEWzHuLCWbhB/g
 6/SH7KJq3GQTmPjetdFCXEnFb/3AYE4Mg2SWrucdKfkV0wwYGKG28MoXZVJLlAoI
 ypQ8mg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44fy472du4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jan 2025 13:59:05 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id ACD2040052;
 Thu, 30 Jan 2025 13:58:18 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BDF463BECF8;
 Thu, 30 Jan 2025 13:56:08 +0100 (CET)
Received: from [10.48.87.126] (10.48.87.126) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 13:56:08 +0100
Message-ID: <dc9dbd62-3eaa-43bb-805c-a3b5f2b9bd60@foss.st.com>
Date: Thu, 30 Jan 2025 13:56:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250123144718.1139824-1-patrice.chotard@foss.st.com>
 <20250123144718.1139824-2-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250123144718.1139824-2-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.126]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v4 1/9] ARM: dts: sti: Add fixed clock for
 ehci and ohci nodes in stih410-b2260.dtsi
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


On 1/23/25 15:47, Patrice Chotard wrote:
> On STi platforms, all clocks are enabled by BOOTROM, so CONFIG_CLK is
> not set as no clock driver for STI exists.
>
> As ehci-generic and ohci-generic drivers are used on platforms where
> CONFIG_CLK is set, clk_get_bulk() returns-ENOSYS in case of
> stih410-b2260.
> To avoid this error, add fixed clocks for ehci and ohci nodes for
> stih410-b2260 to fix the following errors:
>
> Bus usb@9a03c00: ohci_generic usb@9a03c00: Failed to get clocks (ret=-19)
> Port not available.
> Bus usb@9a03e00: ehci_generic usb@9a03e00: Failed to get clocks (ret=-19)
> Port not available.
> Bus usb@9a83c00: ohci_generic usb@9a83c00: Failed to get clocks (ret=-19)
> Port not available.
> Bus usb@9a83e00: ehci_generic usb@9a83e00: Failed to get clocks (ret=-19)
> Port not available.
> scanning bus dwc3@9900000 for devices... 1 USB Device(s) found
>         scanning usb for storage devices... 0 Storage Device(s) found
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Marek Vasut <marex@denx.de>
> ---
>
> (no changes since v1)
>
>   arch/arm/dts/stih410-b2260-u-boot.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

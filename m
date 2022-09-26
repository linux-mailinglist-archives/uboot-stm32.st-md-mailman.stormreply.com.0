Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F7A5E9A26
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Sep 2022 09:08:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0224C03FC7;
	Mon, 26 Sep 2022 07:08:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46E52C035BA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 07:08:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q73luW002166;
 Mon, 26 Sep 2022 09:08:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ysujnhw7rcVpXD6cpudPH/6qnD2WOrvGMeqaki9Hqlw=;
 b=zSeDrl+hYCiKCSsV2QCJGtTLap0ACo6CsmoBAVwMRJEQAGIXEwgjMCuPfLsC/CzoPT5C
 5kEzr0mkd9SrAYpZqtA6WcaJNjgn5YVH9wTMiMUkDa2VLSj9UaAfmRNpO1V4fbtXNs76
 cE0xbdZqeC/KTIpCcxBvaKNNp7aTChG0pUXGc0GGDRTkltWA4meNVOmwqNVpC8+vFzlr
 yFK2d2AIEWver/oZcQ7yGXDrjLFCinoObZ57crgZV9fVSH9pAEg7h4ZpFRHxbkdpAqKn
 9VclXJ79f8B48XAZbbW3kGRH2pDwsT60Cw03BVzJUPn7Vty2GACjeherRy7mgmQboEoo EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsq1astwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 09:08:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E1BB610002A;
 Mon, 26 Sep 2022 09:08:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD19E2138CE;
 Mon, 26 Sep 2022 09:08:33 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.123) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 09:08:33 +0200
Message-ID: <564c620f-881d-d879-4675-58f132754ce4@foss.st.com>
Date: Mon, 26 Sep 2022 09:08:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220909114513.v2.1.I5eabf3f9fdbbaf763cd44e9c018cb5b74a0c65ac@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220909114513.v2.1.I5eabf3f9fdbbaf763cd44e9c018cb5b74a0c65ac@changeid>
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_04,2022-09-22_02,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 1/2] usb: hub: allow to increase
 HUB_DEBOUNCE_TIMEOUT
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

On 9/9/22 11:45, Patrick Delaunay wrote:
> Add a new CONFIG_USB_HUB_DEBOUNCE_TIMEOUT to increase the
> HUB_DEBOUNCE_TIMEOUT value, for example to 2s because some usb device
> needs around 1.5s or more to make the hub port status to be
> connected steadily after being powered off and powered on.
> 
> This 2s value is aligned with Linux driver and avoids to configure
> "usb_pgood_delay" as a workaround for connection timeout on
> some USB device; normally the env variable "usb_pgood_delay" is used
> to delay the first query after power ON and thus the device answer,
> but this variable not used to increase the connection timeout delay.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> Hi,
> 
> V2 of previous patch [1] after Marek request to a add a CONFIG_.
> 
> I think this patch solves a general issue because a 1s timeout for
> USB connection is too short on problematic USB keys / USB HUB.
> The issue was introduced by the commit c998da0d6709 ("usb: Change
> power-on / scanning timeout handling")
> 
> Patching usb_hub allows to avoid to patch in each board/driver.
> 
> For example, commit 0417169054cb ("imx: ventana: add usb_pgood_delay
> 2sec default") => use pgood_delay = 2s !?
> 
> or ("ARM: stm32: Increase USB power-good delay on DHSOM")
> https://patchwork.ozlabs.org/project/uboot/patch/20211113022444.231801-1-marex@denx.de/
> 
> or commit 2bf352f0c1b7 ("usb: dwc2: Add delay to fix the USB
> detection problem on SoCFPGA") => patch in USB DWC2 driver to add
> a timeout in driver
> 
> The commit 319418c01c95 ("usb: hub: allow pgood_delay to be
> specified via env") introduces an env variable for warm-up times
> managed by hub->query_delay.
> 
> But it is not linked to the connect timeout after power on
> managed by hub->connect_timeout.
> 
> This patch allow to increase the boot time for some board when USB device
> is not available; the default value = 1s of the config
> CONFIG_USB_HUB_DEBOUNCE_TIMEOUT allow to keep the current behavior.
> 
> This issue appears with DWC2 and USB HUB used in STM32MP135F-DK board;
> pgood_delay=2 is not enough to solved all the USB key detection issues.
> 
> [1] [2/2] usb: hub: increase HUB_DEBOUNCE_TIMEOUT
> http://patchwork.ozlabs.org/project/uboot/patch/20220704124540.2.I5eabf3f9fdbbaf763cd44e9c018cb5b74a0c65ac@changeid/
> 
> Patrick
> 
> 
> Changes in v2:
> - allow defconfig configuration by CONFIG_USB_HUB_DEBOUNCE_TIMEOUT
> 
>  common/Kconfig   | 12 ++++++++++++
>  common/usb_hub.c |  2 +-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/common/Kconfig b/common/Kconfig
> index e7914ca750a..fedb643ea58 100644
> --- a/common/Kconfig
> +++ b/common/Kconfig
> @@ -992,3 +992,15 @@ config FDT_SIMPLEFB
>  	  These functions can be used by board to indicate to the OS
>  	  the presence of the simple frame buffer with associated reserved
>  	  memory
> +
> +config USB_HUB_DEBOUNCE_TIMEOUT
> +	int "Timeout in milliseconds for USB HUB connection"
> +	depends on USB
> +	default 1000
> +	help
> +	  Value in milliseconds of the USB connection timeout, the max delay to
> +	  wait the hub port status to be connected steadily after being powered
> +	  off and powered on in the usb hub driver.
> +	  This define allows to increase the HUB_DEBOUNCE_TIMEOUT default
> +	  value = 1s because some usb device needs around 1.5s to be initialized
> +	  and a 2s value should solve detection issue on problematic USB keys.
> diff --git a/common/usb_hub.c b/common/usb_hub.c
> index d73638950b9..87fd93c55db 100644
> --- a/common/usb_hub.c
> +++ b/common/usb_hub.c
> @@ -47,7 +47,7 @@
>  #define HUB_SHORT_RESET_TIME	20
>  #define HUB_LONG_RESET_TIME	200
>  
> -#define HUB_DEBOUNCE_TIMEOUT	1000
> +#define HUB_DEBOUNCE_TIMEOUT	CONFIG_USB_HUB_DEBOUNCE_TIMEOUT
>  
>  #define PORT_OVERCURRENT_MAX_SCAN_COUNT		3
>  
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

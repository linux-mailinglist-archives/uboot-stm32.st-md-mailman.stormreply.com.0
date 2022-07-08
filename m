Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6004356BCF3
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Jul 2022 17:35:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DE73C0D2BF;
	Fri,  8 Jul 2022 15:35:00 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C198C03FC8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Jul 2022 15:34:58 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9A38F843A9;
 Fri,  8 Jul 2022 17:34:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657294497;
 bh=d05pMTfazuhsxv0pYGQ99hvJqqsPw02CXp9a8Y3zAoA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QA6hkw9qYBlylppcknfaKKxMXBXDqECqk+FuCbyGIWxQpi77Wz/9PrEL1HAOXX3HW
 0pNfCWwkxKwMc6ua0u3UH2mD/N+2ZzSfDzH9GnoOgz1/RVUdQIbZGxIORw8A0jSl4q
 1/Y0wXj1PY36cshbVNRfImrqzrRC1EbTHL+Rk9nX7rqxj5mEC1ttospW92pUR3n8sm
 7ri39ddO+5usG2UZ32ATyFmEElhYGkLCYtq2uwKe7WVlIvJaK+EdJEvmCNf0fhgIBh
 t1PZVId1UsJmdBT+uGWEahf+r5WB7u7+gEWZqbLdaNU7GjrjGMgCJP195dFE1fc71B
 FZfT8rLIz0LQQ==
Message-ID: <0e84778e-0ac5-5547-5a29-c8d12df3498d@denx.de>
Date: Fri, 8 Jul 2022 17:34:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220704124540.1.Ic02e6fb44225d1cfe15506c7c85f70a0893fb880@changeid>
 <20220704124540.2.I5eabf3f9fdbbaf763cd44e9c018cb5b74a0c65ac@changeid>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220704124540.2.I5eabf3f9fdbbaf763cd44e9c018cb5b74a0c65ac@changeid>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] usb: hub: increase
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 7/4/22 12:45, Patrick Delaunay wrote:
> Increase HUB_DEBOUNCE_TIMEOUT to 2000 because some usb device
> needs around 1.5s or more to make the hub port status to be
> connected steadily after being powered off and powered on.
> 
> These value is aligned with Linux driver and avoids to configure
> "usb_pgood_delay" as a workaround for connection timeout on
> some USB device; normally the env variable "usb_pgood_delay" is used
> to delay the first query after power ON and thus the device answer,
> but this variable not to increase the connection timeout delay.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> Hi,
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
> This patch can increase the boot time for some board when USB device is
> not available; if it is a problem I can introduce a new config:
> CONFIG_USB_HUB_DEBOUNCE_TIMEOUT to define this value with default = 1s
> to keep the current behavior.
> 
> This issue appears with DWC2 and USB HUB used in STM32MP135F-DK board;
> pgood_delay=2 is not enough to solved all the USB key detection issues.
> 
> Patrick
> 
> 
>   common/usb_hub.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/common/usb_hub.c b/common/usb_hub.c
> index d73638950b9..e681f1b3073 100644
> --- a/common/usb_hub.c
> +++ b/common/usb_hub.c
> @@ -47,7 +47,7 @@
>   #define HUB_SHORT_RESET_TIME	20
>   #define HUB_LONG_RESET_TIME	200
>   
> -#define HUB_DEBOUNCE_TIMEOUT	1000
> +#define HUB_DEBOUNCE_TIMEOUT	2000

Do you think it is possible to make this somehow dynamic , so not all 
devices would wait so long ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

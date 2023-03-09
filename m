Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5A16B1F04
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Mar 2023 09:57:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90753C6A609;
	Thu,  9 Mar 2023 08:57:25 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 196E8C6A5FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 08:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1678352238; i=xypron.glpk@gmx.de;
 bh=iK1hnL0yWT8zr6tcSP9QWJgbAx+SrAI1MCBsT8o7cq4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=qE3o4l1A4FGpnRGLHCpfwArlTKTJLwlN0LvBDh2Q7gg7xlCAtK2ZssA5a3FmeYn2j
 FP4yllTWiyFbdmckV54r42B/kwvxMTHshQcF+8pnz0sig1NPhOeUHVHW7n2pM9DTz1
 EXkIeHCjIg+tqGbykQLzHhMtduYcJ63NCmAJIfdP0icEBNrMhdTHcyiSPvutcn9iOW
 nXrihfFje0sY6frhST/dpnLwXQEk8wcl/HQHeYVWJI803rIKkB4P/S8i+PDTAx4YPz
 7IXoPeBEjl/P8bZf6V1org+cmKyb4OyvOsV1O1AlrAZLf8ItBGFKnGC4K1ApiHOjVn
 ycp/FA5ix5wOA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.123.67] ([88.152.145.137]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTAFb-1pzr0510d5-00Ubxb; Thu, 09
 Mar 2023 09:57:18 +0100
Message-ID: <b5c22f81-4312-9d0b-d87d-19ddb4f95833@gmx.de>
Date: Thu, 9 Mar 2023 09:57:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20230308132649.355398-1-patrick.delaunay@foss.st.com>
 <20230308142555.1.I43130d8c0b1b4b863e2cbd9bcb26e07e44e5e235@changeid>
Content-Language: en-US
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20230308142555.1.I43130d8c0b1b4b863e2cbd9bcb26e07e44e5e235@changeid>
X-Provags-ID: V03:K1:V7TIGPJ/DOfAXh1CkkA10mJ4P6ItcsSaUCpzYS0Rf4qnvGdElCI
 OZ+3tkEa0/w0st/Ld9Jv20veLaC7g1VnjxWNp3HYG46+9sD91la47xnohFjMoZoWSMVEp2h
 tihnesj9HM5SUjcJjnalwsPszgzYfsA+rMVo1VZGzhwCUrOwAUgOmn3DghVLfoyf9s6qE/n
 lQr5981Kv51xLRYA808BA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:afqyr/zrD0M=;crndkYLQwXQsqM77o8FtRdhPUZ2
 HqbFRsIA9+tCx8UX1UJ1D/TGOhklqXQD+tH/vYVzzxDVWjyRWy5elEHztqQX4660aVLn79vM4
 uE9cx9UUcQE9o1oJBe+bS5GrzwHdyfINING01PiEkrYiYBRvjG9XDCEoS3RxRPAUXvJNH6IG6
 Ji+ZuSjD4+Nzg5p3wZv2vdR4CTbsaOPcykyfZMiLxq46b2SYU4dCzhfz6yajXEfhpBhZ4ftwi
 yNY8RXT2iex/y07ZZCY+zw80QvOxlMJoJ7zpbnqoTUADFUfc4+WvF7sZZmBhF6Y4oWfTEHhsm
 9KM71+V8HJD86cM+cyx2zlpB3Kl/QNNA7QRLcay6BH0JRQjEcUTYVVRrIA2dJUBZ5TiSkU49q
 zeRjUsV5o/sE42mu3E9WmEUW2+vhtyKTu+yEncUV8moRp44/J/VcmqFEJYWAYEXykZvhk1A5z
 WOIJeF8SspGdoI4x6AjYbX5N370pnzEo9SFTjCl9iobwxSUUPKVd5a4Q2e2Mm6+TjUWXpTnlY
 gDxmplW0dQl/GyWh196x35YW1s96oZ/JPDDsDAVJIXiE99O2BApA/Vr1W7HyYtH8e7l/7F5fL
 6OQ8I0fY0149kzJkKt5S5IrWrN9KdBjCR6fK2j5G6GY2mkLxex10gLR9y9uLupjRYQkdPmr5Q
 +Uh6SeTLke24N5zjxTfvifSNTRaMGe5yJyZxElBihd33F/8ltP35hLNPBE2nW4Bpe0NJj19Cd
 VTnCytZbTHnwUyBcjXbJu27cm94H0c5Y0rq0jxBfLxk41j4pUwu4dqVEZrBc2ZjeANv9+YjXL
 lkHxFassvYLvPsRvq2pf0UUyXzWso5jJdXhV0wAWBQpRAvovRGenwwB/48IEsENoikYuv1KQc
 C5oO4CWcSL1u8DyPoSEiM7LbHuOBxd37R7Bn/dgJFnL+fTbe3PPBWJrwWhXEBuQsMjiM1p8VG
 fQXzfiyNHtv9lwPVW4kDkjvygh4=
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 1/2] efi: remove error in efi_disk_probe
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

On 3/8/23 14:26, Patrick Delaunay wrote:
> EFI has no reason to block the dm core device_probe() in the callback
> efi_disk_probe() registered with EVT_DM_POST_PROBE.
>
> This patch avoids to have error in DM core on device_probe()
>
>    ret = device_notify(dev, EVT_DM_POST_PROBE);
>
> only because EFI is not able to create its instance/handle.

This should only occur if we are out of memory or if you call
efi_disk_probe() twice for the same device.


>
> For example on usb start, when the SAME KEY (PID/VID) is present on
> 2 ports of the USB HUB, the 2nd key have the same EFI device path
> with the call stack:

We need the HUB device with its USB port in the device path.

The way we currently create device paths is not good. We should traverse
the dm tree to the root and create a node for each dm device. The code
code for creating the individual nodes should be moved to uclasses.

@Simon: is that ok for you?

>
> efi_disk_probe()
> 	efi_disk_create_raw()
> 		efi_disk_add_dev()
> 			efi_install_multiple_protocol_interfaces()
> 				EFI_ALREADY_STARTED

If we create the same device path for two USB devices, this is a bug we
must fix.

>
> In case of error in probe, the 2nd key is unbound and deactivated for
> the next usb commands even if the limitation is only for EFI.
>
> This patch removes any return error in probe event callback;
> if something occurs in EFI registration, the device is still probed.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   lib/efi_loader/efi_disk.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/lib/efi_loader/efi_disk.c b/lib/efi_loader/efi_disk.c
> index d2256713a8e7..8d53ba3bd27e 100644
> --- a/lib/efi_loader/efi_disk.c
> +++ b/lib/efi_loader/efi_disk.c
> @@ -677,14 +677,18 @@ int efi_disk_probe(void *ctx, struct event *event)
>   	desc = dev_get_uclass_plat(dev);
>   	if (desc->uclass_id != UCLASS_EFI_LOADER) {
>   		ret = efi_disk_create_raw(dev, agent_handle);
> -		if (ret)
> -			return -1;
> +		if (ret) {
> +			log_err("efi_disk_create_raw %s failed (%d)\n",
> +				dev->name, ret);

This isn't a message a non-developer can easily understand.

> +			return 0;
> +		}
>   	}
>
>   	device_foreach_child(child, dev) {
>   		ret = efi_disk_create_part(child, agent_handle);
>   		if (ret)
> -			return -1;
> +			log_err("efi_disk_create_part %s failed (%d)\n",

ditto.

Best regards

Heinrich

> +				dev->name, ret);
>   	}
>
>   	return 0;

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

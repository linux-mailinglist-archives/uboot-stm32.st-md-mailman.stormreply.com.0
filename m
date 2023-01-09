Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EB1662814
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jan 2023 15:07:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4B0FC69048;
	Mon,  9 Jan 2023 14:07:45 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E50AFC65048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jan 2023 14:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1673273260; bh=pJ14s1g9llZ6rBvQYXIodcLqzuIeKUYiFPYZT+3NyiA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Hf1t7vgDcLrZREJQNXs3jZmmkmu0YcTFhLxbhlZQqQA28QeFk/gZTpxMQpVQTCgWO
 XICcbY1Zz7NsBRWFmnBYV5aT2DtccZLielny8sg8cQWo8+7lthx0j8ZGVdZEZggBEX
 tBrRaSJCThEWlHN5q2nOiQVTqqoHiRBZc/Ir9IVCAZTuGS+/JTjiyDo3BsooqSEIEo
 3GN4uj2tr6irrocun9Rk87nxx44H1e6kmuBX/yAQLoUkqB0z/b492S+/z09hw3lV9j
 b7iPAi328HQS4x2l2VWmqbmG+QeNHYCSa4xSsa//K+lM/rB+Qecwagyzxx33Rtm6I9
 /bEfP7myYyrzg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [10.9.8.2] ([80.130.117.101]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MvKXb-1oxlQw3l8j-00qppx; Mon, 09
 Jan 2023 15:07:40 +0100
Message-ID: <949f7201-5acc-0644-4625-3dbdf02266eb@web.de>
Date: Mon, 9 Jan 2023 15:07:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, u-boot@lists.denx.de
References: <20230109115240.85696-1-dario.binacchi@amarulasolutions.com>
From: Soeren Moch <smoch@web.de>
In-Reply-To: <20230109115240.85696-1-dario.binacchi@amarulasolutions.com>
X-Provags-ID: V03:K1:h0kcfKwL6iSBsOmL/s6vB92u973ZDwbjtVeXq77Z0Fsgxu08Tps
 29a57WcJxWwUxHxQJNctdtaBQH6uxNqtc3fF3ae6/gTfvU0TK7LqFhCqkz2ORqdOXFJTvLf
 /jDe02KBAyelrsd7gHA3cP4+vm/BSUTkl2tSPqFtuCxIWVj+IDCMeXWSiaVeojc3v40WXsP
 blyi80yRX9EnOPO85blsA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:x+4o49p460g=;iIEdH4PYG/LWQRxJMCcZ9F4v3a7
 CiDRY5JZNTX1GAYx0kXAg2GIttjFuu8o7tFd0wYTJH0h82pzdf7jDPT9ek2wr1cznkCorzQTF
 hrMlc9BOTZ04LxaY/ssNg4FXS1Q4MbSco9LsWxbjjf5eeLSSPMZjQJBJqKOcRK9SSyWWR7JYv
 4YRHsUcm09pp6BscD6eaPbUO0etZAv6/+k+zGBEHhd4923dEUQvwxlUKxox9B2nQ4RukbeSFi
 sIRZfUkS8RP3UgTYdyuk7gc5XFN0U4GUnacluVzWZos3DcywWIOmLOKY+TaxsesIBErW/6s6z
 1Wh+xayFyaiscmPwH9KCezeahS7E30OFnkmLTXr7eWavX3152CGSyMiex9Ixg2B0wVHguazDo
 XIXenL6u64JYbTqhLyP5jcXdge0JOVj6JK/FT7WVbdBu61bArkou56X+O8JR7O/8BalyR2HAp
 PvUecW4417FgKcZdU5rVc2m1sBKqNs49vtMKFXAjXunW+8x3vo/8UaHlpAhe1x8jbE+8iysm+
 qIjnaun6dzfYa37FOvVRWtDsItBQGwRVSqGsCpbnSpD45iHKNtZY42moxVc02UkJ/RHGPsDvn
 Txlq0h4+k25JJdX7/1IGTu0TpZ9G2OsNBtn9FDM2KU9oT+BgmlAy0nXISPvqpLGR0aOr5C4yU
 SWcNY8E+PNQExlJCa17OmDaiPbvDrOoa+y0G+pnoTBZd3omusqK08udB1OgV949NCyZopLhVp
 85jIMVep8OOD4RunXpgcvh79gznrTgVV12KdsQTjMTHi7zouqvidQ7Q93nvKTKSdZK4j/soUE
 5Ut8FPczb8bPwvqYFLU65hadNMPWyiAieUPsb2U3spOelmM3+18RmEQsZ7rQWfwzxhkgHERBl
 6PkYuhfolwLXrbwiPY3h5EqMZ+mUIbFE1WntGIlYMnyQRQ3R+fJ7Hpxtg4e4SohL+fZ1aecXR
 C5qG7w==
Cc: Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Kamil Lulko <kamil.lulko@gmail.com>, Dillon Min <dillon.minfei@gmail.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2] doc: fix references to distro
	documentation
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

On 09.01.23 12:52, Dario Binacchi wrote:
> Commit 37c5195dfcd157 ("doc: Move distro boot doc to rST") renamed
> doc/README.distro to doc/develop/distro.rst.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Soeren Moch <smoch@web.de>
> ---
>
> Changes in v2:
> - Change 'distro.rst' to 'doc/develop/distro.rst' also for
>    doc/board/emulation/qemu-x86.rst and doc/board/tbs/tbs2910.rst files.
Thanks a lot,
Soeren
> - Add 'Reviewed-by' tag of Patrice Chotard.
>
>   doc/README.gpt                   | 2 +-
>   doc/README.uniphier              | 2 +-
>   doc/board/emulation/qemu-x86.rst | 3 ++-
>   doc/board/st/stm32mp1.rst        | 2 +-
>   doc/board/tbs/tbs2910.rst        | 2 +-
>   5 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/doc/README.gpt b/doc/README.gpt
> index 91e397d06f88..394cea0aa875 100644
> --- a/doc/README.gpt
> +++ b/doc/README.gpt
> @@ -177,7 +177,7 @@ To restore GUID partition table one needs to:
>        "name=u-boot,size=60MiB;name=boot,size=60Mib,bootable;name=rootfs,size=0"
>      It can be used to locate bootable disks with command
>      "part list <interface> <dev> -bootable <varname>",
> -   please check out doc/README.distro for use.
> +   please check out doc/develop/distro.rst for use.
>
>   2. Define 'CONFIG_EFI_PARTITION' and 'CONFIG_CMD_GPT'
>
> diff --git a/doc/README.uniphier b/doc/README.uniphier
> index badfacd66aa5..af746f6c316e 100644
> --- a/doc/README.uniphier
> +++ b/doc/README.uniphier
> @@ -336,7 +336,7 @@ Deployment for Distro Boot
>   --------------------------
>
>   UniPhier SoC family boot the kernel in a generic manner as described in
> -doc/README.distro .
> +doc/develop/distro.rst.
>
>   To boot the kernel, you need to deploy necesssary components to a file
>   system on one of your block devices (eMMC, NAND, USB drive, etc.).
> diff --git a/doc/board/emulation/qemu-x86.rst b/doc/board/emulation/qemu-x86.rst
> index db842f2ece6e..e7dd4e994d38 100644
> --- a/doc/board/emulation/qemu-x86.rst
> +++ b/doc/board/emulation/qemu-x86.rst
> @@ -57,7 +57,8 @@ to instantiate. Note, the maximum supported CPU number in QEMU is 255.
>   U-Boot uses 'distro_bootcmd' by default when booting on x86 QEMU. This tries to
>   load a boot script, kernel, and ramdisk from several different interfaces. For
>   the default boot order, see 'qemu-x86.h'. For more information, see
> -'README.distro'. Most Linux distros can be booted by writing a uboot script.
> +'doc/develop/distro.rst'. Most Linux distros can be booted by writing a uboot
> +script.
>   For example, Debian (stretch) can be booted by creating a script file named
>   'boot.txt' with the contents::
>
> diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
> index 3759df353ee5..0dcc6b783b89 100644
> --- a/doc/board/st/stm32mp1.rst
> +++ b/doc/board/st/stm32mp1.rst
> @@ -478,7 +478,7 @@ or:
>     +-------+--------+---------+------------------------+------------------------+
>
>   And the 4th partition (Rootfs) is marked bootable with a file extlinux.conf
> -following the Generic Distribution feature (doc/README.distro for use).
> +following the Generic Distribution feature (doc/develop/distro.rst for use).
>
>   The size of fip or ssbl partition must be enough for the associated binary file,
>   4MB and 2MB are default values.
> diff --git a/doc/board/tbs/tbs2910.rst b/doc/board/tbs/tbs2910.rst
> index e97f2b6e6135..9d4be61783ed 100644
> --- a/doc/board/tbs/tbs2910.rst
> +++ b/doc/board/tbs/tbs2910.rst
> @@ -181,7 +181,7 @@ If that fails it will then try to boot from several interfaces using
>   'distro_bootcmd': It will first try to boot from the microSD slot, then the
>   SD slot, then the internal eMMC, then the SATA interface and finally the USB
>   interface. For more information on how to configure your distribution to boot,
> -see 'README.distro'.
> +see 'doc/develop/distro.rst'.
>
>   Links:
>   ------

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

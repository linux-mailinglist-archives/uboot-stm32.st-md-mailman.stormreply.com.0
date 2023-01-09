Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0AF66244A
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jan 2023 12:36:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DBA6C65E4C;
	Mon,  9 Jan 2023 11:36:25 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38CB9C65048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jan 2023 11:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1673264180; bh=O5fFN7XT1MxUWVq3ZJIgBBM5q7sZ0QT1jMNhC8rcZ2w=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=t+9Hw70Cce0GFcyXbGY8jSdE8N9beEKUdeNwHTabv20lEONjRmLu7hwiz1+dMdfIJ
 4mBQlBTalEA/U/BxKur8Jlfsf6vHlyPoNoWdwDEsfpWPb+HhjSukID1bziQfv76CXz
 7NLLRaACZvkzds79zgb33Ni6srsi6E9NM75nDFR1VXd2Q+/J9DLVgFzQweuccSbWd/
 RW7yEWBIkKy1u3Ejz9z7WegIDnaymBMpdkEezIyoTqVoN0PTrHsFy4ki5sMj7CSvz8
 aA79Q/hVXOTfRKs+hTJP9FM+QH4MxuWTfUNkyiNppsO0Xtw1PVuFXFEl5kxo63hc5J
 4AdfnY02nV15g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [10.9.8.2] ([80.130.117.101]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MlL9z-1oVI1G3yBh-00lNQJ; Mon, 09
 Jan 2023 12:36:20 +0100
Message-ID: <cd6bd779-46a2-bea0-bd99-894d8dafcc6e@web.de>
Date: Mon, 9 Jan 2023 12:36:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, u-boot@lists.denx.de
References: <20230108100735.3684180-1-dario.binacchi@amarulasolutions.com>
From: Soeren Moch <smoch@web.de>
In-Reply-To: <20230108100735.3684180-1-dario.binacchi@amarulasolutions.com>
X-Provags-ID: V03:K1:Bh3NZ39A7Nipyc6auzGFjIVc3CNzJL9UzW2fdjPxOEIRWFkzCN8
 e/go9T6JrpePYoM+NqzapNpw8+Vl1DTQvCu4IcOSBQL24tLF56CI1d2rslGiUpY7EkXPxQ7
 rmI5w5okJg3PMG3woxv32UxCI6fVQHsTKDBll30DVzVwHqTVMH6DUD4MJRLb3yGvyrzwxp3
 PxG/hr+P5lfSvA2ISv6Ig==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1qjcczROFoM=;nd8tE8fgliuVc7TN/ZgQqOF+I7k
 HFMcSZe4csNl8TOvIbVp6/Z7yje5xb32beYGrD9RTR1JYvns8rVi5caQLA91M4hKT79b6Tq8u
 /HGkF8DZJCUlPYK+5exWJ5IsoAbjj7ypT2vlIjEXXgNPcwGiCB7S0lABM/OrhiQFX8yMIZ3++
 /NntKtIIKM/5way4wI7xvV8JYn6tF+zZTu2npUsL/+feHMqVWnSeM3Cz7qxM3dww6KyS7/YMC
 MWvWvVEjQ0WVMwv3R4Do09EM0iKmBV4If31AjqgvGhR74XP8dVcqWQTmHCaoNl6c/6q2QnsPR
 1DUupdkwbaslTbtqwfA2X96YUfBk1Fu0NLxQULsvpoGSRc3urYjIEgaBoKWBrvuy7JmZP5lSS
 xbNIW/7ygLE0hTIPXYrukWHgUZuzfuwAsZ4dauyRxFZOffMLRdHWXPT/BXJ2/ydQx6IDU5NNI
 t/qKMZaCI8zrAOe8mOAYbNfuf2APEKfzPMgxzp757rT2tZvY7dlzYhdcAgdDKFYgVtg1sQEX9
 46kSvQEMpyajbxNMtJsAby/JQGrIpaeP3L3rXm5CEvLpkZ/4408nYHW/p8XIAZ+bjSsXdNTuy
 5p7X+npsYBOXxs4XYJMT3ExdWNekefmr68pQJ0/fbWXQzQtOwx4WuV+RmF4VqVFIm1P+hr+xp
 9FxSwSlfdLUrH0NLwEv624AyJEht0tCPFrKyAKPBKr+KB3ihe3Xl42j8sLMLPWfDftJg4q9Tr
 iXYXbdRmgOTh5mnqI862E0e0FzfIHL7d+X8rSBEfRFXuK2DWKZ9u4EPOQpqTi96/9I8Mleqbu
 1Y86ySyacpeoFgIHMn9setUi0gtjB7BcPlzShmSzRkjIV82RCDAaS6VrC/NKBcdkTT0f6WfcF
 BHLikNKqc55gpx11N/x8u4Ksnu9BdvTICNl12qeU1wUn6XMr4TydX0uGJv0IPunUR2eCmwO57
 UD2cZgpz4vxbaY0Tt4dHijzd/Fo=
Cc: Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Kamil Lulko <kamil.lulko@gmail.com>, Dillon Min <dillon.minfei@gmail.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH] doc: fix references to distro
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

Hi Dario,

On 08.01.23 11:07, Dario Binacchi wrote:
> Commit 37c5195dfcd157 ("doc: Move distro boot doc to rST") renamed
> doc/README.distro to doc/develop/distro.rst.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>
>   doc/README.gpt                   | 2 +-
>   doc/README.uniphier              | 2 +-
>   doc/board/emulation/qemu-x86.rst | 2 +-
>   doc/board/st/stm32mp1.rst        | 2 +-
>   doc/board/tbs/tbs2910.rst        | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
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
> index db842f2ece6e..e605ae3ab32e 100644
> --- a/doc/board/emulation/qemu-x86.rst
> +++ b/doc/board/emulation/qemu-x86.rst
> @@ -57,7 +57,7 @@ to instantiate. Note, the maximum supported CPU number in QEMU is 255.
>   U-Boot uses 'distro_bootcmd' by default when booting on x86 QEMU. This tries to
>   load a boot script, kernel, and ramdisk from several different interfaces. For
>   the default boot order, see 'qemu-x86.h'. For more information, see
> -'README.distro'. Most Linux distros can be booted by writing a uboot script.
> +'distro.rst'. Most Linux distros can be booted by writing a uboot script.
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
> index e97f2b6e6135..4760922a93e6 100644
> --- a/doc/board/tbs/tbs2910.rst
> +++ b/doc/board/tbs/tbs2910.rst
> @@ -181,7 +181,7 @@ If that fails it will then try to boot from several interfaces using
>   'distro_bootcmd': It will first try to boot from the microSD slot, then the
>   SD slot, then the internal eMMC, then the SATA interface and finally the USB
>   interface. For more information on how to configure your distribution to boot,
> -see 'README.distro'.
> +see 'distro.rst'.
Please change 'distro.rst' to 'doc/develop/distro.rst' here.
Yes, the 'doc' was missing before, but with the additional 'develop'
directory it becomes even more difficult to find.

Thanks,
Soeren
>
>   Links:
>   ------

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

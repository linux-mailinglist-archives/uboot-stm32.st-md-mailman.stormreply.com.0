Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A32C2661F95
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jan 2023 09:02:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 557D2C65E4C;
	Mon,  9 Jan 2023 08:02:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A749DC65048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jan 2023 08:02:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3097pZUs000349; Mon, 9 Jan 2023 09:02:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=wCajMMRPUmAG4x7bFS00HMApzjqkPYyOR4bCQM5965k=;
 b=gCi/j2/Ws6NDUzLTAzFjWaIdmO940Fyo0TQUwclbQ/em48v7jQr9aLuuXmV8PJb+H0+N
 BVLx2iHcJF3KM8VM96H7OlZ8b0xDbQVCScY25nkanC9T1sjYwD/Lwwzh122oMGTB+Rnj
 4H7rEXL5KQlFzboBtIeMUClp+y7iOBazN/EuHPAAu5Ma63m7zBA+GOmMFssraN4oFt16
 QKzs/GEuFnS/jGte019CEqEL6Y0SxBRgxY2qSwhUQDj6ScB2FUfJElpk+o+P/8Z50Fpj
 WsOmZ+DxRDlAeLYF9Lx5nRQktsUwwajDW8jDccMuBni7ERPdCtVbgX1/BxMyaU4MM1By 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n0eum83t5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 09:02:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D144310002A;
 Mon,  9 Jan 2023 09:02:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C272F211600;
 Mon,  9 Jan 2023 09:02:16 +0100 (CET)
Received: from [10.252.34.235] (10.252.34.235) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Mon, 9 Jan
 2023 09:02:16 +0100
Message-ID: <58f2054b-c0b6-c4ad-d8d7-ab329cfa36bb@foss.st.com>
Date: Mon, 9 Jan 2023 09:02:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20230108100735.3684180-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230108100735.3684180-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.252.34.235]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_03,2023-01-06_01,2022-06-22_01
Cc: Simon Glass <sjg@chromium.org>, Kamil Lulko <kamil.lulko@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Soeren Moch <smoch@web.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dillon Min <dillon.minfei@gmail.com>, Vikas Manocha <vikas.manocha@st.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Dario

On 1/8/23 11:07, Dario Binacchi wrote:
> Commit 37c5195dfcd157 ("doc: Move distro boot doc to rST") renamed
> doc/README.distro to doc/develop/distro.rst.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  doc/README.gpt                   | 2 +-
>  doc/README.uniphier              | 2 +-
>  doc/board/emulation/qemu-x86.rst | 2 +-
>  doc/board/st/stm32mp1.rst        | 2 +-
>  doc/board/tbs/tbs2910.rst        | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/doc/README.gpt b/doc/README.gpt
> index 91e397d06f88..394cea0aa875 100644
> --- a/doc/README.gpt
> +++ b/doc/README.gpt
> @@ -177,7 +177,7 @@ To restore GUID partition table one needs to:
>       "name=u-boot,size=60MiB;name=boot,size=60Mib,bootable;name=rootfs,size=0"
>     It can be used to locate bootable disks with command
>     "part list <interface> <dev> -bootable <varname>",
> -   please check out doc/README.distro for use.
> +   please check out doc/develop/distro.rst for use.
>  
>  2. Define 'CONFIG_EFI_PARTITION' and 'CONFIG_CMD_GPT'
>  
> diff --git a/doc/README.uniphier b/doc/README.uniphier
> index badfacd66aa5..af746f6c316e 100644
> --- a/doc/README.uniphier
> +++ b/doc/README.uniphier
> @@ -336,7 +336,7 @@ Deployment for Distro Boot
>  --------------------------
>  
>  UniPhier SoC family boot the kernel in a generic manner as described in
> -doc/README.distro .
> +doc/develop/distro.rst.
>  
>  To boot the kernel, you need to deploy necesssary components to a file
>  system on one of your block devices (eMMC, NAND, USB drive, etc.).
> diff --git a/doc/board/emulation/qemu-x86.rst b/doc/board/emulation/qemu-x86.rst
> index db842f2ece6e..e605ae3ab32e 100644
> --- a/doc/board/emulation/qemu-x86.rst
> +++ b/doc/board/emulation/qemu-x86.rst
> @@ -57,7 +57,7 @@ to instantiate. Note, the maximum supported CPU number in QEMU is 255.
>  U-Boot uses 'distro_bootcmd' by default when booting on x86 QEMU. This tries to
>  load a boot script, kernel, and ramdisk from several different interfaces. For
>  the default boot order, see 'qemu-x86.h'. For more information, see
> -'README.distro'. Most Linux distros can be booted by writing a uboot script.
> +'distro.rst'. Most Linux distros can be booted by writing a uboot script.
>  For example, Debian (stretch) can be booted by creating a script file named
>  'boot.txt' with the contents::
>  
> diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
> index 3759df353ee5..0dcc6b783b89 100644
> --- a/doc/board/st/stm32mp1.rst
> +++ b/doc/board/st/stm32mp1.rst
> @@ -478,7 +478,7 @@ or:
>    +-------+--------+---------+------------------------+------------------------+
>  
>  And the 4th partition (Rootfs) is marked bootable with a file extlinux.conf
> -following the Generic Distribution feature (doc/README.distro for use).
> +following the Generic Distribution feature (doc/develop/distro.rst for use).
>  
>  The size of fip or ssbl partition must be enough for the associated binary file,
>  4MB and 2MB are default values.
> diff --git a/doc/board/tbs/tbs2910.rst b/doc/board/tbs/tbs2910.rst
> index e97f2b6e6135..4760922a93e6 100644
> --- a/doc/board/tbs/tbs2910.rst
> +++ b/doc/board/tbs/tbs2910.rst
> @@ -181,7 +181,7 @@ If that fails it will then try to boot from several interfaces using
>  'distro_bootcmd': It will first try to boot from the microSD slot, then the
>  SD slot, then the internal eMMC, then the SATA interface and finally the USB
>  interface. For more information on how to configure your distribution to boot,
> -see 'README.distro'.
> +see 'distro.rst'.
>  
>  Links:
>  ------
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

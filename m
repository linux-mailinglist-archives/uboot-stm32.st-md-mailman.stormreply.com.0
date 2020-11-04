Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA7A2A5E8E
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Nov 2020 08:07:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4207C36B35;
	Wed,  4 Nov 2020 07:07:37 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4A43C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Nov 2020 07:07:34 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id e18so10188545edy.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Nov 2020 23:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yd18ndFCWmXoKkTAbsvFJoYQ8zEp6bxSjdOyZc7GANc=;
 b=ztMnlyvMCpOhEIKKOVkZyu74MI/YUcbpPNx1/ff6f4W/I40wJjgZIFFkHMd4rmkMVF
 PjCSh0G+WFJH+y6W4kHEkZD8MQFMrpx8l3hyxTsUjf1+e22ziV0Ok5EwytRvpvCUz7CI
 ipeiWpQR7gSv7dlr+DvmfHOwJIDPq9x5oD7XTaqOCyO4lI7NrKIPf0e2HxgKeqE9kgSE
 QyTjKiioweClJftQqRAkk70Jw4b7dxuga+LVdPEpqDnZyCugzuukhG/7Y6FfpLuGkGbP
 9dzjBUtbuMw+d1HMkAiJq736TlV/y7ezECWGOCBYnUR1or1Y6QUhWfTcQlSCUQArvvMS
 YHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yd18ndFCWmXoKkTAbsvFJoYQ8zEp6bxSjdOyZc7GANc=;
 b=Y7Ctv/tUHeWp1yurQ4+aAkIFHs7O044AUO/fgdMmN3ZqNgFeBZNQANslnxh2SYRv0U
 n0a0lhK03lshnv6xCXcSDMzMUqSWqVyE/PJmvW1nj6d6v8dZrt9Z+eWaguQaXR/9hbPE
 WdkH7H0d0AbaXw+04i1uebiVgilF8uOcVq6O37O5QdGw/8xoKWwrknXWWVek+PTA/ui8
 EleeSa/V7SQ/kPNpl9TuSZ2HJ4Ckfr9hIMmT0rrNJmjfoLhNiKrmV6dT+4mxYwTzWd3o
 /RYixACCcCseB74eMEmTKm9KMyaKw6dhkKF3q428LoGVAE8LBKhS/L4j2RRic/J3v3u1
 VbMQ==
X-Gm-Message-State: AOAM531pyux9JVuYUo6LI2F2TgeLmm2kBPjg4GquoHLneVnGQzMuh/j+
 EJbbGE8XbzbfVZDsQeo3TYoJ8wf80pmB29dSllcGeQ==
X-Google-Smtp-Source: ABdhPJzTbITSjQkOLzmIk+YNNkGAF8iUbFJpyyEXKxGBxC5v1v6hlHZgSqpiFh5elVWYdYyiLMTUlCT8747A5KeE6C0=
X-Received: by 2002:aa7:d28a:: with SMTP id w10mr25923100edq.192.1604473653934; 
 Tue, 03 Nov 2020 23:07:33 -0800 (PST)
MIME-Version: 1.0
References: <fd5e7932-11b9-3a06-0169-ddf13e91ffee@gmail.com>
 <bdf285bd-7540-b7cf-989f-0f24594c6940@gmail.com>
 <CAN5uoS-EoT7aUC1OEmeLv46SUzRFHe_nnr6T8Pvq+9VWc6RV8w@mail.gmail.com>
 <edb08339-a0f0-f9d6-bd5e-d5f1fa7b52c1@gmail.com>
In-Reply-To: <edb08339-a0f0-f9d6-bd5e-d5f1fa7b52c1@gmail.com>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed, 4 Nov 2020 08:07:22 +0100
Message-ID: <CAN5uoS_sBAsOZUXbT54J6hbvBK7Hj5M2KOtd3qsQErLPFcQ4vw@mail.gmail.com>
To: "Alex G." <mr.nuke.me@gmail.com>
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] stm32mp: The purpose of "!tee_find_device()"
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

On Tue, 3 Nov 2020 at 16:53, Alex G. <mr.nuke.me@gmail.com> wrote:
>
> On 10/30/20 3:28 AM, Etienne Carriere wrote:
> > On Thu, 29 Oct 2020 at 15:33, Alex G. <mr.nuke.me@gmail.com> wrote:
> >>
> >> On 9/30/20 6:03 PM, Alex G. wrote:
> >>> Hi
> >>>
> >>> I'm trying to wrap my head around the purpose of the following lines in
> >>> ft_system_setup():
> >>>
> >>>       if (!CONFIG_IS_ENABLED(OPTEE) ||
> >>>           !tee_find_device(NULL, NULL, NULL, NULL))
> >>>           stm32_fdt_disable_optee(blob);
> >>
> >> Hi! Me again! Do we have a (good) reason for this, or should I submit a
> >> patch to remove this problematic code?
> >>
> >> Alex
> >>
> >>> My interpretation is "if optee is not running, delete the FDT node".
> >>> The problem is that tee_find_device() invokes device_probe(). This in
> >>> turn does an SMC call. This call results in an abort and reboot if optee
> >>> is not running in the first place.
> >>>
> >>> So I don't think that tee_find_device() can be used as a check for "Is
> >>> optee running?". Exhibit B: Outside of mach-stm32mp, tee_find_device()
> >>> is used to obtain of a _working_ TEE node, not to ask if "is optee
> >>> running?".
> >>>
> >>>
> >>> My problem is that trying to start linux with CONFIG_OPTEE=y will cause
> >>> the bootm command to crash (log in appendix A):
> >>>
> >>>
> >>>       load mmc 0:7 $fdt_addr_r boot/stm32mp157c-dk2.dtb
> >>>       load mmc 0:7 0xc8000000 boot/utee
> >>>       setenv bootm_boot_mode sec
> >>>       bootm 0xc8000000 - $fdt_addr_r
> >>>
> >>> What is the intent of calling tee_find_device() in an FDT fixup
> >>> function?
> >
> > The scheme is the generic U-Boot implementation do copy OP-TEE
> > related nodes when found in its FDT to the FDT provided to Linux.
> > (called from common/image-fdt.c)
> >
> > However stm32mp1 can be used with or without OP-TEE installed. To
> > get a generic stm32mp1/U-Boot image that support both configurations
> > (with and w/o OP-TEE installed), U-Boot FDT and config for this plaform
> > do enable OP-TEE but, at u-boot runtime, if we find OP-TEE's not present,
> > we remove the FTD node so that Linux does get it and expect OP-TEE
> > is present.
> >
> >>> Do you have any ideas how to make it not crash (short of
> >>> commenting out the problem lines) ?
> >
> > The crash seems due to that there is no secure monitor by the time
> > you have this sequence called. Secure monitor is the code that
> > handles the SMC. If none installed, SMCs ends nowhere and
> > likely badly crash the systel. If OP-TEE is not running but there
> > is a secure monitor loaded, it should not crash.
> >
> > It seems to me that U-Boot does set up a secure monitor for
> > PSCI minimal support, so the U-Boot PSCI stack should
> > nicely handle the SMC to report that there is no OP-TEE installed.
> > Enabling CONFIG_ARMV7_PSCI should fix the issue I think.
>
> Hi Etienne. I understand the reasoning behind this, and I agree that
> things shouldn't break in theory. However,I just double-checked this
> with master (7a8ac9df5d). I think we have a bug on our hands:
>
> stm32mp15_basic_defconfig, with the following changes:
>
>         CONFIG_TEE=y
>         CONFIG_OPTEE=y
>         CONFIG_OPTEE_TZDRAM_SIZE=0x01000000

My apologies, I did'nt notice you use the _basic_defconfig.
With this defconfig, U-Boot cannot invoke OP-TEE services since OP-TEE
is booted only once U-Boot execution is completed (once bootm
command jumps to OP-TEE boot entry). So in this config U-Boot cannot
find the OP-TEE node.

Maybe ft_system_setup() (mach-stm32mp/fdt.c) should bypass OP-TEE
auto probing when CONFIG_BOOTM_OPTEE is enabled.

That would probably require to change stm32mp15_trusted_defconfig
to explicitly disable CONFIG_BOOTM_OPTEE, since this config
does not allow booting OP-TEE from U-Boot.

Patrick, your opinion?

FYI Alex, stm32mp15_basic_defconfig is not well suited to boot OP-TEE.
Consider using stm32mp15_trusted_defconfig instead. The "Trusted"
means U-Boot is booted after secure world. SPL could still be used
to load/boot OP-TEE but stm32mp15_trusted_defconfig does not
provide such support in current U-Boot. TF-A is an alternative to SPL
in this case.

br,
etienne




>         # CONFIG_SYSRESET_CMD_POWEROFF is not set
>
> I double-checked that CONFIG_ARMV7_PSCI is indeed set. The following
> sequence will cause a bad mode abort:
>
>         > load mmc 0:7 $loadaddr boot/uImage
>         > load mmc 0:7 $fdt_addr_r boot/stm32mp157c-dk2.dtb
>         > setenv bootargs console=ttySTM0 root=/dev/mmcblk0p7
>         > bootm $loadaddr - $fdt_addr_r
>
> Alex
>
>
>
> > Regards,
> > Etienne
> >
> >>>
> >>> Alex
> >>>
> >>>
> >>> Appendix A: u-boot log after bootm command
> >>>
> >>> ## Booting kernel from Legacy Image at c8000000 ...
> >>>      Image Name:
> >>>      Created:      2020-09-28  20:58:56 UTC
> >>>      Image Type:   ARM Trusted Execution Environment Kernel Image
> >>> (uncompressed)
> >>>      Data Size:    349276 Bytes = 341.1 KiB
> >>>      Load Address: fdffffe4
> >>>      Entry Point:  fe000000
> >>>      Verifying Checksum ... OK
> >>>      Loading Kernel Image
> >>> ## Flattened Device Tree blob at c4000000
> >>>      Booting using the fdt blob at 0xc4000000
> >>>      Loading Device Tree to cffef000, end cffff5e2 ... OK
> >>> <BOARD RESETS WITHOUT USER INPUT>
> >>> U-Boot SPL 2020.10-rc4 (Sep 20 2020 - 23:46:47 +0000)
> >>> Model: STMicroelectronics STM32MP157C-DK2 Discovery Board
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

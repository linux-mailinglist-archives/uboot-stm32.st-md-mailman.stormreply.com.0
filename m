Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C962A6FA4
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Nov 2020 22:28:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1242C36B35;
	Wed,  4 Nov 2020 21:28:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 173CBC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Nov 2020 21:28:20 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id c18so3773954wme.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Nov 2020 13:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c6DtxXW8R382jD/l2yyuECGImzmYCesxoE/G7BIs4OI=;
 b=y2PYHLJVLe/5z0s1RtRO4ZPd43u3X1Qon7dieeE/nJIH3jNZQ4g8XPYKg1gp6nOjo9
 CS+koQMu9NgaOURYKE3HU97QWevn3CODSfhqL9MOWVp756WmEIeTrwXIkAggnuIrXLI+
 c1AOccOTeEo1YLCYBy5BdepP/5KEF5U04RRlkboJ+XbMsBiq8Kn5ofKK9mnZmcPkcYb5
 DJYy7LHewLZ26rQGtbA/trE4LETYN+r61y8l5Q5/4zJMOMZLLlsl+y+84XsjtEj6ZEnI
 wDLNw0VaGjGq4/NfSb0g3EJntXX/LDYBNGdrX77bLdENCiOfUoSMNm+JAU/APK5YkdzQ
 zOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c6DtxXW8R382jD/l2yyuECGImzmYCesxoE/G7BIs4OI=;
 b=P017TUWwlkznmsTOuFBa/w+QR3oJs8Ptw/nu3YbPWrD3EnhOQx4fygXZ64l09vOSrQ
 uOnB1iaxQ09fi3uXL3R59PyFnlcFLRBv7EgB2qUy9iOkbJP47OBpU3R6UJ9yQctUE5Na
 aqa7waQMpIrbIi9Gaeh1yJD0hZQ+khNOTbDrCQzSb2vJND3pms7bFcUMftDBnSnmGW0e
 oiqPtniArPeMshdJOorwcfbxGmOXN+YgmzhB5B9Qf3aXo3YvqUegxpprSYQVis98VupP
 0xqVzHdFHATpyofsHzcSk06Lh5xe2A6MJIUWkGThgrVBxrdpYjsguczCee/BFtrKfxc8
 hnYw==
X-Gm-Message-State: AOAM532QOZhOlonSk+H9iblSaWvI6/DY4UzHfadhO8+Rbz8gLRtNwNNf
 K9mupxmtLUt4fpkXEbimNumT5v2olZg+j2A4dFlCNA==
X-Google-Smtp-Source: ABdhPJxipW4VS9e7z5oTYy82y+7BgT2bLRD1MAU+sJFbqtxp6euJ0uymLMN0i5qOcHqxUYv7Suc4kZN32vgzzpH3TD4=
X-Received: by 2002:a1c:f405:: with SMTP id z5mr6540862wma.126.1604525299474; 
 Wed, 04 Nov 2020 13:28:19 -0800 (PST)
MIME-Version: 1.0
References: <fd5e7932-11b9-3a06-0169-ddf13e91ffee@gmail.com>
 <bdf285bd-7540-b7cf-989f-0f24594c6940@gmail.com>
 <CAN5uoS-EoT7aUC1OEmeLv46SUzRFHe_nnr6T8Pvq+9VWc6RV8w@mail.gmail.com>
 <edb08339-a0f0-f9d6-bd5e-d5f1fa7b52c1@gmail.com>
 <CAN5uoS_sBAsOZUXbT54J6hbvBK7Hj5M2KOtd3qsQErLPFcQ4vw@mail.gmail.com>
 <ee06e267-a180-2fb2-5e45-fa44eb7cc20f@gmail.com>
In-Reply-To: <ee06e267-a180-2fb2-5e45-fa44eb7cc20f@gmail.com>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed, 4 Nov 2020 22:28:07 +0100
Message-ID: <CAN5uoS9-FWJm8wcF5zVGLpwqi0vNZPD_Jf7E+f-yaJ4QdicHUQ@mail.gmail.com>
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

Hi Alex,

On Wed, 4 Nov 2020 at 20:55, Alex G. <mr.nuke.me@gmail.com> wrote:
>
>
>
> On 11/4/20 1:07 AM, Etienne Carriere wrote:
> > On Tue, 3 Nov 2020 at 16:53, Alex G. <mr.nuke.me@gmail.com> wrote:
> >>
> >> On 10/30/20 3:28 AM, Etienne Carriere wrote:
> >>> On Thu, 29 Oct 2020 at 15:33, Alex G. <mr.nuke.me@gmail.com> wrote:
> >>>>
> >>>> On 9/30/20 6:03 PM, Alex G. wrote:
> >>>>> Hi
> >>>>>
> >>>>> I'm trying to wrap my head around the purpose of the following lines in
> >>>>> ft_system_setup():
> >>>>>
> >>>>>        if (!CONFIG_IS_ENABLED(OPTEE) ||
> >>>>>            !tee_find_device(NULL, NULL, NULL, NULL))
> >>>>>            stm32_fdt_disable_optee(blob);


Here (in mach-stm32mp/fdt.c), maybe to skip runtime probe
when built for SPL.

+        if (!CONFIG_IS_ENABLED(SPL_BUILD) &&
             (!CONFIG_IS_ENABLED(OPTEE) ||
              !tee_find_device(NULL, NULL, NULL, NULL))
                 stm32_fdt_disable_optee(blob);


> >>>> Hi! Me again! Do we have a (good) reason for this, or should I submit a
> >>>> patch to remove this problematic code?
> >>>>
> >>>> Alex
> >>>>
> >>>>> My interpretation is "if optee is not running, delete the FDT node".
> >>>>> The problem is that tee_find_device() invokes device_probe(). This in
> >>>>> turn does an SMC call. This call results in an abort and reboot if optee
> >>>>> is not running in the first place.
> >>>>>
> >>>>> So I don't think that tee_find_device() can be used as a check for "Is
> >>>>> optee running?". Exhibit B: Outside of mach-stm32mp, tee_find_device()
> >>>>> is used to obtain of a _working_ TEE node, not to ask if "is optee
> >>>>> running?".
> >>>>>
> >>>>>
> >>>>> My problem is that trying to start linux with CONFIG_OPTEE=y will cause
> >>>>> the bootm command to crash (log in appendix A):
> >>>>>
> >>>>>
> >>>>>        load mmc 0:7 $fdt_addr_r boot/stm32mp157c-dk2.dtb
> >>>>>        load mmc 0:7 0xc8000000 boot/utee
> >>>>>        setenv bootm_boot_mode sec
> >>>>>        bootm 0xc8000000 - $fdt_addr_r
> >>>>>
> >>>>> What is the intent of calling tee_find_device() in an FDT fixup
> >>>>> function?
> >>>
> >>> The scheme is the generic U-Boot implementation do copy OP-TEE
> >>> related nodes when found in its FDT to the FDT provided to Linux.
> >>> (called from common/image-fdt.c)
> >>>
> >>> However stm32mp1 can be used with or without OP-TEE installed. To
> >>> get a generic stm32mp1/U-Boot image that support both configurations
> >>> (with and w/o OP-TEE installed), U-Boot FDT and config for this plaform
> >>> do enable OP-TEE but, at u-boot runtime, if we find OP-TEE's not present,
> >>> we remove the FTD node so that Linux does get it and expect OP-TEE
> >>> is present.
> >>>
> >>>>> Do you have any ideas how to make it not crash (short of
> >>>>> commenting out the problem lines) ?
> >>>
> >>> The crash seems due to that there is no secure monitor by the time
> >>> you have this sequence called. Secure monitor is the code that
> >>> handles the SMC. If none installed, SMCs ends nowhere and
> >>> likely badly crash the systel. If OP-TEE is not running but there
> >>> is a secure monitor loaded, it should not crash.
> >>>
> >>> It seems to me that U-Boot does set up a secure monitor for
> >>> PSCI minimal support, so the U-Boot PSCI stack should
> >>> nicely handle the SMC to report that there is no OP-TEE installed.
> >>> Enabling CONFIG_ARMV7_PSCI should fix the issue I think.
> >>
> >> Hi Etienne. I understand the reasoning behind this, and I agree that
> >> things shouldn't break in theory. However,I just double-checked this
> >> with master (7a8ac9df5d). I think we have a bug on our hands:
> >>
> >> stm32mp15_basic_defconfig, with the following changes:
> >>
> >>          CONFIG_TEE=y
> >>          CONFIG_OPTEE=y
> >>          CONFIG_OPTEE_TZDRAM_SIZE=0x01000000
> >
> > My apologies, I did'nt notice you use the _basic_defconfig.
> > With this defconfig, U-Boot cannot invoke OP-TEE services since OP-TEE
> > is booted only once U-Boot execution is completed (once bootm
> > command jumps to OP-TEE boot entry). So in this config U-Boot cannot
> > find the OP-TEE node.
> >
> > Maybe ft_system_setup() (mach-stm32mp/fdt.c) should bypass OP-TEE
> > auto probing when CONFIG_BOOTM_OPTEE is enabled.
>
> I'm seeing the following premise:
>      (a) Start out with a "clean" devicetree
>      (b) Add the 'optee' node (generic code)
>      (c) Remove the 'optee' node (stm32mp1 specific)
>
> This seems odd to me for two reasons:
>      1. The code does more work than it needs to
>      2. stm32mp behaves differently than other platforms
>
>
> The way I would approach this is to adjust the heuristic in step (b).
> This can be found in include/tee/optee.h:
>
>         if CONFIG_OPTEE and CONFIG_OF_LIBFDT
>                 add optee node
>         else
>                 do nothing
>
> If there's no need to do step (b), why do both steps (b) and (c) instead
> of doing nothing?
>
> Given that there isn't a situation where step (c) makes sense, I propose
> that we remove stm32_fdt_disable_optee() entirely. The worst case is
> that the 'optee' node stays up, linux is booted in non-secure mode, and
> throws an -ENODEV in optee_probe() -- but otherwise the system boots.
>
> I can prepare a patch, pending Patrick's analysis.

Ack.

>
>
> > That would probably require to change stm32mp15_trusted_defconfig
> > to explicitly disable CONFIG_BOOTM_OPTEE, since this config
> > does not allow booting OP-TEE from U-Boot.
> >
> > Patrick, your opinion?
> >
> > FYI Alex, stm32mp15_basic_defconfig is not well suited to boot OP-TEE.
> > Consider using stm32mp15_trusted_defconfig instead. The "Trusted"
> > means U-Boot is booted after secure world. SPL could still be used
> > to load/boot OP-TEE but stm32mp15_trusted_defconfig does not
> > provide such support in current U-Boot. TF-A is an alternative to SPL
> > in this case.
>
> I have boot timing constraint of one to a graphical userspace
> application. The TF-A boot flow blows my boot time budget. I think
> trusted_defconfig assumes TF-A instead of SPL, so I didn't dig into it.

Ok. I agree it should work.

>
> The fast graphical boot is a use case that I don't think has been
> addressed for STM32MP. I'm currently implementing:
>
>         SPL -> OPTEE -> Linux -> Userspace graphics app
>
> This flow doesn't really require CONFIG_BOOTM_OPTEE. However, I'm still
> interested in a proper for the sake of consistency across platforms.
>

mach-stm32mp/fdt.c could be changed to not probe OP-TEE when it is built as SPL.
SPL would then still enable optee nodes in kernel DT when found
enabled in U-Boot FDT from generic path.
stm32mp15 would still leverage SMCCC protocol to identify OP-TEE
presence dynamically.

If I understand correctly, U-Boot generic adds OP-TEE nodes in kernel
FDT when OP-TEE is found in FDT
(upon fe contidions: optee node found and status="okay" in u-boot FDT,
no optee node already in kernel FDT)
It looks a good behaviour.

stm32mp15 leverage U-Boot can probe OP-TEE to dynamically check
whether OP-TEE is really installed
and prevent booted kernel failure/trace on OP-TEE absence.
It makes stm32mp15 U-Boot DTS files more flexible when the target
board runs or not an OP-TEE.
Obviously this dynamic test cannot be run from SPL.

br/
etienne

> Alex
>
> > br,
> > etienne
> >
> >
> >
> >
> >>          # CONFIG_SYSRESET_CMD_POWEROFF is not set
> >>
> >> I double-checked that CONFIG_ARMV7_PSCI is indeed set. The following
> >> sequence will cause a bad mode abort:
> >>
> >>          > load mmc 0:7 $loadaddr boot/uImage
> >>          > load mmc 0:7 $fdt_addr_r boot/stm32mp157c-dk2.dtb
> >>          > setenv bootargs console=ttySTM0 root=/dev/mmcblk0p7
> >>          > bootm $loadaddr - $fdt_addr_r
> >>
> >> Alex
> >>
> >>
> >>
> >>> Regards,
> >>> Etienne
> >>>
> >>>>>
> >>>>> Alex
> >>>>>
> >>>>>
> >>>>> Appendix A: u-boot log after bootm command
> >>>>>
> >>>>> ## Booting kernel from Legacy Image at c8000000 ...
> >>>>>       Image Name:
> >>>>>       Created:      2020-09-28  20:58:56 UTC
> >>>>>       Image Type:   ARM Trusted Execution Environment Kernel Image
> >>>>> (uncompressed)
> >>>>>       Data Size:    349276 Bytes = 341.1 KiB
> >>>>>       Load Address: fdffffe4
> >>>>>       Entry Point:  fe000000
> >>>>>       Verifying Checksum ... OK
> >>>>>       Loading Kernel Image
> >>>>> ## Flattened Device Tree blob at c4000000
> >>>>>       Booting using the fdt blob at 0xc4000000
> >>>>>       Loading Device Tree to cffef000, end cffff5e2 ... OK
> >>>>> <BOARD RESETS WITHOUT USER INPUT>
> >>>>> U-Boot SPL 2020.10-rc4 (Sep 20 2020 - 23:46:47 +0000)
> >>>>> Model: STMicroelectronics STM32MP157C-DK2 Discovery Board
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

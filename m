Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA55D29FFF1
	for <lists+uboot-stm32@lfdr.de>; Fri, 30 Oct 2020 09:28:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66447C3FAD5;
	Fri, 30 Oct 2020 08:28:38 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78C18C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 08:28:36 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id a71so366354edf.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 01:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eicsNC0bilXejoYFpiz9XRrnllrQYTogcXWdsjt5dtA=;
 b=KIhmte/5fA4tnXZryjBktcjvUBizZQ61gwsWbQcdpYiafydi5l+VDO5m+rPqpIu+7v
 cf/V8Mtcz/t7/7c3S2VvlEKxaFqH7iKLYFKxL6alZOFnmvCMuNMXf8Y8J7OzLNoaK66/
 gxOm05X9/4Dm4rpPj6qYH/Z++eQS/oURiM63/ie8VgjYFSxPzWHV20ZAJpRm9h5hHAuG
 X5IhYr+oUuA9ZA3SgJeqBCGS3OCRFVQrBi4kLAlTv7tKZrkoiZkTJNN11JaZO7+ilJs8
 pvsuMuNITUjFRj6A3sk/ozeQ9ksvRbQQy07CfHj9Ko4NobecV1YIp/Ld1OLCTscrDYGE
 dqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eicsNC0bilXejoYFpiz9XRrnllrQYTogcXWdsjt5dtA=;
 b=VT9NjNQMYinKh3L9k6suHzqZbo25T8ycPUolxPYOo9cOod7zdvnbImhn3PQ2f9HPke
 4wx61pte92EZyXsjV9Cx0T5EvGA7V6oNrhfVnyBTtJ+qaUIhKsveafyhAsCxD5sb1NYW
 dUoDAJKh2ZXHSU9Rffuo5iXciljFCM3YNHn4d+byrYw8jAriYX6Tvzfx3+huZbOt70HX
 xyftRnjdY2E2ZwcQiVPQZn6lb7tGchoxOZdwcxXdrYwSKOanrfLuSTOA//Hmf3z0hOuY
 Lle6i3Ksi6IbcLwMZX0aMi73FU4Kx6xpWyK+2UijamSiQHo57sOZ7NrvSq7/NO0NqQKt
 3R/Q==
X-Gm-Message-State: AOAM53379KRIClStW3GwXcM5WuKNmpgPkc52QzQ5NGVXgE8KXD0kXyYn
 InnwoRDykyuRTCgkWLhZXl4VtYESwDyoXIvpiKuiNg==
X-Google-Smtp-Source: ABdhPJzt0ztGQe3hCzxshjLFfAQbcrybzaq/Ic5X4AAe6QAGOyQHoTRzGmuIpYgMaLfBbU4oGzoczOSyREJqU16XDXQ=
X-Received: by 2002:a05:6402:143a:: with SMTP id
 c26mr1125374edx.150.1604046516070; 
 Fri, 30 Oct 2020 01:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <fd5e7932-11b9-3a06-0169-ddf13e91ffee@gmail.com>
 <bdf285bd-7540-b7cf-989f-0f24594c6940@gmail.com>
In-Reply-To: <bdf285bd-7540-b7cf-989f-0f24594c6940@gmail.com>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 30 Oct 2020 09:28:24 +0100
Message-ID: <CAN5uoS-EoT7aUC1OEmeLv46SUzRFHe_nnr6T8Pvq+9VWc6RV8w@mail.gmail.com>
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

On Thu, 29 Oct 2020 at 15:33, Alex G. <mr.nuke.me@gmail.com> wrote:
>
> On 9/30/20 6:03 PM, Alex G. wrote:
> > Hi
> >
> > I'm trying to wrap my head around the purpose of the following lines in
> > ft_system_setup():
> >
> >      if (!CONFIG_IS_ENABLED(OPTEE) ||
> >          !tee_find_device(NULL, NULL, NULL, NULL))
> >          stm32_fdt_disable_optee(blob);
>
> Hi! Me again! Do we have a (good) reason for this, or should I submit a
> patch to remove this problematic code?
>
> Alex
>
> > My interpretation is "if optee is not running, delete the FDT node".
> > The problem is that tee_find_device() invokes device_probe(). This in
> > turn does an SMC call. This call results in an abort and reboot if optee
> > is not running in the first place.
> >
> > So I don't think that tee_find_device() can be used as a check for "Is
> > optee running?". Exhibit B: Outside of mach-stm32mp, tee_find_device()
> > is used to obtain of a _working_ TEE node, not to ask if "is optee
> > running?".
> >
> >
> > My problem is that trying to start linux with CONFIG_OPTEE=y will cause
> > the bootm command to crash (log in appendix A):
> >
> >      load mmc 0:7 $loadaddr boot/uImage
> >      load mmc 0:7 $fdt_addr_r boot/stm32mp157c-dk2.dtb
> >      load mmc 0:7 0xc8000000 boot/utee
> >      setenv bootm_boot_mode sec
> >      bootm 0xc8000000 - $fdt_addr_r
> >
> > What is the intent of calling tee_find_device() in an FDT fixup
> > function?

The scheme is the generic U-Boot implementation do copy OP-TEE
related nodes when found in its FDT to the FDT provided to Linux.
(called from common/image-fdt.c)

However stm32mp1 can be used with or without OP-TEE installed. To
get a generic stm32mp1/U-Boot image that support both configurations
(with and w/o OP-TEE installed), U-Boot FDT and config for this plaform
do enable OP-TEE but, at u-boot runtime, if we find OP-TEE's not present,
we remove the FTD node so that Linux does get it and expect OP-TEE
is present.

> > Do you have any ideas how to make it not crash (short of
> > commenting out the problem lines) ?

The crash seems due to that there is no secure monitor by the time
you have this sequence called. Secure monitor is the code that
handles the SMC. If none installed, SMCs ends nowhere and
likely badly crash the systel. If OP-TEE is not running but there
is a secure monitor loaded, it should not crash.

It seems to me that U-Boot does set up a secure monitor for
PSCI minimal support, so the U-Boot PSCI stack should
nicely handle the SMC to report that there is no OP-TEE installed.
Enabling CONFIG_ARMV7_PSCI should fix the issue I think.

Regards,
Etienne

> >
> > Alex
> >
> >
> > Appendix A: u-boot log after bootm command
> >
> > ## Booting kernel from Legacy Image at c8000000 ...
> >     Image Name:
> >     Created:      2020-09-28  20:58:56 UTC
> >     Image Type:   ARM Trusted Execution Environment Kernel Image
> > (uncompressed)
> >     Data Size:    349276 Bytes = 341.1 KiB
> >     Load Address: fdffffe4
> >     Entry Point:  fe000000
> >     Verifying Checksum ... OK
> >     Loading Kernel Image
> > ## Flattened Device Tree blob at c4000000
> >     Booting using the fdt blob at 0xc4000000
> >     Loading Device Tree to cffef000, end cffff5e2 ... OK
> > <BOARD RESETS WITHOUT USER INPUT>
> > U-Boot SPL 2020.10-rc4 (Sep 20 2020 - 23:46:47 +0000)
> > Model: STMicroelectronics STM32MP157C-DK2 Discovery Board
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

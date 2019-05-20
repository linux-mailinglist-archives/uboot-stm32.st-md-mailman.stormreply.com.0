Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9919523C3D
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 17:36:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 629BBC5EC44
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 15:36:12 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09A63C5EC41
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 15:36:11 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id m15so3602258ljg.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uJsxt+th0K9HvGB0U/u40Pd7+7sBp91DNuPwXrsm2AU=;
 b=VcLXYv6BcPrsKCa4L0teq+uQmB6EHdtuCAVBCL19QzOHgNlWCEQ+DWaSWkCkgv5S85
 i+l6L4Dv3o4nx6aj2SDcMnjBy0AgInuu7q4x7zU26ACWS3wkRY4qhDK3mrrGTeIdoCWp
 hNox2VeUf8IEIA2VeYeZUXnhR3tE6I58Xbkq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uJsxt+th0K9HvGB0U/u40Pd7+7sBp91DNuPwXrsm2AU=;
 b=AD5rlrltGijTvoXJUR4VRokP4eJfXLjkJx7aFWab6EMb7p3J6qk4vldeHunVJ3zDCF
 Xz+IzIriBAGXt20ee50RkB79oC49kOwuXKBsDltgc+JghTaWTyp0647YXJ3s8tEoxlt0
 eiLxGsHWQRkiiyHbJDtJDGGPZThIm+GmC6SKwjv+FtTKNkYeDIbG+7CfFXItG1KikysZ
 bjMfH7rtTGkZzfL4bdW5pfY2kf2a5HBUxGXqqgU6hL/d52SzLG6bNSuRHwUQguvg13R+
 I8V7bWbjSaiMtYk5vprJlO88E7tVOAfgqvV/s1O0vyJIM6EZ2qjCut9MSzH9w6DTyNRn
 TtFA==
X-Gm-Message-State: APjAAAXaDUvyxuSjEqz6BvuWG54Js6XwFnEUjxta5Ly6+0aAcswC8uL+
 ujs8mhgzT5MCsCLJlMhSiNdS5DuuFpBpycm+9GFICA==
X-Google-Smtp-Source: APXvYqyTNCJPYsI6bYXOrCU6VBwui+CPeV8sLmX/CEaXYjE1Nx4JqAlTETMcgHewl17na61O4QxP3GQzYOzeWnAFYT8=
X-Received: by 2002:a2e:89cb:: with SMTP id c11mr5017750ljk.16.1558366569772; 
 Mon, 20 May 2019 08:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
 <1558357207-7345-7-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1558357207-7345-7-git-send-email-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 20 May 2019 09:35:43 -0600
Message-ID: <CAPnjgZ2mTGU08v7t+dAjxRnMjKQTnBJy80gBmPYL+S1zxOQ1Lg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Mario Six <mario.six@gdsys.cc>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 6/8] test: check u-boot properties in
	SPL device tree
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

Hi Patrick,

On Mon, 20 May 2019 at 07:00, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add a test to check the management of the u-boot relocation properties
> (fdtgrep result) for platdata generation or device tree SPL generation:
> - 'dm-pre-proper' and 'dm-tpl' not included in SPL
> - 'dm-pre-reloc' and 'dm-spl' included in SPL
>
> This patch also executes the version test (test_000_version) to check
> the correct start of the U-Boot after SPL execution.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - add some test for SPL with device tree
>
>  arch/sandbox/dts/test.dts        | 18 ++++++++++++++
>  test/py/tests/test_ofplatdata.py | 53 ++++++++++++++++++++++++++++++++++++++++
>  test/run                         |  5 ++++
>  3 files changed, 76 insertions(+)

I am starting to understand a bit now.

But I don't think we need to execute sandbox to check that fdtgrep is
doing the right thing. We can check the spl/u-boot-spl/tpl.dtb file
against what is expected, but running fdtdump over it, or by opening
the file with pylibfdt (see dtco//fdt.py) and looking for things we
expect.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

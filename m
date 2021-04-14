Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 866F735FBBA
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Apr 2021 21:38:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42CB7C57B78;
	Wed, 14 Apr 2021 19:38:39 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59EF8C57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Apr 2021 19:38:37 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id b3so7007991oie.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Apr 2021 12:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NOesvGEI9zE7UHvRaRyagtSJhZjpwmo14MRYg/SWn3s=;
 b=fDWsXe/HOLF8dm/vrW2yq7vuDfo9UW9MkTBRAoIvl9cN/09bO/27OHsPDFR+fqp1lg
 edcLr4nWNccyY7rwpYaugyhjT0DYJYTKib/RAw3+dLI5DBepUoB2hP0qn19VPrELxR83
 O8UAa0f4dAdHRE3VXSoQR+Sz6s9tONJ1pHgW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NOesvGEI9zE7UHvRaRyagtSJhZjpwmo14MRYg/SWn3s=;
 b=D7YO6i07GyaF2BAZ9akA5LGpm530lQOj6WEYq5bsF3zTrt7g6mFBZwkyFVrPwueDmo
 h8CFm43cHWnI+Nm+BWb0xZ61k49Gf3C7NsMDuopDjtTAij4AejyPcdHefRsrNPyZkYTP
 uXctiYGPCFdaJwb+KO0vXgkG9qtJbQ4j8zsjQcR7As0RQLRTm7L6Kn9r7+Q/ALsC4XpQ
 cMFMwwsm8vCDP/LEyvNRQ+YURqyAvIZ1xxpomfSSlSHQzFu9r1q+RPKVHTBH3GsceEs+
 MKuTDWA9hG1gaogigEgioDgee4MB7LX9d9rBK4t8Nzav5W86lVzLNKHc9g4/zz2/64W9
 igKw==
X-Gm-Message-State: AOAM530kMKqjcWLo5Y1m5ZV7JbAIS/ztDrVsofk1fuOmJZ86pk1N8JSx
 FD0mS7fX03Ii2OZrgM4qmrKsk8UX1BZJCADh5pKZBw==
X-Google-Smtp-Source: ABdhPJypRkX4XZq3ncm1fxXdr9Qy47lu5EzQaE+iebFTmSaWNxoQOqul2gtJ+9NoyVd7NM1UHl3yJqZQvIX8Sw36pG4=
X-Received: by 2002:aca:47ce:: with SMTP id u197mr3438702oia.81.1618429115857; 
 Wed, 14 Apr 2021 12:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210409073617.16045-1-patrice.chotard@foss.st.com>
 <20210409073617.16045-2-patrice.chotard@foss.st.com>
In-Reply-To: <20210409073617.16045-2-patrice.chotard@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 14 Apr 2021 20:38:18 +0100
Message-ID: <CAPnjgZ0ChJdek=+SGCde+Mu-Nmh-WtG1E87m_N463_GiXOt7UQ@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Sean Anderson <seanga2@gmail.com>,
 Herbert Poetzl <herbert@13thfloor.at>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vabhav Sharma <vabhav.sharma@nxp.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/2] cmd: bind: Fix driver binding on a
	device
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

On Fri, 9 Apr 2021 at 08:36, Patrice Chotard
<patrice.chotard@foss.st.com> wrote:
>
> Fix a regression brings by commit 84f8e36f03fa ("cmd: bind: allow to
> bind driver with driver data")
>
> As example, the following bind command doesn't work:
>
>    bind /soc/usb-otg@49000000 usb_ether
>
> As usb_ether driver has no compatible string, it can't be find by
> lists_bind_fdt(). In bind_by_node_path(), which called lists_bind_fdt(),
> the driver entry is known, pass it to lists_bind_fdt() to force the driver
> entry selection.
>
> For this, add a new parameter struct *driver to lists_bind_fdt().
> Fix also all lists_bind_fdt() callers.
>
> Fixes: 84f8e36f03fa ("cmd: bind: allow to bind driver with driver data")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reported-by: Herbert Poetzl <herbert@13thfloor.at>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Herbert Poetzl <herbert@13thfloor.at>
> ---
>
>  cmd/bind.c                     |  2 +-
>  drivers/core/device.c          |  2 +-
>  drivers/core/lists.c           | 11 ++++++++---
>  drivers/core/root.c            |  2 +-
>  drivers/misc/imx8/scu.c        |  2 +-
>  drivers/serial/serial-uclass.c |  2 +-
>  drivers/timer/timer-uclass.c   |  2 +-
>  include/dm/lists.h             |  3 ++-
>  test/dm/nop.c                  |  2 +-
>  test/dm/test-fdt.c             |  2 +-
>  10 files changed, 18 insertions(+), 12 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>

Really this command needs a test.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

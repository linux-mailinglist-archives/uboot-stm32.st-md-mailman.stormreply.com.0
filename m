Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8715233D652
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Mar 2021 16:02:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3ABCAC57B77;
	Tue, 16 Mar 2021 15:02:57 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35DFCC57B5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 15:02:53 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id z1so21915743edb.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 08:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gs/Pw18G4bT72/luPaywlkJyREn/91DUWIf5YIYYxzE=;
 b=cWQzV8TSsz46m9+ua+Xvd5FJlYSbfTocQ9EedHTahQ3NORnzIGmIgpZ/9gRCgNjPoX
 h8U7wBgjwugnxw+sDrGpv1GDbvEIgP2H8K1bJm59sxaxiDKBHPcROeQssKFHKsF/AAjl
 GhE17PGB3rcy1Z8URMEeQZl6Gsit3X94YAN3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gs/Pw18G4bT72/luPaywlkJyREn/91DUWIf5YIYYxzE=;
 b=jWPu9uPLudxxQ+SsH9L7Q6ru8D21ECbrjFeyLLxFjnHmNdG4xBaJH4NbldG+eSMzh6
 E4ISrIyAms9fzD8yaWqFJTH4vTtu9moNJRC1w5S45vFUrblPF+s112cI87IXnBfXHKqh
 R8Dzb0f8hc9iQrJJnOhNdt00rn3BTtRhYOfr0/WdeO+Qy3itMdzurnnFmZo9PVAra1B0
 8uExHH3dmOj8Anqq1Zqk1MuwgJC/43q1q3uOZti/l0zFlUqgdENH17NtZI+oI+bSSD2R
 sIXaiJEJsosEeXCjfv2kO2r0Stztytkp7cjqnNlIu7RYFJvHcxF9pbd31cqa/UjZ1YLK
 0SMQ==
X-Gm-Message-State: AOAM531v7rl/7Ra99s0C6eNgw7Z20eEkRzuYwr8oOmdoBeWaFgbDoaKQ
 Zbm4lr14x9JCv7w/dx1BXKddYps2qMxD9Erxv9jvuA==
X-Google-Smtp-Source: ABdhPJwchyO6Gl8u4Z4LlB+0f4b2sluodHVwajNAnioS6rZWmf7GAfKLKJQ5sWN/Viqd6EyeQ21l/cWGJjuZBMImENo=
X-Received: by 2002:a05:6402:2cd:: with SMTP id
 b13mr36690382edx.55.1615906973464; 
 Tue, 16 Mar 2021 08:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210315173256.103731-1-jagan@amarulasolutions.com>
 <20210315173256.103731-8-jagan@amarulasolutions.com>
 <9586c314-a38f-3c7f-e592-88c39f35e8f1@foss.st.com>
In-Reply-To: <9586c314-a38f-3c7f-e592-88c39f35e8f1@foss.st.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 16 Mar 2021 20:32:41 +0530
Message-ID: <CAMty3ZBCxhBjShT7Qcz98qO+BQfG2TL+WcmogRnTOJ9-e2jihQ@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot-Denx <u-boot@lists.denx.de>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [Uboot-stm32] [PATCH v2 7/9] ARM: dts: stm32: Add Engicam
 MicroGEA STM32MP1 1X4Gb DDR3
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

On Tue, Mar 16, 2021 at 7:16 PM Patrick DELAUNAY
<patrick.delaunay@foss.st.com> wrote:
>
> Hi Jagan,
>
> On 3/15/21 6:32 PM, Jagan Teki wrote:
> > Engicam MicroGEA STM32MP1 Micro SOM has mounted 1x4Gb DDR3
> > which has 16bits width 533Mhz frequency.
> >
> > Add DDR configurations via dtsi.
> >
> > Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v2:
> > - collect Patrice r-b
> >
> >   ...m32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi | 121 ++++++++++++++++++
> >   1 file changed, 121 insertions(+)
> >   create mode 100644 arch/arm/dts/stm32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi
> >
> > diff --git a/arch/arm/dts/stm32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi
> > new file mode 100644
> > index 0000000000..950f292abb
> > --- /dev/null
> > +++ b/arch/arm/dts/stm32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi
> > @@ -0,0 +1,121 @@
> > +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> > +/*
> > + * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
> > + *
> > + * STM32MP157C DK1/DK2 BOARD configuration
> > + * 1x DDR3L 4Gb, 16-bit, 533MHz.
> > + * Reference used NT5CC256M16DP-DI from NANYA
> > + *
> > + * DDR type / Platform       DDR3/3L
> > + * freq              533MHz
> > + * width     16
> > + * datasheet 0  = MT41J256M16-187 / DDR3-1066 bin G
> > + * DDR density       4
> > + * timing mode       optimized
> > + * Scheduling/QoS options : type = 2
> > + * address mapping : RBC
> > + * Tc > + 85C : N
> > + */
>
> This file is identical to stm32mp15-ddr3-1x4Gb-1066-binG.dtsi, because
> it is a files generated
>
> with CubeMX with the same parameters.
>
> Do you any reason to duplicate it ?
>
> Do you expect some board-specific tuning or configuration with be
> integrated latter.

Yes, ie reason. You are right, I think will reuse exiting dtsi and
update based on future requirements. I Will update in the next
version, thanks!

-- 
Jagan Teki,
Amarula Solutions India Pvt. Ltd.
Co-Founder & Embedded Linux Architect
405/E-Block, Sri Lakshmi Shubham Arcade, Chandanagar, Hyderabad - 500050, India
M. (+91) 910 009 0959
[`as] http://www.amarulasolutions.com
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

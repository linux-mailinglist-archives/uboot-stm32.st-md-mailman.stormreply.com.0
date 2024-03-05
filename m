Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9B3871FD3
	for <lists+uboot-stm32@lfdr.de>; Tue,  5 Mar 2024 14:15:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40278C6DD69;
	Tue,  5 Mar 2024 13:15:13 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FA7FC62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Mar 2024 13:15:11 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dd045349d42so693178276.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Mar 2024 05:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709644510; x=1710249310;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8eq13me9D0mT3pdn+HJ78Y033XhwtevLa9pKlcKglx0=;
 b=gjwY1ikMaAvVLzk+2YbbEw15QqJeo4zaZkt7O0nkQg4bgD9BI6oZlqoqiljOBy+uxA
 mJVzWVe3Oz/RAi4Ysuv+5ibAtvCkkjnDypOidCJ+UO7iiY7MPr2p6fYDACar7AICsX7W
 BHPVPTz4Q5+S5p9I/0rvd4X+ge6W5h2fiXruJKRQbQW3NsrEPy3BTSTYx4X2AGK+pRQg
 IjFgoYhnH6jUr3pAZK/zRzuQv4bSlHfVqwq2TGJKGf3ris2gUmWlOtV1n1JpYciA2AgF
 dGcxFB4wZlNlsD0azaFjBGs2WLtTSzJwhcnJ4gj5yhi0pgDec0J8U9NC+xXuF4iVa8Kq
 hNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709644510; x=1710249310;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8eq13me9D0mT3pdn+HJ78Y033XhwtevLa9pKlcKglx0=;
 b=DM2sUL+x0URg6mQuJmSQvfWAOv7VN/bvmlkai8bHUEFC2FsEOPi8AT5crqfIcGZkzJ
 HcUMmtHDeMh1HEiHJdyulsaqCpMXjukj0xVgyJPxZswQ4MPCJeKQtNurNnKYGGvAtKE6
 isbJSxE/zceU9dYimSzpJzGbJ8ZvmSssKwHpBZEXIBGlFj24pau0soWa82AzzC2EhOjf
 HVfl3cUgDyECg66r60ocA0qaJbz/kORUS5d5MjH58NRcRAWe3sqMWvf1kV9jlmShDkjA
 nRHSYLbdAMqz4MUaEaPFQxDhHjU5tjc/5wtbArigjdlHega3SeR0vDHjHzSyksw+IG6g
 kN8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAK1SF8Eg07TTWdSX8kZjThk8YEOD+PbakpK6o/h7qJU7k4IesoK6DNwrRLUQgrMQ27zN2f8IQcR2losNbFMXiNZ0/0L3X1IyXqXoqSlzzUNA4iV03lpUe
X-Gm-Message-State: AOJu0YxljArvl52LArIi4uyS7gzb3u00+lgU4a2v/v0ks2rDGh3tIm6C
 /qNbZ91OdJadbR0xCG5hkyqAm+OXFOOibEm8tKY9cqIHpG1CO1KZDqkp+stx5owK2jm6Ts8f3JM
 +CVyPSA1iS5AuqPabBnS34Hym7RqyMGR/p4kLqQ==
X-Google-Smtp-Source: AGHT+IGpmcRKLyaEcw5hNNT7SJqVPPNVAYEJT86r3u7snoLb0aAl1p2KObnxrsncTIS2uy0D9ZVg3t2hpA/sh0Bkh+Q=
X-Received: by 2002:a5b:34a:0:b0:dcc:8e02:a6b6 with SMTP id
 q10-20020a5b034a000000b00dcc8e02a6b6mr9884996ybp.2.1709644510384; Tue, 05 Mar
 2024 05:15:10 -0800 (PST)
MIME-Version: 1.0
References: <20240304-b4-upstream-dt-headers-v1-0-b7ff41925f92@linaro.org>
 <20240304-b4-upstream-dt-headers-v1-26-b7ff41925f92@linaro.org>
 <CAFA6WYM6sTEdw+VphKidUqjQW61eW8ZVq+oO35CJVM=5wPoniA@mail.gmail.com>
 <3e17d3e4-e2e1-45ff-9d62-44bf5a8991df@linaro.org>
In-Reply-To: <3e17d3e4-e2e1-45ff-9d62-44bf5a8991df@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 5 Mar 2024 18:44:59 +0530
Message-ID: <CAFA6WYNHkU2xp+6_+K0JoOpVrAP3ryS2zs+Q2L6Wb+TTVL+mWg@mail.gmail.com>
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Sam Protsenko <semen.protsenko@linaro.org>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 u-boot-amlogic@groups.io, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Thierry Reding <treding@nvidia.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, Dai Okamura <okamura.dai@socionext.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Rick Chen <rick@andestech.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, uboot-snps-arc@synopsys.com,
 Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, Leo <ycliang@andestech.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>
Subject: Re: [Uboot-stm32] [PATCH RFC 26/26] dts: support building all dtb
 files for a specific vendor
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

On Tue, 5 Mar 2024 at 18:21, Caleb Connolly <caleb.connolly@linaro.org> wrote:
>
>
>
> On 05/03/2024 12:35, Sumit Garg wrote:
> > Hi Caleb,
> >
> > On Mon, 4 Mar 2024 at 22:22, Caleb Connolly <caleb.connolly@linaro.org> wrote:
> >>
> >> This adjusts OF_UPSTREAM to behave more like the kernel by allowing for
> >> all the devicetree files for a given vendor to be compiled. This is
> >> useful for Qualcomm in particular as most boards are supported by a
> >> single U-Boot build just provided with a different DT.
> >>
> >> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> >> ---
> >>  dts/Kconfig          | 24 ++++++++++++++++++++++++
> >>  scripts/Makefile.dts | 17 ++++++++++++++++-
> >>  2 files changed, 40 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/dts/Kconfig b/dts/Kconfig
> >> index b9b6367154ef..67d9dc489856 100644
> >> --- a/dts/Kconfig
> >> +++ b/dts/Kconfig
> >> @@ -100,8 +100,32 @@ config OF_UPSTREAM
> >>           However, newer boards whose devicetree source files haven't landed in
> >>           the dts/upstream subtree, they can override this option to have the
> >>           DT build from existing U-Boot tree location instead.
> >>
> >> +config OF_UPSTREAM_BUILD_VENDOR
> >> +       bool "Build all devicetree files for a particular vendor"
> >> +       depends on OF_UPSTREAM
> >> +       help
> >> +         Enable building all devicetree files for a particular vendor. This
> >
> > Do we really want to build all the DTBs even if many of those aren't
> > supported by U-Boot at all? I would have rather added Makefile targets
> > for boards which really supports a single defconfig eg.
> > qcom_defconfig.
>
> Yes, for the 4 Qualcomm SoCs currently supported there are 51 dts
> targets that ought to be able to run U-Boot to some extent

Have you tested U-Boot on all of them? IMO, it would be good to make
people aware about supported boards via listing their DTs at least.

>
> $ ls -l dts/upstream/src/arm6/qcom/{msm8916,sdm845,msm8996,qcs404}*.dts\
>         | wc -l
> 51
>

qcom_defconfig currently only supports sdm845 and qcs404.

> What do you mean by a "makefile target"? Like copying
> arch/arm64/boot/dts/qcom/Makefile from Linux? I guess my concern here
> would be keeping it in sync, and introducing additional busywork when
> porting.

See following diff:

diff --git a/dts/upstream/src/arm64/Makefile b/dts/upstream/src/arm64/Makefile
index 9a8f6aa35846..ecc15021cb08 100644
--- a/dts/upstream/src/arm64/Makefile
+++ b/dts/upstream/src/arm64/Makefile
@@ -2,6 +2,10 @@

 include $(srctree)/scripts/Makefile.dts

+dtb-$(CONFIG_ARCH_SNAPDRAGON) += qcom/sdm845-db845c.dtb \
+       qcom/sdm845-samsung-starqltechn.dtb \
+       qcom/qcs404-evb-4000.dtb
+
 targets += $(dtb-y)

>
> We do have a lot of Qualcomm DTS files, it takes maybe 10 seconds to
> compile them all on my machine, but that's only once. With incremental
> builds this becomes largely irrelevant.

Maybe someone cares about build time too but that's not my primary
concern. We shouldn't be giving the false impression that all the DTs
present in the vendor directory are supported by U-Boot.

-Sumit
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

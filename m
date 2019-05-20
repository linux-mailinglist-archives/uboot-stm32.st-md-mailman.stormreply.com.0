Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D16F23C3C
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 17:36:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59363C5EC42
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 15:36:12 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5F37C5EC41
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 15:36:10 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id x132so10703385lfd.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 08:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tj5Xp3nWIipiAX1FWZ3wEWS9Aseb37G8a4n+gN8BXpU=;
 b=mk+wsGh2vaaow8knRyYu+0nfdyaA5+vT46g7MNzx7et1wz4Ks62Ja+0Zvt1QSoTITV
 wuigbsZlHhiUZoncTBTXrFxMWHV9D6bc8Oo6AV66/LawFWJttzArj3mDAqhIOldb3OQT
 GyDwRPnys7lONCC3/jVJJFwNHYsxHvNc8AaEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tj5Xp3nWIipiAX1FWZ3wEWS9Aseb37G8a4n+gN8BXpU=;
 b=ssf8YdegJVNOtX8PSIODY83dTpCrEyq48rqa5/e4pOFEMfLtYJc9HNbl8oe6Dqjnl8
 XxaKftm1DwJVzcmyuSBMsfrekm3rIDDgTd8GkPQkwMwJYmLeYRAXAT287BsWG+B1N6PI
 Mnp2tEcapBDo2kRorYoWaqVqOAGbDXChZUUJufCKx7PnbzWCNpGarmhdSIRM9XzCzXfo
 yv6dggez1j7beGmTCFVJoQLggzCL4J402oQpNnK9yU5kt5i10wyiRvvZHONctwb7QLhL
 APndPzpF/yJS5SKByPsoVfDjPFoPvV8PyoUYUcW4g8GKmBoGAmuN788Om11thm8UCnHt
 3LLg==
X-Gm-Message-State: APjAAAUpn9+nuvMJp67tKmJ+DBToXMajY6z/kLzn2CUaCm4c5ID/7E+R
 nyj9aeNme1c0oezTE2S1D1beg4PgKQ4GgZY11DWGng==
X-Google-Smtp-Source: APXvYqzcUor3l7/KMGMYNoCSg72wwcUYTnGFj1Ms8WT14NMspR5xAbbq7ciAytWugwMIhtWB9eIODWszp//1EpsIloI=
X-Received: by 2002:a19:5f56:: with SMTP id a22mr32700652lfj.157.1558366569340; 
 Mon, 20 May 2019 08:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
 <1558357207-7345-6-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1558357207-7345-6-git-send-email-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 20 May 2019 09:35:41 -0600
Message-ID: <CAPnjgZ02_uHKzOR_53mn=+=EHruMT4zq2XtOONMe=412BHRGHg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Mario Six <mario.six@gdsys.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Bin Meng <bmeng.cn@gmail.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v2 5/8] test: move SPL test nodes in test
	device tree
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

Hi Patrick.

On Mon, 20 May 2019 at 07:00, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Moves spl-test nodes in test device tree, selected by
> the new build option '--device-tree'.

Where is this build option?

>
> This patch also executes the version test (test_000_version) to check
> the correct start of the U-Boot after SPL execution.

What is test_000_version?

Again this patch needs  motivation. It is very hard for me to
understand what you are trying to do.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - move all spl test nodes in test dtb
>
>  arch/sandbox/dts/sandbox.dts   | 36 ------------------------------------
>  arch/sandbox/dts/sandbox64.dts | 36 ------------------------------------
>  arch/sandbox/dts/test.dts      | 36 ++++++++++++++++++++++++++++++++++++
>  test/run                       |  3 ++-
>  4 files changed, 38 insertions(+), 73 deletions(-)

Can you please check this series which creates a comment DT:

http://patchwork.ozlabs.org/project/uboot/list/?series=108546

Could you rebase on top of it? - u-boot-dm/sandbox-working

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A017814D524
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:18:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 698D2C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:18:22 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97ACFC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:18:20 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id 203so1130277lfa.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gS5LYTsLrygnW7H+HRtgXba9KxpbwwKuEwU0lfh8imQ=;
 b=N4PkZVHSZMrimFrUmihbnnnB8QEeOZJ8LEMMaaWrWDNU9rtfz0SIegc3Oggyc80ao/
 tcm2LijNWD8mjwf+JxQIcYoLwK5irA7TUX+KdJRDV5XMYNiOLVSbM69NIYxBpEnfsvvz
 ki5Hku87pBUv97K3mteZmlzLqaABmPhDzlCvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gS5LYTsLrygnW7H+HRtgXba9KxpbwwKuEwU0lfh8imQ=;
 b=WGybaJYsaB79OIIAvi0vdIYfjWr1C0bcq/AwxQF6IDTPdfmhLTeLSLfD+6OUCGp/RF
 zKCY4qEVtWfqAGPBUXkNh84UxltBhx37COnD7heI/vuMmOBeWj6JYnPAWsRqqdLW7Ppu
 TnVZV+Z3aeAg3cDZ7A61BdDUk6Y/8JrF+JV6FzofYCQTjg14LQbrh5tw8DTiyNu7vUOy
 P5PxO4PJZQ7io8Tdk9Hvdt9UC3hFoy5zTRsmTC5vIbQkm6XzGetcU0NQxsr+caF058eE
 8GaC9wWKLAEHzM6P3EiYnHotz7k9ZLA22HCyrDShFK6ieXy7LOekkD4b3LUl8Aug38cb
 M6vg==
X-Gm-Message-State: APjAAAVMWfL3xI3YnJgpmrOGL30Sy2vqObDbIvFrPnsKOukdeWFRhY2p
 N2dEG6qxZGYRQvu9w7+UlDl+NPX+RYq+c8RuxmB8AA==
X-Google-Smtp-Source: APXvYqxy7/k2SIs1kESQQdQvEsBE0IBbQ4oJApzI4QluXg5EQHLMrCQzbn19CrCchwNUSGM3hxtdeGDp5EGwFRxkE/A=
X-Received: by 2002:a19:cb17:: with SMTP id b23mr1238795lfg.201.1580350699646; 
 Wed, 29 Jan 2020 18:18:19 -0800 (PST)
MIME-Version: 1.0
References: <20200122135243.17683-1-patrick.delaunay@st.com>
 <20200122135243.17683-3-patrick.delaunay@st.com>
In-Reply-To: <20200122135243.17683-3-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Jan 2020 19:17:52 -0700
Message-ID: <CAPnjgZ2O96cWWbWkbBWJq_JQqBbc1u2w95Qm2L=kjDFK2VVQ4Q@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrice Chotard <patrice.chotard@st.com>, Tom Rini <trini@konsulko.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 2/4] Revert "stm32mp1: remove the imply
	BOOTSTAGE"
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

On Wed, 22 Jan 2020 at 06:52, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> This reverts the workaround introduced by the
> commit 16fec9b0bc1a ("stm32mp1: remove the imply BOOTSTAGE")
> As the bootstage alignment issue is now solved.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2: None
>
>  arch/arm/mach-stm32mp/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5592814D51F
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:17:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF866C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:17:52 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CAAFC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:17:50 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id z18so1174779lfe.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5JGuniqiGh13NtipsPoz7Dg2XzRF8luMilIdc+A94GY=;
 b=FnMQppbcce38AAsJJyd2YiIoBjU4i85WwHLQVjzowEEHYsil8cnf4vawil21IXEEfq
 ldCFTN5pX4EvY08Fot/EFD79+0+RG75x0TYxzkBgob7oCZrMsBFqnyGqV6NWvF8+37M3
 G0X+lZ39L2DeVkExSkkAbT1wHKAQQXu0fBBBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5JGuniqiGh13NtipsPoz7Dg2XzRF8luMilIdc+A94GY=;
 b=Q7BRqniTOotibBIbU+LkqJrwA/NXRJFGsUS8vx5sc75vqGNkqTGcBlwHySjVE+YiHo
 Ld2Mj9ZxqCY7TJZd5iDzuCr5VI3i6ey5pSyUAJnuWv64YYuvjAn3xTFFShyWNpf19SPU
 SR/I+IzCQSdVttgCA+kjs4CpHJDGqRQOVKr1QJ6Nroooz1zId8Ztb1Z9hVa9Jak4oIxC
 onRhXnH/rvFgG54nrwwbEXnEPe/0NWicQmiX1bnLxHikVc/RfzO+ZSqG6oQOHF9rhb+4
 qB6GVARBEfCl5oPAPNfeySggSr1b2+x579NJmjWJWREslD3O4H1vJ8k6LyLaKd75Tm4u
 54zg==
X-Gm-Message-State: APjAAAVdWR5SwyZ+uwnudYOAzgfnMyDtW1Y8uAR4LF1T/AQdwTyJveZg
 sJU5IjkgHDJ/rVv3pIS9WgdeahOerr3Y4gP6PY0chw==
X-Google-Smtp-Source: APXvYqyYlMN0B8D5/lrzcuYfFebEDY5Sa+gbudhdRJhnP148q/pS1bRMxIzVpbmJ+Qhxbx3GlHAyRyYJfq8iUopcvqc=
X-Received: by 2002:ac2:5e9b:: with SMTP id b27mr1289474lfq.184.1580350669468; 
 Wed, 29 Jan 2020 18:17:49 -0800 (PST)
MIME-Version: 1.0
References: <20200109171123.16348-1-patrick.delaunay@st.com>
 <20200109171123.16348-2-patrick.delaunay@st.com>
In-Reply-To: <20200109171123.16348-2-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Jan 2020 19:17:25 -0700
Message-ID: <CAPnjgZ1mf+f5bbQJdBsjNUoxnrbwW+x-qvUDv_MUssfHzCpHoQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] Revert "stm32mp1: remove the imply
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

On Thu, 9 Jan 2020 at 10:11, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> This reverts the workaround introduced by the
> commit 16fec9b0bc1a ("stm32mp1: remove the imply BOOTSTAGE")
> As the bootstage alignment issue is now solved.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

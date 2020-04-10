Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE301A4B61
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 22:47:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C3D4C36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 20:47:41 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A02C1C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 20:47:39 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id k133so1658647oih.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 13:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KfBsGzH6kZY4RDJB+lY+Jl3ft0uN15BJ7it/xADAphU=;
 b=YfBtYXFkEYdOb/p2MWHNpVdZAD1NVzfYeldW3H4I+aA15By1ttrqRUT2qWMjtwelE1
 f7+gBAPv2zTljalt1DGqFU3Re94sMnLhEvWPHgq2lLdXqoW5Jm/a7v1u9+xlob7BDnbQ
 SpNRQaR5DpuygMqHHShhQayEiQwnrok3S/qw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KfBsGzH6kZY4RDJB+lY+Jl3ft0uN15BJ7it/xADAphU=;
 b=Pg5Q0xR/mhyjT8Z1zgYyE4d8I8WAmDmMM820FG7QHC5N29Bz+IMxHYPX97WifTjNTY
 k2CocPTJhxESBmMjBjC0TkQNRDb4dJmJYoqrfL5XE3fBljlj7Lc1PGl2N3A4CO5FGdji
 CY3jhGHrSgJ3oiT7RVbk0563H2TOjLMszKO2mwS62qrK+G9vS60fWUfiGqz/od8W1dD7
 MHVzhMCNq3jICzcttToZExGdDdN6zl7zoNmUQxRaasY3QQXZJoNsK/gFnE5KjE3hN+wn
 gxaGQD2gKRtP0hHttmb9ZL9ZVmsLMnsUpzEQ/H2DsQ+V/ytQm1ADdJ4CurS2jmTvwUVD
 4JAg==
X-Gm-Message-State: AGi0PuZWyk13AzE7XhyVmjEdUfeBNxuOolHlx6uBBerxDutgZU4fsBaQ
 UqFQuMvrWMKYk1192DbaMqxxgfk2CMrxkAzpWJBTEQ==
X-Google-Smtp-Source: APiQypLwxBMoeYAGvdBJFwQpLH9PCH+r9ZAv9/eMGxC11nYPxf6090uJHg9WoeTjFaL73yQ3D0s6STuCrGWHX6dUMm0=
X-Received: by 2002:aca:bb83:: with SMTP id l125mr4524789oif.122.1586551657944; 
 Fri, 10 Apr 2020 13:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200410163403.1.I3190d9b77167a808c65f44883fd1bc1c1d15218a@changeid>
 <20200410163403.2.Ice5c9d8cd5de91bb8b2f0db60c93e5be3d921893@changeid>
In-Reply-To: <20200410163403.2.Ice5c9d8cd5de91bb8b2f0db60c93e5be3d921893@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 10 Apr 2020 14:47:26 -0600
Message-ID: <CAPnjgZ3ZKEQyyeDte9jnzRrsvEmF1mE8xMXsCmCH2P=dp2dSMg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Marek Vasut <marex@denx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Thomas Hebb <tommyhebb@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] README: remove references on no more
	used config CONFIG_SYS_RCAR_I2C*
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

On Fri, 10 Apr 2020 at 08:34, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Remove the references in README on CONFIG_SYS_RCAR_I2C_* not use
> in U-Boot drivers/i2c/rcar_i2c.c, since commit a4d9aafadb31 ("i2c:
>  rcar_i2c: Remove the driver") and commit a06a0ac36d59 ("i2c: rcar_i2c:
>  Add DM and DT capable I2C driver")
>
> Checked by the command: grep -r SYS_RCAR_I2C *
> And these CONFIG are only defined in
> arch/arm/mach-rmobile/include/mach/rcar-base.h
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  README | 10 ----------
>  1 file changed, 10 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

Nice clean-up.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

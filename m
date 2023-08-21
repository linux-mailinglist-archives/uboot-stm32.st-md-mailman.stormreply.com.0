Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA507830E0
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Aug 2023 21:14:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5937BC6C821;
	Mon, 21 Aug 2023 19:14:02 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DDA0C6C820
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 19:14:01 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-d712d86eb96so3450003276.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 12:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692645240; x=1693250040;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gh51Q9edqHjazcD4VlSBwWUs6eEWSX3OB6e7HH2lqTU=;
 b=IHLxDVukKIH9SF70UzhN9DEDvJ/A0/cQxZ0G+iLQqSHqeFc1tIMhDPGijVhZYWPYmZ
 ZXHHfZdsc3kmjdGODzVDsHo2J7RjSUq3yPfnWT7CYpXxK9ouVXXvtsThf9NRvgmmC26i
 fGcwM1nYIJMKnuC5dF4K3oMTxi0WWqnN+cOaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692645240; x=1693250040;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gh51Q9edqHjazcD4VlSBwWUs6eEWSX3OB6e7HH2lqTU=;
 b=FVa79mwCuvLJApQ7Q/RqFGUsdWsLgw2kRrPTOC6Qgd1JWwk2GEA9QPeh3PUkmdbgSN
 z9xCQ/CpdjlL1t9SnyEC4yamuE7Cd1VYSoYlQ0Hna1raIZLDvtIDaU+2TvwoTp5xfWZa
 lDrOwixxhWO9pImB19r24Qj5mpeBIj3SRhix6EJEUDkyQsv8cKBnDyZB9QkTbvDhrG93
 0MkRLb3sJiVRslDBA0Zmol6qe7H0lVbZrLEJKgTP4hrxTaghqY107hFV9pZQZKtXjTUl
 6pabZAqQVojIwaQcx2STamf+EH3uXkdEOX3daVfzWnvqQvYd037dvdN6YumB5zPPfOzP
 hfXg==
X-Gm-Message-State: AOJu0YxpLMF66vLrjk3F6QP0zhIBOGWhNYl5HWGnAYilB1Io/yFxwNsK
 ezvYRZakP5UW/XRCVO5GPIwRQwVvzw5YU0H2tLppYQ==
X-Google-Smtp-Source: AGHT+IFeQrUDp25LtgTjyX80X0IMeUzGGzXNIGbMGuLfVWnohlPcPpRXvEyGBxgTXf87RjPUFh4IAuHNULNfCXp8I9c=
X-Received: by 2002:a25:445:0:b0:d5d:4bae:6fd7 with SMTP id
 66-20020a250445000000b00d5d4bae6fd7mr6851319ybe.31.1692645240458; Mon, 21 Aug
 2023 12:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <20230821135111.3558478-10-alpernebiyasak@gmail.com>
In-Reply-To: <20230821135111.3558478-10-alpernebiyasak@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 21 Aug 2023 13:11:56 -0600
Message-ID: <CAPnjgZ0KELg5yMJ=Mu9GLWmxyKcWWPphk68Bqi4u36iNwtQZjw@mail.gmail.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Derald Woods <woods.technical@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew Davis <afd@ti.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Alexander Graf <agraf@csgraf.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: Re: [Uboot-stm32] [PATCH v5 09/13] efi_loader: GOP: Add damage
	notification on BLT
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

On Mon, 21 Aug 2023 at 07:51, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
>
> From: Alexander Graf <agraf@csgraf.de>
>
> Now that we have a damage tracking API, let's populate damage done by
> UEFI payloads when they BLT data onto the screen.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reported-by: Da Xue <da@libre.computer>
> Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> [Alper: Add struct comment for new member]
> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> ---
>
> Changes in v5:
> - Document new vdev field in struct efi_gop_obj comment
>
> Changes in v4:
> - Skip damage on EfiBltVideoToBltBuffer
>
> Changes in v3:
> - Adapt to always assume DM is used
>
> Changes in v2:
> - Remove ifdefs from gop
>
>  lib/efi_loader/efi_gop.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

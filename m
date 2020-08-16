Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E1A245590
	for <lists+uboot-stm32@lfdr.de>; Sun, 16 Aug 2020 05:40:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1104BC36B24
	for <lists+uboot-stm32@lfdr.de>; Sun, 16 Aug 2020 03:40:22 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63494C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Aug 2020 03:40:20 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id v6so10793884ota.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Aug 2020 20:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tJy0G9sD0mb+hTHSeJ0pqIyCy3snKmOqUrasX5zjYSc=;
 b=gVD4IAbsysjoPcqrCNs12P5SFiH2SbEJngAWY4pLGTzTEq0JOHI+w1TAteUP0CNQ1N
 bfnlPQVgLepuFLdqwZvn3s+zzWIWXWSCE1AKPOzSYbt57gfCyv1KGiBhLo5dU5LeGdT/
 VZDgzGBYHmO3F/og7ElThX3Q1OqlLKOkach+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tJy0G9sD0mb+hTHSeJ0pqIyCy3snKmOqUrasX5zjYSc=;
 b=WkBBaFhmJeMURyWBn3+GTTruuFOIf1/2YAfOrvfIicR24JMPrcHLPzh2u0SsKRQfz6
 8WYT6961aL3xZkjwzRMBJ3OxufJf90pG9RID+jK+PCIiw/v6hVhp1jJZQ05L621H0Kg4
 Ny/u6BtFnnI2003+YQ16GuAxYQ7No+H6vz1DgXIRbn2C2oL2dCsN2rhrV8mYZssBMVHb
 AVqodoNTdALBaaBrk5lutiEw/VcfBe9MBi6MSdiFd2Asl4tvjY9O2U8ze4jGXac7chXP
 msUV5xJDdnHZji/301Hn4hZ/YiNJZq/IyjKS2P/Ii60q+R19Rxv0DZCQo4IfADi/0i5I
 idfQ==
X-Gm-Message-State: AOAM5323Fl0mcV2epiBmMTpWHArEii4SflBrUgZ1wiM3BkQRoVHGiiTV
 vHNorT5okMaCQNd+O5jkH5cSkryyhpRnrqrvoSu5rg==
X-Google-Smtp-Source: ABdhPJyy3b2OLIUKX9cjzG6GwViKSnPdqlldJDAikRUZDcJn95F5FdbZssrD23bN9OWVUFnzQsrsJckvzTqzxH+W/q8=
X-Received: by 2002:a9d:4d01:: with SMTP id n1mr6728193otf.367.1597549218818; 
 Sat, 15 Aug 2020 20:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200730140347.1.I0977b8abc51b9854d9e8f7822a7b28f3f219b99e@changeid>
 <20200730140347.2.I49a10ddbcc4100fd5d62b55f760128a7ecef2cb8@changeid>
In-Reply-To: <20200730140347.2.I49a10ddbcc4100fd5d62b55f760128a7ecef2cb8@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 15 Aug 2020 21:39:20 -0600
Message-ID: <CAPnjgZ0fddQs6tnimxFHTo22cEPKdvGiuEDmR9hCGu4MhrhvZg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] cmd: clk: correctly handle depth for
	clk dump
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

On Thu, 30 Jul 2020 at 06:04, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Update depth only when clock uclass is found to have correct display
> of command "clk dump".
>
> Without this patch, the displayed depth is the binding depth for
> all the uclass and that can be strange as only clock uclass nodes
> are displayed.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  cmd/clk.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

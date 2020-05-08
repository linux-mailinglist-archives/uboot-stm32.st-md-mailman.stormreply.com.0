Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CABCD1CA026
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 May 2020 03:37:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E954C3F95E
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 May 2020 01:37:12 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D9B6C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2020 01:37:11 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id i27so208824ota.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 18:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wikOTniGlmijmfANbWAR/Gt+qSJiudG8bP3Gqrwc/Lw=;
 b=PXl/WD7CfPR/Zy+QMnPJhArKklDKpCrzgLXF0cBvWfNhO7ySRdY1qlOjqbJKTFUqdj
 VXPpA9JmA6eKUMcbcYlddJx8kcdvW+yylTAXzga1H57hmegFfrqtwMpwFu1U5yb9/93H
 DHlwyAwXQK493ugIfTnJKDdaHLZqGm4NbRfM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wikOTniGlmijmfANbWAR/Gt+qSJiudG8bP3Gqrwc/Lw=;
 b=c2wK7mzb4WwTuonMN80kzp8i7xF8sYuEfvpnHueQglthY0wirU8O5l5EGRfkjViAC1
 ZbPxJa0Y5jMps+q/zSL/hNtITynkX75oimAZ6lNhZEsnVZi4GBS3rUqhN3lGN5cp1tkX
 yUkxCC5ZY5dCblzU/SsEdMh3bFHxqv6/35A2ADCNXCeXojE79f3ceIuwn9G0f2qP/vtC
 0+m/vCZglTt5R881YvIwKnAMKnxNHNqtjXTxC1cicjW37DOTrovk1XovTW0LV1svvxEU
 +csYgIihTyLcNazUUtGFisQzWNQjGA+2CzpBPGu3M2YNLl9WwSeSh4haIDoeF1TfBPiv
 YyIA==
X-Gm-Message-State: AGi0PuZWuTlwaONC293PEaarBDVOwXlO+mJMqprGIfepkFKnHNi3Szw2
 zOPcY08yWyHSn0ZLWY711/tYh6WyMlQmiWGDWEH31Q==
X-Google-Smtp-Source: APiQypLZG49c5rm3zK2PtC7IFSjEstAMReviiaLf4UtQQAlUYIgq7XUvtuOOKwPhertsdeivKDNpGXY4ZGu19FMsFY0=
X-Received: by 2002:a9d:490d:: with SMTP id e13mr236670otf.356.1588901829461; 
 Thu, 07 May 2020 18:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200430100619.28557-1-patrice.chotard@st.com>
 <20200430100619.28557-6-patrice.chotard@st.com>
In-Reply-To: <20200430100619.28557-6-patrice.chotard@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 7 May 2020 19:36:55 -0600
Message-ID: <CAPnjgZ1zpMZNfo=MGovDrWpua=-9ctZp8ZSco_YrJJQLPmdRxg@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Andre Przywara <andre.przywara@arm.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v4 5/5] doc: add bind/unbind command
	documentation
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

On Thu, 30 Apr 2020 at 04:06, Patrice Chotard <patrice.chotard@st.com> wrote:
>
> Add documentation in doc/drivel-model for the bind/unbind command.
> Part of this documentation is extracted from original patch commit
> message:
> commit 49c752c93a78 ("cmd: Add bind/unbind commands to bind a device to a driver from the command line")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
>
> ---
>
> Changes in v4:
>    - fix make htmldocs error "Title underline too short"
>
> Changes in v3:
>    - fix typo
>    - add bind/unbind parameters description and how to find them
>
> Changes in v2: None
>
>  doc/driver-model/bind.rst  | 49 ++++++++++++++++++++++++++++++++++++++
>  doc/driver-model/index.rst |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 doc/driver-model/bind.rst

I'm still a bit unsure why we must specify the driver name.

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

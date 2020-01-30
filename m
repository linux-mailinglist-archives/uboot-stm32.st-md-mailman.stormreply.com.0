Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB4414D531
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:19:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCDE4C36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:19:26 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCFBBC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:19:25 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id v201so1131364lfa.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3zJ9yPPymdyLT+2B+114skZN1Oo8bhean+YPTLb6VLc=;
 b=h9+NmGh9e1BbIuFin/buY2EgimSsh8f/BPaXaA4hStNnlRiKHaY0n7WilPxN4DqUrj
 vdaT+ASGr8AEdH989fR0u5/FT836zjjNsjeVrUuI/mgmdKvN3Bz09vGNyAAST++kKTIQ
 Gc/kP99i1ZK1+6PbnIFGs+CtEB8KMpOq1oIxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3zJ9yPPymdyLT+2B+114skZN1Oo8bhean+YPTLb6VLc=;
 b=LEPEMi6xEcbrgRdKukz1Z+FDuK9ln7sqReDtOmJfzacZaSZD85k68YYvA3P3/4kLOt
 HkNKPmURGZtxa0k1FLERe1cbwk8Vjmwv++HATZ+YIxolflPzubz3gHuXXssXfs15MJvc
 wRd4fhQFwUDaQn3eoFTcxc9UGrJiZJ//kfpcK7/km7HUa7VUzKSSSG8X09bsr7W5Vm0/
 8DPO3Ij5WdF3tZhzBr5uLR27WO+4QKm0DsvHr8sGoArZts63CIPkhJ3+bXbTPd9JHncB
 oqHxbpXq0QNXo+8ppMOsEItMkwHDoskk+qah3fBug9G1dbzUWhCx2vpIbRzLX3Wmcney
 EF/g==
X-Gm-Message-State: APjAAAXXdDxZMAg/Bl+10YpdnvUPqtKLsssMuH1xFZqQSVX730UidKdo
 iv02+T366m0LU3taPPKEtlAANC4NlNMrR5/PYyO4tw==
X-Google-Smtp-Source: APXvYqxFtVQT88mIYOjHGF1zJns3mcJDO0hf+VrZknyseBDGDMwDxPE6yD4xwf6s99Bg7NUnSZ9qB4yodl9M5YGjxok=
X-Received: by 2002:a19:cb17:: with SMTP id b23mr1240707lfg.201.1580350764599; 
 Wed, 29 Jan 2020 18:19:24 -0800 (PST)
MIME-Version: 1.0
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-17-patrick.delaunay@st.com>
In-Reply-To: <20200113103515.20879-17-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Jan 2020 19:18:17 -0700
Message-ID: <CAPnjgZ13pkSURj3NG9mj3p=kX_nDAXXzn3FsfawYKGXXXb+Wmg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v3 16/21] dt-bindings: gpio: alignment
	with kernel v5.3
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

On Mon, 13 Jan 2020 at 03:35, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Update the binding file for gpio, it is just an alignment
> with kernel v5.3.
> The U-Boot code example for gpio-hog (not directly linked
> to binding) is moved in a new file doc/README.gpio.
> [commit 21676b706e99 ("gpio: fixes for gpio-hog support")
> & 'commit 4762a9988ede ("gpio: add gpio-hog support")']
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v3: None
> Changes in v2: None
>
>  doc/README.gpio                        |  42 ++++
>  doc/device-tree-bindings/gpio/gpio.txt | 280 ++++++++++++++-----------
>  2 files changed, 196 insertions(+), 126 deletions(-)
>  create mode 100644 doc/README.gpio

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

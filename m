Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2606914D52A
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:19:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E224EC36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:19:00 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFEA9C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:18:57 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id f25so1535285ljg.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bmQ98sijRWVvHjzQDND7AlH7r9fc53WNQdy8AT7IzoU=;
 b=WflyEd5wMt+S0/Ha5RWHMWvaaxpppqmtFr2cZoBeWhWky+3s8W+WKrUwUlwunkOsvJ
 Dr4tIzcqxfSVyEn5yKqGy4kCq73nvgga+uqtZPVEmo7cFIKZYcLqWOG73B75cejiLwO6
 ZAOaqEnFSTqH9PvR57vYrEp4Jm5utp/Ft3toM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bmQ98sijRWVvHjzQDND7AlH7r9fc53WNQdy8AT7IzoU=;
 b=oCuzdfD1Kmx9WKLjTBiHQqOs0fLRLncdza0knsjUG4B5BM33RUAARZsg/rnxLQYIXU
 MeTK5krIuLP9mLLX9fEqexKubkipRCCE5iDu+PHDEzoWVqoUA0/qLSyyOlH2WIMT7+QH
 3P2UjLAil+t/D6DCNNt7968k5yvV2Gr6X6rCHToKeMgzBcJq2CHxPwZyTtctYGdTTPhI
 2CgfrD6WYZONQxroj/V/UGUW+pDZn5+0H5fAu5cw24ZFCLCk5LPO5UZHpUxP+M59NLgU
 uNdv9mHPWQ4k/wR+/F8zIEB9dIUuVL5xsyD1wXF1BYqUpLx1FDLhIsmVQw3+KnJkbFOG
 1iFg==
X-Gm-Message-State: APjAAAVlC0NenDh7zbjn2rtqlgXo03A8bSrcrlHysK2Zd+RS3/ykrbrE
 qhzd2KuCCk8k1pRoiHZ5VuRRZVDLBRyb1AzX5LwIxA==
X-Google-Smtp-Source: APXvYqx0R9aKMzLkO8KpP6krXj2x9vH6xGp+rDTIvUuBy+AHxcEyxy5iV1H9fpLf9wYMfol7LGkdoLt9mkIM1+WE+8Y=
X-Received: by 2002:a2e:9ad8:: with SMTP id p24mr1230961ljj.148.1580350736729; 
 Wed, 29 Jan 2020 18:18:56 -0800 (PST)
MIME-Version: 1.0
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-5-patrick.delaunay@st.com>
In-Reply-To: <20200113103515.20879-5-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Jan 2020 19:18:00 -0700
Message-ID: <CAPnjgZ3cLXC33A-HwBT17VpUm4-ToToVjynn3oeYGnaCAUjgnw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v3 04/21] dt-bindings: gpio: document the
 new pull-up/pull-down flags
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
> This commit extends the flags that can be used in GPIO specifiers to
> indicate if a pull-up resistor or pull-down resistor should be
> enabled.
>
> It is the backport of linux commit ede033e1e863c ('dt-bindings:

Strictly speaking I don't think this is a backport, since this is a
different project.

> gpio: document the new pull-up/pull-down flags')
> from Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> and integrated in v5.1-rc1
> https://github.com/torvalds/linux/commit/ede033e1e863c
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v3: None
> Changes in v2: None
>
>  doc/device-tree-bindings/gpio/gpio.txt | 24 ++++++++++++++++++++++++
>  include/dt-bindings/gpio/gpio.h        |  6 ++++++
>  2 files changed, 30 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

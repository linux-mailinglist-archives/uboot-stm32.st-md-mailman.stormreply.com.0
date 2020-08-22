Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE9524EA59
	for <lists+uboot-stm32@lfdr.de>; Sun, 23 Aug 2020 01:18:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0466BC32E91
	for <lists+uboot-stm32@lfdr.de>; Sat, 22 Aug 2020 23:18:14 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA484C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Aug 2020 23:18:10 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g75so5016748wme.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Aug 2020 16:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=z3gQdTBIKohewsWMSH8+GTXHmhQo3aSdQZ1tRpkfxzk=;
 b=CfesJsEBpa1F/dPwX8IF6RymHLRlBsjTttErrZsVZoO1XcisdnA4fCnyHjON0Nsl0M
 K+tj0Nw/9stQCFPiAAV9VMCnK17JQg6X4GF3SPi2MFrqeOJfeBkw8Mp18SFJnXalyIBm
 KKx0gcWQyfj8TH2LF2WRs4WUMgoFqCQV3gAAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=z3gQdTBIKohewsWMSH8+GTXHmhQo3aSdQZ1tRpkfxzk=;
 b=ZrCz/FRCNJK9S0aIpD5O4xGSqKZfbBoZMB634Dfct+xRH8IOBrzyBYH2co/RiUo92d
 ycn/wPd2vgYb4Vnf3JPNdiKC6o/TUpbrc80i9sVpT0xnwIPTJmqNiXIatIWCXmqVDYZZ
 9t3KnF4FnQaehyKFnD9PgeeZ91pk7U42LnjtVr3xBT7Nf00z2nPRHPLVYORAUvGHEwws
 oAXPvfivJpN3TDSCyDOs6c/yQXY4PPVzXLPM+z600uegursPPJaCk4GxuDitaTZusRtr
 FBf/Tcwj08U/W+ts6LrJaLWy9/nGbRLNnnVQ9FIL+8EW6x+mTupKFjjMXoUyBmXnevBa
 346Q==
X-Gm-Message-State: AOAM531dd/GzNfMkKvgwoN9ycqpE+NPlaZkVBWZUMHdjeEtq5+kW4oTg
 AdfKM++VKf8jP6Hr7o2UIkHk7HSWtJEiz1u6aBoFbg==
X-Google-Smtp-Source: ABdhPJzPGmooBz6FzRWWTekFqQcsjZVeiiIFEkvZw+O3b9hICi0Xg2+86IXkkvJXQLz8kFNh+KIsZUb0+wWCHXERrN4=
X-Received: by 2002:a1c:9ecf:: with SMTP id h198mr296362wme.35.1598138290165; 
 Sat, 22 Aug 2020 16:18:10 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 22 Aug 2020 19:18:06 -0400
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAPnjgZ0owXvzrxbk_uHusCCEmNrWrUhJnSof8Hz9bxE2k8eb-Q@mail.gmail.com>
References: <CAPnjgZ0owXvzrxbk_uHusCCEmNrWrUhJnSof8Hz9bxE2k8eb-Q@mail.gmail.com>
 <20200728071335.5840-1-patrice.chotard@st.com>
 <20200728071335.5840-6-patrice.chotard@st.com>
Date: Sat, 22 Aug 2020 19:18:06 -0400
X-Google-Sender-Auth: DY-OWXDwX4Shk4C6awrysYM44Is
Message-ID: <CAPnjgZ0tF3SBO=i7+oxMECJ5xyXDDOxUZZaGoZW_ME=fLeTgOQ@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH v5 5/5] doc: add bind/unbind command
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

On Tue, 28 Jul 2020 at 01:13, Patrice Chotard <patrice.chotard@st.com> wrote:
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
> (no changes since v4)
>
> Changes in v4:
>   - fix make htmldocs error "Title underline too short"
>
> Changes in v3:
>   - fix typo
>   - add bind/unbind parameters description and how to find them
>
>  doc/driver-model/bind.rst  | 49 ++++++++++++++++++++++++++++++++++++++
>  doc/driver-model/index.rst |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 doc/driver-model/bind.rst

Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot-dm, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

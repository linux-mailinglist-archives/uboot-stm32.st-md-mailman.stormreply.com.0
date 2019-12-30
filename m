Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD0F12CB97
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Dec 2019 02:21:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86681C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Dec 2019 01:21:37 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA455C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Dec 2019 01:21:36 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id r27so44308303otc.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Dec 2019 17:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gUWeLvvbLzwXil9a/5OxR8O0xDSBtEUA0I/aU15/BK0=;
 b=MHKHr4f0HdWBsLsoR1VhgHUFrO0XoJozI92gsz1KNbf3XX40/hQhDH8WTXmINA42GH
 Oj9KqSUO6Wt6y6Pxv86mFYfmlH/wTJuzpEXwIkqCiUleWXpGiaYCHye7znMurfbRJs17
 Zsl7M/PlIAHO8+QPctvhdsLy4wpvjXaf/QDuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gUWeLvvbLzwXil9a/5OxR8O0xDSBtEUA0I/aU15/BK0=;
 b=h0owuFDKhI8qkzXrYLKjDUfbWZrquFQ6mR3HI1Hf7c7wDdpA+6iEfdke85Uq+4VnVl
 9+prvk+6QFPAyha3PyLtVr4aJW3EFgwCTqjAuf5Yb3qzlUSGZTnNjcJpXoHB6TCth/nE
 XNWqokF2/FkUzlRi+H6Xhf3h4YBtePg4CPrv2MZWKYHiKZUm1AfBzNAhEJ8Ms+fPF8lL
 ng85i0PdEKBhNhPwNiTpXP4CtD2lkmYlsTsW3mLSXNrPAdud1hgLDOFla5s24kdLpmnd
 j9VZdVaxRm4d5QQL3JaUgjinbYr/PRaS4ELd4G1GI4uSiJDJiH3Pds6cgMJj2K2H3RNF
 QbAQ==
X-Gm-Message-State: APjAAAV7YWvvLLoStQmGRF2QbBxzJioiPoGyXD/ImoHwUTFvJ+oQppuu
 MlG3JGuq/OYwFVjq/GZkqFuNRKLZleOODmj9xJRV+7UM
X-Google-Smtp-Source: APXvYqy115LykJ6Y3pUOWwvuA6E7iullb7S3OtzQYp0jIqCf6rtS+1sMJRS0HFOx623XZWRdMtjW04ZEku2/Ugvy9O0=
X-Received: by 2002:a05:6830:1112:: with SMTP id
 w18mr65553908otq.356.1577668895358; 
 Sun, 29 Dec 2019 17:21:35 -0800 (PST)
MIME-Version: 1.0
References: <20191206140149.7426-1-patrice.chotard@st.com>
 <20191206140149.7426-2-patrice.chotard@st.com>
In-Reply-To: <20191206140149.7426-2-patrice.chotard@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 29 Dec 2019 18:21:20 -0700
Message-ID: <CAPnjgZ28YzAQcxce-DFCvSoVLUOQtUGQk-iuXCsSiwjNasv2+A@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Chris Packham <judge.packham@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/2] Makefile: Fix
	CONFIG_SYS_UBOOT_START default value
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

On Fri, 6 Dec 2019 at 07:01, Patrice Chotard <patrice.chotard@st.com> wrote:
>
> This patches restores boot on boards which rely on
> CONFIG_SYS_UBOOT_START equal to CONFIG_SYS_TEXT_BASE when using SPL
>
> Fixes: d3e97b53c1f2 ("spl: fix entry_point equal to load_addr")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

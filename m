Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C8118439
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 May 2019 05:54:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7B1DC424C3
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 May 2019 03:54:15 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50078C424C3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 May 2019 03:54:14 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id u199so850167oie.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 May 2019 20:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cm67C+Wj+ZkMNEsjaLVMMRXdOg3sToKyqEOrlbPXANc=;
 b=A356DpjYwrsWNDM48Eukm07AE8Y08qOnQUC/s165btPMZ9ghDP2bkDlFqR5hpfWznI
 OKjMHlBBU547BYKDiZCiTAl8GbBbukABybc1aUmlbcd1X5Mpjnn/aMGIBDes4m9MxOsE
 OfQlUkxvlkR2H9rfBeajskITcKjILjVu6Ovjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cm67C+Wj+ZkMNEsjaLVMMRXdOg3sToKyqEOrlbPXANc=;
 b=A0njnxLXeGfraTkkB7Y/CjYmqAi2zKXAmr1aizxzUeeqqqOSdI8ywQB5Ws6r9kcEfu
 QQgmpssrayK3qgiOY5ouaW7y7xjViEmIbhqWTImDfJ4wPSR2arPNLsy07cxxs8noyArs
 6Bzt/RmS6o8SAdf2+eG9SlCWWz+QcVHarbirLCqdGWsFpJD+Xs/UD8tE/Dzgl34M+FEe
 d96fahTDq9cT+wAF0W0qB/0nUK0IDmj9rA+sc4O7U6Df3P9TOB43Rxt35u0YgZtU14jL
 7BL3NYBxXt2+asRhg+w4hiJN0Q2+Doyo3IuMowyPGOPiFER1vTlXZsVIOOPTLPcFNJtC
 2gMQ==
X-Gm-Message-State: APjAAAVR1YeRs2oaLvINhXH/urz0ZYev+luCxCRBFZ+JEUMmuwHkYp/E
 LRzEzuN9EN+OQW0iDUSLd07nVytxvImtFEvVZ6TyOQ==
X-Google-Smtp-Source: APXvYqzieyvZBEJnCpnQ8dgsnXrEGYmNEraEbWI5+AsRovRSF7X3HInqRaWfzmfDcFOJUkFNSoJMqj72MHdrSc7fcto=
X-Received: by 2002:aca:b7c5:: with SMTP id h188mr141676oif.130.1557374052750; 
 Wed, 08 May 2019 20:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <1556529805-23820-1-git-send-email-patrice.chotard@st.com>
 <1556529805-23820-3-git-send-email-patrice.chotard@st.com>
In-Reply-To: <1556529805-23820-3-git-send-email-patrice.chotard@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 8 May 2019 21:54:00 -0600
Message-ID: <CAPnjgZ2RGRqcp+N_VaimOYbycf7J4RZ3XRWcSiYpzmsfyDZv5g@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Stefan Roese <sr@denx.de>,
 Michal Simek <michal.simek@xilinx.com>
Subject: Re: [Uboot-stm32] [PATCH 2/4] ARM: dts: stm32mp: Add iwdg2 support
	for stm32mp157c
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

On Mon, 29 Apr 2019 at 03:23, Patrice Chotard <patrice.chotard@st.com> wrote:
>
> This patch adds independent watchdog support for stm32mp157c
> in SPL.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
>  arch/arm/dts/stm32mp157-u-boot.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

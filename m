Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9611FC808
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Nov 2019 14:43:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9ABB5C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Nov 2019 13:43:11 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E8BCC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 13:43:09 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id m15so4854956otq.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 05:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=4l3wcmghepzsvHEhpExKpFuS+1IDw2gMT/B93LTaiVo=;
 b=jJ4pD7uCMLmO0QEHfKduoXkWMDCNFrt/Ac5iVi0VZDLJ/i0OdoAvjAnVKVdPkmQu5P
 AUHNZcGe1MQ0/4LASe8r3yxXhX+Xmfllbtavgn7Vali/RY02vWi+/lk0HVTPWHPcTzry
 CKyOerOnNxSHJ0H0WwNA9H3m9Qgv3AgnlQ8dqxoDkPg+kaoeFqA5Wwe7Tv9FREyI76+v
 UUda7bnz3ukmwKnCI6yPb1BnrIxJSf02diNcEcEnmIkYIjLDef8gY+o+Gi0YZCEZDcKx
 R1F9gZYWSTN0Ck3qcPeTKdD4fxnvd4Se0e6o4NnyyqFvHeP4imTRGieHdsbH/zWrpeda
 8NVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=4l3wcmghepzsvHEhpExKpFuS+1IDw2gMT/B93LTaiVo=;
 b=BNOBdVBRRkUeqz/cvklsiwOyyv9jPVJMZfGSMDLUZLHGmn/3vjQykKohNItDd2KkRl
 UcxyEUwDk0V1KH0DAI5Hn8OTghs4DrIRUQgPUwFM+cYhMq/MEWZ38QJ82EfVGhLgxudp
 c853c7uvNDavNNwOKWzwOlaAL56it7KCtHHv+jwIJHwt8+hfZ39yVce0Rx4n9RW6d1bI
 2tq7XmNQOjusTy24lhppbVZPi7/losjnmkME1iMBbIMLZpEHPFOPv7ScQsZznA53dpFg
 wIP80cCxpWLEeAsIhl0vWAovMVN5JYphRZC4TF5v65apNCyYnzWvJQcuvhKJJJqJbLsf
 qtrQ==
X-Gm-Message-State: APjAAAXyo6TGDJ+z7BWOjEkad341SFS14lWHmY++CL+P9OM9wz+H+HPB
 WFCfSpPEu13YUqF4XNVm03Pyb0QtRurGeZmyaD2jRA==
X-Google-Smtp-Source: APXvYqwdgbKfRZ0hpUJCmAiE6bw5OHILvTJg3/cAWE+V3YsudzIKJv0ALxVOMpqBoZs/22l6irA3FBmB3rabMnzqRLA=
X-Received: by 2002:a05:6830:2001:: with SMTP id
 e1mr347557otp.48.1573738987723; 
 Thu, 14 Nov 2019 05:43:07 -0800 (PST)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Nov 2019 05:43:06 -0800
MIME-Version: 1.0
From: sjg@google.com
In-Reply-To: <CAPnjgZ2O7jWSjMptLY3DQTDeB-aTE+Lq2UOoQdDcPtTkT16adg@mail.gmail.com>
References: <CAPnjgZ2O7jWSjMptLY3DQTDeB-aTE+Lq2UOoQdDcPtTkT16adg@mail.gmail.com>
 <20191023134448.20149-1-patrick.delaunay@st.com>
 <20191023134448.20149-2-patrick.delaunay@st.com>
Date: Thu, 14 Nov 2019 05:43:06 -0800
X-Google-Sender-Auth: P8ttaCwBa1M-cSh6BI1jNcT6b4w
Message-ID: <CAPnjgZ29EsT5xt4ggLG=Eyi2th3xE096=-93SMr4VJGe7gV3NA@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 01/13] pinctrol: dm: remove the function
	pinctrl_decode_pin_config
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

On Wed, 23 Oct 2019 at 07:44, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Remove the pinctrl_decode_pin_config() API, because this
> function is unused and not compatible with livetree
> (it uses fdtdec_get_bool instead of ofnode API).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/pinctrl/pinctrl-uclass.c | 12 ------------
>  include/dm/pinctrl.h             | 13 -------------
>  2 files changed, 25 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot-dm, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

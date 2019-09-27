Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91034BFCDF
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Sep 2019 03:50:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F25CC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Sep 2019 01:50:06 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5E38C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2019 01:50:04 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id u3so626369lfl.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2019 18:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L6xBTCVWNPOOK583HQ/8/1rmj+EfGu1riuOKfTbdEw4=;
 b=TSWI1cV5LGLwhuLfyB4LeGIcVegJeo0cLSpVnQiFHNqkCEr1/KP8i5ScDFBGS/lrFf
 8DPlZhNe2pGPGqgzFIWj5knyZhsWUASxO55k7iCqiKMDTZzSYM4NNNkOjWGbhhpdBiG9
 p5gsIQWqaGHV26u5uuny9SbtP2DkQYn6tIjgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L6xBTCVWNPOOK583HQ/8/1rmj+EfGu1riuOKfTbdEw4=;
 b=JldzSZaHHTzCSUWneVlR9s3+y5SrCFOuh46xHTadlIAEtJEwrj2nxAHYmXRPnFFtis
 c4Exko6anjDid+nOrvrZhe7XjGpCOChjaukr3tZkGi+k8k0cWDbOCzPieMxy6CwNgqvf
 uiAwiKXdHmSxnTmbFlNM3OHWsqYzG9dp3tRpv3W/Rbh4bYa5Bszb2nCnKgDRN12ECmbX
 YOfQnotKRIhtNwWWnAFhYMgngfRRKNidytTUIIxYqNacV5BEvdVix5iNNWWQ79VIh9V4
 HHLIJmSm6ppqmmK26kOzYIs6mg9BcO0izQXGyUhIwMeQE2UEkMaxBjyq4Jl9lZcOK9ig
 6Few==
X-Gm-Message-State: APjAAAVbfKw4RVOla8hQafWXkjdyCjjMe+LCF87RBwJJObmblQxcirN5
 7dSp+JhtSVSX/Ww9AI2kDD66Oe5d2fol5O64jGcmJQ==
X-Google-Smtp-Source: APXvYqzTRYqI3J20h8H0Ln5WwaH8CYmB7AbXrvdb8BaA7n0gLKM+f5qpS+cE1QFT36gHAO1f6Bw6TYgRd8qjTt4PrAY=
X-Received: by 2002:a19:f817:: with SMTP id a23mr905187lff.18.1569549003599;
 Thu, 26 Sep 2019 18:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <1564750081-31319-1-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1564750081-31319-1-git-send-email-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 26 Sep 2019 18:48:55 -0700
Message-ID: <CAPnjgZ3Lj7Cj+OsVW6G8DDZwa0t6AuHdFXnJTybXrupK-UGMxw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [RESEND PATCH 1/2] dm: Tidy up dump output when
	there are many devices
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

Hi Patrick,

On Fri, 2 Aug 2019 at 05:48, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> At present the 'Index' column of 'dm tree' assumes there is
> two digits, this patch increase it to 3 digits.
>
> It also aligns output of 'dm uclass', assuming the same 3 digits index.
>
> The boards with CONFIG_PINCTRL_FULL activated have one pinconfig
> by pin configuration, so they can have more than 100 devices
> pinconfig (for example with stm32mp157c-ev1 board we have
> 106 pinconfig node).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> stm32mp157c-ev1 trace before the patch
>

This seems fine but it breaks the tests (make qcheck). Can you please fix that?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

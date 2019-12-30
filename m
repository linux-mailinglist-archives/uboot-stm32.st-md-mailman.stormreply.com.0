Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC2312CB92
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Dec 2019 02:21:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60B1BC36B0C
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Dec 2019 01:21:26 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D2BAC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Dec 2019 01:21:25 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id p8so7905480oth.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Dec 2019 17:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ehDT2mbvUs3tEvZp62X7mfvIx42AmWQX3Ppp7XMydaM=;
 b=E+uHCGiW10TXIWfn79lO7uCQWnd3/qlQiFJTHGRhnT+LOrxlwydGVRB4k+uWnZwDmd
 WKqYNSUh8FymecZqieMKlVGXo7EPAhbU3UxUfes/iqihT0NBwqn+kKKkGpqooymdyEEU
 Ct6aEH7E1I7X89o3LpC4/lGYcVjoIdMBgP0+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ehDT2mbvUs3tEvZp62X7mfvIx42AmWQX3Ppp7XMydaM=;
 b=K02C5c0kei+sDFXaTVqh1y84CdprsQ9CFjSNEqNrk2y/rav/XAppzMhDPysrCKYEom
 eaF3+IPk+UpRsNnsa9iKUfDjB3Bp50FOV/fKVfw2qPE1NDZQ4zfP56rC1WaOulJxwsRb
 s36vdog3QQxmoMOv23shOOWlXZq97SWuZlQBLMXiM0YU1rSTdoLNcbwzyGPrDJeQOHcr
 N7GOj8be4CCCFvkscIpLjt+1tWWWPjecflm5wyBWoTAKhFEWP19mHRDIzSNQbJRbIccK
 XNCeh+J80nrZxrGVlSnP3FV6OwGUiOFzn0F+yb0Pf8e+iUiDQm5GpDFeGlHd0QbR0X+I
 D7UQ==
X-Gm-Message-State: APjAAAUeKqiG9YrtQySD7s7jGy4DDTxbzUFoSSAaUnyIVzvLtODUf/kP
 L7XN7PzxsBYTfKEdP++DaWeRli0y/wNK20fZKg3gRA==
X-Google-Smtp-Source: APXvYqy5a0MU0YJgis92BXMEzHLKRqN7XjjsXB8UCe2+hoEt3dLkBA7YzuRVjmAEeJsXarrCO83RboiCcIyy+Mo7QWw=
X-Received: by 2002:a05:6830:1112:: with SMTP id
 w18mr65553142otq.356.1577668883841; 
 Sun, 29 Dec 2019 17:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20191126084911.19761-1-patrick.delaunay@st.com>
 <20191126084911.19761-7-patrick.delaunay@st.com>
In-Reply-To: <20191126084911.19761-7-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 29 Dec 2019 18:21:11 -0700
Message-ID: <CAPnjgZ2e4K7fCz=C5PPiXxr-kCMvBc=TsDw+wvw04J1GtYEHpg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Bin Meng <bmeng.cn@gmail.com>,
 Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 06/14] gpio: remove the open_drain API
	and ops
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

On Tue, 26 Nov 2019 at 01:49, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> This patch removes the ops get_open_drain/set_open_drain
> and the API dm_gpio_get_open_drain/dm_gpio_set_open_drain.
>
> The ops only provided in one driver (mpc8xxx gpio) and the
> associated API is never called in boards.
>
> This patch prepare a more generic set/get_dir_flags ops,
> including the open drain property.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - remove the open_drain API and ops
>
>  arch/sandbox/include/asm/gpio.h | 20 ------------------
>  drivers/gpio/gpio-uclass.c      | 36 ---------------------------------
>  drivers/gpio/mpc8xxx_gpio.c     | 22 --------------------
>  drivers/gpio/sandbox.c          | 35 --------------------------------
>  include/asm-generic/gpio.h      | 34 -------------------------------
>  test/dm/gpio.c                  |  7 -------
>  6 files changed, 154 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB9D12CB91
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Dec 2019 02:21:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58AE0C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Dec 2019 01:21:26 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1454CC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Dec 2019 01:21:25 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id a15so44318545otf.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Dec 2019 17:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K+z9EqigRmxhbEA/Ulpx+WgnmI0muS0H0UPtV1fZzaE=;
 b=anWQKRALyZL7OLus0YMzv8PL8abtc6r49bxoX2+d7RCuChd4Hwd0qcNuBcwmnsFi7z
 36QIQ6afdTlv5HO3PwRQjuif49z2wWiCQV7i62UlbN+CnX2Z9rjzvp9uprPxY3plvXw9
 X0PP5Qrx+NnLxKAqmfsOaoM99e5qpDIhBGtG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K+z9EqigRmxhbEA/Ulpx+WgnmI0muS0H0UPtV1fZzaE=;
 b=YQVngZicJlBHPBtI9rqqOBWV9Lfp2sJthhPgCJ/KCrMB5YIEvwNIcraBoWJnySBe7m
 LQ7qRbU1gA2I58xNJxpgDeYqR9fSdjJ/82kKupAPLCfAbQMBRAog68zXoTt0PrFUFJ9i
 jnSqFWLu4wSfcBSdjrMwUNTcQfQDjAU0I/gh+vaN/2fYYM6rJe6+yl+hmh9KM+eIaJ6H
 hXGT0ZNtg1lUMj7sk512gees/RBuY9RIQh+S42kXKxkaS9SVW7pmONQ+goOJ6zNVmHB/
 iw/vnFRKYLQzcHxZhzT9zIdwfnmX9bdoWYWBHbY5l7+IZAcGFbiv4c3Ivkk+aWJEtLJS
 mJwg==
X-Gm-Message-State: APjAAAWl9cSSZucPcodgv8k28x3XcyboSDnl3lfTuncOZFsmlzXqoX/q
 OeD6jexD6Is4SCZ5Kd6SsPBMs8uO0ISPdYvkHRGpqA==
X-Google-Smtp-Source: APXvYqyhfjIJNCWcXLEEFFRUMg2W1SiKjo3Iei7/Tk1dX2izGpe3bbkNRrpL5kk2fK2M1Hrhx6d8lrUR31iuaM8Ty+Y=
X-Received: by 2002:a9d:2c68:: with SMTP id f95mr72486693otb.33.1577668883548; 
 Sun, 29 Dec 2019 17:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20191126084911.19761-1-patrick.delaunay@st.com>
 <20191126084911.19761-4-patrick.delaunay@st.com>
In-Reply-To: <20191126084911.19761-4-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 29 Dec 2019 18:21:09 -0700
Message-ID: <CAPnjgZ20NqYH+=TVwi_3isiTEea=n9kDtoqN5HMPbLqsVGWe0A@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 03/14] dm: pinctrl: migrate
	pinctrl-generic to livetree
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
> Migrate pinctrl-generic to livetree:
> - dev_for_each_property
> - dev_read_prop_by_prop
> - dev_read_string_count
> - dev_read_string_index
> and get rid of DECLARE_GLOBAL_DATA_PTR.
>
> This patch solves the parsing issue during sandbox tests for pin
> configuration (OF_LIVE is activated in sandbox_defconfig
> and sub node are not correctly parsed in
> pinctrl_generic_set_state_subnode with fdt lib API).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - Change dev_ functions in pinctrl-generic
>
>  drivers/pinctrl/pinctrl-generic.c | 30 +++++++++++-------------------
>  1 file changed, 11 insertions(+), 19 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

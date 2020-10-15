Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A9C28F57F
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Oct 2020 17:05:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21F49C3FADE;
	Thu, 15 Oct 2020 15:05:50 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AE2BC32EA3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 15:05:48 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id e23so3530163wme.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 08:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y0Gx+2z1kQuy/ANE3UphrPGEfFq/wOhgX3Owr+bym0Y=;
 b=FXJMybP5AEKe5Us9SUqbu8Rg0u1pYMSn7AHYglictzIhVKvx6eca4BibHiF06AfnMJ
 Q54Wng43ixVoAv4D0k5p3uDE6L6ei//xQoqESZUZBG8Di8Ysm4miVqwnTPtktnkU+YyS
 Vq19Howfm4kzZslyWgLauURC5Olmmi38H5vmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y0Gx+2z1kQuy/ANE3UphrPGEfFq/wOhgX3Owr+bym0Y=;
 b=Ch8QNXVMEv4jk+TC4Bxv9AWuJeqpPpHJHwiWw9x99diS3tw2O51Y/GC4X2qpiiNpKq
 bNyFT9mEYSoWDSu1Yy0W7J1nSmYIZdw+0mlDao4pfrB43Wlt++xas8aYrZocwcnIb2Pt
 to5zuzUWDWqLrrmKlO4B4JFZBY8QvMtluw5lFy0+zhvSCEQWhS9m9GUfGYpsWatV1ZNH
 8ux5zHxZVkp7kadgTKJlPjddsagFZ1WwLfd32n7Fd6yoqf9gyFdXrYtYYqNBZJWUlcDS
 +NRQf3+7tK5QdGoGKT9aDyy3B4unf7UcDsuUrAm4pyPzZ16ZX8L5JLSmYAx2XkkQCPon
 fjeg==
X-Gm-Message-State: AOAM532QXD5dD+uywSRwGdq4Goc0xvTZ9BeggHIOwEGOCpFs83IkzEbC
 HF++pQzq8hRD6QPQr88W3XlTBayBWv2kOt4Ik+rU2g==
X-Google-Smtp-Source: ABdhPJxIzPOHXvfGssxbyiJym7+2WkZpNcSvp3VDa2VK8o/UKH9JJJgHG/0FUkPNZ5oeqd5lwy3y+3kAjgSlpNA2Oxc=
X-Received: by 2002:a7b:cd85:: with SMTP id y5mr4453391wmj.168.1602774347344; 
 Thu, 15 Oct 2020 08:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201012074750.15602-1-patrick.delaunay@st.com>
In-Reply-To: <20201012074750.15602-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 15 Oct 2020 09:05:32 -0600
Message-ID: <CAPnjgZ2dpOLir55nN3C9qYx+p_qWCNtSrZY_sawKYOiJkGeFRQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH] Remove default value of CONFIG_PREBOOT
	for CONFIG_USB_STORAGE
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

On Mon, 12 Oct 2020 at 01:48, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Remove the default value "usb start" for CONFIG_USB_STORAGE as the USB
> storage boot initialization is correctly managed by  distro boot command
> ('usb_boot' defined in include/config_distro_bootcmd.h already include
> the command 'usb  start').
>
> Fixes: 324d77998ed6 ("Define default CONFIG_PREBOOT with right config option")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  common/Kconfig.boot | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

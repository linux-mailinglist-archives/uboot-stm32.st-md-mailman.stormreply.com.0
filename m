Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 179F3323D88
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Feb 2021 14:18:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76775C57B53;
	Wed, 24 Feb 2021 13:18:04 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FBDBC3087A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 13:18:00 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id f4so1778113ybk.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 05:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ssvFpbkzqhPg8hBDuNel9XVXbPYL3nxizF9Vwl4OCRc=;
 b=Qupj98Tpjbgo7GfkFC5A7fcaulJChM2gkl5762393SR+XUXVKRJsK/T65cIEihHaPM
 t85Dvy/Zd34xanWvTnQJXTCOBs0/dKeKI7qbKI49pmPEIPr+HP3V7kemO6oGk802hmwd
 QRZsZtaEMjiEg/UQnAeZ8e+5jGnkANW1+ZvhpN0tsFEXo8o6N7mv2DAJilHtPWlcBqUm
 DNmFwx3IHdQqmGn3oIfbmiEc17G7TwgDNjitW3NoLRvn0pSrb5v1P2Djdiq/JHtZanO5
 yYZsWwS+YicyVkyDu0DYze1f1jwt6QbksxRVFuMl/Jf2xdR9UQwVMezY353c9q/pYCJg
 QkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ssvFpbkzqhPg8hBDuNel9XVXbPYL3nxizF9Vwl4OCRc=;
 b=qRrQ+gQ2qaf38ikKn9Hch7MviBGG8+JPBJIs8p3H89OPTDgfPkVRuRbf5gNYny0lj9
 l/Cc7rRIDRiPrJdGdRuAP39yU2mDH6KIVuLQRdryOUPSHeLt5FkQEvCXb65NSNFwE8sc
 nv1IKBklnvCehQy9RUIZuiwQDMAAnLwRkst7o2Yit8OSF5llBM/2/VIc4vN64H9uQz47
 u0Bu+Ts58+c/bjfYa0fK+RvJQiFaoWwi+0Xh4sNtylQEVYhAbBuYgQN5fbM8NR3dpADk
 NZKsWVykPTA5S7TR5Rhqb7+oNYD1zN+CFZORisHRPXyLNSvgYqTjHsqC94flRyiF2JvL
 rbRQ==
X-Gm-Message-State: AOAM5334VWg2ETdWRkwz9uvfKf+PpU1+fYsQSi1RgiZyDamN7tb1iYHm
 H2lHnTLUx5qjjjE5P4BR2DDJljrv+Jd+ywb59T0=
X-Google-Smtp-Source: ABdhPJznL/hFT6MKBYlDY9oBD87W7KyJsyiXdw6yIFS0k6iZWk+kAinLPbvpyeVQcLxM2wcHxyM1w7i7a46P2qqBdss=
X-Received: by 2002:a25:d28b:: with SMTP id
 j133mr44563572ybg.517.1614172679608; 
 Wed, 24 Feb 2021 05:17:59 -0800 (PST)
MIME-Version: 1.0
References: <20210224121904.13927-1-xypron.glpk@gmx.de>
In-Reply-To: <20210224121904.13927-1-xypron.glpk@gmx.de>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 24 Feb 2021 21:17:46 +0800
Message-ID: <CAEUhbmV-ie_-G=jASQNDQ26VO78jQXX5D-wQUJPp3psWS67snQ@mail.gmail.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Bin Meng <bin.meng@windriver.com>,
 Sean Anderson <seanga2@gmail.com>, Stefan Bosch <stefan_b@posteo.net>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Tom Rini <trini@konsulko.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Naoki Hayama <naoki.hayama@lineo.co.jp>, Weijie Gao <weijie.gao@mediatek.com>,
 Marek Vasut <marek.vasut@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Wolfgang Denk <wd@denx.de>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Robert Marko <robert.marko@sartura.hr>, Adam Ford <aford173@gmail.com>,
 Michal Simek <monstr@monstr.eu>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/1] Correct U-Boot upstream repository
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

Hi Heinrich,

On Wed, Feb 24, 2021 at 8:20 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> The U-Boot source moves to https://source.denx.de/u-boot/u-boot.git
> effective 2021-02-28.

Where is this information posted?

>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>  .gitlab-ci.yml                              |   2 +-
>  MAINTAINERS                                 | 110 ++++++++++----------
>  README                                      |   4 +-
>  board/st/common/MAINTAINERS                 |   2 +-
>  board/st/stm32mp1/MAINTAINERS               |   2 +-
>  board/ti/j721e/README                       |   2 +-
>  board/xilinx/microblaze-generic/MAINTAINERS |   2 +-
>  board/xilinx/versal/MAINTAINERS             |   2 +-
>  board/xilinx/zynq/MAINTAINERS               |   2 +-
>  board/xilinx/zynqmp/MAINTAINERS             |   2 +-
>  doc/board/intel/slimbootloader.rst          |   2 +-
>  doc/build/source.rst                        |   2 +-
>  12 files changed, 67 insertions(+), 67 deletions(-)
>

Regards,
Bin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

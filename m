Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB3ED4A40
	for <lists+uboot-stm32@lfdr.de>; Sat, 12 Oct 2019 00:22:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDD08C36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Oct 2019 22:22:21 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C904C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 22:22:19 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id a15so9334588oic.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 15:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NAoHemdYqR+btdRvN9fApuZW+byiYT4nrufcg3Bw6/4=;
 b=mnvyrJU69Cd+1HsP6DytzG+b0VLZn1NUqCmk1asHwMWyXgiBW7QDNcoannXJtBzej0
 LwMDrv6CII16C1XoOZVkXqVlYd3CNffuF3J4WwQXRrVxtdXpVHleHrZMoXeKUfvkOGjn
 m4tDnP/YoOm1MsXDx/DAL+cfL9FG1G9ZrZnis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NAoHemdYqR+btdRvN9fApuZW+byiYT4nrufcg3Bw6/4=;
 b=mVqkteTktNHfGbB9v1nbHjVh55LbnIGPaHF7w1YCoO7U74crEsP3QG8KKTATCmhdZ2
 gc2GQkH4ZE3gCy1Q2SpeD9yJhQ7rnjSK1RYGptjOZjJ7uNbEu5GecSLqjBjQaot7mwmK
 bV0zOMzJyr7zCAyjh1V/EpbzgPnZSegAgU94+06TOBYcwQGZpB43fufr71OuRL4I0xi3
 UVVIStH05YIfuddN7pVukUAhAYjK4ZQc4a3Qv1Hj6Jq0ZAhOziAE70NjGFM0fK6sWCNg
 o7Tgy+6sTkZEFKzXYSeyYNp4Fw/De131DQT83X7DKdErzigo4SLxr4mDhz26387sTaGM
 hTyQ==
X-Gm-Message-State: APjAAAXVBZiVpbvcDoWfBWgn0bhiF8kBXDzmiCd2Tjr7OHN9O01zKcez
 MsoZl/bxslhhwX7LAaeB3S5SKdaPUM8Ks5DUbnrlDA==
X-Google-Smtp-Source: APXvYqx84dP1w7VLxYQicfKaRIVeyUTb3SQX0XPEGYvdRbbC2quRmleFj+uQI1aCIwngDLCWNiayV2ilkkSuCMVEvEM=
X-Received: by 2002:a54:4e83:: with SMTP id c3mr14515694oiy.170.1570832537841; 
 Fri, 11 Oct 2019 15:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190930081913.17306-1-patrick.delaunay@st.com>
In-Reply-To: <20190930081913.17306-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 11 Oct 2019 16:22:04 -0600
Message-ID: <CAPnjgZ0H9hKQ0JWscT6a-4-NR+tRWdOCeUOq0fPcZ2_ZybzbDQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Liviu Dudau <Liviu.Dudau@foss.arm.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v2] dm: Tidy up dump output when there are
	many devices
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

On Mon, 30 Sep 2019 at 02:19, Patrick Delaunay <patrick.delaunay@st.com> wrote:
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
>
> ---

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
